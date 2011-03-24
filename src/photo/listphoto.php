<?php
//@reviewed by zj_du
//@email: duzhenjia@hotmail.com
//@skype:duzhenjia
//@Time: 2009.08.01
include("../common/common.php");
include("../common/members_only.php");
require_once "../includes/category.class.php";
require_once "../includes/photo.class.php";

page_protect();

$userName = $_SESSION["user_name"];
$user_id=$_SESSION['user_id'];

$smarty->assign('user_name',$_SESSION['user_name']);

$category_id=$_GET['id'];
$category_name=html_entity_decode($_GET['name']);


$photo=new Photo();

$photo->useId=$user_id;
$photo->categoryId=$category_id;


 $photolist=$photo->find_photo_lists_other($photo->useId,$photo->categoryId);
 	
 	$smarty->assign('albumId',$photo->categoryId);
	$smarty->assign('count',count($photolist));
	$smarty->assign('photolist',$photolist);
 	$smarty->assign('dirname',$category_name);
	$smarty->display('listphoto.tpl');
?>