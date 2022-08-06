<?php

$conn = mysqli_connect("localhost","root","","firstOffer");

$name = $_POST['name'];
echo "The name is " . $name;

$sql = $conn->query("SELECT * FROM users");

$sql = $conn->query("SELECT * FROM users WHERE first_name = '$name'");

$res = array();

while($row = $sql->fetch_assoc())
{
  $res[] = $row;
}

echo json_decode($res,JSON_PRETTY_PRINT);

?>