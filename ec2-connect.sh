#!/bin/bash

instanceId=$1
prikey="$HOME/.ssh/id_rsa_github"
pubkey="$prikey.pub"
sshUser='ec2-user'

az=$(aws ec2 describe-instances --instance-id ${instanceId} --query 'Reservations[0].Instances[0].Placement.AvailabilityZone' --output text)
publicIp=$(aws ec2 describe-instances --instance-id ${instanceId} --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)



if [[ $2 != '--send-key-only' ]]; then
  echo "connecting to ${publicIp} at ${az}"
	ssh ${sshUser}@${publicIp} -i $prikey
fi