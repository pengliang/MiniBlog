<?php

require_once("../common/common.php");
require_once("../common/members_only.php");
require_once(INCLUDES_DIR . 'category.class.php');

page_protect();
 
$user_id = $_SESSION['user_id'] ; 
$user_name=$_SESSION['user_name'];

$smarty->assign('user_name',$user_name);
$smarty->assign('user_id',$user_id);

$category = new Category();
$category->type="image";

if(!($defaultId=$_GET["id"]))
{
	$defaultId= 1;
}

if($result= $category->find_category_list($user_id,"image"))
{
	while($row=mysql_fetch_array($result))
	{
		$categorylist[$row["id"]]=$row["text"];
	}
	$smarty->assign('category_options', $categorylist);
	$smarty->assign('defaultId', $defaultId);
	
	$smarty->display('addphoto.tpl');
}
else
{
	echo "Your database didn't initialize.";	
}

?>
