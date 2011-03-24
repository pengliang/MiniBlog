<?php
require_once( "../common/common.php");
require_once( INCLUDES_DIR."location.class.php");
require_once( INCLUDES_DIR."Photo.class.php");

require_once( "../common/members_only.php");

page_protect();

$user_id=$_SESSION["user_id"];
$user_name=$_SESSION["user_name"];


$location= new Location();

if($_POST['albumId'])
{
	$location->category_id=$_POST['albumId'];
	$location->category_name=$_POST['albumName'];
	
}
else
{
	$location->category_id=0;
	$location->category_name="没有关联相册";
}
 

$location->user_id = $user_id;

$locationId = $_POST["locationId"]; 


if($location->update_location($locationId))
{	
	$photo = new Photo();
	$photolist=$photo->find_photo_lists($user_id,$location->category_id);
	success(array('id'=>$locationId,'albumId'=>$_POST['albumId'],
			'albumName'=>$_POST['albumName'],'photolists'=>$photolist));

}
else
{
	fail('Failed to update point.');
}

exit;
 
function fail($message) {
	echo (json_encode(array('status' => 'fail', 'message' => $message)));
}

function success($data) {
	echo json_encode(array('status' => 'success', 'location' => $data));
}
?>
