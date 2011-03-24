 
function changestyle() {
	$('#willchangealbum').css('display', 'none');
	$('#deletePoint').css('display', 'none');
	$('#changingalbum').css('display', '');
}
function deletePoint() {
	if (confirm("你确定要删除?")) {
		$.post("result.php?action=dellocation", {
			id : $("#locationId").val()
		}, function(json) {
			if (json.status == "success") {
				map.removeOverlay(current_marker);
			}
		}, "json");
	}
}
function showAlbum(map, marker, location) {
	// style 1

	map.closeInfoWindow();
	var html_str = "";
	html_str += "<div style='width=200px' id='changingalbum'><label>Album:</label>";

	html_str += "<select name='categoryId' id='categoryId'>"
			+ $("#category").html()
			+ "</select>"
			+ "<input type='submit' style='width:60px' id='updatepoint' onClick='return updatePoint();' value='Save'></input></div>"
			+ "<div><input id='locationId' style='display:none' name='locationId' value="
			+ location.id
			+ "></input>"
			+ "<input id='selectedId' style='display:none' name='selectedId' value="
			+ oldid[location.id]
			+ "></input>"
			+ "</div><a id='deletePoint' onclick='return deletePoint();'>删除坐标</a>";
 
	if (oldid[location.id] >1) {
		html_str += "&nbsp;&nbsp;&nbsp;<a id='delPoint' onclick='return delPoint();'>解除相册关联</a>";
	}
		$("#changeinput").html(html_str);
	  	marker.openInfoWindow( $("#Gallery" + location.id).html() + $("#change").html()+$("#lightboxjs").html());
	   
	 current_marker = marker;
	// style2
	// urlmin="<iframe
	// src='listmapphoto.php?id="+location.id+"&id2="+location.albumId+"&name="+location.albumName+"'></iframe>";
	// urlmax="<iframe style='width:400px;height:400px'
	// src='listmapphoto.php?id="+location.id+"&id2="+location.albumId+"&name="+location.albumName+"'></iframe>";
	//
	// marker.openInfoWindowHtml(urlmin
	// ,{maxWidth :"400px" ,maxTitle:"Album Name:"+location.albumName,maxContent
	// :urlmax});
}
function delPoint() {

	$.post("result.php?action=editlocation", {
		albumName : "",
		albumId : 0,
		locationId : $("#locationId").val()
	}, function(json) {
		if (json.status == "success") {
			updateList(json.location);
			oldid[json.location.id] = json.location.albumId;

			 showAlbum(map, current_marker, json.location);
			//map.closeInfoWindow();

		}
		if (json.status == "error") {
			alert(json.message);
		}
	}, "json");

}

function updatePoint() {
	var newalbumId = $("#categoryId option:selected").val();
	var oldselectedId= $("#selectedId").val();
	if (newalbumId == oldselectedId) {

	} else {
		$.post("result.php?action=editlocation", {
			albumName : $("#categoryId option:selected").eq(0).text(),
			albumId : $("#categoryId option:selected").val(),
			locationId : $("#locationId").val()
		}, function(json) {
			if (json.status == "success") {
				updateList(json.location);
				oldid[json.location.id] = json.location.albumId;

				showAlbum(map, current_marker, json.location);
			//	map.closeInfoWindow();

			}
			if (json.status == "error") {
				alert(json.message);
			}
		}, "json");

	}

}
function updateList(location) {

	$("#Gallery" + location.id).html("");

	if (location.albumId > 1) {
		$("#Gallery" + location.id).append(
				"<div class='section' id='Gallery'>" + "<div class='desc'>"
						+ "<p>" + "<span class='title'>Album Name:"
						+ location.albumName + "</span><br />" + "</p> </div>"
						+ "<ul></ul></div>");
		if (!location.photolists.length) {
			$("#Gallery" + location.id).append(
					"<div>该相册下没有照片<a style='' href='../photo/addphoto.php?id="
							+ location.albumId + "'>我要上传照片</a></div>");
		} else {
			$
					.each(
							location.photolists,
							function(i, item) {
							 if(i<3){
									$("#Gallery" + location.id + " div ul")
											.append(
													"<li>"
															+ "<a  href='"
															+ item.physcal
															+ "'>"
															+ "<img style='width:50px;height:50px' src='"
															+ item.physcal
															+ "' alt='"
															+ item.name + "'/>"
															+ "</a>" + "</li>");
							 }
							 else
							 {
									$("#Gallery" + location.id + " div ul")
									.append(
											"<li style='display:none'>"
													+ "<a  href='"
													+ item.physcal
													+ "'>"
													+ "<img style='width:50px;height:50px' src='"
													+ item.physcal
													+ "' alt='"
													+ item.name + "'/>"
													+ "</a>" + "</li>");
							 }
			 
							});
		}
	}
}
function insertList(location) {
	$("<li />").html(location.name).click(function() {
		map.closeInfoWindow();
		map.panTo(new GLatLng(location.lat, location.lng));
	}).appendTo("#list");
	if (location.albumId < 2) {
		$("#Galleryroot").append(
				"<div class='section' id='Gallery" + location.id + "'>"
						+ "</div>");
	} else {
		$("#Galleryroot").append(
				"<div class='section' id='Gallery" + location.id + "'>"
						+ "<div class='section' id='Gallery'>"
							+ "<div class='desc'>"
								+ "<p>"
									+ "<span class='title'>Album Name:"
										+ location.albumName + "</span><br />" 
								+ "</p>"
							+" </div>"
								+ "<ul></ul>"
						+ "</div>"
				+ "</div>");
		if (!location.photolists.length) {
			$("#Gallery" + location.id).append(
					"<div>&nbsp;&nbsp;&nbsp;该相册下没有照片，<a style='' href='../photo/addphoto.php?id="
							+ location.albumId + "'>我要上传照片</a></div>");
		} else {
			$
					.each(
							location.photolists,
							function(i, item) {
								if(i<3)
								{
									$("#Gallery" + location.id + " div ul")
											.append(
													"<li>"
															+ "<a  href='"
															+ item.physcal
															+ "' title='"+item.name+"'>"
															+ "<img style='width:50px;height:50px' src='"
															+ item.physcal
															+ "' alt=''"
															+ item.name + "'/>"
															+ "</a>" + "</li>");
								}
								else
								{
									$("#Gallery" + location.id + " div ul")
									.append(
											"<li style='display:none'>"
													+ "<a  href='"
													+ item.physcal
													+ "' title='"+item.name+"'>"
													+ "<img style='width:50px;height:50px' src='"
													+ item.physcal
													+ "' alt=''"
													+ item.name + "'/>"
													+ "</a>" + "</li>");
								}
							});
		}
	}
}
// 反向解析
function getAddress(overlay, latlng) {
	if (latlng != null) {
		address = latlng;
		geocoder.getLocations(latlng, saveAddress);
	}
}

function saveAddress(response) {
	if (response.Status.code == G_GEO_SUCCESS) {
		var place = response.Placemark[0];
		// to do
	} else {
		var reason = "Code " + response.Status.code;
		if (reasons[response.Status.code]) {
			reason = reasons[response.Status.code]
		}
		$("#add-point .error").html(reason).fadeIn();
		geocode = false;
	}
}

function savePoint(geocode, bounds) {

	var data = $("#add-point :input").serializeArray();
	data[data.length] = {
		name : "lng",
		value : geocode[0]
	};
	data[data.length] = {
		name : "lat",
		value : geocode[1]
	};
	data[data.length] = {
		name : "categoryName",
		value : $("#category :selected").text()
	}

	$.post($("#add-point").attr('action'), data, function(json) {
		$("#add-point .error").fadeOut();
		if (json.status == "fail") {
			$("#add-point .error").html(json.message).fadeIn();
		}
		if (json.status == "success") {
			$("#add-point :input[name!=action]").val("");
			oldid[json.location.id] = json.location.albumId;
			addLocation(map, json.location, bounds);
			zoomToBounds(map, bounds);
		}
	}, "json");

}

function geoEncode(bounds) {
	var address = $("#add-point input[name=address]").val();
	geo.getLocations(address, function(result) {
		if (result.Status.code == G_GEO_SUCCESS) {
			geocode = result.Placemark[0].Point.coordinates;
			savePoint(geocode, bounds);
		} else {
			var reason = "Code " + result.Status.code;
			if (reasons[result.Status.code]) {
				reason = reasons[result.Status.code]
			}
			$("#add-point .error").html(reason).fadeIn();
			geocode = false;
		}
	});
}
function addLocationMin(map, location, bounds) {
	var point = new GLatLng(location.lat, location.lng);
	var marker = new GMarker(point, {
		draggable : true
	});
	current_marker = marker;
	GEvent.addListener(marker, "click", function() {
		map.panTo(point);
		showAddress(this, point);
	});

	GEvent.addListener(marker, "dragstart", function() {
		map.closeInfoWindow();
	});

	GEvent.addListener(marker, "dragend", function() {
		map.panTo(point);
		showAddress(this, point);
	});
	map.addOverlay(marker);
	bounds.extend(marker.getPoint());
	return marker;
}
function addLocation(map, location, bounds) {

	var point = new GLatLng(location.lat, location.lng);
	var marker = new GMarker(point, {
		draggable : true
	});
	current_marker = marker;
	GEvent.addListener(marker, "click", function() {
		map.panTo(point);
		showAddress(this, point);
	});
	GEvent.addListener(marker, "mouseover", function() {
		showAlbum(map, this, location);
	});
	GEvent.addListener(marker, "mouseout", function() {
		// map.closeInfoWindow();
		});
	GEvent.addListener(marker, "dragstart", function() {
		map.closeInfoWindow();
	});

	GEvent.addListener(marker, "dragend", function() {
		map.panTo(point);
		showAddress(this, point);
	});

	map.addOverlay(marker);
	bounds.extend(marker.getPoint());
 	insertList(location);

}
function showAddress(marker, latlng) {
	geo.getLocations(latlng, function(response) {
		if (!response || response.Status.code != 200) {
			// alert("Status Code:" + response.Status.code);
		} else {
			var place = response.Placemark[0];
			marker.openInfoWindowHtml('<b>Address:</b>' + place.address);
		}
	});
}

function zoomToBounds(map, bounds) {
	map.setCenter(bounds.getCenter());
	map.setZoom(map.getBoundsZoomLevel(bounds) - 1);
}

function showMessage(map, marker, text) {
	var markerOffset = map.fromLatLngToDivPixel(marker.getPoint());
	$("#message").hide().fadeIn().css( {
		top : markerOffset.y,
		left : markerOffset.x
	}).html(text);
}