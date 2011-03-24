<?php
/**
 * @author sd-liang@teammersion.com
 * @date 2009-7-21
 *
 */
require_once("category.class.php");

class Article{

	var $title ;
 	var $content  ;
	var $date ;
	var $author_id ;
	var $author_name ;
	var $type ="article";
	var $status  ;

	function Article()
	{
	}
	function validate()
	{
		$this->title=($this->title);
		$this->category_id=(($this->category_id));
		$this->content=( ($this->content));
		$this->author_id=(($this->author_id));
		$this->author_name=(($this->author_name));
		$type="article";
		$this->status =(($this->status));
	}
	/*
	 * @return :      true for success, else false.
	 * @parameter  :
	 */
	function add_article()
	{
 		$this->validate();
		
		$title=($this->title);
		$category_id=($this->category_id);
		$content= ($this->content);
		$author_id=($this->author_id);
		$author_name=($this->author_name);
		$type="article";
		$status =($this->status);
		$date=(int)time();
//		if($this->find_article_by_title($author_id,$title))
//		{
//			echo "此文章标题已经存在！<br>";
//			return false;
//		}
//		else
		{
			$exec="insert into entry (title,content,date,authorId,authorName,status,categoryId)
				values ('$title','$content',$date,$author_id,'$author_name',$status,$category_id)";
			
		 
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
	 * @return  :        true for success, else false.
	 * @parameter :
	 */
	function delete_article_by_id($user_id,$article_id)
	{
		$article_id=($article_id);
		$query="delete  from entry where id=$article_id and authorId=$user_id";
		$result=mysql_query($query);
		 
		if($result && mysql_affected_rows())
		{
			return true;
		}
		else
		{
			echo $query;
			return false;
		}
	}
	/*
	 * @return  :        true for success, else false.
	 * @parameter :  $user_id,$title
	 */
	function delete_article($user_id,$title)
	{
		$user_id=($user_id);
		$title = ($title);
		$query="delete from  where authorId =$user_id and title=$title";
		$result=mysql_query($query);
		if($result && mysql_affected_rows())
		{
			echo "delete article succcessfully!<br>";
			return true;
		}
		else
		{
			echo "delete article failed.<br>";
			return false;
		}
	}

	/*
	 * @return  :        true for success, else false.
	 * @parameter  :    $category_id
	 */
	function update_article($article_id)
	{
		$this->validate();
				
		$title=($this->title);
		$category_id= ($this->category_id);
		$content=($this->content);
		$date=(int)time();
		$article_id = ($article_id);

		$exec="update entry
				set title='$title',content='$content',date=$date,categoryId=$category_id
				where id=$article_id";
	
		$result=mysql_query($exec);
			
		if($result && mysql_affected_rows() )
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
	 * @parameter  : 		 
	 */
	  function update_article_to_default_category($user_id,$caetgory_id,$dafult_categoryId)
	  {
		$exec="update entry  set categoryId=$dafult_categoryId
			   where categoryId=$caetgory_id";
		
		if($result= mysql_query($exec) )
		{
			return $result;
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
	function find_article_by($field,$key)
	{
		$query;
		switch($field){
			case "id":
				$query="select * from entry where id=$key";
				break;
			case "author_id":
				$query="select * from entry where authorId=$key order by date desc";
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
	function find_article_by_category($user_id,$caetgory_id)
	{

		$query="select * from entry where authorId='$user_id' and categoryId=$caetgory_id";

		if($result= mysql_query($query) )
		{
			return $result;
		}
		else
		{
			return false;
		}
	}
	/*
	 * @return      article_id
	 * @parameter  : $user_id $title
	 */
	function find_article_by_title($user_id,$title)
	{
		$article_id;

		$query="select id from entry where authorId='$user_id' and title='$title'";
		

		$result= mysql_query($query) ;

		if($result && mysql_num_rows($result))
		{

			if($row=mysql_fetch_array($result))
			{
				$article_id=$row["id"];
				return $article_id;
			}
			else
			{
				return false;
			}
		}
	}
	/*
	 * @return      article_id
	 * @parameter  : $user_id $title
	 */
	function find_articles()
	{		$query="select * from entry order by date desc limit 0 , 100";
		if($results= mysql_query($query))
		{
			return $results;
		}
		else
		{
			return false;
		}
	}

}
?>
