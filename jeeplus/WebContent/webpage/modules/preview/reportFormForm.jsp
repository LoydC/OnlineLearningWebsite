<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>预习报告单管理</title>
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
	<form:form id="inputForm" modelAttribute="reportForm" action="${ctx}/preview/reportForm/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
				<tr>
					<td class="width-15 active"><label class="pull-right"><font color="red">*</font>任务单名称：</label></td>
					<td class="width-35">
						<form:input path="reportFormNum" htmlEscape="false"    class="form-control required"/>
					</td>
					<td class="width-15 active"><label class="pull-right"><font color="red">*</font>学习内容：</label></td>
					<td class="width-35">
						<form:textarea path="learningContent" htmlEscape="false" rows="4"    class="form-control required"/>
					</td>
				</tr>
		 	</tbody>
		</table>
		
		<div class="tabs-container">
            <ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">课前学习任务：</a>
                </li>
				<li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">实习前学习任务：</a>
                </li>
            </ul>
            <div class="tab-content">
				<div id="tab-1" class="tab-pane active">
			<a class="btn btn-white btn-sm" onclick="addRow('#preclassDutyList', preclassDutyRowIdx, preclassDutyTpl);preclassDutyRowIdx = preclassDutyRowIdx + 1;" title="新增"><i class="fa fa-plus"></i> 新增</a>
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th class="hide"></th>
						<th>学习资源</th>
						<th>学习目标</th>
						<th>问题与思考</th>
						<th>疑问</th>
						<th width="10">&nbsp;</th>
					</tr>
				</thead>
				<tbody id="preclassDutyList">
				</tbody>
			</table>
			<script type="text/template" id="preclassDutyTpl">//<!--
				<tr id="preclassDutyList{{idx}}">
					<td class="hide">
						<input id="preclassDutyList{{idx}}_id" name="preclassDutyList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
						<input id="preclassDutyList{{idx}}_delFlag" name="preclassDutyList[{{idx}}].delFlag" type="hidden" value="0"/>
					</td>
					
					<td  class="max-width-250">
            			<sys:treeselect id="preclassDutyList{{idx}}_learningResource" name="preclassDutyList[{{idx}}].learningResource.id" value="{{row.learningResource.id}}" 
							labelName="preclassDutyList{{idx}}.learningResource.resourceName" labelValue="{{row.learningResource.resourceName}}"
              				title="用户" url="/preview/reportForm/treeData?type=3" cssClass="form-control  required" notAllowSelectParent="true" checked="true"/>
          			</td>
					
					<td>
						<textarea id="preclassDutyList{{idx}}_learningTarget" name="preclassDutyList[{{idx}}].learningTarget" rows="4"    class="form-control required">{{row.learningTarget}}</textarea>
					</td>
					
					
					<td>
						<textarea id="preclassDutyList{{idx}}_questionAndThinking" name="preclassDutyList[{{idx}}].questionAndThinking" rows="4"    class="form-control required">{{row.questionAndThinking}}</textarea>
					</td>
					
					
					<td>
						<textarea id="preclassDutyList{{idx}}_doubt" name="preclassDutyList[{{idx}}].doubt" rows="4"    class="form-control ">{{row.doubt}}</textarea>
					</td>
					
					<td class="text-center" width="10">
						{{#delBtn}}<span class="close" onclick="delRow(this, '#preclassDutyList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
					</td>
				</tr>//-->
			</script>
			<script type="text/javascript">
				var preclassDutyRowIdx = 0, preclassDutyTpl = $("#preclassDutyTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
				$(document).ready(function() {
					var data = ${fns:toJson(reportForm.preclassDutyList)};
					for (var i=0; i<data.length; i++){
						addRow('#preclassDutyList', preclassDutyRowIdx, preclassDutyTpl, data[i]);
						preclassDutyRowIdx = preclassDutyRowIdx + 1;
					}
				});
			</script>
			</div>
				<div id="tab-2" class="tab-pane">
			<a class="btn btn-white btn-sm" onclick="addRow('#prepracticeDutyList', prepracticeDutyRowIdx, prepracticeDutyTpl);prepracticeDutyRowIdx = prepracticeDutyRowIdx + 1;" title="新增"><i class="fa fa-plus"></i> 新增</a>
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th class="hide"></th>
						<th>实习任务</th>
						<th>内容与目标</th>
						<th>疑问</th>
						<th width="10">&nbsp;</th>
					</tr>
				</thead>
				<tbody id="prepracticeDutyList">
				</tbody>
			</table>
			<script type="text/template" id="prepracticeDutyTpl">//<!--
				<tr id="prepracticeDutyList{{idx}}">
					<td class="hide">
						<input id="prepracticeDutyList{{idx}}_id" name="prepracticeDutyList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
						<input id="prepracticeDutyList{{idx}}_delFlag" name="prepracticeDutyList[{{idx}}].delFlag" type="hidden" value="0"/>
					</td>
					
					
					
					<td>
						<textarea id="prepracticeDutyList{{idx}}_contentAndTarget" name="prepracticeDutyList[{{idx}}].contentAndTarget" rows="4"    class="form-control required">{{row.contentAndTarget}}</textarea>
					</td>
					
					
					<td>
						<textarea id="prepracticeDutyList{{idx}}_doubt" name="prepracticeDutyList[{{idx}}].doubt" rows="4"    class="form-control ">{{row.doubt}}</textarea>
					</td>
					
					<td class="text-center" width="10">
						{{#delBtn}}<span class="close" onclick="delRow(this, '#prepracticeDutyList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
					</td>
				</tr>//-->
			</script>
			<script type="text/javascript">
				var prepracticeDutyRowIdx = 0, prepracticeDutyTpl = $("#prepracticeDutyTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
				$(document).ready(function() {
					var data = ${fns:toJson(reportForm.prepracticeDutyList)};
					for (var i=0; i<data.length; i++){
						addRow('#prepracticeDutyList', prepracticeDutyRowIdx, prepracticeDutyTpl, data[i]);
						prepracticeDutyRowIdx = prepracticeDutyRowIdx + 1;
					}
				});
			</script>
			</div>
		</div>
		</div>
	</form:form>
</body>
</html>