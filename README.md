# Lambda-selenium

This is a SAM project to create and deploy lambda functions. This kind of configuration allows you to create lambda functions which can be edited in AWS code editor directly.

## Requirements
- SAM CLI : [link](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html)
- AWS credentials initialized
- Docker

## Getting Started
- Clone this repo
- Run `./script.ps1 fetch`
- Run `./script.ps1 build`
- Run `sam deploy --guided` for first start and use `./script.ps1 deploy` once toml is generated
