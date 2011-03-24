<?php
require_once("../common/common.php");
require_once("../includes/article.class.php");
require_once("../includes/category.class.php");
require_once("../common/members_only.php");

page_protect();

session_start();

$user_id =($_SESSION["user_id"]);
$user_name = ($_SESSION["user_name"]);

$article = new Article();

$article->title=($_POST["article_title"]);
$article->content=($_POST["article_content"]);
$article->category_id=((int)$_POST["category"]);

$article->author_id=$user_id;
$article->author_name=$user_name;

if(empty($article->title))
{
	echo "请输入文章标题！";
}
else if(empty($article->content))
{
	echo "文章内容不能为空！";
}
else if(empty($article->category_id))
{
	echo "分类名称不能为空！";
}
else
{
	$article->status=1;
	if($article->add_article())
	{
		echo "恭喜你，添加文章成功!";
		echo "<script>parent.UnloadConfirm.clear();parent.location='listarticle.php'</script>";
	}
	else
	{
		echo "添加文章失败!";
	}
}

?>