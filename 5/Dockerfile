FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.1

RUN echo 'http.cors.enabled: true' >> /usr/share/elasticsearch/config/elasticsearch.yml \
    && echo 'http.cors.allow-origin: "*"' >> /usr/share/elasticsearch/config/elasticsearch.yml \
    && cd /usr/share/elasticsearch && bin/elasticsearch-plugin remove x-pack

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
