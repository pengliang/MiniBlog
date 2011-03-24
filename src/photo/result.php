<?php
require_once("../common/common.php");

$action=$_GET[action];

switch($action){
	case "addphoto":
		include(ACTION_ROOT."addphoto.action.php");
		break;
	case "editphoto":
		include(ACTION_ROOT."editphoto.action.php");
		break;
	case "delphoto":
		include(ACTION_ROOT."delphoto.action.php");
		break;
	case "addalbum":
		include(ACTION_ROOT."addalbum.action.php");
		break;
	case "delalbum":
		include(ACTION_ROOT."delalbum.action.php");
		break;
	case "editalbum":
		include(ACTION_ROOT."editalbum.action.php");
		break;
	default:
		include("");
}
?>
