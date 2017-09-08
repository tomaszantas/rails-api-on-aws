FROM ruby:2.4.1-slim

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler

# Preinstall gems. This will ensure that Gem Cache wont drop on code change
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN (bundle check || bundle install --without development test)

RUN mkdir /app
ADD ./ /app
#COPY ./config/puma.rb /app/config/puma.rb
#COPY ./script/start_server.sh /app/script/start_server.sh
#COPY ./script/wait_for_db.sh /app/script/wait_for_db.sh
WORKDIR /app
RUN (bundle check || bundle install --without development test)

CMD bash script/wait_for_db.sh && bundle exec rake db:create db:migrate && bundle exec puma -C /app/config/puma.rb
