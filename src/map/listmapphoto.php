<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR . 'category.class.php');
require_once(INCLUDES_DIR . 'photo.class.php');

page_protect();
session_start();

$locationId= $_GET["id"];
$category_id =$_GET["id2"];
$albumName=$_GET["name"]
;
$user_id = $_SESSION["user_id"];
$user_name = $_SESSION["user_name"];

$smarty->assign('user_name', $user_name);

$category = new Category();

if($locationId)
{

	
	if($categorylist= $category->find_category_lists($user_id,"image"))
	{
		$smarty->assign('category_options', $categorylist);
		$smarty->assign('category_id',	 $category_id);
		
		$photo = new Photo();
	 
		if($photolist=$photo->find_photo_lists($user_id,$category_id))
		{
 			$location[0]=$locationId;
			$location[1]=$category_id;
			$location[2]=$albumName;
			$i=0;
			while($i<count($photolist))
			{		 
	
		 		$photolists[$i][0]=$photolist[$i]["id"];
		 		$photolists[$i][1]=$photolist[$i]["name"];
		 		$photolists[$i][2]=$photolist[$i]["date"];
		 		$photolists[$i][3]=$photolist[$i]["physcal"];
		 	 
		 		$i++;	 		
		 		
			}
		     $smarty->assign('photolists',$photolists);
		 	 $smarty->assign('photonumber',4);
			 $smarty->assign('location', ($location));

			 $smarty->display('listmapphoto.tpl');
			
		}
		else
		{
			echo "user_id: ".$user_id."  category_id: ".$category_id;
		}
	}

	else
	{
		echo "locationId: ".$locationId."  category_id: ".$category_id."   albumName:".$albumName;
	}
}


?>