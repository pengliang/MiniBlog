<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR . 'category.class.php');
require_once(INCLUDES_DIR . 'article.class.php');

page_protect();
session_start();

$article_id =$_GET["id"];
$smarty->assign('article_id', $article_id);

$user_id =($_SESSION["user_id"] ) ;
$user_name=($_SESSION["user_name"]);

$smarty->assign('user_name', $user_name);

$category = new Category();
$article = new Article();

if($result = $article->find_article_by("id",$article_id))
{
	if($row=mysql_fetch_array($result))
	{
		$smarty->assign('article_title', ($row["title"]));
		$smarty->assign('article_content', $row["content"]);
	}
	$dafult_id=$row["categoryId"];

	if($result= $category->find_category_list($user_id,"article"))
	{
		while($row=mysql_fetch_array($result))
		{
			$categorylist[$row["id"]]=$row["text"];
 
		}
	
		$smarty->assign('category_options', $categorylist);
		$smarty->assign('category_id', $dafult_id);
		$smarty->display('editarticle.tpl');
	}
}
else
{
	echo "This article didn't exist.<br>";
}
?>