FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
nodejs postgresql-client \
ca-certificates curl firefox               \
 && rm -fr /var/lib/apt/lists/*                \
 && curl -L https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz | tar xz -C /usr/local/bin \
 && apt-get purge -y ca-certificates curl

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install --binstubs
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

