<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title>墓碑编辑器</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="umeditor.min.js"></script>
    <script type="text/javascript" src="lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        h1{
            font-family: "微软雅黑";
            font-weight: normal;
        }
        .btn {
            display: inline-block;
            *display: inline;
            padding: 4px 12px;
            margin-bottom: 0;
            *margin-left: .3em;
            font-size: 14px;
            line-height: 20px;
            color: #333333;
            text-align: center;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            background-color: #f5f5f5;
            *background-color: #e6e6e6;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            border: 1px solid #cccccc;
            *border: 0;
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            border-bottom-color: #b3b3b3;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            *zoom: 1;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn:hover,
        .btn:focus,
        .btn:active,
        .btn.active,
        .btn.disabled,
        .btn[disabled] {
            color: #333333;
            background-color: #e6e6e6;
            *background-color: #d9d9d9;
        }

        .btn:active,
        .btn.active {
            background-color: #cccccc \9;
        }

        .btn:first-child {
            *margin-left: 0;
        }

        .btn:hover,
        .btn:focus {
            color: #333333;
            text-decoration: none;
            background-position: 0 -15px;
            -webkit-transition: background-position 0.1s linear;
            -moz-transition: background-position 0.1s linear;
            -o-transition: background-position 0.1s linear;
            transition: background-position 0.1s linear;
        }

        .btn:focus {
            outline: thin dotted #333;
            outline: 5px auto -webkit-focus-ring-color;
            outline-offset: -2px;
        }

        .btn.active,
        .btn:active {
            background-image: none;
            outline: 0;
            -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn.disabled,
        .btn[disabled] {
            cursor: default;
            background-image: none;
            opacity: 0.65;
            filter: alpha(opacity=65);
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }
		.vertica{
		  writing-mode:tb-rl;
		  height:100px;
		}
		.transverse{
		  writing-mode:lr-tb;
		  height:100px;
		}
		body{
			overflow: scroll;
		    overflow-x: hidden;
		    overflow-y: hidden;
		}
		#determine{
			width: 120px;
		    font-family: cursive;
		    font-size: 16px;
		    background: #333333;
		    color: white;
		    margin-left: 210px;
            margin-top: -30px;
		}
		#determine:active{
			width: 120px;
		    font-family: cursive;
		    font-size: 16px;
		    background: #8d8d8d;
		    color:black;
		    margin-left: 210px;
            margin-top: -30px;
		}
		#transverse,#vertica,#insertHtml{
			background: white;
		    color: #502f12d6;
		    border: 0;
		    text-decoration: underline;
		}
		#transverse:hover,#vertica:hover,#insertHtml:hover{
			background: white;
		    color: #8d8d8d;
		    border: 0;
		    text-decoration: none;
		}
		#result{
			position: relative;
		    left:380px;
		    bottom: 24px;
		}
		span{
			font-family: cursive;
		}
    </style>
</head>
<body>
<h1></h1>

<!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain" id="myEditor" style="width:600px;height:340px;">
    <p></p>
</script>


<div class="clear"></div>
	<div id="btns">
	    <table>
	       
	        <tr>
	        	<td>
	        	   <button class="btn" id="transverse">横式</button>&nbsp;
	        	   <button class="btn" id="vertica">舒式</button>&nbsp;
	        	   <button class="btn" id="insertHtml" onclick="insertHtml()">插入给定的内容</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <!-- <button class="btn" id="myEditor" onclick="UM.getEditor('myEditor').setHide()">隐藏编辑器</button>&nbsp;
	                <button class="btn" id="myEditor" onclick="UM.getEditor('myEditor').setShow()">显示编辑器</button>&nbsp; -->
	        	</td>
	        	<td></td>
	        </tr>
	      <!--  <form name="Edit" id="Edit"> -->
	         <tr>
	            <td id="submitTd">
				    <div id="result">
				       <span>您已输入的字数：</span><input type="text" id="wordsNumber" name="wordsNumber" value="0" size="4"/>&nbsp;&nbsp;&nbsp;
				    </div>
				    <button class="btn" id="determine" type="submit" onclick="determine()">确定</button>
	            </td>
				<td>
	        	   <input type="hidden" id="sgdbh" name="sgdbh">
	        	   <input type="hidden" id="editorText" name="editorText">
				</td>
	        </tr>
	     <!--  </form> -->
	    </table>
	</div>
	<div>
	    <h3 id="focush2"></h3>
	</div>

<script type="text/javascript">
var editorText = window.opener.document.getElementById("editorTextId").value;
var wordsNumber = window.opener.document.getElementById("wordsNumberId").value;
$("#myEditor").text(editorText);
$("#wordsNumber").val(wordsNumber);
var sgdNum = sessionStorage.getItem('sgdNum');
document.getElementById("sgdbh").value=sgdNum;
$(document).ready(function(){
	 $("#determine").click(function(){
	     var sgdbh = $("#sgdbh").val();
	     var editorText = $("#editorText").val();
	     var wordsNumber = $("#wordsNumber").val();
   		 var datas={
	   		'sgdbh':sgdbh,
	   		'editorText':editorText,
	   		'wordsNumber':wordsNumber
          };
         $.ajax({
			 type: "POST",
			 url:"<%=path%>/queryWordsCount.html",
			 data:datas,
			 async:false,
			 dataType: "json",
			 success:function(data){
		    
		  }
	    });	
	   // https://blog.csdn.net/qq_32311977/article/details/49464591
	   /*  var edit=document.Edit;
	    var wordsNumber=edit.wordsNumber.value; */
	    var kzxId = window.opener.document.getElementById("kzxId"); 
	    kzxId.value = wordsNumber;
	    window.close();  
	 }); 
});

$(document).ready(function(){
	 $("#transverse").click(function(){
	    $("#myEditor").removeClass("vertica"); 
	 	$("#myEditor").addClass("transverse");
	 }); 
}); 

$(document).ready(function(){
	  $("#vertica").click(function(){ 
	    $("#myEditor").removeClass("transverse"); 
	 	$("#myEditor").addClass("vertica");
	 });
	 
}); 
$(document).ready(function(){
   $("#myEditor").keyup(function(){ 
    var contentText = $("#myEditor").text();
	var count = contentText.NoSpace();
	$("#wordsNumber").val(count.length); 
	$("#editorText").val($("#myEditor").text());
	}); 
}); 
String.prototype.NoSpace = function() 
{ 
  return this.replace(/\s+/g, ""); 
}
    //实例化编辑器
     var um = UM.getEditor('myEditor');
    /*um.addListener('blur',function(){
        $('#focush2').html('编辑器失去焦点了')
    });
    um.addListener('focus',function(){
        $('#focush2').html('')
    }); */
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus(){
        alert(um.isFocus())
    }
    function doBlur(){
        um.blur()
    }
    function createEditor() {
        enableBtn();
        um = UM.getEditor('myEditor');
    }
    function getAllHtml() {
        alert(UM.getEditor('myEditor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
        UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UM.getEditor('myEditor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UM.getEditor('myEditor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UM.getEditor('myEditor').selection.getRange();
        range.select();
        var txt = UM.getEditor('myEditor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UM.getEditor('myEditor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UM.getEditor('myEditor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UM.getEditor('myEditor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UM.getEditor('myEditor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            domUtils.removeAttributes(btn, ["disabled"]);
        }
    }
    
</script>
   
</body>
</html>