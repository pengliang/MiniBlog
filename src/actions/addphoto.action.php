<?php
require_once("../common/common.php");
require_once("../includes/category.class.php");
require_once("../common/members_only.php");
require_once("../includes/photo.class.php");

$categoryName=$_POST['categoryName'];
$categoryId=$_POST['categoryId'];
$user_id=$_POST["user_id"];
$user_name=$_POST["user_name"];
 
if (!empty($_FILES)) {

	$tempFile = $_FILES['Filedata']['tmp_name'];
	$targetPath =  '../uploads/'.$user_id .'/'.date("Ym").'/';
	$newFileName = $_FILES['Filedata']['name'];

	$fileParts=pathinfo($newFileName);
	$ext=$fileParts["extension"];//取得文件扩展名
	if(!is_dir($targetPath))
	{
		mkdir($targetPath);
	}
	$targetFile =str_replace('//','/',$targetPath).date("YmdHis").rand(1000,9999).".".$ext;		
	
	$photo = new Photo();
	$photo->name=$newFileName;
	$photo->date=(int)time();
	$photo->categoryId=$categoryId;
	$photo->userId =$user_id;
	$photo->physical=$targetFile;
 	
	if(move_uploaded_file($tempFile,$targetFile))
	{
		if($photo->addPhoto())
		{
			echo '1'; 
		}
	}
}
	?>