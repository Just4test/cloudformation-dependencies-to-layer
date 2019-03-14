#!/bin/bash
cd ..
pip3 uninstall -y cfn-dep2layer
python3 setup.py install
clear
cd test
rm -rf cfn_dep2layer.egg-info

#dep2layer clear
dep2layer download --template-file template.yaml --output-template-file .dep2layer-template.json --cache-dir .dep2layer
#dep2layer package --template-file template.yaml --output-template-file packaged-template.json --cache-dir .dep2layer --s3-bucket jsxf-temp

#aws cloudformation deploy --template-file packaged-template.json --stack-name delme --capabilities CAPABILITY_IAM