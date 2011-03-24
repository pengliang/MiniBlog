<?php
require_once( "../common/common.php");
require_once( INCLUDES_DIR."location.class.php");
require_once( INCLUDES_DIR."Photo.class.php");

require_once( "../common/members_only.php");

page_protect();

$user_id=$_SESSION["user_id"];
$user_name=$_SESSION["user_name"];


$location= new Location();

$location->name = $_POST['name'];


$location->category_id=$_POST['category'];
$location->category_name=$_POST['categoryName'];

$location->lat =$_POST['lat'];
$location->lng =  $_POST['lng'];
$location->user_id = $user_id;

if(empty($location->name)) {
	fail('Please enter a name.');
}
if($locationId=$location->add_location())
{
	$photolist = array();
	$photo=new Photo();
	$photolist=$photo->find_photo_lists($user_id,$location->category_id);
	success(
	array('id'=>$locationId,'name' => $_POST['name'],'lat'=>$_POST['lat'],'lng'=>$_POST['lng'],'albumId'=>$_POST['category'],
	'albumName'=>$_POST['categoryName'],'photolists'=>$photolist));

}
else
{
	fail('Failed to add point.');
}

exit;
function fail($message) {
	die(json_encode(array('status' => 'fail', 'message' => $message)));
}

function success($data) {
	echo (json_encode(array('status' => 'success', 'location' => $data)));
}
?>
