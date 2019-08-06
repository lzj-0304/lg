<!DOCTYPE html>
<html>
<head>
	<title>角色管理</title>
	<#include "../base.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" >
	<blockquote class="layui-elem-quote quoteBox">
		<form class="layui-form">
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input type="text" name="roleName"
						   class="layui-input
					searchVal" placeholder="角色名" />
				</div>
				<a class="layui-btn search_btn" data-type="reload"><i
							class="layui-icon">&#xe615;</i> 搜索</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal addNews_btn"><i
							class="layui-icon">&#xe608;</i>  添加角色</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal addGrant"><i class="layui-icon
				">&#xe672;</i>授权</a>
			</div>
		</form>
	</blockquote>
	<table id="roleList" class="layui-table"  lay-filter="roles"></table>

	<!--操作-->
	<script id="roleListBar" type="text/html">
		<a class="layui-btn layui-btn-xs" id="edit" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
	</script>


</form>
<script type="text/javascript" src="${ctx}/admin/js/role/roleList.js"></script>

</body>
</html>