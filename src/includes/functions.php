<?php

//@out-of-date: 2009.08.01 

require_once "../includes/category.class.php";
require_once "../includes/photo.class.php";
require_once "../common/common.php";

// 归类文件夹和文件,按文件夹到文件顺序排列,普通显示
function changeList($array) {
	global $dir,$rootdir;
	if (is_array($array)) {
		foreach($array AS $value) {
			$os = PHP_OS;
			if($os != 'WINNT') {
				$url = rawurlencode($value);
			} else {
				$url = $value;
			}
			if(preg_match('/\.[png|gif|jpg|bmp]/', $value)) {
				$photo=new photo();
				$photo->physical=$rootdir.$url;

				$query="select name from photo where physical='$photo->physical'";
				//echo $query;
				$result=mysql_query($query);
				$row=mysql_fetch_array($result);
				$showname=$row["name"];

				$htm .= "<div class=\"imgli\"><a rel=\"lightbox\" href=\"".$rootdir.$url."\" target=\"_blank\"><img class=\"imgclass\" src=\"".$rootdir.$url."\" border=\"0\" width=\"100\" height=\"80\"><br /><font color=\"#FF0000\">$showname</font></a><br><a href=\"photoEdit.php?action=del&physical=".$photo->physical."\"><font color=\"#FF0000\">删除   </font></a><a href=\"photoEdit.php?action=edit&physical=".$photo->physical."\" ><font color=\"#FF0000\">  编辑</font></a></br></div><hr>";		
					
			} elseif (preg_match('/\.[^png|gif|jpg|bmp]/', $value)) {
				$htm2 .= "<li class=\"imgli\"><a rel=\"lightbox\" href=\"photo_ini.php?imgdir=".$rootdir.$url."\"><img src=\"../images/dir.gif \" border=\"0\" width=\"100\" height=\"80\"><br />"."<font color=\"#FF0000\">$value</font>"."</a></li><hr>";
			} else {
				$htm3 .= "<li class=\"imgli\"><a href=\"photo_ini.php?imgdir=".$rootdir.$url."\"><img src=\"../images/dir.gif \" border=\"0\" width=\"100\" height=\"80\"><br />"."<font color=\"#FF0000\">$value</font>"."相册</a></li><hr>";
			}
		}
		$html = '<div id="showimg">'.$htm3.$htm2.$htm.'</div>';
	}
	return $html;
}



// 显示图片列表及分页信息,普通显示
function showImgList($imgArr, $page, $pageSize) {
	$li = explode('<hr>', $imgArr);
	$total = count($li) - 1;
	$page = ($page == '') ? 1 : $page;
	$limit = ($total < $pageSize) ? $total : $pageSize;
	$start = $pageSize * ($page - 1);
	$show = array_slice($li, $start, $limit);
	if($page != 1) {
		$htm = "<div id=\"showimg\">";
	}
	$htm=$htm."<ul>";
	foreach($show AS $v) {
		$htm.=$v;
	}
	$ret = "";
	$htm .='</ul></div>';
	$ret = "<div align=\"center\">";
	$ret.= $htm;

	$ret.= multi($total, $pageSize, $page, '');
	$ret.= "</div >";
	return $ret;

}



/**
 * 获取文件夹列表
 *
 * @param string $folder ：
 * @param boolean $is_subdir ：
 * @return array ;
 */
function getDirList($folder, $is_subdir = false, $user_id) {
	if (is_dir($folder)) {
		$handle = opendir($folder);
		while (false !== ($myfile = readdir($handle))) {
			if ($myfile != "." && $myfile != "..") {
				$category=new category();
				$category->text=$myfile;
				$category->user_id=$user_id;

				//$category_id=$category->find_category(1,$myfile,"image");
				if(!is_dir($folder."/".$myfile))
				{
					$fileTime[] = @filemtime($myfile);
					$dirList[] = $myfile;
				}
				else{
						

					if($category->find_category($category->user_id,$myfile,"image"))
					{
						$fileTime[] = @filemtime($myfile);
						$dirList[] = $myfile;
					}
				}

				unset($category);
			}
		}
		arsort($fileTime);
		$newList = array();
		foreach($fileTime AS $key=>$time) {
			$newList[] = $dirList[$key];
		}
		closedir($handle);
		unset($folder, $is_subdir);
		//var_dump($newList);
		return $newList;
	}
	else
	{
		echo "getDirList error";
	}


}
 
// 分页函数
function multi($num, $perpage, $curr_page, $mpurl) {
	$multipage = '';
	if($num > $perpage) {
		$page = 10;
		$offset = 2;

		$pages = ceil($num / $perpage);
		$from = $curr_page - $offset;
		$to = $curr_page + $page - $offset - 1;
		if($page > $pages) {
			$from = 1;
			$to = $pages;
		} else {
			if($from < 1) {
				$to = $curr_page + 1 - $from;
				$from = 1;
				if(($to - $from) < $page && ($to - $from) < $pages) {
					$to = $page;
				}
			} elseif($to > $pages) {
				$from = $curr_page - $pages + $to;
				$to = $pages;
				if(($to - $from) < $page && ($to - $from) < $pages) {
					$from = $pages - $page + 1;
				}
			}
		}
		$multipage .= "<a href=\"$mpurl?page=1\"><font color=\"#FF0000\">首页</font></a> ";
		for($i = $from; $i <= $to; $i++) {
			if($i != $curr_page) {
				$multipage .= "<a href=\"$mpurl?page=$i\"><font color=\"#FF0000\">$i</font></a>";
			} else {
				$multipage .= '<strong>'.$i.'</strong>';
			}
		}
		$multipage .= $pages > $page ? "……<a href=\"$mpurl?page=$pages\"><font color=\"#FF0000\">尾页</font></a>" : "<a href=\"$mpurl&page=$pages\"><font color=\"#FF0000\">尾页</font></a>";
	}
	return $multipage;
}
 
?>

