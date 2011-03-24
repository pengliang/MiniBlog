<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MiniBlog Map demo</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/menu_style.css" rel="stylesheet" type="text/css" />
<style type="text/css" media="screen">
  #map { float:left; width:500px; height:500px; }
  #list { float:left; width:200px; background:#eee; list-style:none; padding:0; }
  #list li { padding:10px; }
  #list li:hover { background:#555; color:#fff; cursor:pointer; cursor:hand; }
  #message { background:#555; color:#fff; position:absolute; display:none; width:100px; padding:5px; }
</style>
<link rel="stylesheet" href="stylesheets/boxy.css" type="text/css" />
<link type="text/css" rel="stylesheet" media="screen" href="../css/index.css" />

 </head>
<body> 
{{include file="../templates/header.tpl"}}
 
<script src="custom_map.js" type="text/javascript" charset="utf-8"></script>
<script type='text/javascript' src='javascripts/jquery.boxy.js'></script>
 
<!-- END per project stuff -->
<div id="content">
 	<div><br></div>
	<div id="add" style='display :none '>
		<form id="add-point" action="result.php?action=addlocation" method="post">
		  <input type="hidden" name="action" value="savepoint" id="action" ></input>
		    <fieldset>
		    	<legend>Add a Point to the Map</legend>
		    
		      	<div class="error" style="display:none;">
		     	 </div>
		    
		     	<div class="input">
					<label for="name">Location Name</label>
					<input type="text" name="name" id="name" value=""></input>
	      		 </div>

	    		<div id="albuminput" class="input">
	      			<div >
						<label for="album">Album:</label>
	 	 				<select name="category" id="category">
				 		 {{html_options options=$category_options selected=$default_id}} 
						</select>
						<button id="savepoint" type="submit">Save Point</button>
					</div>	
				</div>
 				
		   </fieldset>
		</form>
	</div>
	<div id="message"></div>
	<div id="map"></div>
	<ul id="list"><p >My Travel Lounge List</p> </ul>
	<script type='text/javascript' src='../js/lightbox/jquery.lightbox.js'></script> 
	<div style="display:none" id='lightboxjs'>
			
		 <script type='text/javascript'>
			  //	alert("IETest");
 		 	 	$('#Gallery a').lightbox(); 
		 </script>
	 
		</div>

 	<div id="change" style="display:none " class="section">
 		<div class="section" id="changeinput" >
					 
		</div>
	</div>
	<div class="section" style="display:none" id="Galleryroot">
		
		  
	
	</div>
</div>
{{include file="../templates/footer.html"}}
  <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=ABQIAAAAq6QYfpBrKqg8M70QamCsOhQmwKcDw0l6l9tr-78Rwq7rGf-5phQ5IzDpiLxvts0uyKOmQSojcWvP3A" type="text/javascript"></script>
<script  type='text/javascript' >
var map = new GMap2(document.getElementById('map'));
var current_marker  ;
var oldid=new Array();
var geo;
 $(document).ready(
	
	function() {
		$('.boxy').boxy(); // Facebook like dialog
		Boxy.DEFAULTS.title = 'Add Marker';
		function createBox(options) {
			options = $.extend( {
				title : "Dialog"
			}, options || {});
			var dialog = new Boxy($("#add"), options);
		}
		var center = new GLatLng(44.797916, -93.278046);
		map.setCenter(center, 8);
	
		map.disableDoubleClickZoom();
		// map.enableDoubleClickZoom();
		map.enableScrollWheelZoom();
		map.enableContinuousZoom();

		map.addControl(new GLargeMapControl())
		map.addControl(new GOverviewMapControl());
		map.addControl(new GScaleControl());

		var bounds = new GLatLngBounds();
		 geo = new GClientGeocoder();

		var reasons = [];
		reasons[G_GEO_SUCCESS] = "Success";
		reasons[G_GEO_MISSING_ADDRESS] = "Missing Address";
		reasons[G_GEO_UNKNOWN_ADDRESS] = "Unknown Address.";
		reasons[G_GEO_UNAVAILABLE_ADDRESS] = "Unavailable Address";
		reasons[G_GEO_BAD_KEY] = "Bad API Key";
		reasons[G_GEO_TOO_MANY_QUERIES] = "Too Many Queries";
		reasons[G_GEO_SERVER_ERROR] = "Server error";

		// initial load points
		$.getJSON("map-service.php?action=listpoints", function(json) {
			if (json.Locations.length > 0) {
				for (i = 0; i < json.Locations.length; i++) {
					var location = json.Locations[i];
					oldid[location.id]=location.albumId;
					addLocation(map,location,bounds);
				}
				zoomToBounds(map,bounds);
			}
		});

		$("#add-point").submit(function() {
			var geocode = [];
			geocode[0] = current_marker.getLatLng().lng();
			geocode[1] = current_marker.getLatLng().lat();
			// alert("lat:"+geocode[1]+"lng:"+geocode[0]);
				savePoint(geocode,bounds);
				Boxy.get(this).hide();
				return false;
			});

		GEvent.addListener(map, 'dblclick', function(overlay, latlng) {
			var latlng = {
				lat : latlng.lat(),
				lng : latlng.lng()
			};
			
			var oldmarker = addLocationMin(map,latlng,bounds);
 			
 			createBox( {
					draggable : true,
					afterHide : function() {
					 	map.removeOverlay(oldmarker);
					}
				});
				zoomToBounds(map,bounds);
			});
		$("#message").appendTo(map.getPane(G_MAP_FLOAT_SHADOW_PANE));
		$("#list p").toggle(function(){$("#list li").slideDown();},function(){$("#list li").slideUp();});
	});

function sortList()
{
	var lb = document.getElementById('category');
	arrTexts = new Array();
	arrValues = new Array();
	arrOldValue = new Array();
	arrLabels	= new Array();
	
	for(i=0; i<lb.length; i++)
	{
	 
		arrValues[i] = lb.options[i].value;
		arrTexts[i] = lb.options[i].text; 
		arrLabels[i] = lb.options[i].label; 
		arrOldValue[i] = lb.options[i].value;
	}
	
	arrValues.sort(function(a,b){if(a<b) return -1;else if(a==b) return 0;else return 1;});

 
	for(i=0; i<lb.length; i++)
	{
		lb.options[i].value = arrValues[i];
		for(j=0; j<lb.length; j++)
		{
			if (arrValues[i] == arrOldValue[j])
			{
				lb.options[i].text = arrTexts[j];
				lb.options[i].label = arrLabels[j];
				j = lb.length;
			}
		}
	}
}
 //sortList();
 </script>


</body>
</html>
