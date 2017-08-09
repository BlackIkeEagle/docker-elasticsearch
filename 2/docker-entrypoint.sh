#!/bin/bash

set -e

declare -a es_opts

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of user-mutable directories to elasticsearch
	for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
	; do
		chown -R elasticsearch:elasticsearch "$path"
	done

    # @see https://github.com/elastic/elasticsearch-docker/blob/5.5/build/elasticsearch/bin/es-docker
    while IFS='=' read -r envvar_key envvar_value
    do
        # Elasticsearch env vars need to have at least two dot separated
        # lowercase words, e.g. `cluster.name`
        if [[ "$envvar_key" =~ ^[a-z_]+\.[a-z_]+ ]]
        then
            if [[ ! -z $envvar_value ]]; then
              es_opt="-D${envvar_key}=${envvar_value}"
              es_opts+=("${es_opt}")
            fi
        fi
    done < <(env)
	set -- gosu elasticsearch "$@" "${es_opts[@]}"
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
