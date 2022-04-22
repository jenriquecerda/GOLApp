FROM ruby:3.0.0-alpine

RUN apk add --no-cache tzdata \
    nodejs yarn \
    build-base

WORKDIR /app
COPY . .
RUN bundle install
RUN yarn install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
