<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>个人信息</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/css/cjy/favicon.ico">
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/flexslider.css">
	<!-- Flaticons  -->
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/style.css">

	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/respond.min.js"></script>
	<![endif]-->
        <style>
        .colorlib-about p{
            text-indent: 2em;
        }

        .colorlib-skills p{
            text-indent: 2em;
        }
        .row{
            background: rgba(0,0,0,0.3)
        }
        </style>
	</head>
	<body style="background:url(${pageContext.request.contextPath}/static/images/cj/index_bg1.jpg) center;">
	<div id="colorlib-page">
		<div class="container-wrap">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<div class="text-center">
				<div class="author-img" style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/about.jpg);"></div>

				<h1>
                    <c:if test="${THIS_USER.usid==sessionScope.CURR_USER.usid}">
                        <a class="position" href="javascript:void(0)" data-toggle="modal"
                           data-target="#editModal">修改个人信息</a>
                    </c:if>
                </h1>
				
				<h1 id="colorlib-logo"><a href="index.do" id="usname1after">${THIS_USER.usname}</a></h1>
				<span class="position">一个常年漂浮各个星系的骚年</span>
				
			</div>
			<nav id="colorlib-main-menu" role="navigation" class="navbar">
				<div id="navbar" class="collapse">
					<ul>
						<li class="active"><a href="#" data-nav-section="home">主页</a></li>
						<li><a href="#" data-nav-section="about">关于我</a></li>
						<li><a href="#" data-nav-section="skills">擅长领域</a></li>
						<li><a href="#" data-nav-section="experience">他的足迹</a></li>
						<li><a href="#" data-nav-section="work">收藏</a></li>
						<li><a href="#" data-nav-section="blog">博客</a></li>
					</ul>
				</div>
			</nav>



		</aside>

		<div id="colorlib-main">
			<section id="colorlib-hero" class="js-fullheight" data-section="home">
				<div class="flexslider js-fullheight">
					<ul class="slides">
				   	<li style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/mercury.jpg);">
				   		<div class="overlay"></div>
				   		<div class="container-fluid">
				   			<div class="row">
					   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 col-sm-12 col-xs-12 js-fullheight slider-text">
					   				<div class="slider-text-inner js-fullheight">
					   					<div class="desc">
                                            <h1>Hi! <br>我是<span  id="usname2after">${THIS_USER.usname}</span></h1>
						   					<h2>个人最喜欢的一句话 </h2>
											</div>
					   				</div>
					   			</div>
					   		</div>
				   		</div>
				   	</li>
				   	<li style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/saturn.jpeg);">
				   		<div class="overlay"></div>
				   		<div class="container-fluid">
				   			<div class="row">
					   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 col-sm-12 col-xs-12 js-fullheight slider-text">
					   				<div class="slider-text-inner">
					   					<div class="desc">
						   					<h1>欢 迎 来 到 <br>我 的 星 球</h1>

												<p><a class="btn btn-primary btn-learn">View Portfolio <i class="icon-briefcase3"></i></a></p>
											</div>
					   				</div>
					   			</div>
					   		</div>
				   		</div>
				   	</li>
				  	</ul>
			  	</div>
			</section>

			<section class="colorlib-about" data-section="about">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-12">
							<div class="row row-bottom-padded-sm animate-box" data-animate-effect="fadeInLeft">
								<div class="col-md-12">
									<div class="about-desc">
										<span class="heading-meta">关 于 我</span>
										<h2 class="colorlib-heading">Who Am I?</h2>
                                        <p><strong>你好，欢迎来到我的星球！</strong></p>
                                        <p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
										<p>天文学是研究宇宙空间天体、宇宙的结构和发展的学科。内容包括天体的构造、性质和运行规律等。天文学是一门古老的科学，自有人类文明史以来，天文学就有重要的地位。</p>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
									<div class="hire">
										<h2>希望你能有所收获 <br>如有问题欢迎和我相互交流！</h2>
										<a href="#" class="btn-hire">Hire me</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
			<div id="colorlib-counter" class="colorlib-counters" style="background-image: url(${pageContext.request.contextPath}/static/images/cj/index_bg1.jpg);" data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="colorlib-narrow-content">
					<div class="row">
					</div>
					<div class="row">
						<div class="col-md-3 text-center animate-box">
							<span class="colorlib-counter js-counter" data-from="0" data-to="209" data-speed="5000" data-refresh-interval="50"></span>
							<span class="colorlib-counter-label">发表文章</span>
						</div>
						<div class="col-md-3 text-center animate-box">
							<span class="colorlib-counter js-counter" data-from="0" data-to="356" data-speed="5000" data-refresh-interval="50"></span>
							<span class="colorlib-counter-label">回答问题</span>
						</div>
						<div class="col-md-3 text-center animate-box">
							<span class="colorlib-counter js-counter" data-from="0" data-to="66" data-speed="5000" data-refresh-interval="50"></span>
							<span class="colorlib-counter-label">粉丝</span>
						</div>
						<div class="col-md-3 text-center animate-box">
							<span class="colorlib-counter js-counter" data-from="0" data-to="10" data-speed="5000" data-refresh-interval="50"></span>
							<span class="colorlib-counter-label">关注</span>
						</div>
					</div>
				</div>
			</div>

			<section class="colorlib-skills" data-section="skills">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">特点</span>
							<h2 class="colorlib-heading animate-box">擅长领域</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
							<p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="progress-wrap">
								<h3>黑 洞</h3>
								<div class="progress">
								 	<div class="progress-bar color-1" role="progressbar" aria-valuenow="75"
								  	aria-valuemin="0" aria-valuemax="100" style="width:75%">
								    <span>75%</span>
								  	</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
							<div class="progress-wrap">
								<h3>恒 星</h3>
								<div class="progress">
								 	<div class="progress-bar color-2" role="progressbar" aria-valuenow="60"
								  	aria-valuemin="0" aria-valuemax="100" style="width:45%">
								    <span>45%</span>
								  	</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="progress-wrap">
								<h3>彗 星</h3>
								<div class="progress">
								 	<div class="progress-bar color-3" role="progressbar" aria-valuenow="85"
								  	aria-valuemin="0" aria-valuemax="100" style="width:65%">
								    <span>65%</span>
								  	</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
							<div class="progress-wrap">
								<h3>星 象</h3>
								<div class="progress">
								 	<div class="progress-bar color-4" role="progressbar" aria-valuenow="90"
								  	aria-valuemin="0" aria-valuemax="100" style="width:30%">
								    <span>30%</span>
								  	</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="progress-wrap">
								<h3>星 云</h3>
								<div class="progress">
								 	<div class="progress-bar color-5" role="progressbar" aria-valuenow="70"
								  	aria-valuemin="0" aria-valuemax="100" style="width:35%">
								    <span>35%</span>
								  	</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
							<div class="progress-wrap">
								<h3>类 星 体</h3>
								<div class="progress">
								 	<div class="progress-bar color-6" role="progressbar" aria-valuenow="80"
								  	aria-valuemin="0" aria-valuemax="100" style="width:20%">
								    <span>20%</span>
								  	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>


			<section class="colorlib-experience" data-section="experience">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">足迹</span>
							<h2 class="colorlib-heading animate-box">他的足迹</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
				         <div class="timeline-centered">
					         <article class="timeline-entry animate-box" data-animate-effect="fadeInLeft">
					            <div class="timeline-entry-inner">

					               <div class="timeline-icon color-1">
					                  <i class="icon-pen2"></i>
					               </div>

					               <div class="timeline-label">
					                  <h2><a href="#">热门文章一</a> <span>2017-2018</span></h2>
					                  <p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
					               </div>
					            </div>
					         </article>


					         <article class="timeline-entry animate-box" data-animate-effect="fadeInRight">
					            <div class="timeline-entry-inner">
					               <div class="timeline-icon color-2">
					                  <i class="icon-pen2"></i>
					               </div>
					               <div class="timeline-label">
					               	<h2><a href="#">热门文章二</a> <span>2017-2018</span></h2>
					                  <p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
					               </div>
					            </div>
					         </article>

					         <article class="timeline-entry animate-box" data-animate-effect="fadeInLeft">
					            <div class="timeline-entry-inner">
					               <div class="timeline-icon color-3">
					                  <i class="icon-pen2"></i>
					               </div>
					               <div class="timeline-label">
					               	<h2><a href="#">热门文章三</a> <span>2017-2018</span></h2>
					                  <p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
					               </div>
					            </div>
					         </article>

					         <article class="timeline-entry animate-box" data-animate-effect="fadeInTop">
					            <div class="timeline-entry-inner">
					               <div class="timeline-icon color-4">
					                  <i class="icon-pen2"></i>
					               </div>
					               <div class="timeline-label">
					               	<h2><a href="#">热门文章四</a> <span>2017-2018</span></h2>
					                  <p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
					               </div>
					            </div>
					         </article>

					         <article class="timeline-entry animate-box" data-animate-effect="fadeInLeft">
					            <div class="timeline-entry-inner">
					               <div class="timeline-icon color-5">
					                  <i class="icon-pen2"></i>
					               </div>
					               <div class="timeline-label">
					               	<h2><a href="#">热门文章五</a> <span>2017-2018</span></h2>
					                  <p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
					               </div>
					            </div>
					         </article>

					         <article class="timeline-entry begin animate-box" data-animate-effect="fadeInBottom">
					            <div class="timeline-entry-inner">
					               <div class="timeline-icon color-none">
					               </div>
					            </div>
					         </article>
					      </div>
					   </div>
				   </div>
				</div>
			</section>

			<section class="colorlib-work" data-section="work">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">图片</span>
							<h2 class="colorlib-heading animate-box">他的收藏</h2>
						</div>
					</div>
					<div class="row row-bottom-padded-sm animate-box" data-animate-effect="fadeInLeft">
						<div class="col-md-12">
							<p class="work-menu"><span><a href="#" class="active">黑洞</a></span> <span><a href="#">日全食</a></span> <span><a href="#">银河系</a></span> <span><a href="#">彗星</a></span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="project" style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/mercury.jpg);">
								<div class="desc">
									<div class="con">
										<h3><a href="work.html">Pic 01</a></h3>
										<span>类别</span>
										<p class="icon">
											<span><a href="#"><i class="icon-share3"></i></a></span>
											<span><a href="#"><i class="icon-eye"></i> 100</a></span>
											<span><a href="#"><i class="icon-heart"></i> 49</a></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
							<div class="project" style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/saturn.jpeg);">
								<div class="desc">
									<div class="con">
										<h3><a href="work.html">Pic 02</a></h3>
										<span>类别</span>
										<p class="icon">
											<span><a href="#"><i class="icon-share3"></i></a></span>
											<span><a href="#"><i class="icon-eye"></i> 100</a></span>
											<span><a href="#"><i class="icon-heart"></i> 49</a></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInTop">
							<div class="project" style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/uranus.jpg);">
								<div class="desc">
									<div class="con">
										<h3><a href="work.html">Pic 03</a></h3>
										<span>类别</span>
										<p class="icon">
											<span><a href="#"><i class="icon-share3"></i></a></span>
											<span><a href="#"><i class="icon-eye"></i> 100</a></span>
											<span><a href="#"><i class="icon-heart"></i> 49</a></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInBottom">
							<div class="project" style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/黑洞2.jpg);">
								<div class="desc">
									<div class="con">
										<h3><a href="work.html">Pic 04</a></h3>
										<span>类别</span>
										<p class="icon">
											<span><a href="#"><i class="icon-share3"></i></a></span>
											<span><a href="#"><i class="icon-eye"></i> 100</a></span>
											<span><a href="#"><i class="icon-heart"></i> 49</a></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="project" style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/黑洞1.jpg);">
								<div class="desc">
									<div class="con">
										<h3><a href="work.html">Pic 05</a></h3>
										<span>类别</span>
										<p class="icon">
											<span><a href="#"><i class="icon-share3"></i></a></span>
											<span><a href="#"><i class="icon-eye"></i> 100</a></span>
											<span><a href="#"><i class="icon-heart"></i> 49</a></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
							<div class="project" style="background-image: url(${pageContext.request.contextPath}/static/images/cjy/space-1.jpg);">
								<div class="desc">
									<div class="con">
										<h3><a href="work.html">Pic 06</a></h3>
										<span>类别</span>
										<p class="icon">
											<span><a href="#"><i class="icon-share3"></i></a></span>
											<span><a href="#"><i class="icon-eye"></i> 100</a></span>
											<span><a href="#"><i class="icon-heart"></i> 49</a></span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 animate-box">
							<p><a href="#" class="btn btn-primary btn-lg btn-load-more">更 多 ··· <i class="icon-reload"></i></a></p>
						</div>
					</div>
				</div>
			</section>

			<section class="colorlib-blog" data-section="blog">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">博客</span>
                            <h2 class="colorlib-heading">
                                <c:if test="${THIS_USER.usid==sessionScope.CURR_USER.usid}">
                                    <a href="addpage.do?${THIS_USER.usid}">发表博客</a>
                                </c:if>
                                <span>最新博客 </span>
                            </h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="blog-entry">
								<a href="blog.jsp" class="blog-img"><img src="${pageContext.request.contextPath}/static/images/cjy/黑洞1.jpg" class="img-responsive" alt="HTML5 Bootstrap Template by colorlib.com"></a>
								<div class="desc">
									<span><small>4月 14日, 2018 </small> | <small> 类 别 </small> | <small> <i class="icon-bubble3"></i> 4</small></span>
									<h3><a href="blog.jsp">黑洞</a></h3>
									<p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInRight">
							<div class="blog-entry">
								<a href="blog.jsp" class="blog-img"><img src="${pageContext.request.contextPath}/static/images/cjy/mercury.jpg" class="img-responsive" alt="HTML5 Bootstrap Template by colorlib.com"></a>
								<div class="desc">
									<span><small>4月 14日, 2018 </small> | <small> 类 别 </small> | <small> <i class="icon-bubble3"></i> 4</small></span>
									<h3><a href="blog.jsp">土星</a></h3>
									<p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="blog-entry">
								<a href="blog.jsp" class="blog-img"><img src="${pageContext.request.contextPath}/static/images/cjy/mercury.jpg" class="                                                                                                                                                                                       img-responsive" alt="HTML5 Bootstrap Template by colorlib.com"></a>
								<div class="desc">
									<span><small>4月 14日, 2018 </small> | <small> 类 别 </small> | <small> <i class="icon-bubble3"></i> 4</small></span>
									<h3><a href="blog.jsp">星河</a></h3>
									<p>天文快讯,天文译文,天文研究动态,天文科普活动,天文论坛,天文直播室,天文百科,天文现象预报,实时天象展示……有关天文学的一切在这里尽显全貌！</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 animate-box">
							<p><a href="#" class="btn btn-primary btn-lg btn-load-more">更 多 ··· <i class="icon-reload"></i></a></p>
						</div>
					</div>
				</div>
			</section>

		</div><!-- end:colorlib-main -->
	</div><!-- end:container-wrap -->
	</div><!-- end:colorlib-page -->

    <!--修改个人信息-->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background: rgba(255,255,255,0.2);">
                <div class="modal-header">
                    <h2 class="text-center">知天易</h2>
                    <h4 class="text-center">用户信息修改</h4>
                    <br/>
                    <div class="alert alert-danger hide" role="alert" id="errEMsg">${errEMsg}</div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="username111" class="control-label">用户名：</label>
                                <input type="text" class="form-control" placeholder="请输入用户名"
                                       name="usname" id="username111" value="${THIS_USER.usname}">
                            </div>
                            <div class="form-group">
                                <label for="password11" class="control-label">密码：</label>
                                <input type="password" class="form-control" id="password11" placeholder="请输入密码"
                                       name="uspassword" value="${THIS_USER.uspassword}">
                            </div>
                            <div class="form-group">
                                <label for="password21" class="control-label">确认密码：</label>
                                <input type="password" class="form-control" id="password21" placeholder="请确认密码"
                                       name="password2" value="${THIS_USER.uspassword}">
                            </div>
                            <div class="form-group">
                                <label for="tel11" class="control-label">电话号码：</label>
                                <input type="text" class="form-control" id="tel11" placeholder="请输入电话号码"
                                       name="ustel" value="${THIS_USER.ustel}">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-primary" value="确认" id="btnEdit">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- jQuery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cj/jquery-3.3.1.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/jquery.countTo.js"></script>


	<!-- MAIN JS -->
	<script src="${pageContext.request.contextPath}/static/js/cjy/js/main.js"></script>
    <script type="text/javascript">
        //修改信息
        $(function() {
            $("#btnEdit").click(function(){
                //1.取到用户名,密码和电话
                var params = {
                    "usid":${THIS_USER.usid},
                    "usname": $("#username111").val(),
                    "uspassword": $("#password11").val(),
                    "ustel":$("#tel11").val()
                };
                //2.发送ajax请求去修改
                $.post("ajax-edit.do", params, function(data){
                    //3.请求回来之后根据结果显示相应的内容
                    if(data.success){
                        $("#errEMsg").text(data.msg).removeClass("hide");
                        setTimeout(function () {
                            $("#errEMsg").addClass("hide");
                            $("#editModal").modal("hide");
                        },1200);
                    }else{
                        $("#errEMsg").text(data.msg).removeClass("hide");
                        setTimeout(function () {
                           $("#errEMsg").addClass("hide");
                        },1200);
                    }
                }, 'json');

            });

        });
    </script>
	</body>
</html>

