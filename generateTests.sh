#!/bin/sh

echo remove target directories
rm -Rf IG-R4
rm -Rf IG-R4b
rm -Rf IG-R5
rm -Rf IG-STU3

echo remove output
rm -Rf output
mkdir output

echo copy base to target directories
cp -R IG-base IG-R4
cp -R IG-base IG-R4b
cp -R IG-base IG-R5
cp -R IG-base IG-STU3

echo process R5
# run liquid using context for R5 on all files with liquid in the name, store them with extension .new
find IG-R5/ -name "*.liquid*" -exec sh -c 'npx --yes liquidjs -t @"$1" --context @./context-R5.json > "$1.new"' x {} \;
# remove the string .liquid from all files with the extension .new
find IG-R5/ -name "*.new" -exec rename s/".liquid"/""/g {} \;
# remove the extension .new from all files with the extension .new
find IG-R5/ -name "*.new" -exec rename s/".new"/""/g {} \;
# remove all files with .liquid in the name
find IG-R5/ -name "*.liquid*" -exec rm -f {} \;
# run sushi
sushi IG-R5
mkdir output/R5
cp IG-R5/fsh-generated/resources/* output/R5

echo process R4b
find IG-R4b/ -name "*.liquid*" -exec sh -c 'npx --yes liquidjs -t @"$1" --context @./context-R4.json > "$1.new"' x {} \;
find IG-R4b/ -name "*.new" -exec rename s/".liquid"/""/g {} \;
find IG-R4b/ -name "*.new" -exec rename s/".new"/""/g {} \;
find IG-R4b/ -name "*.liquid*" -exec rm -f {} \;
sushi IG-R4b
mkdir output/R4b
cp IG-R4b/fsh-generated/resources/* output/R4b

echo process R4
find IG-R4/ -name "*.liquid*" -exec sh -c 'npx --yes liquidjs -t @"$1" --context @./context-R4.json > "$1.new"' x {} \;
find IG-R4/ -name "*.new" -exec rename s/".liquid"/""/g {} \;
find IG-R4/ -name "*.new" -exec rename s/".new"/""/g {} \;
find IG-R4/ -name "*.liquid*" -exec rm -f {} \;
sushi IG-R4
mkdir output/R4
cp IG-R4/fsh-generated/resources/* output/R4

