<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>表格</title>
<meta name="keywords" content="侧边导航菜单(可分组折叠)">
<meta name="description" content="侧边导航菜单(可分组折叠)" />
<meta name="HandheldFriendly" content="True" />
<!-- <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"> -->

<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
.panel-group {
	max-height: 770px;
}

.leftMenu {
	margin: 10px;
	margin-top: 5px;
}

.leftMenu .panel-heading {
	font-size: 14px;
	padding-left: 20px;
	height: 36px;
	line-height: 36px;
	color: white;
	position: relative;
	cursor: pointer;
} /*转成手形图标*/
.leftMenu .panel-heading span {
	position: absolute;
	right: 10px;
	top: 12px;
}

.leftMenu .menu-item-left {
	padding: 2px;
	background: transparent;
	border: 1px solid transparent;
	border-radius: 6px;
}

.leftMenu .menu-item-left:hover {
	background: #C4E3F3;
	border: 1px solid #1E90FF;
}
</style>

<script src="<%=path%>/statics/js/jquery-2.1.4.min.js"></script>

<script src="js/bootstrap.min.js "></script>
<script>
	$(function() {
		$(".panel-heading").click(function(e) {
			/*切换折叠指示图标*/
			$(this).find("span").toggleClass("glyphicon-chevron-down");
			$(this).find("span").toggleClass("glyphicon-chevron-up");
		});
	});
</script>
</head>

<body style="overflow-x:hidden;">
	<div class="row">
		<div class="col-md-2">
			<div class="panel-group table-responsive" role="tablist">
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="../statics/muqu/muqu-list.html"
								target="rightFrame"> 墓区管理</a>
							<!--  <span class="glyphicon glyphicon-chevron-up right"></span> -->
						</h4>
					</div>
				</div>
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="<%=path%>/muxue-list.html"
								target="rightFrame">墓穴管理</a>
							<!--  <span class="glyphicon glyphicon-chevron-up right"></span> -->
						</h4>
					</div>
				</div>
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="<%=path%>/dingmu-list.html"
								target="rightFrame">定墓管理</a>
							<!--  <span class="glyphicon glyphicon-chevron-up right"></span> -->
						</h4>
					</div>
				</div>
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="<%=path%>/customer-list.html"
								target="rightFrame"> 客户查询</a>
							<!--  <span class="glyphicon glyphicon-chevron-up right"></span> -->
						</h4>
					</div>
				</div>

				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading1"
						data-toggle="collapse" data-target="#collapseListGroup1"
						role="tab">
						<h4 class="panel-title">
							营销管理 <span class="glyphicon glyphicon-chevron-up right"></span>
						</h4>
					</div>
					<div id="collapseListGroup1" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading1">
						<ul class="list-group">
							<li class="list-group-item">
								<!-- 利用data-target指定URL -->
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/construction-list.html"
										target="rightFrame"> 施工单</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> 
									<a href="<%=path%>/tombDecoration-list.html" target="rightFrame"> 墓穴装修</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/constructionSchedule-list.html"
										target="rightFrame"> 施工进度</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/qtsr-list.html"
										target="rightFrame"> 其他收入</a> </span>
								</button></li>

						</ul>
					</div>
				</div>
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading2"
						data-toggle="collapse" data-target="#collapseListGroup2"
						role="tab">
						<h4 class="panel-title">
							销售管理 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup2" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading2">
						<ul class="list-group">
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/sale/tombsPicture.jsp"
										target="rightFrame"> 墓穴使用情况图</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/muxueCalculate.html"
										target="rightFrame"> 墓穴统计</a> </span>
								</button></li>
							<%-- <li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/sale/saleCount.jsp"
										target="rightFrame"> 销售统计</a> </span>
								</button></li> --%>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/showBusinessCount.html"
										target="rightFrame">业务统计</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/showSymx.html"
										target="rightFrame"> 使用明细统计</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/showKzcx.html"
										target="rightFrame"> 刻字瓷像统计</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/sale/XSLZ.jsp"
										target="rightFrame"> 销售落葬统计</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/sale/cheapCount.jsp"
										target="rightFrame"> 优惠情况统计</a> </span>
								</button></li>
						</ul>
					</div>
				</div>
				
				
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading3"
						data-toggle="collapse" data-target="#collapseListGroup3"
						role="tab">
						<h4 class="panel-title">
							维护费管理 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup3" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading3">
						<ul class="list-group">
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/weihufei-list.html"
										target="rightFrame"> 维护费明细</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/weihufei-add.html"
										target="rightFrame"> 维护费续交</a> </span>
								</button></li>
							
						</ul>
					</div>
				</div>

                <div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading4"
						data-toggle="collapse" data-target="#collapseListGroup4"
						role="tab">
						<h4 class="panel-title">
							数据管理 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup4" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading4">
						<ul class="list-group">
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>"
										target="rightFrame"> 数据备份</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>"
										target="rightFrame"> 数据恢复</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>"
										target="rightFrame"> 数据导出</a> </span>
								</button></li>
						</ul>
					</div>
				</div>
				
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading5"
						data-toggle="collapse" data-target="#collapseListGroup5"
						role="tab">
						<h4 class="panel-title">
							查询打印 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					 </div>
					<div id="collapseListGroup5" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading5">
						<ul class="list-group">
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/printing/monthPrinting.jsp"
										target="rightFrame">财务月报表打印</a> </span>
								</button>
							</li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/printing/dayPrinting.jsp"
										target="rightFrame"> 财务日报表打印</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/printing/contractPrinting.jsp"
										target="rightFrame"> 打印合同及证书</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/printing/tombDecorationPrinting.jsp"
										target="rightFrame">墓穴装修打印</a> </span>
								</button></li>
							<%-- <li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="<%=path%>/statics/customer/maintainPrinting.jsp"
										target="rightFrame"> 维护费打印</a> </span>
								</button></li> --%>
						</ul>
					</div>
				</div>
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading6"
						data-toggle="collapse" data-target="#collapseListGroup6"
						role="tab">
						<h4 class="panel-title">
							系统设置 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup6" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading6">
						<ul class="list-group">
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="../statics/xitong/cixiang/cixiang-list.html"
										target="rightFrame">瓷像设置</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="../statics/xitong/address/address-list.html"
										target="rightFrame"> 地区设置</a> </span>
								</button></li>
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="../statics/xitong/user/user.html"
										target="rightFrame">单位信息</a> </span>
								</button></li>
							<!-- <li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="../statics/customer/customer-list.jsp"
										target="rightFrame">用户权限设置</a> </span>
								</button></li> -->
							<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="../statics/xitong/ basicData/basicData-list.html"
										target="rightFrame"> 基础资料设置</a></span>
								</button></li>
								<li class="list-group-item">
								<button class="menu-item-left" target="rightFrame">
									<span class="glyphicon glyphicon-triangle-right"> <a
										href="../statics/xitong/addUser/addUser.html"
										target="rightFrame"> 用户新增</a></span>
								</button></li>
						</ul>
					</div>
				</div>
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="<%=path%>/statics/dataInterface/dataInterface.jsp"
								target="rightFrame">公墓信息上报</a>
							<!--  <span class="glyphicon glyphicon-chevron-up right"></span> -->
						</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
