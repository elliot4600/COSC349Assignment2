# Shell script to setup the database server (dbserver) VM.

echo "Running dbserverscript.sh"
echo " "

# Update/upgrade packages
apt-get update
apt-get upgrade -y

# Gives password to mySQL installer before installing.
# Prevents password prompts.
export MYSQL_PWD='password1'

echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections 
echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

# Install the MySQL database server.
apt-get -y install mysql-server


echo "DROP DATABASE IF EXISTS librarydb;" | mysql
echo "DROP USER IF EXISTS 'admin', remote;" | mysql

# Create database, "librarydb" which will contain the table storing information
# about available books.
echo "CREATE DATABASE librarydb;" | mysql

# Create a database user "admin" with the given password, "admin".
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql
# Provide all privilieges to the user created above.
echo "GRANT ALL PRIVILEGES ON librarydb.* TO 'admin'@'%'" | mysql

# Sets then password which mysql will use to access the database.
export MYSQL_PWD='admin'

# Run the initial sql script and create the user admin for the database librarydb.
cat /home/ubuntu/testdb.sql | mysql -u admin librarydb


# Update the mysql .cnf file to accept connections from any network.
sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart to include configuration changes.
service mysql restart

echo "Finishing dbserverscript.sh"
echo " "