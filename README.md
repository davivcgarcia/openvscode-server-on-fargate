# openvscode-server-fargate

## Overview

This repository contains artifacts that allow users to run [OpenVSCode-Server](https://github.com/gitpod-io/openvscode-server) on AWS cloud as a serverless container.

## Architecture

The application will be executed as a [AWS Fargate](https://aws.amazon.com/fargate/) task on [Amazon Elastic Container Service (ECS)](https://aws.amazon.com/ecs/), exposed by an [Application Load Balancer (ALB)](https://aws.amazon.com/elasticloadbalancing/application-load-balancer/). To keep it minimally secure, it will leverage [AWS Systems Manager Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html) to store a dynamically-generated Connection Token.

The whole solution is coded as a [Amazon CloudFormation](https://aws.amazon.com/cloudformation/) stack, that requires a VPC with 2 public subnets. A Dockerfile is provided with `--connection-token` option enabled and some extra Ubuntu packages, that can be used to build a custom container image to be used with the stack.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.