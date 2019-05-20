FROM elixir:latest

RUN mkdir /sender-app
COPY . /sender-app
WORKDIR /sender-app

RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.compile

CMD sh entrypoint.sh
