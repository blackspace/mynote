FROM ruby
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp


RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
RUN gem install rails

RUN rails new . -B --force --no-deps 
RUN cat Gemfile | sed  "s/rubygems.org/gems.ruby-china.com/" > Gemfile.tmp
RUN mv Gemfile.tmp Gemfile
RUN cat Gemfile | sed  "s/gem 'sqlite3'*/&,'~> 1.3.6'/"  > Gemfile.tmp
RUN mv Gemfile.tmp Gemfile
RUN bundle install
RUN rake db:create

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

CMD ["rails", "server", "-b", "0.0.0.0"]

ENTRYPOINT ["entrypoint.sh"]

