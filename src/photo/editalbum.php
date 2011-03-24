<?php
require_once("../common/common.php");
require_once("../common/members_only.php");
require_once(INCLUDES_DIR . 'category.class.php');

page_protect();
 
$user_id = $_SESSION['user_id'] ; 
$user_name=$_SESSION['user_name'];

$smarty->assign('user_name',$user_name);
$smarty->assign('user_id',$user_id);
 
$albumId=$_GET["id"];

$smarty->assign('albumId',$albumId);

$smarty->display('editalbum.tpl');


?>
