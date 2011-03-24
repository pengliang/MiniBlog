<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!--@reviewed by  : zj-du -->
<!--@reviewed time: 2009.08.01 -->
<!--@email:duzhenjia@hotmail.com-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Miniblog--Photos</title>
		<link href="../css/style.css" rel="stylesheet" type="text/css" />
		<link href="../css/form.css" rel="stylesheet" type="text/css" />
		<link href="../css/menu_style.css" rel="stylesheet" type="text/css" />
	</head>
	
	<body >
		<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
		
		{{include file="header.tpl"}}
		
		<div id="content">
			{{include file="menu.inc"}}
			<table border="0" cellspacing="6" cellpadding="1" class="formhd">
				<tr align="center">
					<td width="582" nowrap class="f14">
						<a href="#" target="_blank"><img src="../images/Check.png" border="0" alt="操作成功" style="margin-right:10px"></a>
					</td>
				</tr>
				<tr align="center">
					<td>
						<div style="padding-top:5px;padding-left:10px">
						<br><br>恭喜您，操作成功!<br><br>
						您可以：<a href="addPhoto.php" ><img src="../images/uploadPhoto.jpg" border="0" alt="上传照片"></a>或者 返回<a href="./photo_ini.php"><img src="../images/dirlist.jpg" border="0" alt="上传照片"></a>。<br><br><br>	
						</div>
					</td>
				</tr>
			</table>
		</div>
 
		{{include file="footer.html"}}
	</body>
</html>