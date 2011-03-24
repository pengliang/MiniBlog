<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR . 'category.class.php');

page_protect();
session_start();

$user_id =mysql_escape_string($_SESSION["user_id"] ) ;
$user_name=mysql_escape_string($_SESSION["user_name"]);

$smarty->assign('user_name', $user_name);

$category = new Category();


if($result= $category->find_category_list($user_id,"article"))
{
	$smarty->assign('category_number', mysql_num_rows($result));
 	$i=0;
	while($row=mysql_fetch_array($result))
	{
		$categorylist[$i]=$row;
 
		 $i++;
	}
	$smarty->assign('categorylist', $categorylist);
}
	$smarty->display('editcategory.tpl');


?>
