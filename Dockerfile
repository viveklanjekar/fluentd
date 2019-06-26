FROM fluent/fluentd:v1.2-onbuild
LABEL maintainer "Vivek Lanjekar <vivek.lanjekar@gmail.com>"

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-scalyr \
        fluent-plugin-s3 \
        fluent-plugin-kafka \
        fluent-plugin-grok-parser \
        fluent-plugin-rewrite-tag-filter \
        fluent-plugin-record-reformer \
        fluent-plugin-throttle \
        fluent-plugin-detect-exceptions \
        fluent-plugin-multi-format-parser \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem
EXPOSE 24224 5140
