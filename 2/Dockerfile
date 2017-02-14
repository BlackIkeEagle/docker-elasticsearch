FROM elasticsearch:2-alpine

RUN echo 'http.cors.enabled: true' >> /usr/share/elasticsearch/config/elasticsearch.yml \
    && echo 'http.cors.allow-origin: "*"' >> /usr/share/elasticsearch/config/elasticsearch.yml
