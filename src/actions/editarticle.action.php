<?php
require_once("../common/common.php");
require_once("../includes/article.class.php");
require_once("../includes/category.class.php");


$article = new Article();

$article->id=$_POST["article_id"];
$article->title=$_POST["article_title"];
$article->content=$_POST["article_content"];
$article->category_id=$_POST["category"];

echo "<script>parent.UnloadConfirm.clear();</script>";

if(empty($article->title))
{
	echo "article title cann't null";
}
else if(empty($article->content))
{
	echo "article cann't null";
}
else if(empty($article->category_id))
{
	echo "article category cann't null";
}
else
{
	$article->status=1;
	if($article->update_article($article->id))
	{
		echo "恭喜你，文章更新成功!";
		echo "<script>parent.location='listarticle.php';</script>";
	}
	else
	{
		echo "edit article failed!";
	}
}

?>