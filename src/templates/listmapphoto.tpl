<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MiniBlog Map demo</title>
 <style type="text/css" media="screen">
  #map { float:left; width:500px; height:500px; }
  #list { float:left; width:200px; background:#eee; list-style:none; padding:0; }
  #list li { padding:10px; }
  #list li:hover { background:#555; color:#fff; cursor:pointer; cursor:hand; }
  #message { background:#555; color:#fff; position:absolute; display:none; width:100px; padding:5px; }
</style>
<link rel="stylesheet" href="stylesheets/boxy.css" type="text/css" />
<link type="text/css" rel="stylesheet" media="screen" href="../css/index.css" />

<script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script type='text/javascript' src='../js/lightbox/jquery.lightbox.js'></script>    

</head>
<body>
<div >
	<div class="section"  id="Galleryroot">
		 
  		 
	</div>
	<div  class="section" id="change"  class="input">
	      	<div>
				<label for="album">Change:</label>
	 	 		<select name="category" id="category">
						 {{html_options options=$category_options selected=$category_id}} 
				</select>
				<input type="submit" id="updatepoint"  onClick="return updatePoint();" value="Save Point"></input>
				<br>
				<input id="locationId" name="locationId" value="0"></input>
				<input id="seleteeeedId" name="seleteeeedId" value="0"></input>
			</div>
	</div>


</div>

<script  type='text/javascript' >	 
 
				$("#Galleryroot").append(			
						"<div class='section' id='Gallery'>"+
					    "<div class='desc'>"+
		                "<p>"+
		                    "<span class='title'>Album Name:{{$location[2]|escape htmlall}}</span><br/>"+     
 		                "</p> </div>"+
						"<ul></ul>" +
						"</div>");
			 	
				{{section name=id loop=$photonumber}}
			
			       		$("#Gallery ul").append(
			       			"<li>" +
			    				"<a  href='{{$photolists[id][3]|escape htmlall}}'>" +
			       					"<img style='width:50px;height:50px' src= '{{$photolists[id][3] |escape htmlall}}'  alt='{{$photolists[id][1]|escape htmlall}}'/>" +
			       				"</a>" +
			       			"</li>");
			      
				{{/section}}
 			   
		$('#Gallery a').lightbox();
	  
 </script>
</body>
<html>