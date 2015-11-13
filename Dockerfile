FROM node:latest
MAINTAINER Ashley Avileli

RUN apt-get -q update
RUN apt-get -qy install git-core redis-server supervisor python-pip
RUN pip install awscli
RUN npm install -g yo generator-hubot coffee-script
ADD supervisord.conf /etc/supervisord.conf
RUN git clone https://github.com/l2t3r/slack-hubot-aws.git hubot
RUN cd hubot && npm install
CMD supervisord -c /etc/supervisord.conf
