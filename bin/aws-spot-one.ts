#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { AwsSpotOneStack } from '../lib/aws-spot-one-stack';

const app = new cdk.App();
new AwsSpotOneStack(app, 'AwsSpotOneStack');
