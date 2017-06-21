#!/bin/bash

RANDOMfoldername=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32`
RANDOMfilename=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32`

echo "Keys will be stored on ./$RANDOMfoldername/$RANDOMfilename.json"

mkdir $RANDOMfoldername

node DontRunMe.js >> ./$RANDOMfoldername/$RANDOMfilename.json
sed -i "5ilet savedKeys = require(\"./$RANDOMfoldername/$RANDOMfilename.json\");" basic256.js

echo "Keys are saved and attached to the basic256.js file."

rm DontRunMe.js
rm runMeFirst.bash
exit
