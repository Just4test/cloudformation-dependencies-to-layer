rm -rf dist
python3 setup.py sdist bdist_wheel
twine upload -u just4test dist/*
echo ======== OK ========
rm -rf dist
rm -rf cfn_dep2layer.egg-info
rm -rf build