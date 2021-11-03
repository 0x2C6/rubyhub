FROM ruby:2.6.5

WORKDIR /app
COPY ./Gemfile* /app/
COPY rubyhub.gemspec /app/

RUN gem install bundler && bundle install
COPY . /app/

CMD ["bin/puma"]
