FROM fluent/fluentd:v1.3.2-onbuild

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-scalyr \
        fluent-plugin-s3 \
        fluent-plugin-kafka \
        fluent-plugin-rewrite-tag-filter \
        fluent-plugin-record-reformer \
        fluent-plugin-multi-format-parser \
        fluent-plugin-kubernetes_metadata_filter \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
