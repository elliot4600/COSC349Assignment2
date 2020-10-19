<!DOCTYPE HTML>
<html>
	<link rel="stylesheet"type="text/css" href="style.css">
	<body>
	<div id="main">
	<h1>Community Library Database</h1>
	<div id="websiteuserinput">
	<h2>Add new books to the database using the form below.</h2>
	<hr/>
	<form action="" method="post">
	<label>Book Name:</label>
	<input type="text" name="bookname" id="bookname" required="required" placeholder="Enter book name here"/><br /><br />
	<label>Author:</label>
	<input type="text" name="author" id="author" required="required" placeholder="Enter author here"/><br/><br />

	<input type="submit" value=" Submit " name="submit"/><br />
	</form>
	</div>

<?php
if(isset($_POST["submit"])){ 
$db_host   = '192.168.2.13';
$db_name   = 'librarydb';
$db_user   = 'admin';
$db_passwd = 'admin';

$pdo_dsn = "mysql:host=$db_host;dbname=$db_name";

$pdo = new PDO($pdo_dsn, $db_user, $db_passwd);

$sql = "INSERT INTO availablebooks (bookname, author)
VALUES ('".$_POST["bookname"]."','".$_POST["author"]."')";

if ($pdo->query($sql)) {
echo "<script type= 'text/javascript'>alert('New book added to database successfully');</script>";
}

else{
echo "<script type= 'text/javascript'>alert('New book failed to add to database.');</script>";
}
}

?>
	</table>
	</div>
	</body>
</html>
