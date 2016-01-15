<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/global.jsp" %>
<html>

 <head>
    <script type="text/javascript" charset="utf-8" src="ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>
 </head>
<body class="easyui-layout">
	<script type="text/javascript">
	var isInvoice={"Y":"有","N":"无"};
		$(function(){
			//表格
			$('#brandTable').datagrid({ 
		        url: context + "/product/queryProductList.do",
		        animate:"true",
		        rownumbers:"true",
		        singleSelect:true,
		        selectOnCheck: true,
		        checkOnSelect: true,
		        fit:true,
		        fitColumns:true,
		        pagination:true,
		        pageSize:10,
		        columns:[[ 
	        		{title:'品号',field:'tblBrand', width:180, formatter:function(value,rowData,rowIndex){
	                	return "" + value.brandName;
	        		}},
	        		{title:'货号',field:'productNo',width:180},
			        {title:'库存数量',field:'inventoryNum',width:160},
			        {title:'市场价格',field:'marketPrice',width:160},
			        {title:'优惠价格',field:'discountPrice',width:160},
			        {title:'运费',field:'freight',width:160},
			        {title:'发票',field:'isInvoice',width:140, formatter:function(value,rowData,rowIndex){
	                	return isInvoice[value];
	        		}}
		        ]],
		        
		    });
			//保存品牌
			$("#addEditBrandSaveButton").click(function() {
				$.messager.progress();
				$("#addEditBrandForm").form("submit", {
					url : context + "/product/saveOrUpdateProduct.do",
					dataType : "json",
					onSubmit : function() {
						var isValid = $("#addEditBrandForm").form('validate');
						if (!isValid) {
							$.messager.progress('close');
						}
						return isValid;
					},
					success : function(result) {
						var data = $.parseJSON(result);
						$.messager.alert("系统提示", data.msg);
						$.messager.progress('close');
						$("#addEditBrandForm").form('clear');
						if (data.success) {
							$('#addEditBrandWindow').window('close');
							$("#brandTable").datagrid("reload");
						}
					}
				});
			});
			//取消
			$("#addEditBrandCancelButton").click(function() {
				$('#addEditBrandWindow').window('close');
			});
			  
		});
		function addBrand() {
			$("#addEditBrandForm").form('clear');
			$('#addEditBrandWindow').window({
				title : "新增商品"
			});
			$('#addEditBrandWindow').window('open');
		}
		function editBrand() {
			var row = $('#brandTable').datagrid('getSelected');
			if (!row) {
				$.messager.alert("系统提示", "请选择一条记录！");
				return;
			}
			$("#addEditBrandForm").form('clear');
			$('#addEditBrandWindow').window({
				title : "修改商品"
			});
			$('#addEditBrandWindow').window('open');
			$('#addEditBrandForm').form("load", {
				brandNo : row.brandNo,
				productNo : row.productNo,
				inventoryNum : row.inventoryNum,
				discountPrice : row.discountPrice,
				marketPrice : row.marketPrice,
				loadCapacity : row.loadCapacity,
				freight : row.freight,
				isInvoice:row.isInvoice,
				introduction : row.introduction,
				productId : row.productId
			});
		}
		function deleteBrand(){
			var row = $('#brandTable').datagrid('getSelected');
			if (!row) {
				$.messager.alert("系统提示", "请选择一条记录！");
				return;
			}
			$.messager.confirm('系统提示', '确定删除?', function(r) {
				if (r) {
					var url = context + "/product/deleteProduct.do";
					var data = {};
					data.productId = row.productId;
					ajaxCall("#brandTable", url, data, function(res) {
						$("#brandTable").datagrid("reload");
					});
				}
			});
		}
		function searchBrand(){
			var url = context + "/product/queryProductList.do";
			var data = {};
			data.productName = $("#brandNo").val();
			data.productNo=$("#productNo").val();
			$('#brandTable').datagrid({url:url,queryParams:data});
		}
		
		
		
	</script>
	<div id="tb" style="padding:5px;height:auto">
	<!-------------------------------搜索框----------------------------------->
        <fieldset>
            <legend>信息查询</legend>
            <form id="ffSearch" method="post">
                <div id="toolbar">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <label>品牌：</label>
                                <select id="brandNo" name="brandNo" style="width: 125px;">
                                    <option value="">全部</option>
                                    <c:forEach items="${tblBrands}" var="tblBrand">
                                        <option value="${tblBrand.no }">${tblBrand.brandName }</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <label >货号：</label><input class="easyui-validatebox textbox" type="text" name="productNo" id="productNo" data-options="validType:['productNo','length[1,20]']"/>
                            </td>
                            <td>
                                &nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="btnSearch" onclick="searchBrand();">查询</a>
                            </td>
                          </tr>
                          <tr><td>&nbsp;</td></tr>
                          <tr>
                            <td>
                                <a href="javascript:void(0)" class="easyui-linkbutton" id="btnAdd" iconcls="icon-add" onclick="addBrand()">新增</a>&nbsp;&nbsp;
                                <a href="javascript:void(0)" class="easyui-linkbutton" id="btnEdit" iconcls="icon-edit" onclick="editBrand()">修改</a>&nbsp;&nbsp;
                                <a href="javascript:void(0)" class="easyui-linkbutton" id="btnDelete" iconcls="icon-remove" onclick="deleteBrand()">删除</a>&nbsp;&nbsp;
                            </td>
                          </tr>
                    </table>
                </div>
            </form>
        </fieldset>
        </div>
	<table title="商品列表" id="brandTable" toolbar="#tb"></table>
	
    <div id="addEditBrandWindow" class="easyui-window" data-options="modal:true,closed:true" style="width:600px;height:550px;padding:10px;">
        <div class="easyui-layout" data-options="fit:true">
            <form id="addEditBrandForm" method="post">
            <input class="easyui-textbox" type="hidden" name="productId"/>
                <table width="100%">
                    <tr >
                        <td colspan="5">注意：填错商品属性信息，可能引起宝贝下架，影响您的正常销售。请认真准确填写。</td>
                    </tr>
                    <tr>
                        <td align="right" width="15%">
                            品牌：
                        </td>
                        <td>
                            <select  name="brandNo" style="width: 125px;">
                                <c:forEach items="${tblBrands}" var="tblBrand">
                                    <option value="${tblBrand.no }">${tblBrand.brandName }</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">如果没有您需要的品牌，您也可以点此<a href="../product/brandIndex.do">申请添加品牌</a></td>
                    </tr>
                    <tr>
                        <td align="right" width="15%">
                            货号：
                        </td>
                        <td>
                            <input class="easyui-validatebox textbox" type="text" name="productNo" data-options="required:true,validType:['productNo','length[1,20]']"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" width="15%">
                            库存数量：
                        </td>
                        <td>
                            <input class="easyui-validatebox textbox" type="text" name="inventoryNum" id="inventoryNum" data-options="required:true,validType:['inventoryNum','number[10]']"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" width="15%">
                            承载重量：
                        </td>
                        <td>
                            <input class="easyui-validatebox textbox" type="text" name="loadCapacity" id="loadCapacity" data-options="required:true,validType:['loadCapacity','length[1,20]']"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" width="15%">
                            运费：
                        </td>
                        <td>
                            <input class="easyui-validatebox textbox" type="text" name="freight" id="freight" data-options="required:true,validType:['freight','length[1,20]']"/>
                        </td>
                        <td align="right" width="15%">
                            发票：
                        </td>
                        <td>
                            <input type="radio" value="Y" name="isInvoice" checked="checked"/>有&nbsp;&nbsp;<input type="radio" value="N" name="isInvoice"/>无
                        </td>
                        <td><input type="radio" value="Y" name="isMinusInventory" checked="checked"/>付款减库存</td>
                    </tr>
                    <tr>
                        <td align="right" width="15%">
                            优惠价格：
                        </td>
                        <td>
                            <input class="easyui-validatebox textbox" type="text" name="discountPrice" id="discountPrice" data-options="required:true,validType:['discountPrice','length[1,20]']"/>
                        </td>
                        <td align="right" width="15%">
                            市场价格：
                        </td>
                        <td>
                            <input class="easyui-validatebox textbox" type="text" name="marketPrice" id="marketPrice" data-options="required:true,validType:['marketPrice','length[1,20]']"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" width="15%">
                            商品介绍：
                        </td>
                        <td colspan="5">
                            <textarea style="width: 100%;height: 260px;" class="textarea easyui-validatebox" name="introduction"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td colspan="5" style="padding:15px;text-align:right;">
                            <a id="addEditBrandSaveButton" href="#" class="easyui-linkbutton" icon="icon-ok">保存</a>
                            <a id="addEditBrandCancelButton" href="#" class="easyui-linkbutton" icon="icon-cancel">取消</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <!-- <script type="text/javascript">
        var heightMargin = $("#toolbar").height() + 164;
        var widthMargin = $(document.body).width() - $("#tb").width();
        // 第一次加载时和当窗口大小发生变化时，自动变化大小
        $('#brandTable').resizeDataGrid(heightMargin, widthMargin, 0, 0);
        $(window).resize(function () {
            $('#brandTable').resizeDataGrid(heightMargin, widthMargin, 0, 0);
        });
</script> -->
</body>
</html>
