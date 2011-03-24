<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MiniBlog </title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/form.css" rel="stylesheet" type="text/css" />
<link href="css/menu_style.css" rel="stylesheet" type="text/css" />
</head>
<body> 
<?php include("templates/top_header.html"); ?>

<div id="content">
  <div class="outer">
<div class="menu">

<ul>

    <li><a href="#">News</a></li>

    <li><a href="#">Features</a></li>

    <li><a href="#">Getting Started</a></li>

    <li><a href="#">Support</a></li>
</ul>


</div>
</div>
  <div class="content-box">
    <img class="content-header" src="images/content-box-header.jpg"/>
    <div id="formbox">
      <form method="post" action="result.php?action=adduser">
	<div class="fieldblock">
	  <label for="name">UserName:</label>
	  <input name="user_name" type="text"/>
	</div>
	<div class="fieldblock">
	  <label for="user_pwd">Password:</label>
	  <input name="user_pwd" type="password"/>
	</div>
	<div class="fieldblock">
	  <label for="user_pwd_conf">Confirm Password:</label>
	  <input name="user_pwd_conf" type="password"/>
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
	       <select size="1" name="dobMonth" id="dobMonth">
		 <option value="Jan">Jan</option>
                 <option value="Feb">Feb</option>
                 <option value="Mar">Mar</option>
                 <option value="Apr">Apr</option>
                 <option value="May">May</option>
                 <option value="Jun">Jun</option>
                 <option value="Jul">Jul</option>
                 <option value="Aug">Aug</option>
                 <option value="Sep">Sep</option>
                 <option value="Oct">Oct</option>
                 <option value="Nov">Nov</option>
                 <option value="Dec">Dec</option>
                </select>

                <select size="1" name="dobDay" id="dobDay">
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option>
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>		  
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
                <select size="1" name="dobYear" id="dobYear">
                  <option value="2000">2000</option>
                  <option value="1999">1999</option>
                  <option value="1998">1998</option>
                    <option value="1997">1997</option>
                    <option value="1996">1996</option>
                    <option value="1995">1995</option>
		    <option value="1994">1994</option>
		    <option value="1993">1993</option>
		    <option value="1992">1992</option>

		    <option value="1991">1991</option>
		    <option value="1990">1990</option>
		    <option value="1989">1989</option>
		    <option value="1988">1988</option>
		    <option value="1987">1987</option>
		    <option value="1986">1986</option>

		    <option value="1985">1985</option>
		    <option value="1984">1984</option>
		    <option value="1983">1983</option>
		    <option value="1982">1982</option>
		    <option value="1981">1981</option>
		    <option value="1980">1980</option>

		    <option value="1979">1979</option>
		    <option value="1978">1978</option>
		    <option value="1977">1977</option>
		    <option value="1976">1976</option>
		    <option value="1975">1975</option>
		    <option value="1974">1974</option>

		    <option value="1973">1973</option>
		    <option value="1972">1972</option>
		    <option value="1971">1971</option>
		    <option value="1970">1970</option>
		    <option value="1969">1969</option>
		    <option value="1968">1968</option>

		    <option value="1967">1967</option>
		    <option value="1966">1966</option>
		    <option value="1965">1965</option>
		    <option value="1964">1964</option>
		    <option value="1963">1963</option>
		    <option value="1962">1962</option>

		    <option value="1961">1961</option>
		    <option value="1960">1960</option>
		    <option value="1959">1959</option>
		    <option value="1958">1958</option>
		    <option value="1957">1957</option>
		    <option value="1956">1956</option>

		    <option value="1955">1955</option>
		    <option value="1954">1954</option>
		    <option value="1953">1953</option>
		    <option value="1952">1952</option>
		<option value="1951">1951</option>
		<option value="1950">1950</option>

                </select>

	</div>
	<div id="submitblock"> 
	  <input name="submit" id="submit" type="image" src="images/submit.gif" value="Submit" /> 
	</div>
      </form>
    </div>
    <img class="content-footer" src="images/content-box-footer.jpg"/>
  </div>
</div>
<?php include("templates/footer.html"); ?>
</body>
</html>
