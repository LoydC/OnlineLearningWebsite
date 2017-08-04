<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>

	<!-- Basic Page Needs
	================================================== -->
	<meta charset="utf-8">
	<title>Home</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- Mobile Specific Metas
	================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	
	
	<!-- CSS
	================================================== -->
	<!-- Normalize default styles -->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/normalize.css" media="screen" />
	<!-- Skeleton grid system -->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/skeleton.css" media="screen" />
	<!-- Base Template Styles-->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/base.css" media="screen" />
	<!-- Template Styles-->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/style.css" media="screen" />
	<!-- Superfish -->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/superfish.css" media="screen" />
	<!-- Prettyphoto -->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/prettyPhoto.css" media="screen" />
	<!-- FontAwesome -->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/font-awesome.min.css" media="screen" />
	<!-- REVOLUTION BANNER CSS SETTINGS -->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/settings.css" media="screen" />
	<!-- Flexslider -->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/flexslider.css" media="screen" />
	<!-- Layout and Media queries-->
	<link rel="stylesheet" href="${ctxStatic }/yzts_6_emotion/css/media-queries.css" media="screen" />
	
	<!--[if lt IE 9]>
		<link rel="stylesheet" href="css/ie/ie8.css" media="screen" />
	<![endif]-->
	
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<!-- Favicons
	================================================== -->
	<link rel="shortcut icon" href="${ctxStatic }/yzts_6_emotion/images/favicon.ico">
	<link rel="apple-touch-icon" href="${ctxStatic }/yzts_6_emotion/images/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="${ctxStatic }/yzts_6_emotion/images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="${ctxStatic }/yzts_6_emotion/images/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="144x144" href="${ctxStatic }/yzts_6_emotion/images/apple-touch-icon-144x144.png">
	
	
</head>
<body>
	
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">
			
		<div class="wrapp-holder">
			<div class="wrap-frame">
				<!-- BEGIN HEADER -->
				<header id="header" class="header">
				
					<!-- Top Header -->
					<div class="header-top">
						<div class="container clearfix">
							<div class="grid_12">
								<!-- Top Menu -->
								<ul class="header-top-menu unstyled">
									<li><a href="#">Pricing</a></li>
									<li><a href="#">Sitemap</a></li>
									<li><a href="#">FAQs</a></li>
                                    <li><a href="http://www.cssmoban.com">More themes</a></li>
								</ul>
								<!-- /Top Menu -->
								
								<!-- Social Links -->
								<ul class="social-links unstyled">
									<li class="ico-twitter"><a href="#">Twitter</a></li>
									<li class="ico-facebook"><a href="#">Facebook</a></li>
									<li class="ico-googleplus"><a href="#">Google+</a></li>
									<li class="ico-dribbble"><a href="#">Dribbble</a></li>
									<li class="ico-vimeo"><a href="#">Vimeo</a></li>
									<li class="ico-rss"><a href="#">RSS</a></li>
								</ul>
								<!-- /Social Links -->
							</div>
						</div>
					</div>
					<!-- /Top Header -->
					
					<!-- Main Header -->
					<div class="header-main">
						<div class="container clearfix">
							<div class="grid_12 hr-bottom">
								
								<!-- BEGIN LOGO -->
								<div id="logo">
									<!-- Image based Logo -->
									<img src="${ctxStatic }/yzts_6_emotion/images/logo.png" alt="Emotion" width="145" height="67" />
									
									<!-- Text based Logo
									<h1><a href="index.html">Emotion</a></h1>
									<p class="tagline">Responsive HTML Template</p>
									-->
									
								</div>
								<!-- END LOGO -->
								
								
								<!-- BEGIN NAVIGATION -->
								<nav class="primary">
									<ul class="sf-menu">
										<li class="current-menu-item">
											<a href="index.html">Home <span><i>|</i> Get Started</span></a>
											<ul>
												<li class="current-menu-item"><a href="index.html">Revolution Slider</a></li>
												<li><a href="index-flex-fade.html">Flexslider Fade</a></li>
												<li><a href="index-flex-slide.html">Flexslider Slide</a></li>
											</ul>
										</li>
										<li>
											<a href="elements.html">Features <span><i>|</i> Why Choose Us</span></a>
											<!-- Sub Navigation -->
											<ul>
												<li><a href="about.html">About Us</a></li>
												<li><a href="columns.html">Columns</a></li>
												<li><a href="services.html">Services</a></li>
												<li><a href="pricing-tables.html">Pricing Tables</a></li>
												<li><a href="elements.html">Page Elements</a></li>
												<li><a href="#">Second Level Item</a>
													<ul>
														<li><a href="#">Third Level Item</a></li>
														<li><a href="#">And another one</a></li>
													</ul>
												</li>
											</ul>
											<!-- /Sub Navigation -->
										</li>
										<li>
											<a href="portfolio-3cols.html">Portfolio <span><i>|</i> Our Works</span></a>
											<!-- Sub Navigation -->
											<ul>
												<li><a href="portfolio-2cols.html">Portfolio 2 cols</a></li>
												<li><a href="portfolio-3cols.html">Portfolio 3 cols</a></li>
												<li><a href="portfolio-4cols.html">Portfolio 4 cols</a></li>
												<li><a href="portfolio-details.html">Single Project</a></li>
											</ul>
											<!-- /Sub Navigation -->
										</li>
										<li>
											<a href="blog.html">Blog <span><i>|</i> Our Updates</span></a>
											<!-- Sub Navigation -->
											<ul>
												<li><a href="post.html">Single Post</a></li>
											</ul>
											<!-- /Sub Navigation -->
										</li>
										<li>
											<a href="contacts.html">Contacts <span><i>|</i> Get in Touch</span></a>
										</li>
									</ul>
								</nav>
								<!-- END NAVIGATION -->
								
							</div>
						</div>
					</div>
					<!-- /Main Header -->
					
				</header>
				<!-- END HEADER -->
				
				
				<!-- BEGIN SLIDER -->
				<div id="slider" class="slider loading">
					<div class="container clearfix">
						<div class="grid_12">
							
							<div class="bannercontainer">
								<div class="banner">
									<ul>
										<!-- THE FIRST SLIDE -->
										<li data-transition="fade" data-slotamount="10" data-masterspeed="300" data-slideindex="back">
											<!-- THE MAIN IMAGE IN THE SLIDE -->
											<img src="${ctxStatic }/yzts_6_emotion/images/page1.jpg">
		
											<!-- THE CAPTIONS OF THE FIRST SLIDE -->
											<div class="tp-caption sfl original"
												data-x="100"
												data-y="146"
												data-speed="300"
												data-start="600"
												data-captionhidden="on"
												data-endeasing="easeOutExpo"
												data-easing="easeOutExpo">
												跟着孙老师学VB
											</div>
											
											<div class="tp-caption sfr original_high"
												data-x="142"
												data-y="178"
												data-speed="300"
												data-start="800"
												data-captionhidden="on"
												data-endeasing="easeOutExpo"
												data-easing="easeOutExpo">
												助你起飞
											</div>
											
										</li>
										
										
										<!-- THE SECOND SLIDE -->
										<li data-transition="fade" data-slotamount="10" data-masterspeed="300" data-slideindex="back">
										
											<!-- THE MAIN IMAGE IN THE SLIDE -->
											<img src="${ctxStatic }/yzts_6_emotion/images/slide-light.jpg">
		
											<!-- THE CAPTIONS OF THE SECOND SLIDE -->
											<div class="tp-caption sfl original"
												data-x="100"
												data-y="146"
												data-speed="300"
												data-start="600"
												data-captionhidden="on"
												data-endeasing="easeOutExpo"
												data-easing="easeOutExpo">
												教师团队
											</div>
											
											<div class="tp-caption sfr original_high"
												data-x="142"
												data-y="178"
												data-speed="300"
												data-start="800"
												data-captionhidden="on"
												data-endeasing="easeOutExpo"
												data-easing="easeOutExpo">
												各领域专家
											</div>

										<div class="caption randomrotate"
											 data-x="680"
											 data-y="35"
											 data-speed="600"
											 data-start="1200"
											 data-easing="easeOutExpo"  ><img src="${ctxStatic }/yzts_6_emotion/images/samples/img140x140.jpg" alt="Image 3"></div>

										<div class="caption randomrotate"
											 data-x="530"
											 data-y="35"
											 data-speed="600"
											 data-start="1300"
											 data-easing="easeOutExpo"  ><img src="${ctxStatic }/yzts_6_emotion/images/samples/img140x140.jpg" alt="Image 4"></div>

										<div class="caption randomrotate"
											 data-x="680"
											 data-y="185"
											 data-speed="300"
											 data-start="1400"
											 data-easing="easeOutExpo"  ><img src="${ctxStatic }/yzts_6_emotion/images/samples/img140x140.jpg" alt="Image 5"></div>

										<div class="caption randomrotate"
											 data-x="530"
											 data-y="185"
											 data-speed="600"
											 data-start="1500"
											 data-easing="easeOutExpo"  ><img src="${ctxStatic }/yzts_6_emotion/images/samples/img140x140.jpg" alt="Image 6"></div>
										
											
										</li>
										
										<!-- THE THIRD SLIDE -->
										<li data-transition="fade" data-slotamount="10" data-masterspeed="300" data-slideindex="back">
											<!-- THE MAIN IMAGE IN THE SLIDE -->
											<img src="${ctxStatic }/yzts_6_emotion/images/samples/slide2.jpg">
		
											<!-- THE CAPTIONS OF THE THIRD SLIDE -->
											<div class="tp-caption sft original"
												data-x="100"
												data-y="146"
												data-speed="300"
												data-start="600"
												data-captionhidden="on"
												data-endeasing="easeOutExpo"
												data-easing="easeOutExpo">
												The Best Solution
											</div>
											
											<div class="tp-caption sfb original_high"
												data-x="142"
												data-y="178"
												data-speed="300"
												data-start="800"
												data-captionhidden="on"
												data-endeasing="easeOutExpo"
												data-easing="easeOutExpo">
												You can Find!
											</div>
											
										</li>
										
										
										<!-- THE FOURTH SLIDE -->
										<li data-transition="fade" data-slotamount="10" data-masterspeed="300" data-slideindex="back">
										
												<!-- THE MAIN IMAGE IN THE SLIDE -->
												<img src="${ctxStatic }/yzts_6_emotion/images/slide-black.jpg">

												<div class="caption fade fullscreenvideo" data-autoplay="false" data-x="0" data-y="0" data-speed="500" data-start="10" data-easing="easeOutBack">111</div>

										</li>
										
										<!-- THE FIFTH SLIDE -->
										<li data-transition="fade" data-slotamount="10" data-masterspeed="300" data-slideindex="back">
											<!-- THE MAIN IMAGE IN THE SLIDE -->
											<img src="${ctxStatic }/yzts_6_emotion/images/samples/slide1.jpg">
		
											<!-- THE CAPTIONS OF THE FIFTH SLIDE -->
											<div class="tp-caption sft original"
												data-x="100"
												data-y="146"
												data-speed="300"
												data-start="600"
												data-captionhidden="on"
												data-endeasing="easeOutExpo"
												data-easing="easeOutExpo">
												We always think
											</div>
											
											<div class="tp-caption sfb original_high"
												data-x="142"
												data-y="178"
												data-speed="300"
												data-start="800"
												data-captionhidden="on"
												data-endeasing="easeOutExpo"
												data-easing="easeOutExpo">
												About Customers
											</div>
											
										</li>
										
									</ul>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<!-- END SLIDER -->
				<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >免费模板</a></div>
				
				<!-- BEGIN CONTENT WRAPPER -->
				<div id="content-wrapper" class="content-wrapper">
					
					<div class="container">
						
						<div class="clearfix">
							<div class="grid_12">
								<!-- BEGIN TABBED CONTENT -->
								<div class="tabs tabs__alt">
									<div class="tab-menu clearfix">
										<ul>
											<li><a href="#tab1">Latest</a></li>
											<li><a href="#tab2">Popular</a></li>
											<li><a href="#tab3">Featured</a></li>
										</ul>
									</div>
									<div class="tab-wrapper">
										<div id="tab1" class="tab">
											<!-- Latest Posts Loop -->
											<ul class="post-loop unstyled clearfix">
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/vb.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">News</a> / <a href="#">Design</a></span>
														<h4><a href="${ctx}/sysindex?course=vb">VB 一种通用的基于对象的程序设计语言</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">Illustration</a></span>
														<h4><a href="${ctx}/sysindex?course=java">Java 不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">Graphic</a> / <a href="#">Design</a></span>
														<h4><a href="#">Nulla vitae dui vel dolor laoreet</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">News</a> / <a href="#">Logo</a></span>
														<h4><a href="#">Suspendisse odio est, lacinia nec adipiscing</a></h4>
													</div>
												</li>
											</ul>
											<!-- /Latest Posts Loop -->
										</div>
										<div id="tab2" class="tab">
											<!-- Popular Posts Loop -->
											<ul class="post-loop unstyled clearfix">
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">Illustration</a></span>
														<h4><a href="#">Pellentesque tristique lacinia adipiscing</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">News</a> / <a href="#">Design</a></span>
														<h4><a href="#">Vivamus  ullamcorper,  nunc sed  imperdiet pretium</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">News</a> / <a href="#">Logo</a></span>
														<h4><a href="#">Suspendisse odio est, lacinia nec adipiscing</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">Graphic</a> / <a href="#">Design</a></span>
														<h4><a href="#">Nulla vitae dui vel dolor laoreet</a></h4>
													</div>
												</li>
												
											</ul>
											<!-- /Popular Posts Loop -->
										</div>
										<div id="tab3" class="tab">
											<!-- Featured Posts Loop -->
											<ul class="post-loop unstyled clearfix">
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">News</a> / <a href="#">Logo</a></span>
														<h4><a href="#">Suspendisse odio est, lacinia nec adipiscing</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">News</a> / <a href="#">Design</a></span>
														<h4><a href="#">Vivamus  ullamcorper,  nunc sed  imperdiet pretium</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">Graphic</a> / <a href="#">Design</a></span>
														<h4><a href="#">Nulla vitae dui vel dolor laoreet</a></h4>
													</div>
												</li>
												<li>
													<img src="${ctxStatic }/yzts_6_emotion/images/samples/img220x210.jpg" alt="" class="post-img" width="220" height="210">
													<div class="post-caption">
														<span class="post-cats"><a href="#">Illustration</a></span>
														<h4><a href="#">Pellentesque tristique lacinia adipiscing</a></h4>
													</div>
												</li>
											</ul>
											<!-- /Featured Posts Loop -->
										</div>
									</div>
								</div>
								<!-- END TABBED CONTENT -->
							</div>
						</div>
						
						<div class="hr hr-dashed"></div>

					</div>
					
				</div>
				<!-- END CONTENT WRAPPER -->
			</div>
		</div>
		
		<!-- BEGIN FOOTER -->
		<footer id="footer" class="footer">
			
			<div class="footer-holder">
				<div class="footer-frame">
					<!-- Footer Widgets -->
					<div class="footer-widgets">
						<div class="container clearfix">
							
							<div class="grid_5">
								<!-- Text Widget -->
								<div class="text-widget widget widget__footer">
									<h3 class="widget-title">About This Theme</h3>
									<div class="widget-content">
										<h5>Donec tincidunt, mi non ultrices varius, diam felis</h5>
										<p>Elementum eros, at congue nisl massa ut metus. Vivamus accumsan malesuada orci, vel euismod velit aliquet id.</p>
										
										<p>Sed aliquet tempus pellentesque. Curabitur varius suscipit orci, quis cursus quam varius vel.Vivamus nec tortor tellus.</p>
									</div>
								</div>
								<!-- /Text Widget -->
							</div>
							<div class="grid_3">
								<!-- Twitter Widget -->
								<div class="twitter-widget widget widget__footer">
									<h3 class="widget-title">Twitter</h3>
									<div class="widget-content">
										111
									</div>
								</div>
								<!-- /Twitter Widget -->
							</div>
							<div class="grid_4">
								<!-- Flickr Widget -->
								<div class="flickr-widget widget widget__footer">
									<h3 class="widget-title">Flickr Feed</h3>
									<div class="widget-content">
										<!-- Flickr images will appear here -->
										11
									</div>
								</div>
								<!-- /Flickr Widget -->
							</div>
							
						</div>
					</div>
					<!-- /Footer Widgets -->
					
					<!-- Copyright -->
					<div class="copyright">
						<div class="container clearfix">
							<div class="grid_12">
								<div class="clearfix">
									<div class="copyright-primary">
										&copy;  2013 Emotion <span class="separator">|</span> Responsive HTML Template
									</div>
									<div class="copyright-secondary">
										More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /Copyright -->
				</div>
			</div>
			
		</footer>
		<!-- END FOOTER -->
		
	</div>
	<!-- END WRAPPER -->
	
	
	<!-- Javascript Files
	================================================== -->
	
	<!-- initialize jQuery Library -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="${ctxStatic }/yzts_6_emotion/js/jquery-1.9.1.min.js"><\/script>')</script>
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery-migrate-1.1.1.min.js"></script>
	<!-- Modernizr -->
	<script src="${ctxStatic }/yzts_6_emotion/js/modernizr.custom.17475.js"></script>
	<!-- easing plugin -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.easing.min.js"></script>
	<!-- Prettyphoto -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.prettyPhoto.js"></script>
	<!-- Superfish -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.mobilemenu.js"></script>
	<!-- superfish -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.superfish-1.5.0.js"></script>
	<!-- Twitter -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.twitter.js"></script>
	<!-- Flickr -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jflickrfeed.js"></script>
	<!-- ElastiSlide Carousel -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.elastislide.js"></script>
	<!-- jQuery REVOLUTION Slider  -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.themepunch.plugins.min.js"></script>
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.themepunch.revolution.min.js"></script>
	<!-- Isotope -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.isotope.min.js"></script>
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.imagesloaded.min.js"></script>
	<!-- Flexslider -->
	<script src="${ctxStatic }/yzts_6_emotion/js/jquery.flexslider.js"></script>

	<!-- Custom -->
	<script src="${ctxStatic }/yzts_6_emotion/js/custom.js"></script>
	
</body>
</html>