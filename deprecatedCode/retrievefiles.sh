echo "Retrieving required files from S3 bucket"
echo " "

mkdir query
cd query
wget https://assignment2storage.s3.amazonaws.com/query/index.php
wget https://assignment2storage.s3.amazonaws.com/query/style.css
cd ../

mkdir www
cd www
wget https://assignment2storage.s3.amazonaws.com/www/index.php
wget https://assignment2storage.s3.amazonaws.com/www/style.css
cd ../

ls
echo "www & query sites retrieved"
