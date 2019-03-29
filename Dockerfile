# base image
FROM node:10.15.3

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable


# Some install for Nonalping
RUN npm i npm --g 
#RUN npm i gyp --g
RUN npm i yarn --g
RUN npm install -g @angular/cli 
#@angular-devkit/build-angular


RUN  rm -rf ~/.npm/ ~/.yarn/

#RUN npm install -g perfect-scrollbar  chalk  tsickle typescript


# Ready system for running the rest of the specific app script

