FROM amberframework/amber:v0.7.0

WORKDIR /app

RUN crystal deps
COPY shard.* /app/

COPY . /app

RUN rm -rf /app/node_modules

CMD amber watch
