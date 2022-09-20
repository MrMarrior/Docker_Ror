FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y libpq-dev nodejs default-libmysqlclient-dev
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app
#COPY . ./
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
RUN useradd -ms /bin/bash newuser
RUN chown -R newuser .
RUN chmod 777 /app
RUN rake tmp:cache:clear
RUN chmod 0664 /app/log/development.log
USER newuser
#ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
