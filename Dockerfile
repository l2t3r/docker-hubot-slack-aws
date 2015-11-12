############################################################
# Dockerfile file to build Hubot with slack support and get ec2 information
# back to slack from role tags
# AUTHOR: Ashley Avileli  <ashleymail4u@gmail.com>
# Version 0.1
############################################################

FROM node:latest
MAINTAINER Ashley Avileli <ashleymail4u@gmail.com>

#updating system
RUN apt-get -q update

#updating packages required for my mysetup
RUN apt-get -qy install git-core redis-server supervisor python-pip

#installing aws cli tools
RUN pip install awscli

#installing the hubot and coffescript support
RUN npm install -g yo generator-hubot coffee-script

#Add my modified supervisord.conf to image
ADD supervisord.conf /etc/supervisord.conf

#clone my hubot-slack-aws repo
RUN git clone https://github.com/l2t3r/slack-hubot-aws.git hubot
#install required dependency for external scripts like hubot-youtube hubot-google-translate hubot-rules moment-timezone
RUN cd hubot && npm install

#Runing my supervisor script
CMD supervisord -c /etc/supervisord.conf
