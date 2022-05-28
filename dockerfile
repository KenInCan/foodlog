FROM ruby:3.0-buster

RUN mkdir /home/foodlog
WORKDIR /home/foodlog

COPY ./Gemfile /home/foodlog/Gemfile
COPY ./Gemfile.lock /home/foodlog/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]