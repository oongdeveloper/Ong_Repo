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
//테넌트별로 차트 색상 별도 정의시 사용
//var sessionTenantId ="<c:out value="${sessionScope.userSession.tenantId}" />";
//alert(Highcharts.theme.colors);
//Highcharts.theme.colors = ["#56AA1C","#E46C0A","#EAAF0F","#FF0066","#BAD80A","#D6606D","#D15B05","#CE007C","#007A3D","#E28C05","#00B0F0","#FFC000","#7C1E3F","#72166B","#FFA3B2","#C10538","#92D050","#EEAAEE","#55BF3B","#DF5353","#7798BF","#AAEEEE","#BFBFBF","#058DC7","#50B432","#ED561B","#DDDF00","#24CBE5","#64E572","#FF9655","#FFF263","#6AF9C4"];
//alert(Highcharts.theme.colors);siteRankingMain.
//highchartsOptions = Highcharts.setOptions(Highcharts.theme);

var sessionDefaultLocaleCd = "ko_KR";

</script>

<script type="text/javascript">

function formatLen(str) {
    return str = (""+str).length<2 ? "0"+str : str;
}
var toDay = new Date();
window.todayDate =  toDay.getFullYear() + "-" + formatLen(toDay.getMonth() + 1) + "-" + formatLen(toDay.getDate());

<%-- 주석 침 --%>
// window.headTenantId = 'showroom';
// window.headUserId = 'lgcnsadmin';
// window.headProjectType = 'M';
// window.headDiscoveryUseYn = 'N';
// window.headEngagementUseYn = 'N';
// window.cnsAdmin = 'Y';
// window.customerAdmin = 'N';
// window.defaultDataSourceOption = "";
// window.defaultLanguageOption = "";
// window.defaultCountryOption = "";
// window.defaultAnyEtc2Option = "";
// window.headReplyUseConfirmYn = "N";
// window.headMajorSiteUseYn = "N";
<%-- window.headJustOneAttribute = false;	<%//단일 속성 사용 여부 (ex : kia_m_krsale)%>	 --%>
// //window.categoryCodeUrl = "/common/common/selectCategoryCode.tt2";
// //window.originalPostUrl = "/common/common/selectOriginalPostSearchList.tt2";
// //window.originalPostPinterestUrl = "/common/common/selectMonitoringOriginalPostPinterest.tt2";
// window.defaultTopics =  "";
// window.defaultMedias =  "";

// window.defaultOptions = {"defaultCompanyAnalysisOption": "N"
// 												,"defaultBrandAnalysisOption": "Y"
// 												,"defaultPropertyAnalysisOption": "N"
// 												,"defaultRelatedAnalysisOption": "N"
// 												,"defaultMonitoringSmallOption": "N"};
												
// window.setSessionProductSelect = function(){
// }; 
<%-- ----------------------------------------------------- --%>
</script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common_layout.css?20190201" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common2.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/tpAnaly/sampleMain.css"></link>
<script src="<%=request.getContextPath() %>/js/tpcontent/moment.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/gridstackcss/ui.daterangepicker.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery/jquery-ui-1.10.4.custom.css" type="text/css" title="ui-theme" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/jquery-ui.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.11.3.min.js"></script>
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
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/gridstackcss/gridstack.css"></link> --%>

<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/underscore-min.js"/></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.js"/></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.jQueryUI.js"/></script> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/gridstackcss/gridstack.css"></link>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/underscore-min.js"/></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.js"/></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.jQueryUI.js"/></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/tpcontent/sampleMain.js"/></script>

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
        <div class="searchInner">
            <form id="sform">

                <fieldset>
                    <legend>날짜지정</legend>
                    <span class="dateWrap">

                                <span class="selDate1">

                                    <input class="selDate1-1" type="radio" name="dateRange" id="1D" value="1D"  /><label for="1D">1D</label>
                                    <input class="selDate1-2" type="radio" name="dateRange" id="1W" value="1W"  /><label for="1W">1W</label>
                                    <input class="selDate1-3" type="radio" name="dateRange" id="2W" value="2W"  /><label for="2W">2W</label>
                                    
                                    <!--  <input type="radio" name="dateRange" id="3M" value="3M"  /><label for="3M" onclick="javascript:$(this).dateRange( '3M' );" >3M</label> -->
                                    <!-- <a href="#" class="plus3Btn" id="more3mBtn">+3M</a>  -->
                                </span><!-- //selDate1-->

                                <span class="selDate2">
                                    <span>
                                        <input type="text" id="fromDate" name="fromDate"/>
                                        <input type="hidden" name="pFromDate"/>
                                        <a id="fromDateIco"></a>
                                    </span>
                                    ~
                                    <span>
                                        <input type="text" id="toDate"  name="toDate"/>
                                        <input type="hidden" name="pToDate"/>
                                        <a id="toDateIco"></a>
                                    </span>
                                </span><!-- //selDate2-->

                                <%-- <input type="hidden" id="calBefore3mDate" value="<%= before3mDate %>" />--%>
                                <input type="hidden" id="calBefore1yDate" name="calBefore1yDate" value="2019-02-01" />
                            </span><!-- //dateWrap-->
                            <span><input type="button" class="KeywordSearch" value="조회" id="btnSch"/></span>
                </fieldset>
            </form>
        </div><!-- // searchInner-->

    </div><!-- //searchWrap-->
</div><!-- //headerWrap-->


<div class="grid-stack" id="grid-stack"">
    
   
    
    
    
</div>

<div>
	<%@ include file="../include/footer.jsp" %>
</div>
</body>
<!-- 선택된 키워드를 div로 삽입하기위한 템플릿 -->
<script id="templateTopicUl" type="text/x-template">
	<li id="idtopic_{{id}}" class="topic-keyword-li {{classNm}}">
		<a href="javascript:void(0);" onclick="temp();">
			<span class="documentBtnWord">{{keyword}}</span>&nbsp
			<span class="documentBtnNum">{{cnt}}</span>
		</a>
	</li>
</script>


<script id="templateRealGrid" type="text/x-tile">
	<div class="grid-stack-item">
			<div class="grid-stack-item-content" id="{{gridId}}">				
       	    	<div class="chartTop">
            		<div class="leftDivpo">
            			<span>{{name}}</span>
            		</div>
            		<div class="rightDivpo">
	            		<select class="selectPeriod" id="selectPeriod">
						    <option value="selectDay">일 별</option>
						    <option value="selectWeek">주 별</option>
						    <option value="selectMonth">월 별</option>
						</select>
						<select class="selectMedia" id="selectMedia-Line" onclick="selectMedia(this)">
							<option id="selMediaDefault" value="" selected disabled hidden>Select Media</option>
						</select>
						<div class = "checkboxesDiv" id="checkboxes-Line"></div>
                    </div>
            	</div>
				<div class="chart" id="{{chartId}}"></div>
       	    </div>
	  </div>
</script>

<style>
 #chartdiv { 
   width: 1100px; 
} 

.sch-keyword-div{
	width:150px; 
	height:28px; 
	line-height:28px; 
	margin:10px; 
	float:left;
	border:1px solid;
}
.grid-stack-item {
  border: 1px solid;
}

</style>

<script id="templateCateLi" type="text/x-template">
	<li id="{{id}}" class="category-keyword-li {{classNm}}">
		<a href="javascript:void(0);">
			<span class="documentBtnWord">{{title}}</span>&nbsp
		</a>
	</li>
</script>
<!-- <div class="checkboxes" id="checkboxes"> -->
<script id="templateMediaLi" type="text/x-template">
	
 	<div class="checkboxes" id="{{id}}">
		    <label for="total">
		      	  <input type="checkbox" id="selectTotal" />전체</label>  
			<label for="one">
		      	  <input type="checkbox" id="selectBlog" />블로그</label>
		      <label for="two">
		      	  <input type="checkbox" id="selectCafe" />카페</label>
		      <label for="three">
		     	   <input type="checkbox" id="selectSNS" />SNS</label>
		      <label for="four">
		     	   <input type="checkbox" id="selectNews" />뉴스</label>
		      <label for="five">
		     	   <input type="checkbox" id="selectCommu" />커뮤니티</label>
		      <label for="six">
		     	   <input type="checkbox" id="selectInsta" />인스타그램</label>
		      <label for="seven">
		      	  <input type="checkbox" id="selectMall" />Mall</label>
		      <label for="eight">
		      	  <input type="checkbox" id="selectEtc" />기타</label>
		      <label for="nine">
			      <input type="checkbox" id="selectOrg" />기관/공공</label>
	</div>
</script>

<script>
/* -----------------화면 단 Start-------------------*/
$(function(){
	var rqData = {
			'fromDate': '',
			'toDate':''
	};
	$('.grid-stack').gridstack();
    $('#fromDate,#toDate').datepicker({
        //showOn: "both",
        changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달', 
        fromDate: "fromDate",
        toDate: "toDate",
//         showOn: "button",
        buttonImage: window.contextPath + "/img/btns/btn_calendar.png",
        onClose: function() {
            $("input[name=pFromDate]").val($("input[name=fromDate]").val());
            $("input[name=pToDate]").val($("input[name=toDate]").val());
        }
    });
    
   	
    // 1일, 1주일, 2주일 선택 시 기준일 text 재세팅
    $("input[name=dateRange]").click(function() {
    	var range = $(this).val();
	    var dt2 = moment($("input[name=toDate]").val());
        var dt1, dt3, dt4;
        switch(range) {
            case "1D":
                $("#prevDateRangeTitle").text("전일");
                dt1 = moment(dt2).add(-1, 'd').add(1, 'd');
                break;
            case "1W":
            	console.log("1주입니다.");
                $("#prevDateRangeTitle").text("3일");
                dt1 = moment(dt2).add(-7, 'd').add(1, 'd');
                break;
            case "2W":
            	console.log("2주입니다.");
                $("#prevDateRangeTitle").text("전주");
                dt1 = moment(dt2).add(-14, 'd').add(1, 'd');
                break;
        }
        
        $("input[name=fromDate]").val(dt1.format("YYYY-MM-DD"));
        $("input[name=toDate]").val(dt2.format("YYYY-MM-DD"));
        $("input[name=pFromDate]").val(dt1.format("YYYY-MM-DD"));
        $("input[name=pToDate]").val(dt2.format("YYYY-MM-DD"));

        if($("#prevDateRangeTitle").text() == "전일") {
            $("#prevDateRange").text(dt2);
        } else {
            $("#prevDateRange").text(dt1 + " ~ " + dt2);
        }
        
        rqData['fromDate'] = $('#fromDate').val();
        rqData['toDate'] = $('#toDate').val();
        //$("#btnSch").click();
        //$("input[name=dateRange]:checked").click();
    });
    
    $("input[name=fromDate]").val('2018-12-01');
  	$("input[name=toDate]").val('2018-12-07');
   	$("input[name=dateRange]:eq(0)").click();
    
    // 검색일자 변경 시
    $("input[name=fromDate],input[name=toDate]").change(function() {
    	
    	var toDate = moment($("input[name=toDate]").val()).format("YYYY-MM-DD");
    	var fromDate = moment($("input[name=fromDate]").val()).format("YYYY-MM-DD");
    	var strToDate = String(toDate);
    	var strFromDate = String(fromDate);
    	
        if(strFromDate < '2018-01-01') {
            alert("2018-01-01 이후 데이터만 존재합니다.");
            $("input[name=fromDate]").val($("input[name=pFromDate]").val());
            return false;
        }
        if(strToDate >= '2019-01-01') {
            alert("2018-12-31 까지 데이터만 존재합니다.");
            $("input[name=toDate]").val($("input[name=pToDate]").val());
            return false;
        }
        else if(strFromDate > strToDate) {
            alert("시작일자는 종료일자 보다 클 수 없습니다.");
            $("input[name=fromDate]").val($("input[name=pFromDate]").val());
            $("input[name=toDate]").val($("input[name=pToDate]").val());
            return false;
        }
        else{
        	$("input[name=pFromDate]").val(toDate);
            $("input[name=pToDate]").val(fromDate);
        }

    })
    
});

/* -----------------화면 단 End-------------------*/


</script>

</html>