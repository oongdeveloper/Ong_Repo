<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet"> -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/0.2.6/gridstack.min.css" rel="stylesheet"> -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.16.3/lodash.min.js"></script> -->
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/underscore-min.js"/></script> --%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/0.2.6/gridstack.min.js"></script> -->


<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.js"/></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.jQueryUI.js"/></script> --%>

<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.min.js"/></script> --%>


<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common_layout.css?20190201" type="text/css" /> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common2.css" /> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/tpAnaly/tpanaly_common.css"></link> --%>
<%-- <script src="<%=request.getContextPath() %>/js/tpcontent/moment.min.js"></script> --%>

<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/gridstackcss/ui.daterangepicker.css" type="text/css" /> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery/jquery-ui-1.10.4.custom.css" type="text/css" title="ui-theme" /> --%>

<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/jquery-ui.min.css"> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.11.3.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/jquery-ui.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/js/jquery-ui-1.12.0/datepicker-ko.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/daterangepicker.jQuery.js"></script> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/gridstackcss/gridstack.css"></link> --%>

<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/underscore-min.js"/></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.js"/></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/gridstack/gridstack.jQueryUI.js"/></script> --%>

<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>

<script
  src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"
  integrity="sha256-xNjb53/rY+WmG+4L6tTl9m6PpqknWZvRt0rO1SRnJzw="
  crossorigin="anonymous"></script>

<style>
* {
  margin: 0;
  padding: 0;
}
body {
  margin: 100px;
}
.pop-layer .pop-container {
/*   padding: 20px 25px; */
  padding: 0px 25px;
}
.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}
.pop-layer .ctxt {
  color: #666;
  line-height: 25px;
}
.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}
.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}
.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}
.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}
.dim-layer .pop-layer {
  display: block;
}
a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}
a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
  float:right;
}
.wrapPopupHeader{
	position:absoulte;
	width:100%;
	height:30px;
	margin-top:2px;
}
.wrapPopupContainer{
	position:absoulte;
	width:100%;
	margin-top:2px;
}

.headerName{
	position:absoulte;
	width:70%;
	height:30px;
	float:left;
}
.optionName{
	margin-left:5px;
	width:20%;
	float:left;
}
.secondOption{
	height:100px;
}

.thirdOption{
	display:none;
	height:100px;
}

.secondOp{
	float:left;
	margin-right:10px;
}
.delPopop{
	position:absoulte;
	height: 32px;
    width: 32px;
    color: black;
    border-radius: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    font: bold 20px arial;
    float:right;
}
.wrapPopupContainer{
	position:absoulte;
	width:100%;
	height:30px;
	
}
.popupOption{
	position:absoulte;
	width:100%;
	height:30px;
	
}
div.thinker 
{ background:url(/TPOLMgmt/img/icon/thinker.gif) no-repeat 50% 50%; height:100%;}
</style>

<body>

<button id="startProgress" type="button">Start Progress</button>
<button id="stopProgress" type="button">Stop Progress</button>
<a href="#layer2" class="btn-example">딤처리 팝업레이어 1</a>
<div class="btn-example div_tag">버즈 추이 Chart</div>
<div class="btn-example div_tag">매체별 버즈 추이 Chart</div>
<div class="btn-example div_tag">버즈 비율 Chart</div>
<div class="btn-example div_tag">긍부정 Chart</div>
<div class="btn-example div_tag">연관어 Chart</div>
<div class ="forProgress" style="width:400px; height:400px;"></div>
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
<!--                 <p class="ctxt mb20">Thank you.<br> -->
<!--                     Your registration was submitted successfully.<br> -->
<!--                     Selected invitees will be notified by e-mail on JANUARY 24th.<br><br> -->
<!--                     Hope to see you soon! -->
<!--                 </p> -->
                <div class="ctxt">
                	<br>
					<div class="wrapPopupHeader">
						<div class="headerName"></div>
						<div class="delPopop">X</div>
					</div>
					<div class="wrapPopupContainer">
						<div class="optionName">2차 분류</div><div class="secondOption"></div>
						<div style="clear:both"></div>
						<div class="optionName">3차 분류</div><div class="thirdOption"></div>
					</div>
<!-- 					<div class="wrapPopupContainer"> -->
<!-- 						<div class="popupOption"></div> -->
						
<!-- 					</div> -->
                    
                </div>
				<div style="clear:both"></div>
                <div class="btn-r">
                    <a href="#" class="btn-layerClose">Close</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>
</body>




<script>
//차트 띵킹(씽킹?sinking?ㅋㅋ)
$.fn.chartThinking = function() {
		if($(this).find("div.thinker").length > 0){ return false; }
		var spin = "<div class='thinker'><img src='/TPOLMgmt/img/icon/thinking.gif' style='display:block; margin-left:auto; margin-right:auto; padding-top:200px;'/></div>";
		$(this).append(spin);
};
$(document).ready(function(){
	alert("GItttttt");
	var chart = [{
		'first':'버즈 추이 Chart',
		'second':'단일',
		'third':'Line 차트'
	},{
		'first':'버즈 추이 Chart',
		'second':'단일',
		'third':'히스토그램'
		},{
		'first':'버즈 추이 Chart',
		'second':'다중',
		'third':'비교 히스토그램'
	},{
		'first':'버즈 추이 Chart',
		'second':'다중',
		'third':'비교 Bar 차트'
	},{
		'first':'버즈 추이 Chart',
		'second':'다중',
		'third':'Line 차트'
	},{
		'first':'매체별 버즈 추이 Chart',
		'second':'단일',
		'third':'Bar 차트'
	},{
		'first':'매체별 버즈 추이 Chart',
		'second':'단일',
		'third':'List'
	},{
		'first':'매체별 버즈 추이 Chart',
		'second':'단일',
		'third':'Pie 차트'
	},{
		'first':'매체별 버즈 추이 Chart',
		'second':'단일',
		'third':'히스토그램'
	},{
		'first':'매체별 버즈 추이 Chart',
		'second':'다중',
		'third':'Stacked 차트'
	},{
		'first':'버즈 비율 Chart',
		'second':'단일',
		'third':'Line 차트'
	},{
		'first':'버즈 비율 Chart',
		'second':'단일',
		'third':'Pie 차트'
	},{
		'first':'버즈 비율 Chart',
		'second':'다중',
		'third':'Line 차트'
	},{
		'first':'버즈 비율 Chart',
		'second':'다중',
		'third':'100% Stacked 차트'
	},{
		'first':'버즈 비율 Chart',
		'second':'Mixed Chart',
		'third':'Pie_Line 차트'
	},{
		'first':'버즈 비율 Chart',
		'second':'Mixed Chart',
		'third':'Pie_히스토그램 차트'
	},{
		'first':'긍부정 Chart',
		'second':'단일',
		'third':'Line 차트'
	},{
		'first':'긍부정 Chart',
		'second':'단일',
		'third':'Pie 차트'
	},{
		'first':'긍부정 Chart',
		'second':'다중',
		'third':'100% Stacked 차트'
	},{
		'first':'연관어 Chart',
		'second':'List',
		'third':'1차'
	},{
		'first':'연관어 Chart',
		'second':'List',
		'third':'2차'
	},{
		'first':'연관어 Chart',
		'second':'Wordcloud',
		'third':'Default'
	}];
	
	$('.div_tag').on('click',function(){
				
		str = $(this).text();
		
		layer_popup2('#layer2',str);
	});
	
// 	$('.btn-example').click(function(){
//         var $href = $(this).attr('href');
//         layer_popup2($href);
//     });

	function layer_popup2(el,str){
        var $layer_id = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $layer_id.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수
	
        isDim ? $('.dim-layer').fadeIn() : $layer_id.fadeIn();
        
        var elWidth = ~~($layer_id.outerWidth()),
            elHeight = ~~($layer_id.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();
        // 화면의 중앙에 레이어를 띄운다.
        if (elHeight < docHeight || elWidth < docWidth) {
            $layer_id.css({
                marginTop: -elHeight /2,
                marginLeft: -elWidth/2
            })
        } else {
            $layer_id.css({top: 0, left: 0});
        }
        $('.headerName').text(str);
       	
//         var str = $(this).text();
        var chartArr = chart.filter(function(item) {					
			return str == item['first'];
		});
		
		var single = chartArr.reduce(function( a, b ){
			if( a.indexOf(b['second']) < 0 ) a.push(b['second']) ;
			return a ;
		}, []) ;
		
		$.each(single,function(index,item){
			var html = "";
			html += "<div class='secondOp'><input type='radio' name='radioTxt' value='" + item + "'>" + item + "</div>"
// 			html += "<div class='secondOp' id='secondOp" + index + "'>" + item + "</div>";
			$('.secondOption').append(html);
		});
        

	    $('input[name="radioTxt"]').change(function(){
	    	var radioVal = $('input[name="radioTxt"]:checked').val();
	    	var aa = chart.filter(function(item) {					
				return str == item['first'] && radioVal == item['second'];
			});
	    	console.log("Adaad");
	    	console.log(aa);
	    });
	    
		
        $layer_id.find('a.btn-layerClose').click(function(){
        	$('.secondOption').children('.secondOp').remove();
            isDim ? $('.dim-layer').fadeOut() : $layer_id.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });
        $('.dimBg').click(function(){
        	$('.secondOption').children('.secondOp').remove();
            $('.dim-layer').fadeOut();
            return false;
        });
    }
    
    $('#startProgress').on('click',function(){
     	$('.forProgress').chartThinking();
//     	if($('.dim-layer').find("div.thinker").length > 0){ console.log("dd"); return false; }
// 		var spin = "<div class='thinker'><img src='/TPOLMgmt/img/icon/thinking.gif' style='display:block; margin-left:auto; margin-right:auto; padding-top:200px;'/></div>";
// 		$('.dim-layer').append(spin);
    });
    
    $('#stopProgress').on('click',function(){
    	if($('.forProgress').find("div.thinker").length > 0){ $('.thinker').remove(); }
    });
    
});
</script>