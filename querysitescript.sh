# Shell script to configure the queryserver VM.

echo "Running querysitescript.sh"
echo " "

# Update/upgrade packages
apt-get update
apt-get upgrade -y
# Install Apache2 and PHP.
apt-get install -y apache2 php libapache2-mod-php php-mysql


cp /vagrant/query-site.conf /etc/apache2/sites-available/

# Enable the newly created website.
a2ensite query-site
# Disable the default apache landing page.
a2dissite 000-default
# Reload apache
service apache2 reload

echo "Finishing querysitescript.sh"
echo " "