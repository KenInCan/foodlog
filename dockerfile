FROM ruby:3.0-buster

RUN mkdir /home/foodlog
WORKDIR /home/foodlog

COPY ./Gemfile /home/foodlog/Gemfile
COPY ./Gemfile.lock /home/foodlog/Gemfile.lock
RUN bundle install

RUN useradd ruby
USER ruby

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]