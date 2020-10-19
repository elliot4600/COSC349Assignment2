# Shell script to configure the websiteserver VM.

echo "Running websitescript.sh"
echo " "

# Update/upgrade packages
apt-get update
apt-get upgrade -y
# Install Apache2 and PHP.
apt-get install -y apache2 php libapache2-mod-php php-mysql


cp /vagrant/private-website.conf /etc/apache2/sites-available/

# Enable the newly created website.
a2ensite private-website
# Disable the default apache landing page.
a2dissite 000-default
# Reload apache
service apache2 reload

echo "Finishing webscript.sh"
echo " "