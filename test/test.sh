#!/bin/bash

#rm -rf .dep2layer
#rm .dep2layer-template.yaml
cd ..
python3 setup.py install
cd test
dep2layer download
aws cloudformation package --template-file .dep2layer-template.yaml --s3-bucket jsxf-temp --output-template-file packaged-template.json

aws cloudformation deploy --template-file packaged-template.json --stack-name delme --capabilities CAPABILITY_IAM