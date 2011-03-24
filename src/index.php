<?php
require_once('common/defaults.php');
require_once('common/common.php');
require_once('includes/article.class.php');
require_once('includes/smarty/Smarty.class.php');

$article = new article();

$articlelist;

if($result= $article->find_articles())
{
	$smarty->assign('articlenumber', mysql_num_rows($result));
	$i=0;
	while($row=mysql_fetch_array($result))
	{
		$articlelist[$i]=$row;
	 
		$articlelist[$i][3]=date("Y-m-d H:i",$row["date"]);
	 
		$i++;
	}
	$smarty->assign('articlelist', $articlelist);
}
else
{
	echo "error 11";
}
$smarty->display('index.tpl');

?>
