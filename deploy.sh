#!/bin/bash          
echo Build started
rm -rf dist
mkdir dist
cd dist
mkdir install
cd ..
npm install --prefix dist/install .
rm dist/dist.zip
cd dist/install/node_modules/alexa-plex/
zip -r ../../../dist.zip * .env
echo files are ready
cd ..
cd ..
cd ..
mv install/* .
rmdir install etc
chmod -R 777 node_modules/
zip -r dist.zip *
cd ..
echo uploading zip file, please wait...
aws --region us-east-1 lambda update-function-code --zip-file fileb://dist/dist.zip --function-name alexa-plex
echo upload is done, exiting.
