#! /usr/bin/sh

# this script will find all files ending with '.sh' and add them
# to a bucket in S3 for scripts

# STEPS
# FIND FILES WITHIN CURRENT DIRECTORY THAT END WITH '.SH'
# We can search for words within a file by using ' grep '
# grep -c [keyword] [files]
# grep -c usr *.sh
# MOVE THAT FILE TO S3 BUCKET
echo "Here is a list of your buckets: "
aws s3 ls
echo -n "Which bucket do you want to add the file?"
read BUCKET_NAME
# grep -l usr/sh *.sh  #find all files that match that pattern
echo -n "What is the name of the file? "
read FILE
find . -type f -name "$FILE.sh"
FILE="$FILE.sh"
echo "This is file $FILE "
if [ -f "$FILE" ];then # if [ file exists ]; then
  echo "file exists"
  aws s3 cp $FILE s3://$BUCKET_NAME  # move that file to S3
else
  echo "file does not exist yet"
  touch $FILE
  echo "now it does"
fi
echo "DONE"
