<?php
require_once "../common/common.php";
require_once "../includes/photo.class.php";
require_once "../includes/category.class.php";
require_once "../common/members_only.php";

page_protect();
$user_id= $_SESSION["user_id"];
$user_name=$_SESSION["user_name"];

$smarty->assign('user_name',$user_name);

$src=$_GET['src'];

$category =new Category();
$photo_id=$_GET['id'];
$photo_name=$_GET['name'];

$dafult_id=$_GET["catId"];

if($result= $category->find_category_list($user_id,"image"))
{
	while($row=mysql_fetch_array($result))
	{
		$albumlist[$row["id"]]=$row["text"];
	}
	$smarty->assign('photo_id',$photo_id);
	$smarty->assign('photo_name',$photo_name);
	$smarty->assign('albumlist',$albumlist);
	$smarty->assign('dafult_id',$dafult_id);
	$smarty->assign('src',$src);
	$smarty->assign('photo_name',$photo_name);

}
else
{
	echo "获取相册列表失败！";
}
	$smarty->display('editphoto.tpl');

?>


