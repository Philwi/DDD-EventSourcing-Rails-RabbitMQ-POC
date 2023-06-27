FROM ruby:3.1.2

ENV APP_USER=xfs
ENV APP_PATH=/usr/src/admin
# Install nodejs
RUN apt-get update -qq
RUN apt-get update && apt-get install -y \
    software-properties-common

# Update
RUN apt-get update -y

RUN apt-get install bash -y
RUN apt-get install vim -y

ADD ./admin /usr/src/admin
WORKDIR /usr/src/admin

COPY ./admin/config/database.docker.yml /usr/src/admin/config/database.yml

# Install & run bundler
RUN gem install bundler:'~> 2.1.4'
RUN gem install rake

CMD ./docker-entrypoint.sh
