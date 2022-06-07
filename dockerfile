FROM ruby:3.0-buster

RUN mkdir /home/foodlog
WORKDIR /home/foodlog

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - 
RUN apt-get install -y nodejs

RUN apt-get update
RUN apt-get install -y yarn

COPY ./Gemfile /home/foodlog/Gemfile
COPY ./Gemfile.lock /home/foodlog/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]