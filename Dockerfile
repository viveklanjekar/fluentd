FROM fluent/fluentd:v1.3.2-onbuild

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-kafka \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
