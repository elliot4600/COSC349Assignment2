echo "Configuring Webserver"
echo " "

cd /var/www/html/
sudo rm -r index.html
sudo wget https://assignment2storage.s3.amazonaws.com/www/index.php
sudo wget https://assignment2storage.s3.amazonaws.com/www/style.css
cd ~/
# sudo wget https://assignment2storage.s3.amazonaws.com/query/query-site.conf

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql

# sudo cp /home/ubuntu/query-site.conf /etc/apache2/sites-available/

sudo chmod 755 /home/ubuntu
# sudo chmod 755 /home/ubuntu/query
# chmod 755 /home/ubuntu

# cd /ubuntu/query
# find . -type f -exec chmod 644 {} \;

# Enable the newly created website.
#sudo a2ensite query-site
# Disable the default apache landing page.
#sudo a2dissite 000-default
# Reload apache
sudo service apache2 reload



ls
echo " "
echo "Webserver files retrieved"
