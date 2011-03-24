<?php
 header("Content-type: text/html; charset=utf-8"); 
require_once('../includes/page.class.php');
$page=new page(array('total'=>1000,'perpage'=>20,'url'=>'listarticle.php'));
echo $page->show();
/*echo '<hr>mode:2<br>'.$page->show(2);
echo '<hr>mode:3<br>'.$page->show(3);
echo '<hr>mode:4<br>'.$page->show(4);
echo '<hr>开始AJAX模式:';
$ajaxpage=new page(array('total'=>1000,'perpage'=>20,'ajax'=>'ajax_page','page_name'=>'test'));
echo 'mode:1<br>'.$ajaxpage->show();*/
?>