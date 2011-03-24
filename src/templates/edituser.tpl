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
	{{include file="menu.inc"}}
  	<div class="content-box">
    	<img class="content-header" src="../images/content-box-header.jpg"/>
    	<div id="formbox">
      		<form method="post" action="result.php?action=edit">
				<div class="fieldblock">
	  				<label for="name">RealName:</label>
	 				<input name="realname" type="text" value={{$realname}}>
				</div>
				<div class="fieldblock">
	  				<label for="email">Email:</label>
	  				<input name="email" type="text" value={{$email}}>
				</div>
				<div class="fieldblock">
	  				<label for="gender">Gender:</label>
					<select size="1" name="gender" id="gender">
						<option value="Male">Male</option>
						<option value="Female">Female</option>
						<option value="Don't Ask">Don't Ask</option>
					</select>
				</div>
				<div class="fieldblock">
					<label for="birthday">Date of Birth:</label>
						 {{html_select_date  start_year="-70" end_year="+0" }}
				</div>
				<div class="fieldblock">
				  <label for="address">Address:</label>
	 			  <input name="address" type="text" value={{$address}}>
				</div>
				<div id="submitblock"> 
				  <input name="submit" type="image" src="../images/submit.gif" value="Save"/>
				</div>
    	   </form>
		</div>
     	<img class="content-footer" src="../images/content-box-footer.jpg"/>
	</div>
</div>

{{include file="footer.html"}}
</body>
</html>
