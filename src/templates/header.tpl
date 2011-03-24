<!-- stylesheets -->
  	<link rel="stylesheet" href="../resources/login_panel/css/slide.css" type="text/css" media="screen" />
	
  	<!-- PNG FIX for IE6 -->
  	<!-- http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
	<!--[if lte IE 6]>
		<script type="text/javascript" src="../resources/login_panel/js/pngfix/supersleight-min.js"></script>
	<![endif]-->
	 
    <!-- jQuery - the core -->
	<script src="../resources/login_panel/js/jquery-1.3.2.min.js" type="text/javascript"></script>
	<!-- Sliding effect -->
	<script src="../resources/login_panel/js/slide.js" type="text/javascript"></script>

<!-- import the RSV function library -->
  <script type="text/javascript" src="../js/rsv.js"></script>
<script type="text/javascript">

  var login_rules = [];
login_rules.push("required,user_name,Please enter your account name.");
login_rules.push("required,user_pwd,Please enter your password.");
var reg_rules=[];
reg_rules.push("required,user_name,Please enter your account name.");
reg_rules.push("required,user_pwd,Please enter your password.");
reg_rules.push("required,user_pwd_conf,Please confirm your password.");
reg_rules.push("required,email,Please enter your email address.");
reg_rules.push("valid_email,email,Please enter a valid email address.");
</script>

{{if $user_name}}
<!-- Panel -->
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
		</div>
	</div> <!-- /login -->	

    <!-- The tab on top -->	
	<div class="tab">
		<ul class="login">
	    	<li class="left">&nbsp;</li>
	        <li>Hello {{$user_name}} </li>
			<li class="sep">|</li>
			<li id="toggle">
				<a id="open" class="open" href="../user/logout.php">Leave</a>
				<a id="close" style="display: none;" class="close" href="#">Close Panel</a>			
			</li>
	    	<li class="right">&nbsp;</li>
		</ul> 
	</div> <!-- / top -->
	
</div> <!--panel -->
{{else}}
<!-- Panel -->
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
			<div class="left">
				<h1>Welcome to MiniBlog</h1>
				<h2>This is our first PHP demo </h2>		
				<p class="grey">You can put your article and images here.</p>
			</div>
			<div class="left">
				<!-- Login Form -->
				<form class="clearfix" action="../user/result.php?action=login" method="post" onsubmit="return rsv.validate(this, login_rules)">
					<h1>Member Login</h1>
					<label class="grey" for="log">Username:</label>
					<input class="field" type="text" name="user_name" id="log" value="" size="23" />
					<label class="grey" for="pwd">Password:</label>
					<input class="field" type="password" name="user_pwd" id="pwd" size="23" />
	            	<label><input name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" /> &nbsp;Remember me</label>
        			<div class="clear"></div>
					<input type="submit" name="submit" value="Login" class="bt_login" />
					<a class="lost-pwd" href="#">Lost your password?</a>
				</form>
			</div>
			<div class="left right">			
				<!-- Register Form -->

				<form action="../user/result.php?action=adduser" method="post" onsubmit="return rsv.validate(this, reg_rules)">
					<h1>Not a member yet? </h1>				
					<label class="grey" for="signup">UserName:</label>
					<input class="field" type="text" name="user_name" id="signup" value="" size="23" />
					<label class="grey" for="email">Email:</label>
					<input class="field" type="text" name="email" id="email" size="23" />
					<label class="grey" for="password">Password:</label>
					<input class="field" type="password" name="user_pwd" id="password" size="23" />
					<label class="grey" for="pwd_conf">Conf Password:</label>
					<input class="field" type="password" name="user_pwd_conf" id="pwd_conf" size="23" />
					<input type="submit" name="submit" value="Register" class="bt_register" />
				</form>
			</div>
		</div>
	</div> <!-- /login -->	

    <!-- The tab on top -->	
	<div class="tab">
		<ul class="login">
	    	<li class="left">&nbsp;</li>
	        <li>Hello Guest</li>
			<li class="sep">|</li>
			<li id="toggle">
				<a id="open" class="open" href="#">Join</a>
				<a id="close" style="display: none;" class="close" href="#">Close Panel</a>			
			</li>
	    	<li class="right">&nbsp;</li>
		</ul> 
	</div> <!-- / top -->
	
</div> <!--panel -->
{{/if}}
<div id="header">
  <div id="topHeaderPan">
    <ul>
	<li class="company"><a href="../index.php">Home</a></li>
	<li class="company"><a href="#">About me</a></li>
	<li class="company"><a href="#">Contact</a></li>
	<li class="company"><a href="../article/listarticle.php">Blogs </a></li>
	<li class="company"><a href="../photo/listalbum.php">Photos </a></li>
	<li style="width:150px" class="client"><a style="width:150px" href="../map/listlocation.php">Travel Lounge</a></li>
	
    </ul>
    <a href="#"><img src="../images/logo.jpg"
	title="Blog Division" alt="MiniBlog" width="191" height="84"
	border="0" /></a>
  </div>
</div>
