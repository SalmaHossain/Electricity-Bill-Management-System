<!DOCTYPE html>
<html>
<body>

<h1>My first PHP page</h1>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "copilot";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    echo "Connection failed: " ;
}
else{
echo "Connected successfully";}

$sql = "CREATE TABLE meme (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";

// Execute the query
if (mysqli_query($conn,$sql)) {
    echo "Table 'users' created successfully.";
} else {
    echo "Error creating table: " . $conn->error;
}


?>





</body>
</html>