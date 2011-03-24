<?php
//@author:duzhenjia
//@email:duzhenjia@hotmail.com
//@last edit:2009.7.29
class Photo{
	var $name;
	var $date;
	var $physical;
	var $categoryId;
	var $useId;

	//construction function,add a connection
	function Photo()
	{

	}

	/* @add a photography
	 * @return: ture for success,else false
	 */
	function addPhoto()
	{
		$name=$this->name;
		$date=$this->date;
		$physical=$this->physical;
		$categoryId=$this->categoryId;
		$userId=$this->userId;

		$exec="insert into photo (name,date,physical,categoryId,userId)
							values ('$name','$date','$physical','$categoryId','$userId')";

		$result=mysql_query($exec);

		if($result && mysql_affected_rows())
		{
			return true;
		}
		else
		{
			echo "insert into photo failed.";
			return false;
		}

	}
	/* @delete a album's all photo
	 * @return: true for delete successfully,else false
	 * @param:  $name,$categaryId,$userId
	 */
	function delAllPhoto($albumId,$userId)
	{
		$exec="delete from photo where userId=$userId and categoryId=$albumId";

		$result=mysql_query($exec);

		if($result && mysql_affected_rows())
		{ 
			return true;
		}
		else
		{
			return false;
		}
	}

	/* @delete a photography
	 * @return: true for delete successfully,else false
	 * @param:  $name,$categaryId,$userId
	 */
	function delPhoto($photoId,$userId)
	{
 
		$exec="delete from photo where userId=$userId and id=$photoId";

		$result=mysql_query($exec);

		if($result && mysql_affected_rows())
		{ 
			return true;
		}
		else
		{
			return false;
		}
	}
	//update a photography
	function updatePhoto($photoId,$name)
	{
		$name=mysql_escape_string($name);
		$exec="update photo
				set name='$name'
				where id='$photoId'";

		$result=mysql_query($exec);

		if($result && mysql_affected_rows())
		{
			echo "update photo succcessfully!<br>";
			return true;
		}
		else
		{
			echo "update photo failed.<br>";
			return false;
		}
	}

	//@return:photoId
	//@param: name,userId,categoryID
	function find_photoId($name,$userId,$categoryId)
	{
		$photoId;
		$name=mysql_escape_string($name);
		$userId=mysql_escape_string($userId);
		$categoryId=mysql_escape_string($categoryId);
		$query="select id from photo where name='$name' and userId=$userId and categoryId=$categoryId";
		$result=mysql_query($query);

		$row=mysql_fetch_array($result);
		return intval($row["id"]);
		/*if($result && mysql_num_rows($result))
		 {
			if($row=mysql_fetch_array($result))
			{
			$photoId=$row["id"];
			return $photoId;
			}
			else
			{
			return false;
			exit;
			}
			}*/

	}
 
	//@return:photoId
	//@para: photo_physical
	function find_by_physical($photo_physical)
	{
		$photoId;
		$photo_physical=mysql_escape_string($photo_physical);
		$query="select id from photo where physical='$photo_physical'";
		$result=mysql_query($query);
		$row=mysql_fetch_array($result);
		//var_dump($result);
		$photoId=$row["id"];
		return intval($photoId);

	}
	//@return : photo_name
	//@param: photo_physical
	function find_name_by_physical($photo_physical)
	{
		$photo_name;
		$photo_physical=mysql_escape_string($photo_physical);
		$query="select name from photo where physical='$photo_physical'";
		$result=mysql_query($query);
		$row=mysql_fetch_array($result);
		//var_dump($result);
		$photo_name=$row["name"];
		return $photo_name;
	}
	//@return : photoId list
	//@param: user_id ,categoryId
	function find_photo_lists($user_id,$category_id)
	{
		$query="select * from photo where userId=$user_id and categoryId=$category_id";
			
		$results=mysql_query($query);

		$photolist= array();

		if($results)
		{
			while ($row = mysql_fetch_array($results)) {
				array_push($photolist, array('id'=>$row['id'],'name' => $row['name'],'date'=>$row['date'],'physcal' =>$row['physical']));
			}
			return $photolist;
		}
		else
		{
			echo $query;
			return false;
		}
	}
	//@return : photoId list
	//@param: user_id ,categoryId
	//@New: 2009-08-03 by sd-liang@teammersion.com
	function find_photo_lists_other($user_id,$category_id)
	{
		$query="select * from photo where userId=$user_id and categoryId=$category_id order by id";

		$result=mysql_query($query);

		if($result)
		{
			$i=0;
			while($row=mysql_fetch_array($result))
			{
				$photolist[$i]=$row;
				$i++;
 			}
			return $photolist;
		}
		else
		{
			return false;
		}
	}
	/*
	 * @return  :         	photo list's length 
	 * @parameter  : 		$user_id,$caetgory_id
	 */
	function find_photo_by_category($user_id,$caetgory_id)
	{

		$query="select * from photo where userId=$user_id and categoryId=$caetgory_id";

		if($result= mysql_query($query) )
		{
			return mysql_num_rows($result);
		}
		else
		{
			return false;
		}
	}
	//@return : photoId list
	//@param: user_id ,categoryId
	function find_photo_list($user_id,$category_id)
	{
		$query="select * from photo where userId=$user_id and categoryId=$category_id";

		$result=mysql_query($query);

		if($result)
		{
			return $result;
		}
		else
		{
			return false;
		}
	}
	//set,get functions
	function set_name($name)
	{
		$ths->name=$name;
	}

	function get_name()
	{
		return $this->name;
	}

	function set_date($date)
	{
		$this->date=$date;
	}

	function get_date()
	{
		return $this->date;
	}

	function set_physical($physical)
	{
		$this->physical=$physical;
	}

	function get_physical()
	{
		return $this->physical;
	}

	function set_categoryId($categoryId)
	{
		$this->categoryId=$categoryId;
	}

	function get_categoryId()
	{
		return $this->categoryId;
	}

	function set_userId($userId)
	{
		$this->userId=$userId;
	}

	function get_userId()
	{
		return $this->userId;
	}
}
?>