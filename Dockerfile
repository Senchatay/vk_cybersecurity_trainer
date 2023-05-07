FROM ruby:3.0.0-alpine
RUN apk add --no-cache postgresql-dev libc6-compat libxml2-dev build-base nodejs postgresql-client

WORKDIR /app

COPY . .

RUN bundle install

# ENTRYPOINT [ "/app/bin/docker-entrypoint" ]

EXPOSE 3000
CMD ["rails s -b 0.0.0.0"]