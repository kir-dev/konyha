FROM ruby:2.7.1

RUN mkdir /konyhasch
WORKDIR /konyhasch

RUN gem install bundler -v 2.1.4
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install --retry 3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn -y

COPY yarn.lock .
COPY package.json .
COPY app/javascript ./app/javascript

RUN yarn install --check-files

COPY . .

RUN bin/webpack

CMD ["bundle","exec","rails","server"]