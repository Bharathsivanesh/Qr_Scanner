<?php
// Database connection parameters
$host = "localhost";
$username = "root";
$password = "";
$database = "cse";

// Connect to MySQL database
$conn =  mysqli_connect($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}

// Query to fetch data
echo "PHP Script Accessed Successfully<br>";
$sql = "SELECT * FROM details";
$result = $conn->query($sql);

// Fetch data and encode as JSON
$data = array();
if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()) {
$data[] = $row;
}
}

echo json_encode($data);

// Close connection
$conn->close();
?>
