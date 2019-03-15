<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<!-- <script -->
<!--   src="https://code.jquery.com/jquery-1.11.1.min.js" -->
<!--   integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE=" -->
<!--   crossorigin="anonymous"></script> -->
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/jquery-ui.min.css">
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.9.1.js"></script> --%>
<script src="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/jquery-ui.min.js"></script>
<%-- <script src="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/datepicker-ko.js"></script> --%>

<!-- <script type="text/javascript" src="node_modules/jquery/dist/jquery.js"></script> -->
<!-- <script type="text/javascript" src="node_modules/underscore/underscore.js"/></script> -->
<!-- <script type="text/javascript" src="lib/jquery-ui.js"/></script> -->


<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/lodash.js"/></script> --%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/underscore-min.js"/></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/gridstackcss/gridstack.css"></link>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.js"/></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.jQueryUI.js"/></script>


<style>
.grid-stack-item {
  border: 1px solid;
  background-color: #eee;
}
</style>
<body>



<select name="job" id="selectbox">
    <option value="Barbymonth">월별 막대차트</option>
    <option value="Keywordchart">키워드 순위차트</option>
    <option value="Topicchart">토픽 순위트</option>
    <option value="RelatedKeywordchart">연관어차트</option>
</select>
<button id="addBtn">항목 추가</button>
 
<div class="grid-stack">
    <div class="grid-stack-item aa"
        data-gs-x="0" data-gs-y="0"
        data-gs-width="4" data-gs-height="2">
            <div class="grid-stack-item-content">기존항목1</div>
    </div>
    <div class="grid-stack-item bb"
        data-gs-x="4" data-gs-y="0"
        data-gs-width="4" data-gs-height="4">
            <div class="grid-stack-item-content">기존항목2</div>
    </div>
    <div class="grid-stack-item cc"
        data-gs-x="9" data-gs-y="0"
        data-gs-width="1" data-gs-height="2">
            <div class="grid-stack-item-content">기존항목3</div>
    </div>
    <div class="grid-stack-item dd"
        data-gs-x="4" data-gs-y="2"
        data-gs-width="4" data-gs-height="2">
            <div class="grid-stack-item-content">기존항목4</div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function () {
  var options = {
      cellHeight: 80,
      verticalMargin: 10
  };
  $('.grid-stack').gridstack(options);
 
  let a = 0;
  $('#addBtn').click(function(){
    let $html = '<div id="'+ a + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
    $html += '<div class="grid-stack-item-content">';
    $html += $('#selectbox option:selected').val();
    $html += '</div></div>';
    
    $($html).appendTo($('.grid-stack'));
    $('.grid-stack').gridstack();
 
    var grid = $('.grid-stack').data('gridstack');
    grid.addWidget($('#' + a));
    a++;
    
    $('.aa').gridstack();
    $('.bb').gridstack();
    $('.cc').gridstack();
    $('.dd').gridstack();
    var gridaa = $('.aa').data('gridstack');
    var gridbb = $('.bb').data('gridstack');
    var gridcc = $('.cc').data('gridstack');
    var griddd = $('.dd').data('gridstack');
    
    var positoion ={
    		'top':'',
    		'left':''
    };
    var position ={
    		'top':'',
    		'left':''
    };
    var positionc ={
    		'top':'',
    		'left':''
    };
    var positiond ={
    		'top':'',
    		'left':''
    };
    console.log("gird Pixel a 값!!!!");
    console.log(gridaa.getCellFromPixel(positoion));
    console.log("gird Pixel b 값!!!!");
    console.log(gridbb.getCellFromPixel(position));
    console.log("gird Pixel c 값!!!!");
    console.log(gridcc.getCellFromPixel(positionc));
    console.log("gird Pixel d 값!!!!");
    console.log(griddd.getCellFromPixel(positiond));
    
  });
});
</script>
</body>
</html>