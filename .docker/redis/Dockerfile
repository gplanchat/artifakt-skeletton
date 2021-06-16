FROM redis:6-alpine AS builder

WORKDIR /build

RUN set -ex \
    && apk add --virtual .build-deps \
        git \
        build-base \
        python3 \
        cargo \
        clang-libs \
    && git clone --recursive https://github.com/RedisJSON/RedisJSON.git rejson \
    && cd rejson \
    && cargo build --release \
    && apk del .build-deps

FROM redis:6-alpine

COPY --from=builder /build/rejson/target/release/librejson.so /opt/librejson.so

COPY redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "--loadmodule", "/opt/librejson.so", "/usr/local/etc/redis/redis.conf" ]
