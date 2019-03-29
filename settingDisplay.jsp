<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>TP Analysis</title>
	
	<%@ include file="/jsp/include/header.jsp" %>
<%-- 	<script type="text/javascript" src="<c:url value="/js/lgemc/lgeMaster.js" />"></script> --%>
<style>

.loading_box{  
    position: fixed; 
    left:0; 
    right:0; 
    top:0; 
    bottom:0; 
    background: rgba(0,0,0,0.2); /*not in ie */ 
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */ 
} 

.loading_box div{ /*로딩 이미지*/ 
    position: fixed; 
    top:50%; 
    left:50%; 
    margin-left: -21px; 
    margin-top: -21px; 
} 

.display-none{ /*감추기*/ 
    display:none; 
} 

</style>
<script type="text/javascript">

var sessionDefaultLocaleCd = "ko_KR";

</script>

<script type="text/javascript">

function formatLen(str) {
    return str = (""+str).length<2 ? "0"+str : str;
}
var toDay = new Date();
window.todayDate =  toDay.getFullYear() + "-" + formatLen(toDay.getMonth() + 1) + "-" + formatLen(toDay.getDate());


</script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common_layout.css?20190201" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common2.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/tpAnaly/tpanaly_common.css"></link>
<script src="<%=request.getContextPath() %>/js/tpcontent/moment.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/gridstackcss/ui.daterangepicker.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery/jquery-ui-1.10.4.custom.css" type="text/css" title="ui-theme" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/jquery-ui.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/datepicker-ko.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/daterangepicker.jQuery.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script> --%>



<!-- JSGrid 용 -->
<script src="<%=request.getContextPath() %>/js/jsgrid/jsgrid.core.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/jsgrid.load-indicator.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/jsgrid.load-strategies.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/jsgrid.sort-strategies.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/jsgrid.field.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/fields/jsgrid.field.text.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/fields/jsgrid.field.number.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/fields/jsgrid.field.select.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/fields/jsgrid.field.checkbox.js"></script>
<script src="<%=request.getContextPath() %>/js/jsgrid/fields/jsgrid.field.control.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jsgrid/css/jsgrid.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jsgrid/css/theme.css" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common_layout_tpcontent.css" />
<script src="<%=request.getContextPath() %>/js/tpcontent/wordcloud/d3.layout.cloud.js"></script>
<script src="<%=request.getContextPath() %>/js/tpcontent/wordcloud/d3.min.js"></script>
<script src="<%=request.getContextPath() %>/js/tpcontent/drawChart.js"></script>

<!-- Amchart 4 version -->
<script src="<%=request.getContextPath() %>/js/chart/amcharts4/core.js"></script>
<script src="<%=request.getContextPath() %>/js/chart/amcharts4/charts.js"></script>
<script src="<%=request.getContextPath() %>/js/chart/amcharts4/themes/material.js"></script>
<script src="<%=request.getContextPath() %>/js/chart/amcharts4/lang/de_DE.js"></script>
<script src="<%=request.getContextPath() %>/js/chart/amcharts4/maps.js"></script>
<script src="<%=request.getContextPath() %>/js/chart/amcharts4/themes/animated.js"></script>

<!-- HighChart 7 version -->
<script src="<%=request.getContextPath() %>/js/chart/highchart7/code/highcharts.js"></script>
<script src="<%=request.getContextPath() %>/js/chart/highchart7/code/modules/exporting.js"></script>
<script src="<%=request.getContextPath() %>/js/chart/highchart7/code/modules/export-data.js"></script>
<script src="<%=request.getContextPath() %>/js/chart/highchart7/code/highcharts-more.js"></script>

<!-- gridStack!! -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/gridstackcss/gridstack.css"></link>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/underscore-min.js"/></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.js"/></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.jQueryUI.js"/></script>


<script type="text/javascript" src="<%=request.getContextPath() %>/js/tpcontent/settingDisplay.js"/></script>

<%
	
	session = request.getSession();
	session.setAttribute("userId", "109");	//랜덤하게 생성된 키를 1회성으로 java에서 전달 받기 위해 session에 저장한다.
	//out.println("<script>alert('sName" + session.getAttribute("userId") + "');</script>");
%>

</head>
<body>	
<%@ include file="../include/showMenuMain.jsp" %>
<div class="headerWrap">

    <div class="searchWrap">
        <div class="settingWrap">
            <form id="sform">
                <fieldset>
                    <legend>화면 구성</legend>
<!--                     <select name="selectChart" id="selectChart"> -->
<!-- 					    <option value="TrendbyLine">추이 차트</option> -->
<!-- 					    <option value="OneRelatedList">1차 연관어 List</option> -->
<!-- 					    <option value="TwoRelatedList">2차 연관어 List</option> -->
<!-- 					    <option value="ThrRelatedList">3차 연관어 List</option> -->
<!-- 					    <option value="PostList">원문 List</option> -->
<!-- 					    <option value="PercentPie">비율 Pie 차트</option> -->
<!-- 					    <option value="PercentBar">비율 Bar 차트</option> -->
<!-- 					</select> -->
						
					<div class="documentBtnsWrap documentBtnsWrapNew">
		            	<ul name="categoryWrap" class="categoryWrap" id="ulCategoryListWrap">
		            	</ul>
		            </div>
		            <span><input type="button" class="saveSetting" value="Load" id="loadGridBtn"/></span>
		            <span><input type="button" class="saveSetting" value="Reset" id="resetGridBtn"/></span>
                    <span><input type="button" class="saveSetting" value="저장" id="saveGridBtn"/></span>
                    <div style="clear:both"></div>
                    <input id="jsonStr" type="edit">
                </fieldset>
            </form>
        </div><!-- // searchInner-->

    </div><!-- //searchWrap-->
</div><!-- //headerWrap-->

<div class="grid-stack" id="grid-stack"">
	

<!-- <div class="grid-stack"> -->
<!--     <div class="grid-stack-item defaultGrid" -->
<!--         data-gs-x="1" data-gs-y="0" -->
<!--         data-gs-width="2" data-gs-height="3"> -->
<!--             <div class="grid-stack-item-content"> -->
            	
<!--             	<div class="chartTop"> -->
<!--             		<div class="leftDivpo"> -->
<!--             			<span name="spLine">Line Chart</span> -->
<!--             		</div> -->
            		
<!--             		<div class="rightDivpo"> -->
	            	
<!--                     </div> -->
                    
<!--             	</div> -->

<!-- 				<div class="chartLine" id="chartLineChart"></div> -->
				
<!-- 			</div> -->
<!--     </div> -->
  
<!--     <div class="grid-stack-item" -->
<!--         data-gs-x="1" data-gs-y="3" -->
<!--         data-gs-width="3" data-gs-height="2"> -->
<!--             <div class="grid-stack-item-content"> -->
            	
<!--             	<div class="chartTop"> -->
<!--             		<div class="leftDivpo"> -->
<!--             			<span>1차 연관어</span> -->
<!--             		</div> -->
            		
<!--             		<div class="rightDivpo"> -->

<!--                     </div> -->
                    
<!--             	</div> -->
<!-- 				<div class="chartList" id="chartOneList"></div> -->
				
<!-- 			</div> -->
<!--     </div> -->
    

<!--      <div class="grid-stack-item" id="ppie" -->
<!--         data-gs-x="1" data-gs-y="5" -->
<!--         data-gs-width="5" data-gs-height="5"> -->
<!--             <div class="grid-stack-item-content"> -->
<!--             	<div class="chartTop"> -->
<!--             		<div class="leftDivpo"> -->
<!--             			<span>Pie Chart</span> -->
<!--             		</div> -->
<!--             		<div class="rightDivpo"> -->
	            		
<!--                     </div> -->
<!--             	</div> -->
<!--             	<div class="chartPie" id="chartPercentPie"></div> -->
<!--             </div> -->
<!--     </div> -->
	
	 <div style="clear:both"></div> 
	<nav class="floating-menu">
	    <h3>Floating Menu</h3>
	    
<!-- 	    <div class="floatMenu_div"> -->
	    <div class="floatMenu_div" id="settingTrendChart">
			<img src="<%=request.getContextPath() %>/img/widget.jpg" class="floatMenu_img">	
		    <div style="clear:both"></div>    
		    <span class="floatMenu_span">추이 차트</span>
	    </div>
	    <div class="floatMenu_div" id="settingRelatedChart">
			<img src="<%=request.getContextPath() %>/img/widget.jpg" class="floatMenu_img">	
		    <div style="clear:both"></div>    
		    <span class="floatMenu_span">연관어 차트</span>
	    </div>
	     <div class="floatMenu_div" id="settingEmoChart">
			<img src="<%=request.getContextPath() %>/img/widget.jpg" class="floatMenu_img">	
		    <div style="clear:both"></div>    
		    <span class="floatMenu_span">감성어 차트</span>
	    </div>
	     <div class="floatMenu_div" id="settingBuzzChart">
			<img src="<%=request.getContextPath() %>/img/widget.jpg" class="floatMenu_img">	
		    <div style="clear:both"></div>    
		    <span class="floatMenu_span">버즈 차트</span>
	    </div>
	</nav>
    
    
</div>

<div>
	<%@ include file="../include/footer.jsp" %>
</div>
</body>

<!-- <li id="{{id}}" class="category-keyword-li {{classNm}}"> -->
<!-- 		<a href="javascript:void(0);" onclick="temp();"> -->
<!-- 			<span class="documentBtnWord">{{title}}</span>&nbsp -->
<!-- 		</a> -->
<!-- 	</li> -->
<!-- 선택된 키워드를 div로 삽입하기위한 템플릿 -->
<script id="templateCateLi" type="text/x-template">
	<li id="{{id}}" class="category-keyword-li {{classNm}}">
		<a href="javascript:void(0);">
			<span class="documentBtnWord">{{title}}</span>&nbsp
		</a>
	</li>
</script>

<script id="templateGrid" type="text/x-template">
	<div id="{{id}}" class="grid-stack-item">
			<div class="del-tile" onclick="delTile(this)">
                X
            </div>
			<div class="grid-stack-item-content">				
       	    	<img src="/TPOLMgmt/img/widget.jpg" class="floatMenu_img"/>	
		    	<div style="clear:both;"><div/>    
		    	<span class="floatMenu_span">{{name}}<span/>
       	    <div/><div/>
	    
</script>

<script>
/* -----------------화면 단 Start-------------------*/
$(function(){
	//$html += $('#selectbox option:selected').val();
	
// 	var serializeWidgetMap = function(items) {
// 	    console.log(items);
// 	};
	
// 	$('.grid-stack').on('change', function(event, items) {
// 	    serializeWidgetMap(items);
// 	});
	
// 	$('.grid-stack').on('dragstop', function(event, ui) {
// 	    var grid = this;
// 	    var element = event.target;
// 	    console.log(element);
// 	});

	
	
	
// 	$('#fromDate,#toDate').datepicker({
//         //showOn: "both",
//         changeMonth: true, 
//         changeYear: true,
//         nextText: '다음 달',
//         prevText: '이전 달', 
//         fromDate: "fromDate",
//         toDate: "toDate",
// //         showOn: "button",
// //         buttonImage: window.contextPath + "/img/btns/btn_calendar.png",
//         onClose: function() {
//             //$("input[name=toDate]").change();
//             $("input[name=pFromDate]").val($("input[name=fromDate]").val());
//             $("input[name=pToDate]").val($("input[name=toDate]").val());
//         }
//     });
	
	
	
});

/* -----------------화면 단 End-------------------*/


</script>

</html>