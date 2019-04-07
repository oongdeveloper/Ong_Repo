//
//Number.prototype.numberFormat = function(){
//	if(this==0) return 0;       
//	var reg = /(^[+-]?\d+)(\d{3})/;     
//	var n = (this + '');       
//	while (reg.test(n)) {
//		n = n.replace(reg, '$1' + ',' + '$2');
//	}
//	return n; 
//};

// Dual Calendar 용------------------
$.datepickerLanguageOption = function(option){
	//날짜 검색용 Select Box는 기본 조건으로 한다.
	var datepickerOption = {
		changeMonth: true,
		changeYear: true		
	};
	
	if(sessionDefaultLocaleCd == 'ko_KR'){	//한국어
		var localOption = {
			prevText: '이전 달', 
			nextText: '다음 달',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			//yearSuffix: '년',
			showMonthAfterYear: true
		};
		$.extend(datepickerOption, localOption);
	}else if(sessionDefaultLocaleCd == 'ja_JP'){
		var localOption = {
			prevText: '前月',
			nextText: '翌月',
			monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			dayNames: ['日曜日','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日'],
			dayNamesShort: ['日','月','火','水','木','金','土'],
			dayNamesMin: ['日','月','火','水','木','金','土'],
			//yearSuffix: '년',
			showMonthAfterYear: true
		};
		$.extend(datepickerOption, localOption);
	}else if(sessionDefaultLocaleCd == 'en_CA'){
		var localOption = {
				prevText: '上一月',
				nextText: '下一月',
				monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
				monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
				dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
				dayNamesShort: ['日','一','二','三','四','五','六'],
				dayNamesMin: ['日','一','二','三','四','五','六'],
				//yearSuffix: '년',
				showMonthAfterYear: true
		};
		$.extend(datepickerOption, localOption);
	}
	$.extend(datepickerOption, option);
	return datepickerOption;
};


//$("#selectMedia").on('click', function() {
//	  $("#checkboxes").slideToggle('fast');
//});
//
//$(".selectMedia a").on('click', function() {
//	$("#checkboxes").hide();
//});
//
//function getSelectedValue(id) {
//	return $("#" + id).find("input[type=checkbox]").html();
//}
//
//$(document).on('click', function(e) {
//	var $clicked = $(e.target);
//	if (!$clicked.parents().hasClass("selectMedia")) $("#checkboxes").hide();
//});
//
//$('#checkboxes input[type="checkbox"]').on('click', function() {
//	var title = $(this).closest('#checkboxes').find('input[type="checkbox"]').val();
//	title = $(this).val() + ",";
//	
//	if ($(this).is(':checked')) {
//	  var html = '<span title="' + title + '">' + title + '</span>';
//	  $('.multiSel').append(html);
//	  $(".selMediaDefault").hide();
//	} else {
//	  $('span[title="' + title + '"]').remove();
//	  var ret = $(".selMediaDefault");
//	  $('.selectMedia a').append(ret);
//	
//	}
//});

function MyGrid(id)
{
    var width = 0;
    var height = 0;
    var cols = 12;
    var rows = 12;
    var vmargin = 20;

    var lastHeight = 0;

    var gridObj = 0;

    var options = {
			width:12,
	        float: false,
	        float: false,
	        animate: true,
	        disableResize: false,
	        disableDrag: false,
	        cellHeight: 'auto',
	        cellHeightUnit: 'px',
	        removable: '',
	        removeTimeout: 100,
//	        verticalMargin: 20,
	        acceptWidgets: '.grid-stack-item',
	        resizable: { handles: 'e, se, s, sw, w' },
    };

    function init()
    {
    	
	    $(id).gridstack(options);
	    gridObj = $(id).data('gridstack');

	    gridObj._updateHeightsOnResize = function() { resize(); };

	    gridObj.onResizeHandler();
    }

    function resize()
    {
        width = $(id).parent().width();
        height = $(id).parent().height() - ((rows - 1) * vmargin);

        if (0 >= height)
        {
            setTimeout(gridObj.onResizeHandler, 1000);
            return;
        }

        if (lastHeight == height)
			return;

        lastHeight = height;
        gridObj.cellHeight(parseInt(height / rows) + 'px');

    }

    function addTile(id, x, y, w, h)
    {
//    	if($('.defaultGrid').length > 0){
//			$('.defaultGrid').remove();
//		}
		var gridDatas=[{
			'id':'settingTrendChart',
			'gs_width':'4',
			'gs_height':'3',
			'name':'추이 차트'
		},{
			'id':'settingRelatedChart',
			'gs_width':'3',
			'gs_height':'4',
			'name':'연관어 차트'
		},{
			'id':'settingEmoChart',
			'gs_width':'4',
			'gs_height':'4',
			'name':'감성어 차트'
		},{
			'id':'settingBuzzChart',
			'gs_width':'4',
			'gs_height':'3',
			'name':'버즈 차트'
		}]
		
		var item = _.filter(gridDatas, function(item) {
			return item.id == id;
		});
		
		var template = $("#templateGrid").text();
		template = template.replace( /{{id}}/g , item[0].id  );
//		template = template.replace( /{{gs-width}}/g , item[0].gs_width );
//		template = template.replace( /{{gs-height}}/g , item[0].gs_height );
		template = template.replace( /{{name}}/g , item[0].name );
		var gridObj = $('.grid-stack').data('gridstack');
	
		template = removeEnter(template);
		if(x){
			gridObj.addWidget($(template), x, y, w, h,true);
		}else{
			gridObj.addWidget($(template),5, 0, 4, 3,true);
		}
		
    }

    function removeTile(h)
    {
        gridObj.removeWidget($(h).closest('.grid-stack-item'));
    }

    function save()
    {
        return $.makeArray($(id + ' > .grid-stack-item')).map(function(v)
        {
            var n = $(v).data('_gridstack_node');
            console.log("aaaaaa");
            console.log(n);
            return n ? { id: n.el[0].id, x: n.x, y: n.y, width: n.width, height: n.height } : null;
        });
    }

    function load(data)
    {
        gridObj.removeAll();
        $.each(data, function(k, v) { addTile(v.id, v.name, v.x, v.y, v.width, v.height); });
    }

    function clear()
    {
        gridObj.removeAll();
    }
    
    function removeEnter(value){
//		 template = template.replace( /\r\n|\r|\n|\n\r/g ,"" );
		value = value.replace(/\s+/, "");//왼쪽 공백제거
		value = value.replace(/\s+$/g, "");//오른쪽 공백제거
		value = value.replace(/\n/g, "");//행바꿈제거
		value = value.replace(/\r/g, "");//엔터제거
		return value;
	 }

    init();

    this.resize = resize;
    this.addTile = addTile;
    this.removeTile = removeTile;
    this.save = save;
    this.load = load;
    this.clear = clear;
}


$(function(){	
//	$(document).on('click', function(e) {
//		var $clicked = $(e.target);
//		if (!$clicked.parents().hasClass("selectMedia")) $("#checkboxes")[0].style.display = "none";
//	});
	
	//gridstack Widget 만들기 Start -----
//	$('.grid-stack').on('gsresizestop', function(event, elem) {
//		var newX = $(elem).attr('data-gs-x');
//		var newY = $(elem).attr('data-gs-y');
//		var newWidth = $(elem).attr('data-gs-width');
//	    var newHeight = $(elem).attr('data-gs-height');
//	    var newId = $(elem).attr('id');
//	    
//	    console.log(newX + " " + newY + " " + newWidth + " " + newHeight);
//	    console.log(newId);
//	    console.log($('#selectMedia').val());
//	});
	
	//gridstack Widget 만들기 Start -----
//	$('.grid-stack').on('dropped', function(event, elem) {
//		if($('.defaultGrid').length > 0){
//			$('.defaultGrid').remove();
//		}
//	    $(this).find('.grid-stack-item').css('border','1px solid');
//	    $(this).find('.floating-menu .grid-stack-item').css('border','none');
//	});

	var myGrid = 0;
	$(function()
	{
	    myGrid = new MyGrid('#grid-stack');
	    //myGrid.load(tmpl, '#tmpl_tile');
	});

	$('.floating-menu .floatMenu_div').on('dblclick',function(el){
		myGrid.addTile(el.currentTarget.id);		 
	});
// ------------------- 봐야됨 수정 필요!!!----------------------
	function delTile(tile) { myGrid.removeTile(tile); }

	$('#resetGridBtn').on('click', function() { myGrid.clear(); });

	$('#saveGridBtn').on('click', function()
	{
	    $('#jsonStr').val(JSON.stringify(myGrid.save()));
	});

	$('#loadGridBtn').on('click', function()
	{
	    myGrid.load(JSON.parse($('#jsonStr').val()));
	});

//	$('#load').on('click', function()
//	{
//	    $('#jsonStr').val(JSON.stringify(myGrid.save()));
//	});
	
	
	var rqData = {
			'fromDate': '',
			'toDate':''
	};
	
//    $('#grid2').gridstack(_.defaults({
//        float: true
//    }, options));
    var items = [
        {x: 0, y: 0, width: 2, height: 2}
    ];
//    $('.grid-stack').each(function () {
//        var grid = $(this).data('gridstack');
//        _.each(items, function (node) {
//            grid.addWidget($('<div><div class="grid-stack-item-content" /><div/>'),
//                node.x, node.y, node.width, node.height);
//        });
//    });
    
//    $('.grid-stack').each(function () {
//        var grid = $(this).data('gridstack');
//        
//        _.each(items, function (node) {
//        	console.log(items);
//            grid.addWidget($('<div><div class="grid-stack-item" /><div/>'),
//                node.x, node.y, node.width, node.height);
//        });
//    });

    
    
    
//	$('.floating-menu .grid-stack-item').draggable({
//        revert: 'invalid',
//        handle: '.grid-stack-item-content',
//        scroll: false,
//        appendTo: 'body'
//    });
    
    
	
//	fnMakeCategoryList();
	
	// Dual Calendar 추가
	var inframe = false;
	if($(window.parent.document).find('iframe').size()){
		inframe = true;
	}
//	$('#fromDateIco,#toDateIco').daterangepicker({
//		datepickerOptions: $.datepickerLanguageOption(), //object containing native UI datepicker API options
//		fromDate: "fromDate",
//		toDate: "toDate",
//		onOpen:function(){ if(inframe){ $(window.parent.document).find('iframe:eq(0)').width(700).height('35em');} }, 
//		onClose: function(){ if(inframe){ $(window.parent.document).find('iframe:eq(0)').width('100%').height('5em');} }
//	}); 
//	
//	$("#selectChart").change(function() {
//		//alert(this.value + " - " + $("#selectChart option:selected").text());
//		fnAddWidget(this);
//    });
//	
//    $("#saveBtn").click(function() {
//    	InitDisplay();
//    });
    
    function fnAddWidget(obj){
    	console.log(" fnAddWidget 입니다.....");
    	let $html = '';
    	var divObj = $('#'+obj.value);

  		console.log("$('#' + obj.value).length: " + $('#' + obj.value).length);
        if ($('#' + obj.value).length > 0) {
        	// ComboBox 다시 원상복귀시키기!!!
        	return;
        }
    	
    	switch(obj.value){
	        case "TrendbyLine":
	        	$html += '<div id="'+ obj.value + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += $('#selectChart option:selected').text();
	       	    $html += '</div></div>';
	            break;
	        case "OneRelatedList":
	        	$html += '<div id="'+ obj.value + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += $('#selectChart option:selected').text();
	       	    $html += '</div></div>';
	            break;
	        case "TwoRelatedList":
	        	$html += '<div id="'+ obj.value + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += $('#selectChart option:selected').text();
	       	    $html += '</div></div>';
	            break;
	        case "ThrRelatedList":
	        	$html += '<div id="'+ obj.value + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += $('#selectChart option:selected').text();
	       	    $html += '</div></div>';
	            break;
	        case "PostList":
	        	$html += '<div id="'+ obj.value + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += $('#selectChart option:selected').text();
	       	    $html += '</div></div>';
	            break;
	        case "PercentPie":
	        	$html += '<div id="'+ obj.value + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += $('#selectChart option:selected').text();
	       	    $html += '</div></div>';
	            break;
	        case "PercentBar":
	        	$html += '<div id="'+ obj.value + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += $('#selectChart option:selected').text();
	       	    $html += '</div></div>';
	            break;   
	    }
   	    
//   	    $($html).appendTo($('.grid-stack'));
//   	    $('.grid-stack').gridstack();
//   	 
//   	    var grid = $('.grid-stack').data('gridstack');
//   	    grid.addWidget($('#' + obj.value));
    }
    
});


function fnMakeCategoryList(){
	
	var topicList = [{
		id:"TrendbyLine",
		title : "추이 차트"
	},{
		id:"OneRelatedList",
		title : "1차 연관어 List"
	},{
		id:"TwoRelatedList",
		title : "2차 연관어 List"
	},{
		id:"ThrRelatedList",
		title : "3차 연관어 List"
	},{
		id:"PostList",
		title : "원문 List"
	},{
		id:"PercentPie",
		title : "비율 Pie 차트"
	},{
		id:"PercentBar",
		title : "비율 Bar 차트"
	}];
	
	for(var i=0; i<topicList.length; i++) {
		
		var id = topicList[i].id;
		var title = topicList[i].title;
		
		var template = $("#templateCateLi").html();
		template = template.replace( /{{id}}/g , id  );
		template = template.replace( /{{title}}/g , title );
		
		template = template.replace( /{{classNm}}/g , "off" );
		
		$( "#ulCategoryListWrap" ).append(template);
	}
	fnTrendbyLine();
	fnPercentPie();
	
	
	$(".category-keyword-li").on("click", function() {  
        console.log("$(category-keyword-li).length : " + $(".category-keyword-li").length);
        
        if($(this).hasClass("on")){
        	$(this).addClass("off");
        	$(this).removeClass("on");

        	$('#div_'+$(this).attr('id')).remove();
        }
        else if(!$(this).hasClass("on")) {
			$(this).addClass("on");
			$(this).removeClass("off");
			
			fnAddWidget(this);
		}
		else{
		}
		
	})
}

function fnAddWidget(obj){
    	console.log(" fnAddWidget 입니다.....");
    	console.log($('#' + obj.id + " .documentBtnWord").text());
    	console.log($('#' + obj.id + " .documentBtnWord").length);
    
    	let $html = '';
//        if ($('#' + obj.id + " .documentBtnWord").length > 0) {
//        	return;
//        }
        
        var objId = $('#' + obj.id).attr('id');
        var objText = $('#' + obj.id + " .documentBtnWord").text();
        
        if ($('#div_' + obj.id).length > 0) {
        	alert("이미 존재하는 Widget 입니다.")
        	return;
        }
        
    	switch(objId){
	        case "TrendbyLine":
	        	$html += '<div id="div_'+ objId + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += objText;
	       	    $html += '</div></div>';
	            break;
	        case "OneRelatedList":
	        	$html += '<div id="div_'+ objId + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += objText;
	       	    $html += '</div></div>';
	            break;
	        case "TwoRelatedList":
	        	$html += '<div id="div_'+ objId + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += objText;
	       	    $html += '</div></div>';
	            break;
	        case "ThrRelatedList":
	        	$html += '<div id="div_'+ objId + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += objText;
	       	    $html += '</div></div>';
	            break;
	        case "PostList":
	        	$html += '<div id="div_'+ objId + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += objText;
	       	    $html += '</div></div>';
	            break;
	        case "PercentPie":
	        	$html += '<div id="div_'+ objId + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    $html += objText;
	       	    $html += '</div></div>';
	            break;
	        case "PercentBar":
	        	$html += '<div id="div_'+ objId + '" class="grid-stack-item" data-gs-x="0" data-gs-y="2" data-gs-width="4" data-gs-height="2">';
	       	    $html += '<div class="grid-stack-item-content">';
	       	    //$html += $('#selectChart option:selected').text();
	       	    $html += objText;
	       	    $html += '</div></div>';
	            break;   
	    }
   	    
   	    $($html).appendTo($('.grid-stack'));
   	    $('.grid-stack').gridstack();
   	 
   	    var grid = $('.grid-stack').data('gridstack');
   	    grid.addWidget($('#div_' + objId));
}

function fnTrendbyLine(){
	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	var chart = am4core.create("chartLineChart", am4charts.XYChart);

	var data = [{
		'date':'03',
		'value':'100',
	},{
		'date':'04',
		'value':'60',
	},{
		'date':'05',
		'value':'75',
	},{
		'date':'06',
		'value':'66',
	},{
		'date':'07',
		'value':'35',
	},{
		'date':'08',
		'value':'42',
	},{
		'date':'09',
		'value':'67',
	},{
		'date':'10',
		'value':'71',
	},{
		'date':'11',
		'value':'80',
	},{
		'date':'12',
		'value':'65',
	}];
	var value = 50;
	chart.data = data;
	chart.autoMargins=false;
	// Create axes
	var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
	dateAxis.renderer.minGridDistance = 10;

	var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

	// Create series
	var series = chart.series.push(new am4charts.LineSeries());
	series.dataFields.valueY = "value";
	series.dataFields.dateX = "date";
	series.tooltipText = "{value}"

	series.tooltip.pointerOrientation = "vertical";

	
	//Cursor 크기 조정 가능한가?
//	chart.cursor = new am4charts.XYCursor();
//	chart.cursor.snapToSeries = series;
//	chart.cursor.xAxis = dateAxis;
//
////	chart.scrollbarY = new am4core.Scrollbar();
//	chart.scrollbarX = new am4core.Scrollbar();
	fnOneRelatedList(chartOneList);
}

function fnOneRelatedList(obj){
	var data = [{
		'no':'1',
		'keyword':'카페',
		'cnt':100,
	},{
		'no':'2',
		'keyword':'2번',
		'cnt':97,
	},{
		'no':'3',
		'keyword':'3번',
		'cnt':80,
	},{
		'no':'4',
		'keyword':'4번',
		'cnt':70,
	},{
		'no':'5',
		'keyword':'5번',
		'cnt':60,
	},{
		'no':'6',
		'keyword':'6번',
		'cnt':40,
	},{
		'no':'7',
		'keyword':'7번',
		'cnt':30,
	},{
		'no':'8',
		'keyword':'8번',
		'cnt':20,
	},{
		'no':'9',
		'keyword':'9번',
		'cnt':10,
	},{
		'no':'10',
		'keyword':'10번',
		'cnt':9,
	},{
		'no':'11',
		'keyword':'11번',
		'cnt':8,
	},{
		'no':'12',
		'keyword':'12번',
		'cnt':7,
	},{
		'no':'13',
		'keyword':'13번',
		'cnt':6,
	},{
		'no':'14',
		'keyword':'14번',
		'cnt':5,
	},{
		'no':'13',
		'keyword':'13번',
		'cnt':4,
	}];
	
    $(obj).jsGrid({
      width: "92%",
//      height: 330,
//  	width: 380,
      autoload: true,
      selecting: false,
      sorting: true,
      paging:true,
      filtering:true,
      fields: [
          { name: "no", title: "순위", filtering:false, type: "number", width: 50, align: "center" },
          { name: "keyword", title: "키워드", filtering:true, type: "text" },
          { name: "cnt", title: "버즈량",filtering:false, type: "number", width: 40, itemTemplate: function(value, item) {
                  return value.numberFormat();
              }}
      ],
      data:data,
      controller: {
          loadData: function(filter) {
          	console.log(filter);
          	var tempd = data;
          	var d = $.Deferred();
              if(filter.keyword){
              	tempd= $.grep(tempd, function(tempd) {
                      //return tempd.keyword == filter.keyword;
              		return !tempd.keyword.indexOf(filter.keyword);
//              		if(!tempd.keyword.indexOf(filter.keyword)){
//              			return tempd.keyword;
//              		}
//              		else{
//              		}
                      
                  });
              }
              d.resolve(tempd);
              return d.promise();
          }
      },
      rowClick: function(args) {
//              var item = args.item;
//              var keys = Object.keys(item);
//              var text = "";
    	  var $row = this.rowByItem(args.item);
//    	  //.jsgrid-grid-body .jsgrid-row:first-child .jsgrid-cell,
//    	  $row.find('.jsgrid-cell').css('background-color', '#80BFFF');
//    	  console.log($row.find('.jsgrid-cell').css('background-color'));
    	  $row.find('.jsgrid-cell').css('background-color',function(index,value){
    		  if(value == "rgb(128, 191, 255)"){
    			  $row.find('.jsgrid-cell').css('background-color', ' #fcfcfc');
    		  }
    		  else{
    			  $row.find('.jsgrid-cell').css('background-color', '#80BFFF');
    		  }
    	  });
    	  
    	  //$row.find('td').addClass("onJs");
          //$row.toggleClass("highlight");
//highlight 해제 ----
//          var selectedRow = $("#jsGrid").find('table tr.highlight').
//          selectedRow.toggleClass('highlight') or selectedRow.removeClass('highlight')
//          highlight 해제 ----
          //document.getElementById('"tpaddKeywordList"').appendChild(div);
//              var addKeywordList = document.getElementById('tpaddKeywordListid').innerHTML;
              
//              $(".tpaddKeyword").each(function(idx){
//              	alert("idx " + idx);
//              	alert("value "+ $(this).text());
//              });
              
//              var divId = "tpaddKeyword"+item["no"];
             
//              var divObj2 = $('#' + divId);
//
//              if(divObj2.html() != ""){
//              	console.log(divObj2);
//              	divObj2.click();
//              	return;
//              }
              
//              console.log("$(# divId).length : " + $('#' + divId).length);
//              if ( $('#' + divId).length > 0) {
//              	$('#' + divId).trigger('click');
//              	return;
//              }
//              console.log("$('.tpaddKeyword').length "+$('.tpaddKeyword').length);
//              if ( $('.tpaddKeyword').length >= 5) {
//              	alert("Keyword 는 5개까지만 선택 가능합니다.");
//              	return;
//              }
//              var addKeyworddiv = document.createElement('div');
              //var text = document.createTextNode(item["keyword"]);
              
//              var divKeyword = document.getElementById('tpaddKeywordListid').appendChild(addKeyworddiv);
              //var divKeyword = $(".tpaddKeywordList").append(addKeyworddiv);
              
//              $(divKeyword).attr("id", divId);
              //addKeyworddiv.id = divId;
//              var divObj = $('#' + divId);
              
              
//              console.log("item[keyword] : " +item["keyword"]);
//              divObj.addClass("tpaddKeyword");
//              divObj.attr("onClick","fntpremoveKeyword(this)");
//              divObj.html(item["keyword"]);
              	
              //document.getElementById('tpaddKeywordList').appendChild(addKeyworddiv);
//              document.getElementById('tpaddKeywordList').innerHTML += [
//          	                                                          "<div class='tpaddKeyword' onclick='fntpremoveKeyword(this)'>",
//          	                                                          getData["keyword"],
//          	                                                          "</div>"
//          	].join("");               
        }
  });
}

function fnTwoRelatedList(){
	
}

function fnThrRelatedList(){
	
}

function fnPostList(){
	
}

function fnPercentPie(){
	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create("chartPercentPie", am4charts.PieChart);

	// Add data
	chart.data = [ {
	  "country": "Lithuania",
	  "litres": 501.9
	}, {
	  "country": "Czech Republic",
	  "litres": 301.9
	}, {
	  "country": "Ireland",
	  "litres": 201.1
	}, {
	  "country": "Germany",
	  "litres": 165.8
	}, {
	  "country": "Australia",
	  "litres": 139.9
	}, {
	  "country": "Austria",
	  "litres": 128.3
	}, {
	  "country": "UK",
	  "litres": 99
	}, {
	  "country": "Belgium",
	  "litres": 60
	}, {
	  "country": "The Netherlands",
	  "litres": 50
	} ];

	// Set inner radius
	chart.innerRadius = am4core.percent(30);

	// Add and configure Series
	var pieSeries = chart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.value = "litres";
	pieSeries.dataFields.category = "country";
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeWidth = 2;
	pieSeries.slices.template.strokeOpacity = 1;

	// This creates initial animation
	pieSeries.hiddenState.properties.opacity = 1;
	pieSeries.hiddenState.properties.endAngle = -90;
	pieSeries.hiddenState.properties.startAngle = -90;
}

function fnPercentBar(){
	
}