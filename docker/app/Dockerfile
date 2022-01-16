FROM ruby:3.1

RUN mkdir -p /app
WORKDIR /app

COPY . /app
RUN bundle install

RUN chmod +x /app/index.sh
