<?php
include("../common/common.php");

$action=$_GET[action];

switch($action){
	case "login" :
		include(ACTION_ROOT."login.action.php");
		break;
	case "adduser":
		include(ACTION_ROOT."adduser.action.php");
		break;
	case "edituser":
		include(ACTION_ROOT."edituser.action.php");
		break;
	case "deleteuser":
		include(ACTION_ROOT."deluser.action.php");
		break;
	default:
		include("../no_response.php");
}
?>
