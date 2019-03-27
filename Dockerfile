# base image
FROM node:10.15.3

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# Some install for Nonalping
RUN npm i npm --g 
#RUN npm i gyp --g
RUN npm i yarn --g
RUN npm install -g @angular/cli 
#@angular-devkit/build-angular

#RUN npm install -g perfect-scrollbar  chalk  tsickle typescript


# install and cache app dependencies
COPY package.json /usr/src/app/package.json

RUN echo "Yarning the Angular Project"
RUN yarn
#RUN npm install -g @angular/cli

# cleanup cache for optimal image size (latest is 800mb)
#RUN npm cache clean
RUN yarn cache clean

# add app
COPY . /usr/src/app

# start app
#CMD ng serve --host 0.0.0.0 --port 4223 --disableHostCheck
CMD yarn start

