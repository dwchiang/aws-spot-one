#!/bin/bash

instanceId=$1
prikey="$HOME/.ssh/id_rsa_github"
pubkey="$prikey.pub"
sshUser='ec2-user'

az=$(aws ec2 describe-instances --instance-id ${instanceId} --query 'Reservations[0].Instances[0].Placement.AvailabilityZone' --output text)
publicIp=$(aws ec2 describe-instances --instance-id ${instanceId} --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

echo "sending public key to ${instanceId}"
aws ec2-instance-connect send-ssh-public-key --instance-id ${instanceId} --instance-os-user ${sshUser} \
--ssh-public-key file://${pubkey} --availability-zone ${az} > /dev/null

if [[ $2 != '--send-key-only' ]]; then
  echo "downloading data from ${publicIp} at ${az}"
  scp -i $prikey ${sshUser}@${publicIp}:firecracker-demo/{data.log,gnuplot.script} .

  gnuplot gnuplot.script
  xdg-open boot-time.png  # on Ubuntu. For other distros just use your default .png viewer.
fi