<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/global.jsp" %>
<html>

<body>
	<script type="text/javascript">
		$(function(){
			//表格
			$('#roleTable').datagrid({ 
		        url: context + "/role/roleList.do",
		        animate:"true",
		        rownumbers:"true",
		        singleSelect:true,
		        fit:true,
		        pagination:true,
		        pageSize:10,
		        columns:[[ 
	        		{title:'角色名称',field:'roleName', width:180},
			        {title:'描述',field:'remark',width:180},
	        		{title:'创建人',field:'createOper',width:80},
	        		{title:'创建日期',field:'createDate',width:80},
	        		{title:'创建时间',field:'createTime',width:80},
	        		{title:'修改人',field:'modifyOper',width:80},
	        		{title:'修改日期',field:'modifyDate',width:80},
	        		{title:'修改时间',field:'modifyTime',width:80}
		        ]],
		        toolbar:[{
		        	text:"新增角色",
		        	iconCls:"icon-add",
		        	handler:function(){
		        		$("#addEditRoleForm").form('clear');
		        		$('#addEditroleWindow').window({title:"新增角色"});
		        		$('#addEditroleWindow').window('open');
		        	}
		        },"-",{
		        	text:"修改角色",
		        	iconCls:"icon-edit",
		        	handler:function(){
		        		var row = $('#roleTable').datagrid('getSelected');
		        		if(!row){
		        			$.messager.alert("系统提示", "请选择一条记录！");
		        			return;
		        		}
		        		$("#addEditRoleForm").form('clear');
		        		$('#addEditroleWindow').window({title:"修改角色"});
		        		$('#addEditroleWindow').window('open');
		        		$('#addEditRoleForm').form("load",{
		        			roleName:row.roleName,
		        			roleId:row.roleId,
		        			remark:row.remark
		        		});
		        	}
		        },"-",{
		        	text:"删除角色",
		        	iconCls:"icon-remove",
		        	handler:function(){
		        		var row = $('#roleTable').datagrid('getSelected');
		        		if(!row){
		        			$.messager.alert("系统提示", "请选择一条记录！");
		        			return;
		        		}
		        		$.messager.confirm('系统提示', '确定删除角色?', function(r){
		        			if(r){
		        				var url = context + "/role/deleteRole.do";
		        				var data = {};
		        				data.roleId = row.roleId;
		        				ajaxCall("#roleTable", url, data, function(res){
				        			$("#roleTable").datagrid("reload");
				        		});
		        			}
		        		});
		        	}
		        },"-",{
		        	text:"分配权限",
		        	iconCls:"icon-add",
		        	handler:function(){
		        		//var parentTree = $("#roleMenuTree").combotree('tree');
		        		var row = $('#roleTable').datagrid('getSelected');
		        		if(!row){
		        			$.messager.alert("系统提示", "请选择一条记录！");
		        			return;
		        		}
		        		$(":text[name='roleName']").val(row.roleName);
		        		$(":hidden[name='roleId']").val(row.roleId);
		        		//读取当前角色的权限信息
		        		var url = context + "/role/roleAuthorityList.do";
		        		var data = {"roleId" : row.roleId};
		        		ajaxCallNoMsg("#roleTable", url, data, function(res){
		        			var authoritys = res.authorityData;
		        			var authorityArray = [];
		        			for(i=0; i<authoritys.length; i++){
		        				authorityArray.push(authoritys[i].menuId);
		        			}
		        			var roleMenuTree = $("#roleMenuTree").combotree('setValues', authorityArray);
		        		});
		        		$('#rightWindow').window({title:"分配权限"});
		        		$('#rightWindow').window('open');
		        	}
		        }]
		    });
			
			//保存权限
			$("#roleSaveButton").click(function(){
				$.messager.progress();
				//var roleId = $(":hidden[name='roleId']").val();
				//var nodes = $('#roleMenuTree').combotree('getValues');
				//alert(nodes.join(","));
				$("#authorityForm").form("submit", {
					url:context + "/role/saveAuthority.do",
					dataType:"json",
					onSubmit:function(){
						var isValid = $("#authorityForm").form('validate');
						if (!isValid){
							$.messager.progress('close');
						}
						return isValid;
					},
					success: function(result){
						var data = $.parseJSON(result);
						$.messager.alert("系统提示", data.msg);
						$.messager.progress('close');
						$("#authorityForm").form('clear');
						if(data.success){
							$('#rightWindow').window('close');
							$("#roleTable").datagrid("reload");
						}
					}
				});
			});
			//保存角色
			$("#addEditRoleSaveButton").click(function(){
				$.messager.progress();
				$("#addEditRoleForm").form("submit", {
					url:context + "/role/saveRole.do",
					dataType:"json",
					onSubmit:function(){
						var isValid = $("#addEditRoleForm").form('validate');
						if (!isValid){
							$.messager.progress('close');
						}
						return isValid;
					},
					success: function(result){
						var data = $.parseJSON(result);
						$.messager.alert("系统提示", data.msg);
						$.messager.progress('close');
						$("#addEditRoleForm").form('clear');
						if(data.success){
							$('#addEditroleWindow').window('close');
							$("#roleTable").datagrid("reload");
						}
					}
				});
			});
			//取消
			$("#roleCancelButton").click(function(){
				$("#rightWindow").window("close");
			});
			//取消
			$("#addEditRoleCancelButton").click(function(){
				$("#addEditroleWindow").window("close");
			});
		});
	</script>
	<table title="角色列表" id="roleTable"></table>
	<!-- 新增/修改角色 -->
	<div id="addEditroleWindow" class="easyui-window" data-options="modal:true,closed:true" style="width:500px;height:210px;padding:10px;">
		<div class="easyui-layout" data-options="fit:true">
			<form id="addEditRoleForm" method="post">
				<table width="100%">
					<tr>
						<td>角色名称：</td>
						<td>
							<input class="easyui-validatebox textbox" type="text" name="roleName" style="width: 300px" data-options="required:true"/>
           					<input class="easyui-textbox" type="hidden" name="roleId"/>
						</td>
					</tr>
					<tr>
						<td>描述：</td>
						<td>
							<textarea rows="5" cols="35" class="textarea easyui-validatebox" name="remark"></textarea>
						</td>
					</tr>
					<tr>
           				<td>
           					&nbsp;
           				</td>
           				<td style="padding:15px;text-align:right;">
           					<a id="addEditRoleSaveButton" href="#" class="easyui-linkbutton" icon="icon-ok">保存</a>
           					<a id="addEditRoleCancelButton" href="#" class="easyui-linkbutton" icon="icon-cancel">取消</a>
           				</td>
           			</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 角色权限 -->
	<div id="rightWindow" class="easyui-window" data-options="modal:true,closed:true" style="width:500px;height:200px;padding:10px;">
		<div class="easyui-layout" data-options="fit:true">
			<div>
				<form id="authorityForm" method="post">
            		<table width="100%">
            			<tr>
            				<td style="width: 75px">
            					角色名称：
            				</td>
            				<td colspan="3">
            					<input class="easyui-textbox" type="text" name="roleName" readonly="readonly" style="width: 300px" data-options="required:true"/>
            					<input class="easyui-textbox" type="hidden" name="roleId"/>
            				</td>
            			</tr>
            			<tr>
            				<td>
            					分配菜单：
            				</td>
            				<td colspan="3">
            					<select id="roleMenuTree" class="easyui-combotree" multiple data-options="url:'<%=context %>/menu/menuList.do', cascadeCheck:false" name="roleMenu" style="width: 305px"></select>
            				</td>
            			</tr>
            			<tr>
            				<td>
            					&nbsp;
            				</td>
            				<td colspan="3" style="padding:15px;text-align:right;">
            					<a id="roleSaveButton" href="#" class="easyui-linkbutton" icon="icon-ok">保存</a>
            					<a id="roleCancelButton" href="#" class="easyui-linkbutton" icon="icon-cancel">取消</a>
            				</td>
            			</tr>
            		</table>
            	</form>
			</div>
		</div>
	</div>
</body>
</html>
