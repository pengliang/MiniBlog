<?php
require_once("../common/common.php");

$action=$_GET[action];

switch($action){
	case "addarticle":
		include(ACTION_ROOT."addarticle.action.php");
		break;
	case "delarticle":
		include(ACTION_ROOT."delarticle.action.php");
		break;
	case "editarticle":
		include(ACTION_ROOT."editarticle.action.php");
		break;
	case "addcategory":
		include(ACTION_ROOT."addcategory.action.php");
		break;
	case "delcategory":
		include(ACTION_ROOT."delcategory.action.php");
		break;
	case "editcategory":
		include(ACTION_ROOT."editcategory.action.php");
		break;
	default:
		include("");
}
?>
