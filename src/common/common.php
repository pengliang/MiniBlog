<?php
require_once("defaults.php");
require_once(SMARTY_DIR . 'Smarty.class.php');
header( 'Content-Type: text/html; charset=utf-8' );

//==================================db setting=========================
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "miniblog";

date_default_timezone_set("UTC");

$link=mysql_connect($dbhost,$dbuser,$dbpass);
if(!$link){
	die("database connect error!<br> Please check your database setting in common.php");
}
mysql_select_db($dbname,$link);
//====================================================
iconv_set_encoding("internal_encoding", "UTF-8");
iconv_set_encoding("output_encoding", "UTF-8");
iconv_set_encoding("input_encoding", "UTF-8");
iconv_set_encoding("all", "UTF-8");
//==================================smarty setting==========================
$smarty=new Smarty;

$smarty= new Smarty;
$smarty->template_dir = CL_ROOT."/templates" ;
$smarty->compile_dir = CL_ROOT."/templates_c";
$smarty->config_dir = CL_ROOT."/configs/";
$smarty->cache_dir = CL_ROOT."/cache/";
$smarty->plugins_dir=CL_ROOT."/includes/smarty/plugins/";
$smarty->left_delimiter = '{{';
$smarty->right_delimiter = '}}';

?>