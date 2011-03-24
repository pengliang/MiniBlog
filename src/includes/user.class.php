<?php
class User{

	var $user_id;
	var $user_name;
	var $user_pwd;
	var $email;
	var $gender;
	var $reg_time;
	var $birthday;
	var $address;
	var $realname;

	function User($name,$pwd){
		$this->user_name=$name;
		$this->user_pwd=$pwd;
	}

	function search_by($field,$key){
		$query_str;
		switch($field){
			case "id":
				$query_str="select * from userinfo where id='$key'";
				break;
			case "name":
				$query_str="select * from userinfo where user_name='$key'";
				break;
		}
		return $results=mysql_query($query_str);
	}

	/*
	 * @return  :          	userinfo
	 * @parameter  : 		$field,$key
	 */
	function find_user_by($field,$key)
	{
		$query;
		switch($field){
			case "id":
				$query="select * from userinfo where id=$key";
				break;
			case "name":
				$query="select * from userinfo where user_name='$key'";
				break;
		}
		if(!empty($query))
		{
			if($result= mysql_query($query))
			{
				return $result;
			}
			else
			{
				return false;
			}
		}
		else{
			echo "can't search by the field '$field'<br>";
			return false;
		}
	}

	function save_user(){
		$user_name=$this->user_name;
		$email=$this->email;
		$gender=$this->gender;
		$user_pwd=$this->user_pwd;
		$reg_time=$this->reg_time;
		$query_str="insert userinfo (user_name,email,user_pwd,gender,reg_time) values ('$user_name','$email','$user_pwd',$gender,'$reg_time')";

		mysql_query("begin");
 		mysql_query("set autocommit=0");

		mysql_query($query_str);

		/* add by sd-liang@teammersion.com*/

		$results=$this->search_by("name",$user_name);

		if($row=mysql_fetch_array($results))
		{
			$dirname=date("Ym");
			$user_id=$row["id"];		
			$imagerootName="默认相册";
			$rootName="默认分类";
			$query_str2="INSERT INTO `category` (`dirname`,`text`, `userId`, `type`) VALUES
							('$dirname','$rootName', $user_id, 'file'),
							('$dirname','$rootName', $user_id, 'article'),
							('$dirname','$imagerootName', $user_id, 'image'),
							('$dirname','$rootName', $user_id, 'link');";

			$re=mysql_query($query_str2);

			if($re && mysql_affected_rows())
			{
				$dir_path="../uploads/".$user_id."/";
				if(!is_dir($dir_path))
				{					
					if(mkdir($dir_path,0777)&& mkdir($dir_path.$dirname,0777))
					{						
						mysql_query("commit");
 						mysql_query("set autocommit=1");
						return true;
					}
					else
					{
 						mysql_query("rollback");
						mysql_query("set autocommit=1");
						return false;
					}
				}
				else
				{
 					mysql_query("commit");
 					mysql_query("set autocommit=1");
					return true;
				}
			}
			else
			{
 				mysql_query("rollback");
				mysql_query("set autocommit=1");
				return false;
			}
		}
		else
		{
 			mysql_query("rollback");
			mysql_query("set autocommit=1");
			return false;
		}
		/* end*/
	}


	function get_name(){
		return $this->user_name;
	}

	function set_name($name){
		$this->user_name=$name;
	}

	function get_pwd(){
		return $this->user_pwd;
	}

	function set_pwd($pwd){
		$this->user_pwd=$pwd;
	}

	function get_email(){
		return $this->email;
	}

	function set_email($email){
		$this->email=$email;
	}

	function get_gender(){
		return $this->gender;
	}

	function set_gender($gender){
		$this->gender=$gender;
	}

	function get_birthday(){
		return $this->birthday;
	}

	function set_birthday($birthday){
		$this->birthday=$birthday;
	}

	function get_regtime(){
		return $this->reg_time;
	}

	function set_regtime($regtime){
		$this->reg_time=$regtime;
	}

}
?>
