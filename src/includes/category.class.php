<?php
/**
 * @author sd-liang@teammersion.com
 * @date 2009-7-21
 *
 */
require_once("article.class.php");
require_once("user.class.php");
require_once("photo.class.php");

class Category{

	var $text ;
	var $user_id  ;
	var $type ;
	var $id;
	var $desc  ;
	
	function Category()
	{
	}
	function validate()
	{
		$this->text=($this->text);
		$this->user_id=($this->user_id);
		$this->type =($this->type);
	}
	/*
	 * @return :        true for success, else false.
	 * @parameter :
	 */
	function add_category()
	{
		$this->validate();

		$text=($this->text);
		$user_id=($this->user_id);
		$type =($this->type);
		$desc =$this->desc;	

		if(empty($text))
		{
			echo "category name cann't null";
		}
		else if($this->find_category($user_id,$text,$type)){
			echo "<script>parent.showError('1','分类名称不得重复.');parent.isOping=false;</script>";
			return 1;
		}
		else
		{
			$dirname=date("Ym");
			$createdate=time();
			$exec="insert into category (`dirname`, `text`, `userId`, `date`, `type`, `desc`) values ('$dirname','$text',$user_id,$createdate,'$type','$desc')";

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
	}
	/*
	 * @return :         true for success, else false.
	 * @parameter :  $user_id,$text
	 */
	function delete_category_by_id($user_id,$category_id,$defaultId)
	{
		$article=new Article();
			
		$query="delete from category where id=$category_id and userId=$user_id";

		if($article->update_article_to_default_category($this->user_id,$category_id,$defaultId))
		{
			if($result=mysql_query($query) && mysql_affected_rows())
			{
				return true;
			}
			else
			{
				echo "删除分类失败！<br>";
				return false;
			}
		}
		else
		{
			echo "移动文章到默认分类失败！<br>";
			return false;
		}
	}
	/*
	 * @return :         true for success, else false.
	 * @parameter :  $user_id,$text
	 */
	function delete_album_and_images($user_id,$category_id,$num)
	{
		$photo=new Photo();

		$query="delete from category where id=$category_id and userId =$user_id";
		
		if(intval($num) == 0)
		{
			if($result=mysql_query($query)&& mysql_affected_rows())
				{
					return true;
				}
				else
				{
					echo "删除相册失败!";
					return false;
				}
		}
		else
		{
			if($photo->delAllPhoto($category_id,$user_id))
			{
				if($result=mysql_query($query)&& mysql_affected_rows())
				{
					return true;
				}
				else
				{
					echo "删除相册失败!";
					return false;
				}
			}
			else
			{
				echo "删除照片失败！";
				return false;
			}
		}
	}
	/*
	 * @return:         true for success, else false.
	 * @parameter :   $category_id
	 */
	function update_category($user_id,$OldText,$newText)
	{

		$OldText=mysql_escape_string($OldText);
		$user_id=($user_id);
		$newText=($newText);
		$desc = $this->desc;
		
		$exec="update category
				set text='$newText',userId = $user_id,`desc`='$desc' 
				where  text='$OldText' and userId= $user_id";
			

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

	/*
	 * @return:         true for success, else false.
	 * @parameter :   $category_id
	 */
	function update_category_by_id($category_id)
	{
		$this->validate();

		$text=($this->text);
		$type =($this->type);
		$desc = $this->desc;
		$category_id= ($category_id);

		$exec="update category 	set text='$text',type='$type', `desc`='$desc' where id= $category_id ";

		$result=mysql_query($exec);

		if($result)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	/*
	 * @return :         category_text
	 * @parameter :		$category_id
	 */
	function find_category_by_id($category_id)
	{
		$category_id=($category_id);

		$query="select * from category where id = $category_id";

		$result= mysql_query($query) ;

		if($result && mysql_num_rows($result))
		{
			if($row=mysql_fetch_array($result))
			{
				return $row;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}

	}
	/*
	 * @return :         category list array
	 * @parameter :		 $user_id,$type
	 */
	function find_category_lists($user_id,$type)
	{
		$user_id=($user_id);
		$type  =($type);

		$query="select * from category where userId=$user_id and type='$type' order by id";

		$result= mysql_query($query) ;

		$categorylist;
		$photo=new Photo();
		if($result && mysql_num_rows($result))
		{
			$i=0;
			while($row=mysql_fetch_array($result))
			{
				$categorylist[$i]=$row;
				$categorylist[$i][10]=$photo->find_photo_by_category($user_id,$row["id"]);
				$i++;
			}
			return $categorylist;
		}
		else
		{
			return false;
		}

	}


	/*
	 * @return :         category list array
	 * @parameter :		 $user_id,$type
	 */
	function find_category_list($user_id,$type)
	{
		$user_id=($user_id);
		$type  =($type);

		$query="select * from category where userId=$user_id and type='$type' order by id";

		$result= mysql_query($query) ;

		if($result && mysql_num_rows($result))
		{
			return $result;
		}
		else
		{
			return false;
		}

	}
	/*
	 * @return  :    category_id
	 * @parameter :  $user_id ,$title,$type
	 */
	function find_category($user_id,$text,$type)
	{
		$category_id;

		$text= ($text);
		$user_id=($user_id);
		$type=($type);

		$query="select id from category where userId=$user_id and text='$text' and type='$type' order by id";

		$result= mysql_query($query) ;

		if($result && mysql_num_rows($result))
		{
			if($row=mysql_fetch_array($result))
			{
				$category_id=$row["id"];
				return $category_id;
			}
			else
			{
				return false;
				exit;
			}
		}
	}
}
?>