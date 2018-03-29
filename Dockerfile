FROM amberframework/amber:v0.7.0

WORKDIR /app

COPY shard.* /app/
RUN crystal deps

COPY . /app

RUN rm -rf /app/node_modules

CMD amber watch
