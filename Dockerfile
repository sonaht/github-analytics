FROM ubuntu
MAINTAINER Nikolas Vourlakis <nvourlakis@gmail.com>
RUN apt-get -y update
RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN apt-get -y install git

RUN alias node="nodejs"
ADD . /src
WORKDIR /src
RUN git clone https://github.com/kabitakis/github-analytics.git

WORKDIR /src/github-analytics
RUN npm install
RUN npm install -g nodemon
RUN cp /usr/bin/nodejs /usr/bin/node
RUN ./node_modules/.bin/browserify -t reactify public/*.js -o public/js/bundle.js

EXPOSE 3000
ENV GHTOKEN the-token-!!!
ENV NODE_ENV local

CMD ["nodejs", "./github-analytics.js"]
