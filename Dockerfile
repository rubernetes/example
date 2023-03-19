FROM ruby:3.0
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN chmod 777 ./clustered_example.rb
RUN chmod 777 ./namespaced_example.rb
