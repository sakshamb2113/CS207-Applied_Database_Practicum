<html>
<head>
</head>
<body>
<?php
$sdate=$_GET["s"];
$edate=$_GET["e"];
$col=$_GET["mydropdown"];
$sqlmax="select max($col) as ans from poll where dat>=\"$sdate\" and dat<=\"$edate\"";
$sqlmin="select min($col) as ans from poll where dat>=\"$sdate\" and dat<=\"$edate\"";
$sqlavg="select avg($col) as ans from poll where dat>=\"$sdate\" and dat<=\"$edate\""; 
$host="localhost";
$dbname="mini_project";
$username="root";
$password="";
$conn=mysqli_connect($host,$username,$password,$dbname);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
};
if($_GET["max"])
{
    $mx = $_GET["max"];
    $result=mysqli_query($conn,$sqlmax);
    // $row = mysqli_fetch_assoc($result);
    // print_r($row);
    while($row = mysqli_fetch_assoc($result)) {
        echo "maximum of ".$col." ".$row["ans"]."\n";
        // echo "heu";
}
}
if($_GET["min"])
{
    $mn = $_GET["min"];
    $result=mysqli_query($conn,$sqlmin);
    // $row = mysqli_fetch_assoc($result);
    // print_r($row);
    while($row = mysqli_fetch_assoc($result)) {
        echo "minimum of ".$col." ".$row["ans"]."\n";
        // echo "heu";
    }
}
if($_GET["avg"])
{
    $av = $_GET["avg"];
    $result=mysqli_query($conn,$sqlavg);
    // $row = mysqli_fetch_assoc($result);
    // print_r($row);
    while($row = mysqli_fetch_assoc($result)) {
        echo "average of ".$col." ".$row["ans"]."\n";
        // echo "heu";
    }
}
else 
{
    echo "AVG is Not Checked !!";
}
// $row = mysqli_fetch_assoc($result);
// foreach($row as $head=>$marks)
// {
//     echo $head."\n";
// }
// echo $result;
// $row = mysql_fetch_array($result);

mysqli_close($conn);
?>
</body>
</html>
