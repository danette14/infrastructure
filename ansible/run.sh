#!/bin/bash
PURPOSE=$1
COUNT=$2
echo "Purpose: $PURPOSE  Count: $COUNT"

aws ec2 run-instances \
    --image-id ami-05d38da78ce859165  \
    --instance-type t2.micro \
    --key-name MoniNordic \
    --security-group-ids sg-02b3d29bdcd49a0cc \
    --subnet-id subnet-06d26c27601fa5b42 \
    --count $COUNT \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=danbd_$PURPOSE},{Key=Purpose,Value=$PURPOSE},{Key=CreatedBy,Value=danbd}]" \
--output json > instance-details.json


# aws ec2 describe-instances
# aws ec2 describe-instances --instance-ids <id>