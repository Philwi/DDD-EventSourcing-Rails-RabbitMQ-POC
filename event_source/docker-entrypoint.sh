#!/bin/sh
rm -f tmp/pids/server.pid
bundle install --path=vendor/cache
bundle exec rails db:create db:migrate

echo "Starting event_source rails server"
bundle exec rails server -p 3000 -b 0.0.0.0 -e $RAILS_ENV
