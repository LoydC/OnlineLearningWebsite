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
				var myPlayer = videojs('my-Video',{ fluid: true}, function () {
					console.log('Good to go!');
           			//this.play(); 
				});
				myPlayer.on("play", function(){
				    var myDate = new Date();
				    //alert(myDate.toLocaleString() + "用户开始播放" + this.currentTime());
				    console.log(myDate.toLocaleString() + "用户开始播放" + this.currentTime() + " 有效播放时间为：" + effective_playtime/3);
				});
				myPlayer.on("ended", function(){
				    //console.log("end", this.currentTime());
				    //var myDate = new Date();
				    //alert(myDate.toLocaleString() + "用户已观看到结尾" + this.currentTime());
				});
				myPlayer.on("pause", function(){
				    //console.log(parent.getActiveTabName().attr("data-id"));
				    //console.log(parent.getActiveTabName()[0].innerText);
				    //console.log(data_id);
				    //console.log("pause");
				    var myDate = new Date();
				    //alert( myDate.toLocaleString() + "用户已暂停" + this.currentTime());
				    console.log(myDate.toLocaleString() + "用户已暂停" + this.currentTime() + " 有效播放时间为：" + effective_playtime/3);
				}); 
				myPlayer.on("timeupdate", function(){
				    console.log( "timeupdate  " + this.currentTime());
				}); 
				myPlayer.on("seeking", function(){
				    console.log("用户移动进度条");
				}); 
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