<?php
require_once( "../common/common.php");
require_once("../common/members_only.php");
require_once(INCLUDES_DIR."photo.class.php");
require_once(INCLUDES_DIR."location.class.php");

page_protect();

$user_id= $_SESSION['user_id'];
$user_name=$_SESSION['user_name'];
$location = new Location();
$location->user_id =$user_id;

$points = array();


if($results = $location->find_location_by("user_id",$user_id))
{	
	$photolist = array();
	$photo=new Photo();

	while ($row = mysql_fetch_array($results, MYSQL_ASSOC)) {
		$photolist=$photo->find_photo_lists($user_id,$row["categoryId"]);
		array_push($points, array('id'=>$row['id'],'name' => $row['name'], 'lat' => $row['lat'], 'lng' => $row['lng'],
					'albumId'=>$row["categoryId"],'albumName'=>$row["categoryName"],'photolists'=>$photolist));
	}
	echo json_encode(array("Locations" => $points));
	exit;
}
 
function fail($message) {
	echo (json_encode(array('status' => 'fail', 'message' => $message)));
}

function success($data) {
	echo (json_encode(array('status' => 'success', 'data' => $data)));
}
?>
