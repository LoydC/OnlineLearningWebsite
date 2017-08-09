<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>学生报告单记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body class="hideScroll">
	<form:form id="inputForm" modelAttribute="studentReportformRecords" action="${ctx}/preview/studentReportformRecords/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
				<tr>
					<td class="width-15 active"><label class="pull-right"><font color="red">*</font>实验报告单：</label></td>
					<td class="width-35">
						<form:input path="reportForm" htmlEscape="false"    class="form-control required"/>
					</td>
					<td class="width-15 active"><label class="pull-right"><font color="red">*</font>学习花费时间：</label></td>
					<td class="width-35">
						<form:input path="spendTime" htmlEscape="false"    class="form-control required"/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right"><font color="red">*</font>学习难度：</label></td>
					<td class="width-35">
						<form:select path="learnDifficulty" class="form-control required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('learning_difficulty')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
					<td class="width-15 active"><label class="pull-right"><font color="red">*</font>学习目标完成度：</label></td>
					<td class="width-35">
						<form:select path="learnTarget" class="form-control required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('learning_target_degree')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right"><font color="red">*</font>存在问题：</label></td>
					<td class="width-35">
						<form:input path="existProblem" htmlEscape="false"    class="form-control required"/>
					</td>
					<td class="width-15 active"><label class="pull-right">建议：</label></td>
					<td class="width-35">
						<form:input path="advice" htmlEscape="false"    class="form-control "/>
					</td>
				</tr>
		 	</tbody>
		</table>
		
		<div class="tabs-container">
            <ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">学生预习报告单记录的疑问：</a>
                </li>
            </ul>
            <div class="tab-content">
				<div id="tab-1" class="tab-pane active">
			<a class="btn btn-white btn-sm" onclick="addRow('#studentRecordsDoubtList', studentRecordsDoubtRowIdx, studentRecordsDoubtTpl);studentRecordsDoubtRowIdx = studentRecordsDoubtRowIdx + 1;" title="新增"><i class="fa fa-plus"></i> 新增</a>
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th class="hide"></th>
						<th>预习任务</th>
						<th>是课前学习任务（1）还是实习前学习任务（0）</th>
						<th>疑问</th>
						<th width="10">&nbsp;</th>
					</tr>
				</thead>
				<tbody id="studentRecordsDoubtList">
				</tbody>
			</table>
			<script type="text/template" id="studentRecordsDoubtTpl">//<!--
				<tr id="studentRecordsDoubtList{{idx}}">
					<td class="hide">
						<input id="studentRecordsDoubtList{{idx}}_id" name="studentRecordsDoubtList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
						<input id="studentRecordsDoubtList{{idx}}_delFlag" name="studentRecordsDoubtList[{{idx}}].delFlag" type="hidden" value="0"/>
					</td>
					
					<td>
						<input id="studentRecordsDoubtList{{idx}}_previewDutyId" name="studentRecordsDoubtList[{{idx}}].previewDutyId" type="text" value="{{row.previewDutyId}}"    class="form-control required"/>
					</td>
					
					
					<td>
						<input id="studentRecordsDoubtList{{idx}}_flag" name="studentRecordsDoubtList[{{idx}}].flag" type="text" value="{{row.flag}}"    class="form-control required"/>
					</td>
					
					
					<td>
						<input id="studentRecordsDoubtList{{idx}}_doubt" name="studentRecordsDoubtList[{{idx}}].doubt" type="text" value="{{row.doubt}}"    class="form-control "/>
					</td>
					
					<td class="text-center" width="10">
						{{#delBtn}}<span class="close" onclick="delRow(this, '#studentRecordsDoubtList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
					</td>
				</tr>//-->
			</script>
			<script type="text/javascript">
				var studentRecordsDoubtRowIdx = 0, studentRecordsDoubtTpl = $("#studentRecordsDoubtTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
				$(document).ready(function() {
					var data = ${fns:toJson(studentReportformRecords.studentRecordsDoubtList)};
					for (var i=0; i<data.length; i++){
						addRow('#studentRecordsDoubtList', studentRecordsDoubtRowIdx, studentRecordsDoubtTpl, data[i]);
						studentRecordsDoubtRowIdx = studentRecordsDoubtRowIdx + 1;
					}
				});
			</script>
			</div>
		</div>
		</div>
	</form:form>
</body>
</html>