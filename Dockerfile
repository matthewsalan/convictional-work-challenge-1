FROM ruby:3.1.4-alpine

RUN apk add --update --virtual \
  runtime-deps \
  build-base \
  postgresql-dev \
  linux-headers \
  tzdata \
  && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN bundle install

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000
