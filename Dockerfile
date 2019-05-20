FROM elixir:latest

RUN mkdir /sender-app
COPY . /sender-app
WORKDIR /sender-app

ENV username=guest
ENV password=guest
ENV host=rabbitmq-service.e-stack

RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.compile

CMD ["mix run", "/sender-app/sender.exs"]
