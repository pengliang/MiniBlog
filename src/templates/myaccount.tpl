<?php 
include("../common/members_only.php");
page_protect();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MiniBlog </title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<link href="../css/menu_style.css" rel="stylesheet" type="text/css" />
</head>
<body> 
{{include file="header.tpl"}}
	<div id="content">
		<div class="outer">
		<div class="menu">
			<ul>
				<li><a href="../user/edit.php">My Profile</a></li>
				<li><a href="addarticle.php">Add Article</a></li>
				<li><a href="listarticle.php">My Blogs</a></li>
				<li><a href="../photo_ini.php">My Photos</a></li>
				<li><a href="#">Support</a></li>
			</ul>
		</div>
	</div>
		<div id="bodyrightPan">
<div id="toprightPan">
		    <ul>
		      <li class="home">Home</li>
		      <li class="about"><a href="http://www.free-css.com/">About us</a></li>
		      <li class="contact"><a href="http://www.free-css.com/">contact</a></li>
		    </ul>
		  </div>
			<div id="servicesPan">&nbsp;</div>
	  <div id="servicesBodyPan">
	        <p class="services">ControlCenter </p>
      <p class="boldbrowntext">Name: {{$user_name}} </p>
      <p class="boldbrowntext">Gender: {{$gender}} </p>
      <p class="bluetext">Email: {{$email}}</p>
      <p class="link"><a href="edit.php">click here to Edit</a></p>
	  </div>
	  <div id="servicesBottomPan">&nbsp;</div>
		</div>
	</div>
	
{{include file="footer.html"}}
</body>
</html>
