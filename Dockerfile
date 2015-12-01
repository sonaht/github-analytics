FROM node
MAINTAINER Antonios A. Chariton <daknob.mac@gmail.com>

# Copy files to Image
RUN mkdir /analytics
COPY . /analytics

# Install required modules
WORKDIR /analytics
RUN npm install
RUN npm install -g nodemon
RUN ./node_modules/.bin/browserify -t reactify public/*.js -o public/js/bundle.js

# Run Node
ENV "GHTOKEN" "t0k3n"
CMD ["npm", "run", "dev"]

EXPOSE 3000
