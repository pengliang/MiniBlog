<?php
/**
 * @author sd-liang@teammersion.com
 * @date 2009-7-29
 *
 */

class Location{

	var $id ;

	var $name ;
	var $lat ;
	var $lng ;
	var $category_id ;
	var $user_id;
	var $category_name ;

	function Location()
	{
	}

	/*
	 * @return :      true for success, else false.
	 * @parameter  :
	 */
	function add_location()
	{
		$name=($this->name);
		$lat=($this->lat);
		$lng = ($this->lng );
		$category_id=($this->category_id);
		$category_name=($this->category_name);
		$user_id = ($this->user_id );

		$exec="insert into locations (name,lat,lng,userId,categoryId,categoryName)
				values ('$name',$lat,$lng,$user_id,$category_id,'$category_name')";
				
		$result=mysql_query($exec);

		if($result && mysql_affected_rows())
		{
			$locat=$this->find_location($name,$user_id);
			$row=mysql_fetch_array($locat);
			
			return $row["id"];
		}
		else
		{
			echo $exec;
			return false;
		}
	}

	/*
	 * @return  :        true for success, else false.
	 * @parameter :
	 */
	function delete_location($user_id,$location_id)
	{
		$query="delete from locations where id=$location_id and userId=$user_id";
		$result=mysql_query($query);
		if($result && mysql_affected_rows())
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	/*
	 * @return  :        true for success, else false.
	 * @parameter  :    $category_id
	 */
	function update_location($location_id)
	{
		$name=($this->name);
	 
		$category_id=($this->category_id);
		$category_name=($this->category_name);
		 

		$exec="update locations set categoryName = '$category_name',categoryId=$category_id	where id=$location_id";
 
		$result=mysql_query($exec);
				
		if($result )
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	/*
	 * @return  :          article list array
	 * @parameter  : 		$field,$key
	 */
	function find_location_by($field,$key)
	{
		$query;
		switch($field){
			case "id":
				$query="select * from locations where id=$key";
				break;
			case "user_id":
				$query="select * from locations where userId=$key order by id desc";
				break;
		}
		if(!empty($query)){

			if($result= mysql_query($query))
			{
				return $result;
			}
			else
			{
				return false;
			}
		}else{
			echo "can't search by the field '$field'";
			return false;
		}
	}
	/*
	 * @return  :          article list array
	 * @parameter  : 		$field,$key
	 */
	function find_location($name,$user_id)
	{
 
		$query="select * from locations where userId=$user_id and name='$name' order by id desc";
 		if($result= mysql_query($query))
		{
			return $result;
		}
		else
		{
			return false;
		}
	}
}
?>
