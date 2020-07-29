import * as cdk from '@aws-cdk/core';
import * as ec2 from '@aws-cdk/aws-ec2';
import * as spotone from 'cdk-spot-one';

export class AwsSpotOneStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // cdk diff -c use_default_vpc=1
    const vpc = spotone.VpcProvider.getOrCreate(this);

    const fleet = new spotone.SpotFleet(this, 'Fleet', {
      blockDuration: spotone.BlockDuration.ONE_HOUR,
      defaultInstanceType: new ec2.InstanceType('t3.small'), //e.g. t3.small, c5.metal, i3.metal
    });

    fleet.expireAfter(cdk.Duration.hours(1));
  }
}
