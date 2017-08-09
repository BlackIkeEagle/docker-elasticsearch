FROM elasticsearch:2

RUN echo 'http.cors.enabled: true' >> /usr/share/elasticsearch/config/elasticsearch.yml \
    && echo 'http.cors.allow-origin: "*"' >> /usr/share/elasticsearch/config/elasticsearch.yml

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
