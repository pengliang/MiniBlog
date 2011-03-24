<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MiniBlog </title>

<link rel="stylesheet" href="js/lightbox/css/lightbox.css" type="text/css" media="screen"/>
<script type="text/javascript" src="js/lightbox/js/prototype.js"></script>
<script type="text/javascript" src="js/lightbox/js/scriptaculous.js?load=effects,builder"></script>
<script type="text/javascript" src="js/lightbox/js/lightbox.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body> 

<?php include("templates/top_header.html"); ?>
	<div id="content">
		<div id="bodyleftPan">
			<h2>images set 1</h2>
		
			<a href="images/header1.jpg" rel="lightbox" title="my caption"><img src="images/header1.jpg" width="100" height="40" alt="" /></a>
<ul>
			<li class="more"><a href="http://www.free-css.com/">Read more</a></li>
			<li class="comment">Comments: 03</li>
			</ul>
			<h3>images set 2</h3>
			<p class="greentext">L Piterson</p>
			<p class="browntext">03rd october 2006</p>
<a href="images/header1.jpg" rel="lightbox[test]" title="my caption"><img src="images/header1.jpg" width="100" height="40" alt="" /></a>
<a href="images/header1.jpg" rel="lightbox[test]" title="my caption"><img src="images/header1.jpg" width="100" height="40" alt="" /></a>
<a href="images/header1.jpg" rel="lightbox[test]" title="my caption"><img src="images/header1.jpg" width="100" height="40" alt="" /></a>
<a href="images/header1.jpg" rel="lightbox[test]" title="my caption"><img src="images/header1.jpg" width="100" height="40" alt="" /></a>
<a href="images/header1.jpg" rel="lightbox[test]" title="my caption"><img src="images/header1.jpg" width="100" height="40" alt="" /></a>
			<ul>
				<li class="more"><a href="http://www.free-css.com/">Read more</a></li>
				<li class="comment">Comments: 03</li>
			</ul>
		</div>
		<div id="bodyrightPan">
			<div id="loginPan">
				<h2>members <span>login</span></h2>
					<form action="user/login_action.php" method="post">
						<label>UserName</label><input name="user_name" type="text"/>
						<label>Password</label><input name="user_pwd" type="password"/>
						<input name="Input" type="submit" class="button" value="Login" />
					</form>
					<ul>
						<li class="nonregister">Not a member &nbsp;?</li>
						<li class="register"><a href="http://www.free-css.com/">Resister now</a> </li>
					</ul>
			</div>
			<div id="loginBottomPan">&nbsp;</div>
			<p class="hours"><a href="http://www.free-css.com/">24/7 hours</a></p>
		</div>
	</div>
	
<?php include("templates/footer.html"); ?>
</body>
</html>
