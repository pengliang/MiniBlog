<?php
require_once("../common/common.php");
require_once("../includes/category.class.php");
require_once("../common/members_only.php");

page_protect();

$user_id=$_SESSION['user_id'];
$user_name=$_SESSION['user_name'];
$category = new Category();
$category->text=$_POST["albumname"];
$category->desc=$_POST["albumdesc"];
$category->type="image";
$category->user_id=$user_id;
$dirname=date("Ym");
//make a dir on the server
$path= "../uploads/".$user_id."/".$dirname;

if(!is_dir($path))
{
	mkdir($path,0777);
}
else if(is_dir($path))
{
	if($category->add_category())
	{
		if($category_id=$category->find_category($user_id,$category->text,$category->type))
		{
				$albumName=htmlentities($category->text,ENT_QUOTES,"UTF-8");
				$albumDesc=htmlentities($category->desc,ENT_QUOTES,"UTF-8");
				$album= array("albumId" => "$category_id", "albumName" => $albumName,"albumDesc" => $albumDesc);
				echo json_encode(array("status"=>"success","album"=>$album));
 		}
	}
	else
	{
		echo json_encode(array("status"=>"fail"));
	}
}
else
{
	echo "Failed to mkdir";
}

?>