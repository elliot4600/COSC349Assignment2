<!DOCTYPE HTML>
<html>
  <link rel="stylesheet"type="text/css" href="style.css">
  <div id="main">
  <head>
  </head>
  <body>
    <h1>Contents of local community library:</h1>
    <table border="1">
      <tr><th>Book Title</th><th>Author</th></tr>
  </div>
      <?php
         $db_host   = 'ec2-34-226-245-31.compute-1.amazonaws.com';
         $db_name   = 'librarydb';
         $db_user   = 'admin';
         $db_passwd = 'admin';

         $pdo_dsn = "mysql:host=$db_host;dbname=$db_name";

         $pdo = new PDO($pdo_dsn, $db_user, $db_passwd);
         $q = $pdo->query("SELECT * FROM availablebooks");

      while($row = $q->fetch()){
      echo "<tr><td>".$row["bookname"]."</td><td>".$row["author"]."</td></tr>\n";
      }
      ?>
  </table>
  </body>
</html>
