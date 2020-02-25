# No longer manually download dependencies for your lambda
For each of your Lambda in Cloudformation template, this tool can download dependencies and package them to layer.

If you just want to download dependencies automatically, [sam build](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/sam-cli-command-reference-sam-build.html) is a better choise. If you want to package dependencies to layer, use this tool.


Support lambda runtime:

- Python 3.8
- Python 3.7
- Python 3.6
- Python 2.7
- Node.js 12.x
- Node.js 10.x
- Node.js 8.10
- Node.js 6.10

## How to use
Currently only available on macOS python3.

```
pip3 install -U cfn-dep2layer
cd cloudformation-project-rootdir
dep2layer download --template-file template.yaml --out-template-file .dep2layer-template.yaml
```
## WARNING  
DO NOT USE `CodeUri: .` in template.yaml. In other words, you SHOULD NOT put lambda code in the same dir of template.yaml.  
Create a sub-dir, for example "lambda", put your lambda code files in it, and use `CodeUri: ./lambda` in template.yaml.

This because dep2layer will store cache files under template dir by default. And "aws cloudformation package" or "sam package" will zip all files in "CodeUri" dir as lambda runtime bundle. If use template dir as CodeUri, the cache files will zip into lambda bundle and cause slower boot time for your lambda.
