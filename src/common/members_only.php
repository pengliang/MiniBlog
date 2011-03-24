<?php
function page_protect() {
		
	session_start();

	//check for cookies

	if(isset($_COOKIE['user_id']) && isset($_COOKIE['user_name'])){
	 $_SESSION['user_id'] = $_COOKIE['user_id'];
	 $_SESSION['user_name'] = $_COOKIE['user_name'];
	}


 if (!isset($_SESSION['user_id']))
	 {
		header("Location: ../user/login.php");
	}
/*******************END********************************/
}
?>