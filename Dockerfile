FROM ruby:2.7 

EXPOSE 3000
WORKDIR app/
COPY . .

RUN gem install bundle rails
RUN bundle update
RUN bundle install
RUN rails db:create
RUN rails db:migrate

ENTRYPOINT rails s -b 0.0.0.0