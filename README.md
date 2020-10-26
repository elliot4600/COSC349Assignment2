# COSC349Assignment2
Assignment 2 for COSC349 UoO 2020
PLEASE NOTE: All files that are not within the deprecatedCode folder in the github repository are also stored in the AWS S3 storage bucket and will be accessed from the bucket. I have left them in the repository for the marker to easily see the script files that are being used to setup my VMs.  

This application consists of two webpages. One for the general public to use, the queryserver which pulls the list of all available books from the library, and the general webserver which allows for addition of more books to the library/database. (Note that both are http:// and not https://)

The webserver is located at the following URL: http://ec2-3-92-189-61.compute-1.amazonaws.com/ 
More books can be added to the database using the simple form found on it’s website.

The queryserver is located at the following URL: http://ec2-3-92-217-81.compute-1.amazonaws.com/
The queryserver simply retrieves a list of all available books found within the database and displays it in a simple table for the reader.
