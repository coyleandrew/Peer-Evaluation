FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client build-essential
RUN npm install yarn

# Bootstrap files, will be overwritten by rails new command
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY . /app
RUN bundle install

# Init script, removes pre-existing server.pid
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]