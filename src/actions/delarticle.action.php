<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR . 'article.class.php');

page_protect();

$user_id = ($_SESSION["user_id"]);
$user_name = ($_SESSION["user_name"]) ;

$article = new Article($link);
$article_id =$_POST["article_id"];

 
if($article->delete_article_by_id($user_id,$article_id))
{
	echo json_encode(array("status" =>"success"));
}
else
{
	echo json_encode(array("status" =>"fail"));
 	
}
?>