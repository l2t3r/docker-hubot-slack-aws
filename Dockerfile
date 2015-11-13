FROM node:0.10.40-slim

ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Ashley Avileli

RUN apt-get update && apt-get install -y git-core redis-server supervisor python-pip --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm up -g npm && npm i -g yo generator-hubot coffee-script && \
    npm cache clean

RUN pip install awscli

ADD supervisord.conf /etc/supervisord.conf
RUN git clone https://github.com/l2t3r/slack-hubot-aws.git hubot
RUN cd hubot && npm install
CMD supervisord -c /etc/supervisord.conf
