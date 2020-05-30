<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-164964981-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-164964981-1');
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
	integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
	crossorigin=""></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js "></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script type="text/javascript" src="/poli/resources/js/barchart.js"></script>
<link rel="stylesheet" type="text/css" href="/poli/resources/css/barchart.css"/>
<style>
#map {
	height: 600px;
	width: 100%;
}
.info {
    padding: 6px 8px;
    font: 14px/16px Arial, Helvetica, sans-serif;
    background: white;
    background: rgba(255,255,255,0.8);
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
    border-radius: 5px;
}
.info h4 {
    margin: 0 0 5px;
    color: #777;
}
.map_pic{
	width: 60px;
	height: 60px;
}

.leaflet-popup-content { width:600px !important; }
.poll .leaflet-popup-content-wrapper{width:340px;}
#v-pre .v-pre-tbl{width:100%;table-layout:auto;line-height:1.25 ; border-radius: 10px;}
#v-pre thead{background-color:rgba(0,0,0,.7);color:#fff;}
#v-pre tbody{max-height:220px;overflow-y:auto;background-color:#fff}
#v-pre table{text-align:center;}
#v-pre th{height: 30px;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/form/header.jsp" %>
<div id="map"></div>
<%@ include file="/WEB-INF/views/form/footer.jsp" %>
	<script type="text/javascript">
		//{zoomControl: false, scrollWheelZoom: false} 
		var map = L.map("map").setView(
				[ 37.526299749225679, 127.058673592883977 ], 12);

		
				L.tileLayer(
						"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
						{
							attribution : '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
						}).addTo(map);
		//전국 구별 geojson파일 불러오기
		$.getJSON("/poli/resources/json/TL_SCCO_SIG.json", function(geojson) {

			var data = geojson.features;

			$.each(data, function(index, val) {

				function getColor(name) {
					return name == '용산구' || name == '서초구' || name == '강남구'
							|| name == '송파구' ? '#fa9fb5' : name == '강서구'
							|| name == '양천구' || name == '구로구' || name == '영등포구'
							|| name == '금천구' || name == '관악구' || name == '동작구'
							|| name == '마포구' || name == '서대문구' || name == '은평구'
							|| name == '종로구' || name == '성북구' || name == '강북구'
							|| name == '동대문구' || name == '중구' || name == '광진구'
							|| name == '중랑구' || name == '노원구' || name == '도봉구'
							|| name == '강동구' || name == '성동구' ? '#3182bd' : '';

				}

				function style(data) {
					return {
						fillColor : getColor(data.properties.SIG_KOR_NM),
						weight : 2,
						opacity : 1,
						color : 'white',
						dashArray : '3',
						fillOpacity : 0.5
					};
				}
				
				var geo;
				
				//마우스 올렸을 때 이벤트
				function highlightFeature(e) {
				    var layer = e.target;

				    layer.setStyle({
				        weight: 3,
				        color: '#666',
				        dashArray: '',
				        fillOpacity: 0.7
				    });
				    
				    info.update(layer.feature.properties);

				    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
				        layer.bringToFront();
				    }
				}
				
				//마우스out 했을 때 이벤트 해제하기
				function resetHighlight(e) {
				    geo.resetStyle(e.target);
				    info.update();
				}
				
				// 클릭했을 때 확대 및 팝업창 열기
				function zoomToFeature(e) {
				   //map.fitBounds(e.target.getBounds());//확대
				   
				   //투표소 아이콘 커스텀
					var voteIcon = L.icon({
						iconUrl: '/poli/resources/images/vote.png',
						iconSize:     [18, 18], // size of the icon
						iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
						popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
					})
				   	//ajax로 근방 5km 투표소 보여주기
		 			var ajax = new ComAjax();
		 			ajax.url("/poli/poll.do");
		 			
		 			var latlng = {
		 					"lat" : e.latlng.lat,
		 					"lng" : e.latlng.lng
		 			}
		 			//현재위치 ajax 파라미터로 보내기
		 			ajax.param(latlng);
					
		 			ajax.success(function(data,msg){
		 				//투표소 마커 찍기
		 				$.each(data, function(index,val){
		 					var lat = data[index].location.coordinates[1];
		 					var lng = data[index].location.coordinates[0];
		 					var marker = L.marker([lat, lng], {icon: voteIcon}).addTo(map);
		 					
		 					var popupContent = "<b>"+data[index].pollname + "</b><br/>"
		 					                  +data[index].name + "<br/>"
		 					                  +data[index].addr;
		 					var customOptions = {
		 				    	'className': "poll"
		 				    };
		 					
		 					marker.bindPopup(popupContent, customOptions);
		 					//hover할 때 팝업창 열리게
		 			        marker.on('mouseover', function (e) {
		 			            this.openPopup();
		 			        });
		 			        marker.on('mouseout', function (e) {
		 			            this.closePopup();
		 			        });

	
		 				})
		 				
	 					
		 			})
		 			
		 			ajax.call();
		 			
				    var layer = e.target;
				    var popup = L.popup();
				    //구별 국회의원 정보 가져오기
				    var title, party, name, kor_name, image, gender, age, VoterTurnOut;
				    var clist = new Array;
				    $.getJSON("/poli/resources/json/congress.json", function(json) {
				    	var data = json.congress
				    	$.each(data, function(index, val) {
		
				    		if(val.title.indexOf(layer.feature.properties.SIG_KOR_NM) != -1){
				    			title = val.title;
				    			party = val.party;
				    			image = val.image;
				    			name = val.name;
				    			kor_name = name.substring(0,3);
				    			gender = val.gender;
				    			age = val.age;
				    			VoterTurnOut = val.VoterTurnOut;
				    		
				    		clist.push('<tr>\
					    	  			    <td style="color:#000">'+ title +'</td>\
					    	  				<td><img class="map_pic" id="image" src=' +image+ ' >\</td>\
					    	  				<td style="color:#004EA2">'+party +'</td>\
					    	  				<td><a href="https://search.naver.com/search.naver?query='+kor_name +'"'+'target="_blank" title="네이버로 검색하기">'+name+'</a>\</td>\
					    	  				<td style="color:#000">'+gender+'</td>\
					    	  				<td style="color:#000">'+age+'</td>\
					    	  				<td style="color:#000">'+VoterTurnOut+'</td></tr>');
				    			  
				    		 
				    		}
				    		
				    		
				    	});
				    	
				    	//팝업창 열기	
					    popup
				        .setLatLng(e.latlng)
				        .setContent('<div id="v-pre">\
				        		<table class="v-pre-tbl">\
						    	  <thead>\
						    	    <tr>\
						    	     <th>선거구명</th>\
						    	     <th>후보</th>\
		   	                         <th>소속정당</th>\
		   	                         <th>성명</th>\
		   	                         <th>성별</th>\
		   	                         <th>나이</th>\
		   	                         <th>득표</th>\
						    	    </tr>\
						    	  </thead>\
						    	  		<tbody>\
						    	  		     '+ clist +'\
						    	  		 </tbody>\
						    	</table>\
						     </div>\
						  ')
				        .openOn(map);
				    	
				    });	    
				}
				
				function onEachFeature(feature, layer) {
				    layer.on({
				        mouseover: highlightFeature,
				        mouseout: resetHighlight,
				        click: zoomToFeature
				    });
				}
				
				geo = L.geoJson(val, {style : style, 
					                  onEachFeature: onEachFeature}).addTo(map);
			});

		});
		
		var info = L.control();

		//지도 오른쪽 위에 고정되어있는 정보창 생성
		info.onAdd = function (map) {
		    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
		    this.update();
		    return this._div;
		};

		
		info.update = function (props) {
		    this._div.innerHTML = '<h4>서울시 국회의원 선거결과</h4>' +  (props ?
		        '<b>' + props.SIG_KOR_NM + '</b><br />' : '지역구에 마우스를 올려주세요');
		};

		info.addTo(map);
		
		var graph = L.control({position : 'bottomleft'});
		//투표율 그래프 생성
		graph.onAdd = function (map) {
		    this._div = L.DomUtil.create('div', 'container'); 
		    this.update();
		    return this._div;
		};
		graph.update = function (props) {
		    this._div.innerHTML = '<div class="myprogress"><div class="pro-bar"></div></div><b>21대 총선 투표율</b>';
		};

		graph.addTo(map);
		
		//현재 위치 표시(geolocation)
		map.locate({setView: true, maxZoom: 13});
		
		//현재 위치 아이콘 커스텀
		var redIcon = L.icon({
			iconUrl: '/poli/resources/images/red_marker.png',
			iconSize:     [38, 45], // size of the icon
			iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
			popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
		})
		
		//현재 위치 받아오기(geolocation api)
		function onLocationFound(e) {
		    var radius = e.accuracy;

		    L.marker(e.latlng, {icon: redIcon}).addTo(map);
		}

		map.on('locationfound', onLocationFound);
		
	</script>
	 
</body>
</html>