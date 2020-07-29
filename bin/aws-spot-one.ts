#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { AwsSpotOneStack } from '../lib/aws-spot-one-stack';

const app = new cdk.App();

const env = {
    region: process.env.CDK_DEFAULT_REGION,
    account: process.env.CDK_DEFAULT_ACCOUNT,
};

new AwsSpotOneStack(app, 'AwsSpotOneStack', { env });
