# docker-hubot-slack-aws

##Hubot integration with slack and ec2 aws service to get private ips using the role tag

To build this docker image. 

1. clone repo
2. run docker build -t tranceash23/hubot-slack-aws:latest .

 
##To run the hubot-slack-aws bot

3 environment variables need to be exported before running the image

Create a file called env.list

`HUBOT_SLACK_TOKEN=''`

`AWS_ACCESS_KEY_ID=''`

`AWS_SECRET_ACCESS_KEY=''`

Aws IAM user will need to have ec2:DescribeInstances permissions

Usage
docker run -d --env-file ./env.list tranceash23/hubot-slack-aws:latest

In slack you can then get ec2 information from a role tag like this ec2 <tagvalue> <region>
ec2 web us-west-1 [ role=web and region is us-west-1 ]
