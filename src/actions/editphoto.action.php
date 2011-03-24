<?php
require_once "../common/common.php";
require_once "../common/members_only.php";
require_once "../includes/photo.class.php";
page_protect();

$user_id=$_SESSION['user_id'];

$photo_name=$_POST["photo_name"];
 
$photo_id=$_POST['photo_id'];

$photo_catId=$_POST["cat_id"];

$photo =new Photo();

$exec="update photo set name='$photo_name' , categoryId=$photo_catId where id=$photo_id and userId='$user_id'";

$result=mysql_query($exec);
if($result)
{
	echo json_encode(array("status"=>"success"));
}
else
{
	 echo json_encode(array("status"=>"fail")); 
}


?>