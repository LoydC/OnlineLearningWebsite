<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/webpage/include/taglib.jsp"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>文件管理</title>

	<link href="${ctxStatic }/inspinia/css/bootstrap.min.css"rel="stylesheet">
	<link href="${ctxStatic }/inspinia/font-awesome/css/font-awesome.css"rel="stylesheet">
	<link href="${ctxStatic }/inspinia/css/plugins/jsTree/style.min.css"rel="stylesheet">
	<link href="${ctxStatic }/inspinia/css/animate.css" rel="stylesheet">
	<link href="${ctxStatic }/inspinia/css/style.css" rel="stylesheet">

	<!-- video.js -->
	<link href="${ctxStatic }/videojs/css/video-js.css" rel="stylesheet">
	<!-- If you'd like to support IE8 -->
	<script src="${ctxStatic }/videojs/js/videojs-ie8.min.js"></script>

</head>

<body class="gray-bg">

		<div class="row">
			<div class="col-lg-8">
				<div class="ibox ">
					<div class="ibox-title">
						<h5>文件树</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div id="using_json"></div>
					</div>
				</div>
			</div>
		</div>

	<!-- Mainly scripts -->
	<script src="${ctxStatic }/inspinia/js/jquery-2.1.1.js"></script>
	<script src="${ctxStatic }/inspinia/js/bootstrap.min.js"></script>
	<script src="${ctxStatic }/common/contabs.js"></script>
	<script
		src="${ctxStatic }/inspinia/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${ctxStatic }/inspinia/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="${ctxStatic }/inspinia/js/inspinia.js"></script>
	<script src="${ctxStatic }/inspinia/js/plugins/pace/pace.min.js"></script>

	<script src="${ctxStatic }/inspinia/js/plugins/jsTree/jstree.min.js"></script>

	<style>
.jstree-open>.jstree-anchor>.fa-folder:before {
	content: "\f07c";
}

.jstree-default .jstree-icon.none {
	width: 0;
}
</style>

	<script>
	function downloadFile(url) {   
        try{ 
            var elemIF = document.createElement("iframe");   
            elemIF.src = url;   
            elemIF.style.display = "none";   
            document.body.appendChild(elemIF);   
        }catch(e){ 
 
        } 
    }
		$(document).ready(function() {
			//start
			var temp = ${nodeJson};
			$('#using_json').jstree({'core' :{
			'check_callback' : true,
			'data':temp,
			
			},
			"types" : {  
        		"default" : {  
          		"valid_children" : ["default","file"]  
        		},  
        		"file" : {  
          		"icon" : "glyphicon glyphicon-file",  
          		"valid_children" : []  
        		}  
      		},  
      		"plugins" : [  
        	"contextmenu", "dnd", "search",  
        	"state", "types", "wholerow"  
      		],  
      		"contextmenu":{  
        		"items":{  
            		"create":null,  
            		"rename":null,  
            		"remove":null,  
            		"ccp":null,  
            		"新建菜单":{  
                		"label":"下载",  
                		"action":function(data){  
                    		
                    		
                    		var inst = jQuery.jstree.reference(data.reference);
                    		obj = inst.get_node(data.reference);  
                    		//alert (inst.get_path(obj,"/",0));
                    		var url = inst.get_path(obj,"/",0); 
                    		
                    		var fileExtension = url.substring(url.lastIndexOf('.') + 1);
		        
					        if(fileExtension == 'mp4'){
					        	alert("视频无法下载，请点击在线观看。");
					        }else{
					        	downloadFile("/jeeplus/file/" + encodeURI(url));
					        }

                		} 
            		}/* ,  
            		"删除菜单":{  
                		"label":"删除菜单",  
                		"action":function(data){  
                    		var inst = jQuery.jstree.reference(data.reference),  
                    		obj = inst.get_node(data.reference);  
                    		if(confirm("确定要删除此菜单？删除后不可恢复。")){  
                        		jQuery.get("/accountmanage/deleteMenu?id="+obj.id,function(dat){  
                            		if(dat == 1){  
                                		alert("删除菜单成功！");  
                                		jQuery("#"+treeid).jstree("refresh");  
                            		}else{  
                                		alert("删除菜单失败！");  
                            		}  
                        		});  
                    		}  
                		}  
            		},  
            		"编辑菜单":{  
                		"label":"编辑菜单",  
                		"action":function(data){  
                    		var inst = jQuery.jstree.reference(data.reference),  
                    		obj = inst.get_node(data.reference);  
                    		dialog.show({"title":"编辑“"+obj.text+"”菜单",url:"/accountmanage/editMenu?id="+obj.id,height:280,width:400});  
                		}  
            		}   */
        		}  
      		}  
			}) 
			$('#using_json').on("changed.jstree", function (e, data) {
        		var videoPath = data.instance.get_path(data.selected[0],"/",0);
		        var fileExtension = videoPath.substring(videoPath.lastIndexOf('.') + 1);
		        consoel.log(data);
				if(fileExtension == 'mp4'){
		        	var url = '${ctx}/video?videoPath=' + videoPath;
			        url = encodeURI(encodeURI(url));		        
			        //parent.parentMenuItem(url,"视频播放");
			        parent.openTab(url,"视频播放",false);
		        } 

      		})  
			//
	
		});
	</script>
</body>
</html>