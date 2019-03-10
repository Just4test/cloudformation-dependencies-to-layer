#!/bin/bash
cd ..
python3 setup.py install
cd test
rm -rf cfn_dep2layer.egg-info

dep2layer clear
dep2layer package --template-file template.yaml --output-template-file packaged-template.yaml --cache-dir .dep2layer --s3-bucket jsxf-temp

aws cloudformation deploy --template-file packaged-template.yaml --stack-name delme --capabilities CAPABILITY_IAM