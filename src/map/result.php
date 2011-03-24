<?php
require_once("../common/common.php");

$action=$_GET[action];

switch($action){
	case "addlocation":
		include(ACTION_ROOT."addlocation.action.php");
		break;
	case "dellocation":
		include(ACTION_ROOT."dellocation.action.php");
		break;
	case "editlocation":
		include(ACTION_ROOT."editlocation.action.php");
		break;
	case "listlocation":
		include(ACTION_ROOT."listlocation.action.php");
		break;
	default:
		include("");
}
?>
