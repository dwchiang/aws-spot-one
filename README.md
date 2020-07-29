# aws-spot-one

Follow Pahud's Youtube video: EP22 - [Building Highly Durable Spot Blocks with no Interruption with AWS CDK(4K 2160P)](https://youtu.be/RgQQO6mMY9E)

## Requirement

- Use default VPC. 

## Preparation

File: `ec2-init-connect.sh` and `ec2-connect.sh`:

- Update your private key file path in `prikey`.

File: `lib\aws-spot-one-stack.ts`

- Update `blockDuration` to your desired duration.
  - Also update `fleet.expireAfter` to your desired duration.
- Update `defaultInstanceType` to your assigned instance type.

## Execution

Bootstrap once per AWS account per region.

```
make bootstrap

```

---

Synth:

```
make synth
```

---

Diff:

```
make diff
```

---

Deploy:

```
make deploy

# You may need to press 'Y' if cdk involves creating IAM resources.
```

You will see the spot instance id after couple minutes.
Then you can have an ssh connect to the new created spot instance:

```
./ec2-init-connect.sh {your_instance_id}
```

---

Destroy:

Normally you don't need to destory it, but it's an option.

```
make destroy
```

---

Clean:

If you are using multiple AWS/IAM accounts, you may need to clean up the cdk context (which is generated by cdk synth).

```
make clean
```
