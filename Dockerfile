FROM ruby:2.3.1

RUN echo Asia/Tokyo > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /myapp
WORKDIR /myapp
# ADD admin /app/admin
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install -j4
ADD . /myapp
