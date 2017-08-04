<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		     WinMove();
		});
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
   <div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12">
            <blockquote class="text-info" style="font-size:14px">Visual Basic（简称VB）是Microsoft公司开发的一种通用的基于对象的程序设计语言，为结构化的、模块化的、面向对象的、包含协助开发环境的事件驱动为机制的可视化程序设计语言。是一种可用于微软自家产品开发的语言。[1] 
“Visual” 指的是开发图形用户界面 (GUI) 的方法——不需编写大量代码去描述界面元素的外观和位置，而只要把预先建立的对象add到屏幕上的一点即可。 “Basic”指的是 BASIC (Beginners All-Purpose Symbolic Instruction Code) 语言，一种在计算技术发展历史上应用得最为广泛的语言。
Visual Basic源自于BASIC编程语言。VB拥有图形用户界面（GUI）和快速应用程序开发（RAD）系统，可以轻易的使用DAO、RDO、ADO连接数据库，或者轻松的创建Active X控件，用于高效生成类型安全和面向对象的应用程序[2]  。程序员可以轻松的使用VB提供的组件快速建立一个应用程序。
    			<br/>
                <br>…………
            </blockquote>

            <hr>
        </div>
    </div>
      
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-4">

                <div class="ibox float-e-margins">
                     <div class="ibox-title">
                        <h5>VB发展历程</h5> 
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="index.html#">选项1</a>
                                </li>
                                <li><a href="index.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <p> 1991年4月，微软公司推出了 Visual Basic 1.0Windows版本，这个连接编程语言和用户界面的进步被称为Tripod（有些时候叫做Ruby），最初的设计是由阿兰·库珀（Alan Cooper）完成的。在当时，它是第一个“可视”的编程软件。

                        <ol>
						<li>1992年9月，Visual Basic 1.0 DOS版本发布。11月，由于Visual Basic 1.0的功能过于简单，微软推出了新版本Visual Basic 2.0。这个版本最大的改进就是加入了对象型变量，比如Dim b As CommandButton、Dim c As Control，对语言的改进和扩充，Visual Basic 2.0对VBX有了很好的支持，许多第三方控件涌现出来，极大地丰富了Visual Basic的功能。微软还为Visual Basic 2.0增加了OLE和简单的数据访问功能。9月，Visual Basic 1.0 DOS版本发布。</li>
						<li>1993年，微软公司推出Visual Basic 3.0，分为标准版和专业版。其中包含一个数据引擎，可以直接读取Access数据库。增加了最新的ODBC2.0的支持，Jet数据引擎的支持和新版本OLE的支持。Visual Basic 3.0增加了许多新的金融函数，增加了相当多的专业级控件，可以开发具有相当水平Windows应用程序。</li>
						<li>1995年8月，微软公司推出Visual Basic 4.0，版本包含了16位和32位两个版本，VBX控件换成了OCX控件，Visual Basic 4.0所用的语言换成了Visual Basic For Application。</li>
						<li>1997年2月，微软公司推出Visual Basic 5.0，Visual Basic 5.0加入了一个本地代码编译器，Visual Basic 5.0对Visual Basic For Application语言有重大的完善和丰富，Visual Basic 5.0的IDE支持“智能感知”，支持开发自己的ActiveX 控件、进程内的COM DLL组件、进程外的COM EXE组件以及在浏览器中运行的ActiveX文档。程序员可以用32位的版本导入由4.0版本创建的16位程序，并且能顺利编译。同时还包含了对用户自建控件的支持。</li>
						<li>1998年，微软公司推出Visual Basic 6.0，Visual Basic 6.0在数据访问方面有了很大的改进，新的ADO组件让对大量数据快速访问成为可能。数据环境和新的报表功能也让数据开发有了全新的体验。 借助COM/COM+强大的功能，可以开发具有N层结构的分布式应用程序。可以在IIS上开发性能超群的Web应用程序。</li>
						<li>2000年，微软公司推出Visual Basic.NET版本Visual Basic.NET有对CLR最完善的支持，同时尽量保留着BASIC易懂的语法风格和易用性。Visual Basic.NET大大减少了Visual Basic语言的关键字，如GoSub、PSet等等。</li>
						<li>2002年，微软将.NET Framework与 Visual Basic 结合而成为 Visual Basic .NET (vb .net)，重新打造 VB，新增许多特性及语法。2月，Visual Basic .NET 2002 (7.0)，由于其使用了新的核心和特性，所以很多 VB 的程序员都要改写程序。</li>
						<li>2003年，Visual Basic .NET 2003 (v7.1)问世，主要改进了运行状况，提升了 IDE 以及运行时稳定性。</li>
						<li>2004年，微软开放了Visual Studio 2005的测试版本（代号Whidbey）。包含了.NET Framework2.0的测试版本。</li>
						<li>2005年11月7日，Visual Basic 2005 (v8.0)问世，同时间推出Visual Basic 2005的免费简化版本Visual Basic 2005 Express Edition给Visual Basic初学者及学生使用。是 vb .net 的重大转变，微软决意在其名称中去掉了".NET"部份。VB2005 提供 My 伪命名空间、泛型、操作符重载等新语言特性。</li>
						<li>2007年11月，微软公司推出Visual Basic 2008 (9.0)，提供支持 IIF 函数、匿名类、LINQ、Lambda 表达式、XML 数据结构等新语言特性。</li>
						<li>2008年3月，微软宣布将不会再对非.NET版本的VB进行支持。/li>
						<li>2010年4月，微软公司推出Visual Studio 2010 (10.0)，提供支持 Dynamic Language Runtime (DLR)、自动实现属性、集合初始化、不需要在代码断行书写时输入下划线“_”等新语言特性。</li>						
						<li>2012年5月，微软公司推出Visual Studio 2012 (11.0) RC，提供支持更简易的异步编程(Asynchronous Programming)、Iterator、扩充 Global 关键词等新语言特性。</li>
                        </ol>
                    </div>
                </div>
              
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                     <div class="ibox-title">
                        <h5>语言特色</h5> <span class="label label-primary">K+</span>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="index.html#">选项1</a>
                                </li>
                                <li><a href="index.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="panel-body">
                            <div class="panel-group" id="version">
                            
                            <div id="v2.6" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <ol>
                                    	<li>制作应用程序安装盘等提供了友好的集成开发环境。</li>
                                    	<li>结构化的程序设计语言</li>
                                    	<li>事件驱动的编程机制</li>
                                        <li>强大的数据库功能</li>
                                        <li>ActiveX技术</li>
                                    	<li>网络功能</li>
                                    	<li>可视化的设计平台</li>
                                        <li>.........</li>
                                    </ol>
                                </div>
                            </div>
                            
                            	<!-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.6">v2.6</a><code class="pull-right">2017.2.18更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.6" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>制作应用程序安装盘等提供了友好的集成开发环境。</li>
                                            	<li>结构化的程序设计语言</li>
                                            	<li>事件驱动的编程机制</li>
                                                <li>强大的数据库功能</li>
                                                <li>ActiveX技术</li>
                                            	<li>网络功能</li>
                                            	<li>可视化的设计平台</li>
                                                <li>.........</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div> -->
                            
                            	<!-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.5">v2.5</a><code class="pull-right">2016.10.8更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.5" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>升级代码生成器，生成的代码增加表单校验功能。</li>
                                            	<li>修复代码生成器v2.3版本的bug，修复乱码功能。</li>
                                            	<li>优化代码生成器体验，增加错误校验等。</li>
                                                <li>去除dialog的竖向滚动条</li>
                                                <li>修复升级layer2.3的bug。</li>
                                            	<li>升级layim1.0到layim2.0。</li>
                                            	<li>支持自定义签名。</li>
                                                <li>支持表情，文件，群聊，群聊聊天记录。</li>
                                                <li>支持自定义聊天群组，添加移除群组人员。</li>
                                                <li>支持离线消息。</li>
                                                <li>....</li>
                                                <li>layim1.0是免费插件，layim2.0是商业授权，你仍可选择免费使用layim1.0，如果需要使用layim2.0，你需要购买一个授权，价格不贵，希望大家尊重知识版权，给开源作者一点点鼓励，才能持续给大家提供优秀的开源软件,<a href="http://layim.layui.com/?from=layer" target="_blank">layIM官网</a>。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div> -->
                            
                            	<!-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.4">v2.4</a><code class="pull-right">2016.06.27更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.4" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>升级layer到2.4版本。</li>
                                                <li>解决layer弹出窗无法自适应手机的问题，jeeplus以完美支持移动端。</li>
                                                <li>修复layer弹窗弹出时窗口闪动的bug。</li>
                                                <li>修复分页bug。</li>
                                                <li>....</li>
                                                <li>封装echarts标签，提供快捷开发报表的功能。</li>
                                                <li>感谢大家的持续关注，如果你有更好的建议，请直接联系我。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div> -->
                            	<!-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.3">v2.3</a><code class="pull-right">2016.05.17更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.3" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>修复初次登录，菜单加载慢的问题,加载速度从10秒优化到2秒。</li>
                                                <li>修复list导入Excel文档为空的bug。</li>
                                                <li>修复360浏览器（7.1版本）提交表单失败的bug。</li>
                                                <li>修复短信发送bug。</li>
                                                <li>修复发送站内信时，无法添加图片的bug。</li>
                                                <li>增加我的日程功能。</li>
                                                <li>修复代码生成器生成的树结构，删除子节点时，会误删除父节点的bug。</li>
                                                <li>删除百度统计的代码</li>
                                                <li>修复oracle数据库脚本</li>
                                                <li>优化登录页的显示风格</li>
                                                <li>增加我的日程功能</li>
                                                <li>增加代码生成器支持生成富文本编辑框的功能</li>
                                                <li>增加代码生成器支持自定义grid选择框的功能。</li>
                                                <li>....</li>
                                                <li>下一个版本，主要关注功能是报表和activity工作流，至于数据权限，我暂时还没想到好的解决方案。</li>
                                                <li>感谢大家的持续关注，如果你有更好的建议，请直接联系我。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div> -->
                            	<!-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.2">v2.2Beta版</a><code class="pull-right">2016.03.13更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.2" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>这是目前为止最重要的一次升级。</li>
                                                <li>新增功能：cpu，内存，jvm性能检测预警工具，短信群发功能，邮件群发功能，ace主题切换功能，表单构建器功能等功能。</li>
                                                <li>修正了大量2.1beta版本的bug，以及页面性能优化，具体参照网站的更新报告</li>
                                                <li>升级代码生成器功能，移除（可插入，可编辑）2个配置项，新增(表单）配置项，使代码生成器更加简单易懂，提高了代码生成器的实用性。</li>
                                                <li>....</li>
                                                <li>富文本编辑器，自定义java对象功能，表格的行权限和列权限，上下菜单风格，echarts图表生成器等功能预计在2.3版本推出。</li>
                                                <li>感谢大家的持续关注，如果你有更好的建议，请直接联系我。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div> -->
                                
                            	<!-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.0">v2.1Beta版</a><code class="pull-right">2016.02.25更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.0" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>这个版本是一个bug修复版本</li>
                                                <li>修正zTree显示bug</li>
                                                <li>移除google的cdn依赖，解决加载慢的问题</li>
                                                <li>修正代码生成器拖拽bug</li>
                                                <li>修正站内信bug</li>
                                                <li>....</li>
                                                <li>仪表盘，定时任务，自定义表单，邮箱短信等等新功能，因为多个环境对应以及代码校验完善的原因将在2.2推出，所有正式用户均可免费升级。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div> -->
                                <!-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.0">v2.0</a><code class="pull-right">2016.01.15更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.0" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                                <li>修复IE不兼容，首页出现滚动条</li>
                                                <li>修复validate插件bug</li>
                                                <li>提供基于WebSocket的即时聊天系统</li>
                                                <li>增加注册忘记密码功能</li>
                                                <li>优化了主题的显示效果</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div> -->
                                <!-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v1.0">v1.9</a><code class="pull-right"></code>
                                            </h5>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v1.0">v1.8</a><code class="pull-right"></code>
                                            </h5>
                                    </div>
                                </div>
                           		<div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="">********</a><code class="pull-right"></code>
                                            </h5>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v1.1">v1.1</a><code class="pull-right"></code>
                                            </h5>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v1.0">v1.0</a><code class="pull-right"></code>
                                            </h5>
                                    </div>
                                </div> -->
                               
                </div>
            </div>
            </div>
            </div>
            </div>
            <div class="col-sm-4">
<!--                 <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商业授权 </h5>
                    </div>
                    <div class="ibox-content">
                        <p>JeePlus是一款收费开源的快速开发平台，购买后您将获得以下内容</p>
                        <ol>
                            <li>源码(带注释)；</li>
                            <li>代码生成器；</li>
                            <li>开发者文档；</li>
                            <li>永久的免费升级服务；</li>
                            <li>授权许可；</li>
                            <li>付费二次开发服务；</li>
                            <li>……</li>
                        </ol>
                        <hr>
                    </div>
                </div> -->
                  <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>任课老师信息</h5>

                    </div>
                    <div class="ibox-content">
                        <p><i class="fa fa-send-o"></i> 网址：<a href="http://cie.nwsuaf.edu.cn/szdw/fjs/2008114252/index.htm" target="_blank">陈勇 副教授简介</a>
                        </p>
                        <p><i class="fa fa-qq"></i> QQ：111111 <!-- <a href="http://wpa.qq.com/msgrd?v=3&uin=117575171&site=qq&menu=yes" target="_blank"> 117575171</a>-->
                        </p>
                        <p><i class="fa fa-weixin"></i> 微信：111111<!-- <a href="javascript:;">117575171</a> -->
                        </p>
                        <!-- <p><i class="fa fa-credit-card"></i> 支付宝：<a href="javascript:;" class="支付宝信息">117575171@qq.com</a>
                        </p> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div>
</body>
</html>