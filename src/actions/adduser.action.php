<?php

require_once("../common/common.php");
require_once("../includes/user.class.php");

$user_name=$_POST["user_name"];
$email=$_POST["email"];
$user_pwd=$_POST["user_pwd"];
$user_pwd_conf=$_POST["user_pwd_conf"];
$registtime=(int)date("Y-m-d H:i:s");

if($user_pwd==$user_pwd_conf){
	$user=new User($user_name,$user_pwd);
	
	$searches=$user->search_by("name",$user_name);
	
	$row_nums=mysql_num_rows($searches);
	if($row_nums==0){
		$user->set_regtime($registtime);
		$user->set_email($email);
		$user->set_gender(1);
		
		if($user->save_user()){
			header("Location: ../index.php");
		}else{
			echo "注册失败。";
		}
	}else{
		echo "用户名已经存在。";
	}
}else{
	echo "密码不一致。";
}

?>
