<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gugi&display=swap" rel="stylesheet">
<style>
	
#chartdiv {
	width: 100%;
	height: 600px;
}
</style>
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js "></script>
</head>

<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>

	<div id="chartdiv"></div> <!-- 워드클라우드 -->
		<script>
		am4core
				.ready(function() {

					// Themes begin
					am4core.useTheme(am4themes_animated);
					// Themes end

					var chart = am4core.create("chartdiv",
							am4plugins_wordCloud.WordCloud);
					chart.fontFamily = "Do Hyeon";
					var series = chart.series
							.push(new am4plugins_wordCloud.WordCloudSeries());
					series.randomness = 0.1;
					series.rotationThreshold = 0.5;

					$(document).ready(function() { 
						$.getJSON('/poli/resources/json/news.json', function(data) {
							series.data = data
						});
					});
					
					series.dataFields.word = "tag";
					series.dataFields.value = "count";

					series.heatRules.push({
						"target" : series.labels.template,
						"property" : "fill",
						"min" : am4core.color("#0000CC"),
						"max" : am4core.color("#CC00CC"),
						"dataField" : "value"
					});

					series.labels.template.url = "https://stackoverflow.com/questions/tagged/{word}";
					series.labels.template.url = "/poli/search.do?keyword={word}";
					series.labels.template.urlTarget = "_blank";
					series.labels.template.tooltipText = "{word}: {value}";

					var hoverState = series.labels.template.states
							.create("hover");
					hoverState.properties.fill = am4core.color("#FF0000");
					/*
					var subtitle = chart.titles.create();
					subtitle.text = "(click to open)";
					
					var title = chart.titles.create();
					title.text = "Most Popular Tags @ Jungchiro";
					title.fontSize = 20;
					title.fontWeight = "800";*/

				}); // end am4core.ready()
	</script>
	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
</body>
</html>