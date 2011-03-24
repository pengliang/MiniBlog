<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR . 'category.class.php');
require_once(INCLUDES_DIR . 'article.class.php');

page_protect();
session_start();

$user_id =($_SESSION["user_id"] ) ;
$user_name=($_SESSION["user_name"]);

$smarty->assign('user_name', $user_name);

$category = new Category();

$article = new Article();

if($result= $article->find_article_by("author_id",$user_id))
{
	$smarty->assign('articlenumber', mysql_num_rows($result));
	$i=0;
	while($row=mysql_fetch_array($result))
	{
		$articlelist[$i]=$row;
		if($cat_result=$category->find_category_by_id($row["categoryId"]))
		{
			$articlelist[$i][8]=$cat_result["text"];
		}
		$articlelist[$i][3]=date("Y-m-d H:i",$row["date"]);
 
		$i++;
	}
	$smarty->assign('articlelist', $articlelist);
}
if($result= $category->find_category_list($user_id ,"article"))
{
	$smarty->assign('category_number', mysql_num_rows($result));
	$i=0;
	while($row=mysql_fetch_array($result))
	{
		$categorylist[$i][0]=$row["text"];
		$categorylist[$i][2]=$row["id"];
		
		if($re=$article->find_article_by_category($user_id,$row["id"]))
		{	
			$categorylist[$i][1]=mysql_num_rows($re);
		}
		else
		{
			$categorylist[$i][1]=0;
		}
 
		$i++;
	}
	$smarty->assign('categorylist', $categorylist);
 }
$smarty->display('listarticle.tpl');
?>
