#!/bin/bash
pwd
#rm -rf .dep2layer
cd ../dep2layer
python3 run.py
echo ===============
cd ../test
aws cloudformation package --template-file .dep2layer-template.yaml --s3-bucket jsxf-temp --output-template-file packaged-template.json

aws cloudformation deploy --template-file packaged-template.json --stack-name delme --capabilities CAPABILITY_IAM