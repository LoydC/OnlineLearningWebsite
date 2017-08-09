<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>视频播放</title>

	<link href="${ctxStatic }/inspinia/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctxStatic }/inspinia/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="${ctxStatic }/inspinia/css/plugins/jsTree/style.min.css" rel="stylesheet">
	<link href="${ctxStatic }/inspinia/css/animate.css" rel="stylesheet">
	<link href="${ctxStatic }/inspinia/css/style.css" rel="stylesheet">

	<!-- video.js -->
	<link href="${ctxStatic }/videojs/css/video-js.css" rel="stylesheet">
	<!-- If you'd like to support IE8 -->
	<script src="${ctxStatic }/videojs/js/videojs-ie8.min.js"></script>
</head>

<body class="gray-bg">
	
	<div class="m">
			<video id="my-Video" class="video-js" controls autoplay="true" preload="auto" width="640" height="264"
			  poster="MY_VIDEO_POSTER.jpg" data-setup='{"example_option":true}'>
				<source src="${videoPath}" type="video/mp4">
				<source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm">
				<source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg">
				<p class="vjs-no-js">
				  To view this video please enable JavaScript, and consider upgrading to a web browser that
				  <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
				</p>
			  </video>
			  
			<script src="http://vjs.zencdn.net/5.18.4/video.min.js"></script>	
		  	<script type="text/javascript">
		
			cpalyinging="";//播放
			cending="";//结束
			ctimeupdate="";//进度条更新
			cpauseing="";//暂停
			JSONData = "";//前台JSON数据
			var myPlayer = videojs('my-Video', {
				fluid : true
			}, function() {
				console.log('Good to go!');
				this.play();
			});
			videojs("my-Video").ready(function() {
				var myPlayer = this;
				myPlayer.play();
				console.log("totaltimeffff"+myPlayer.duration());
			});
			myPlayer.on("play", function() {
				var myDate = new Date();
				cpalyinging += myDate.toLocaleString() +  "!"
						+ this.currentTime()+";";
				localStorage.setItem("cpalyinging", cpalyinging);
				
				//document.cookie = "cpalyinging = " + cpalyinging;
				/* alert(myDate.toLocaleString() + "用户开始播放" + this.currentTime()); */
			});
			myPlayer.on("ended",
					function() {
						console.log("end", this.currentTime());
						var myDate = new Date();
						cending = myDate.toLocaleString() +"!"
						+ this.currentTime()+";";
						localStorage.setItem("cending", cending);
				//document.cookie += "cending = " + cending ;
						 /* alert(myDate.toLocaleString() + "用户已观看到结尾"
								+ this.currentTime());  */
					});
			myPlayer.on("pause", function() {
			var temp = parent.getActiveTabName();
				console.log(parent.getActiveTabName().attr("data-id"));
				console.log(parent.getActiveTabName()[0].innerText);
				console.log(data_id);
				console.log("pause");
				var myDate = new Date();
				cpauseing += myDate.toLocaleString() +  "!"
						+ this.currentTime()+";";
				localStorage.setItem("cpauseing", cpauseing);
				//document.cookie += "cpauseing = " + cpauseing;
				/* alert( myDate.toLocaleString() + "用户已暂停" + this.currentTime()); */
			});
			myPlayer.on("timeupdate",function(){
			
				ctimeupdate += this.currentTime()+",";
				localStorage.setItem("ctimeupdate", ctimeupdate);
				//document.cookie += "ctimeupdate = " + ctimeupdate;
									
			})
			myPlayer.on("fullscreenchange", function() {
				console.log("fullscreenchange");
			});
		
			//start
			
			var courseId = "VB";
			var totalTime = "";			
			var videoId = "";
			var playList = createVJSON(localStorage.getItem("cpalyinging"));			
			var pauseList = createVJSON(localStorage.getItem("cpauseing"));
			var timeupdate = localStorage.getItem("ctimeupdate");
			console.log("totaltime"+myPlayer.duration());
			
			var JSONResult = createJSON();
			console.log("JSONHHH"+JSONResult);//注释
			$.ajax({
					type : 'POST',
					url: '${ctx}/video/data',
					headers:{
					},
					data:JSONResult,

					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(){
						
						alert("保存成功");
					}
				})
			
			/* passData为待构造成json的字符串，该函数用于构造pauseList和playListjson数组 */
			function createVJSON(passData){
				var tempListJSON = [];
				var tempList = passData.split(";")
            	for (var i = 0; i < tempList.length-1; i++) {
	                var j = {};
	                j.currentTime = tempList[i].split("!")[1];
	                j.systemTime = tempList[i].split("!")[0];
	                
	                tempListJSON.push(j);
            	}
            	var ListData = JSON.stringify(tempListJSON);
            	//alert("ListData"+ListData);
            	return ListData;
			}
			/* 改函数用于构造传递给前台的参数 */
			function createJSON(){
				
				var timeupdate = [];
				var tempObj = {};
				tempObj.courseId = courseId;
				tempObj.totalTime = "";
			/* 	tempObj.userId = ""; */
				tempObj.videoId = "";
				tempObj.playList = createVJSON(localStorage.getItem("cpalyinging"));			
				tempObj.pauseList = createVJSON(localStorage.getItem("cpauseing"));
				timeupdate.push(localStorage.getItem("ctimeupdate"));
				tempObj.timeupdate = timeupdate;
				
				JSONData = JSON.stringify(tempObj) ;
				alert("JSONData"+JSONData);
				return JSONData;
			}
			//end
						
		</script>
		</div>

<script>

	var data_id;

	var effective_playtime = 0;

	window.onload = function (){
	
		data_id = parent.getActiveTabName().attr("data-id");
		
		setInterval(pauseVideo,100);
		
		//如果当前的标签的url和现在播放视频的url不相同，则暂停视频的播放
		function pauseVideo(){
			if(data_id != parent.getActiveTabName().attr("data-id")){
				var myplayer = videojs("my-Video");
				myplayer.pause();
			}
		}
	
	}

</script>


</body>
</html>