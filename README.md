# docker-hubot-slack-aws

##Hubot integration with slack and ec2 aws service to get private ips using the role tag

#To run the hubot-slack-aws bot

3 environment variables need to be exported before running the image

Create a file called env.list

`HUBOT_SLACK_TOKEN=''`

`AWS_ACCESS_KEY_ID=''`

`AWS_SECRET_ACCESS_KEY=''`

Aws IAM user will need to have ec2:DescribeInstances permissions

##Usage
docker run -d --env-file ./env.list docker-hubot-slack-ec2:bg

In slack you can then get ec2 information from a role tag by typing ec2 <tagvalue> <region>

Example: ec2 web us-west-1 [ Tag Name: role Value: web and region is us-west-1 ]

###Additional testing branch...Do not use this branch for your testing.....

Bugs Fixed: 
  1. Fix job endpoints - 19/05/2015
