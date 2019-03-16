<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>jQuery/CSS3 3D Tab菜单选项卡插件DEMO演示</title>
  	  <link rel="stylesheet" href="<%=path%>/statics/css/main/style.css">
	  <link rel="stylesheet" href="<%=path%>/statics/css/main/b.page.bootstrap3.css">
	  <link rel="stylesheet" href="<%=path%>/statics/css/main/b.page.css">
	  <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
</head>

<body>
  <div id="main"> 

        <div id="tab_header"> 
            <span class="selected">tab1</span><span>tab2</span><span>tab3</span> 
        </div> 

        <div id="tab_body"> 

            <ul class="shown"> 
			   <li>
				  <p><span>姓名：</span><input type="text" name="" value="" placeholder="请输入..."/>
				  <span>登录名：</span><input type="text" name="" value="" placeholder="请输入..."/>
				  <span>性别：</span><input type="text" name="" value="" placeholder="请输入..."/>
				  <span>电话：</span><input type="text" name="" value="" placeholder="请输入..."/>
				  </p>
				  <p><span>姓名：</span><input type="text" name="" value="" placeholder="请输入..."/>
				  <span>登录名：</span><input type="text" name="" value="" placeholder="请输入..."/>
				  <span>性别：</span><input type="text" name="" value="" placeholder="请输入..."/>
				  <span>电话：</span><input type="text" name="" value="" placeholder="请输入..."/>
				  </p>
				  <p>
				     <button>搜索</button>
				  </p>
			   </li>
               <li>
                <!-- 页面跳转模式为例 -->
				<!-- 前提条件为服务端已将分页数据设置到request中 -->
				<!-- 设置表格，内容区域中使用服务端的el表达式循环生成表格内容 -->
				<table class="bTable table table-striped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th class="selectColumn" >选择</th>
							<th>登录名</th>
							<th>姓名</th>
							<th>性别</th>
							<th>出生年月</th>
							<th>电话</th>
							<th>电子邮箱</th>
							<th>状态</th>
							<th>更新时间</th>
						</tr>
					</thead>
					<tbody>
						<tr class="" id="id">
							<td class="selectColumn"><input type="radio" name="userSelect" value="id" /></td>
							<td>xingming</td>
							<td>name</td>
							<td>sexname</td>
							<td>20160712</td>
							<td>phone1</td>
							<td>email</td>
							<td>statusName</td>
							<td>20180923</td>
						</tr>
						<tr class="" id="id">
							<td class="selectColumn"><input type="radio" name="userSelect" value="id" /></td>
							<td>xingming</td>
							<td>name</td>
							<td>sexname</td>
							<td>20160712</td>
							<td>phone1</td>
							<td>email</td>
							<td>statusName</td>
							<td>20180923</td>
						</tr>
						<tr class="" id="id">
							<td class="selectColumn"><input type="radio" name="userSelect" value="id" /></td>
							<td>xingming</td>
							<td>name</td>
							<td>sexname</td>
							<td>20160712</td>
							<td>phone1</td>
							<td>email</td>
							<td>statusName</td>
							<td>20180923</td>
						</tr>
						<!-- <c:if test="${userList.list != null}">
							<c:forEach var="d" items="${userList.list}">
						<tr class="<c:if test="${d.status == 0}">error</c:if>" id="${d.id}">
							<td class="selectColumn"><input type="radio" name="userSelect" value="${d.id}" /></td>
							<td>${d.login_name}</td>
							<td>${d.name}</td>
							<td>${d.sexName}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${d.birthday}" type="date" /></td>
							<td>${d.phone1}</td>
							<td>${d.email}</td>
							<td>${d.statusName}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${d.update_time}" type="date" /></td>
						</tr>
							</c:forEach>
						</c:if>-->
					</tbody>
				</table>
				
				<input type="hidden" id="pageNumber" value="1">
				<input type="hidden" id="pageSize" value="1">
				<input type="hidden" id="totalPage" value="1">
				<input type="hidden" id="totalRow" value="1">
				     

			</li>

            </ul> 

            <ul> 

                <li>tab2 - 1</li> 

                <li>tab2 - 2</li> 

            </ul> 

            <ul> 

                <li>tab3 - 1</li> 

                <li>tab3 - 2</li> 

                <li>tab3 - 3</li> 

            </ul> 

        </div> 

    </div>
   <script>
	
   </script>
   <script src='<%=path%>/statics/js/main/jquery.min.js'></script>
    <script  src="<%=path%>/statics/js/main/index.js"></script>
  <script  src="<%=path%>/statics/js/main/b.page.js"></script>
  <script src="https://apps.bdimg.com/libs/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>