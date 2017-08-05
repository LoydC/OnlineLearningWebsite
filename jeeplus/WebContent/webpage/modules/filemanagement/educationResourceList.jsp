<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
    <title>教学资源增删改查管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
        });
    </script>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content">
    <div class="ibox">
    <div class="ibox-title">
        <h5>教学资源增删改查列表 </h5>
        <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#">选项1</a>
                </li>
                <li><a href="#">选项2</a>
                </li>
            </ul>
            <a class="close-link">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
    
    <div class="ibox-content">
    <sys:message content="${message}"/>
    
    <!--查询条件-->
    <div class="row">
    <div class="col-sm-12">
    <form:form id="searchForm" modelAttribute="educationResource" action="${ctx}/filemanagement/educationResource/" method="post" class="form-inline">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
        <div class="form-group">
            <span>课程：</span>
                <form:input path="course" htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>
            <span>资源名称：</span>
                <form:input path="resourceName" htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>
         </div> 
    </form:form>
    <br/>
    </div>
    </div>
    
    <!-- 工具栏 -->
    <div class="row">
    <div class="col-sm-12">
        <div class="pull-left">
            <shiro:hasPermission name="filemanagement:educationResource:add">
                <table:addRow url="${ctx}/filemanagement/educationResource/form" title="教学资源增删改查"></table:addRow><!-- 增加按钮 -->
            </shiro:hasPermission>
            <shiro:hasPermission name="filemanagement:educationResource:edit">
                <table:editRow url="${ctx}/filemanagement/educationResource/form" title="教学资源增删改查" id="contentTable"></table:editRow><!-- 编辑按钮 -->
            </shiro:hasPermission>
            <shiro:hasPermission name="filemanagement:educationResource:del">
                <table:delRow url="${ctx}/filemanagement/educationResource/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
            </shiro:hasPermission>
            <shiro:hasPermission name="filemanagement:educationResource:import">
                <table:importExcel url="${ctx}/filemanagement/educationResource/import"></table:importExcel><!-- 导入按钮 -->
            </shiro:hasPermission>
            <shiro:hasPermission name="filemanagement:educationResource:export">
                <table:exportExcel url="${ctx}/filemanagement/educationResource/export"></table:exportExcel><!-- 导出按钮 -->
            </shiro:hasPermission>
           <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
        
            </div>
        <div class="pull-right">
            <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
            <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
        </div>
    </div>
    </div>
    
    <!-- 表格 -->
    <table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
        <thead>
            <tr>
                <th> <input type="checkbox" class="i-checks"></th>
                <th  class="sort-column course">课程</th>
                <th  class="sort-column resourceName">资源名称</th>
                <th  class="sort-column displayPath">资源的展示路径</th>
                <th  class="sort-column type">资源类型</th>
                <th  class="sort-column author">资源编著者</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="educationResource">
            <tr>
                <td> <input type="checkbox" id="${educationResource.id}" class="i-checks"></td>
                <td><a  href="#" onclick="openDialogView('查看教学资源增删改查', '${ctx}/filemanagement/educationResource/form?id=${educationResource.id}','800px', '500px')">
                    ${educationResource.course}
                </a></td>
                <td>
                    ${educationResource.resourceName}
                </td>
                <td>
                    ${educationResource.displayPath}
                </td>
                <td>
                    ${fns:getDictLabel(educationResource.type, 'resource_type', '')}
                </td>
                <td>
                    ${educationResource.author}
                </td>
                <td>
                    <shiro:hasPermission name="filemanagement:educationResource:view">
                        <a href="#" onclick="openDialogView('查看教学资源增删改查', '${ctx}/filemanagement/educationResource/form?id=${educationResource.id}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="filemanagement:educationResource:edit">
                        <a href="#" onclick="openDialog('修改教学资源增删改查', '${ctx}/filemanagement/educationResource/form?id=${educationResource.id}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="filemanagement:educationResource:del">
                        <a href="${ctx}/filemanagement/educationResource/delete?id=${educationResource.id}" onclick="return confirmx('确认要删除该教学资源增删改查吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
                    </shiro:hasPermission>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
        <!-- 分页代码 -->
    <table:page page="${page}"></table:page>
    <br/>
    <br/>
    </div>
    </div>
</div>
</body>
</html>