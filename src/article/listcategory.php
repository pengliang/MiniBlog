<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR . 'category.class.php');

page_protect();
session_start();

$user_id =($_SESSION["user_id"] ) ;
$user_name=($_SESSION["user_name"]);

$smarty->assign('user_name', $user_name);

$category = new Category();

if($result= $category->find_category_list($user_id,"article"))
{
	$smarty->assign('category_number', mysql_num_rows($result)-1);
 	$i=0;
	while($row=mysql_fetch_array($result))
	{
		if(!($row[2] == "默认分类"))
		{
			$categorylist[$i]=$row;
			$i++;
		}
		else
		{
			$defaultId=$row[0];
		}
	}
	$smarty->assign('categorylist', $categorylist);
	$smarty->assign('defaultId', $defaultId);
}
else
{
	 
}

	$smarty->display('listcategory.tpl');


?>
