<%--
  Created by IntelliJ IDEA.
  User: fish
  Date: 2018/12/20
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>知天易</title>
    <link href="${pageContext.request.contextPath}/static/css/cj/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/cj/addstyle.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/cj/addtype.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div>
    <jsp:include page="head.jsp"></jsp:include>

        <div class="container">
            <div id="fsDb" class="bannerfocus">
                <div id="D1picb" class="fPic">
                    <div class="bannerfcon astronomyType" id="更多">
                        <div class="text text_true torgba">
                            <h2><a href="" target="_blank">天文学</a></h2>
                            天文学（Astronomy）是研究宇宙空间天体、宇宙的结构和发展的学科。内容包括天体的构造、性质和运行规律等。主要通过观测天体发射到地球的辐射，发现并测量它们的位置、探索它们的运动规律、研究它们的物理性质、化学组成、内部结构、能量来源及其演化规律。</p>
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide" id="粒子对">
                        <div class="text torgba">
                            <h2><a href="/perio/toIndex.do" target="_blank">粒子对</a></h2>
                            物理学上由狄拉克方程预言每种微观粒子都存在有它的“反粒子”。举个例子，我们知道电子是带负电荷的，而人们在实验中也发现了正电子，正负电子就是一对正反粒子对。正反粒子一相遇就会发生湮灭，同归于尽。
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide" id="红移">
                        <div class="text torgba">
                            <h2><a href="/degree/toIndex.do" target="_blank">红移</a></h2>
                            红移指物体的电磁辐射由于某种原因波长增加的现象，在可见光波段表现为光谱的谱线朝红端移动了一段距离，即波长变长、频率降低。红移有多普勒红移、引力红移、宇宙学红移三种类别，红移主要应用于物理学和天文学领域，多用于天体的移动及规律的预测上。
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide"  id="引力波">
                        <div class="text torgba">
                            <h2><a href="/conf/load.do" target="_blank">引力波</a></h2>
                            引力波在广义相对论里，是时空本身的涟漪，是由带质量物体的加速度运动所生成。由于广义相对论限制了引力相互作用的传播速度为光速，因此会产生引力波的现象。相反地说，牛顿重力理论中的相互作用是以无限的速度传播，所以在这一理论下并不存在引力波。                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide" id="暗物质">
                        <div class="text torgba">
                            <h2><a href="/navigations/patent.do" target="_blank">暗物质</a></h2>
                            暗物质是一种因存在现有理论无法解释的现象而假想出的物质，比电子和光子还要小的物质，不带电荷，不与电子发生干扰，能够穿越电磁波和引力场，是宇宙的重要组成部分。
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType  hide" id="时空扭曲">
                        <div class="text torgba">
                            <h2><a href="/tech/techindex.do" target="_blank">时空扭曲</a></h2>
                            时空扭曲，根据相对论的解释，当一个有质量的物体体积趋于0时，其引力会达到无法想象的地步，从而改变空间，导致光都无法在其空间里逃避，进而形成时空扭曲。
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide" id="相对论">
                        <div class="text torgba">
                            <h2><a href="/techResult/tr-nav.do" target="_blank">相对论</a></h2>
                            一切的惯性参考系都是平权的，即物理规律的形式在任何的惯性参考系中是相同的。真空中的光速在任何参考系下是恒定不变的，这用几何语言可以表述为光子在时空中的世界线总是类光的。
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide" id="量子力学">
                        <div class="text torgba">
                            <h2><a href="/navigations/standards.do" target="_blank">量子力学</a></h2>
                            量子力学是研究物质世界微观粒子运动规律的物理学分支，主要研究原子、分子、凝聚态物质，以及原子核和基本粒子的结构、性质的基础理论它与相对论一起构成现代物理学的理论基础。
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide" id="星际尘埃">
                        <div class="text torgba">
                            <h2><a href="/legislations/toIndex.do" target="_blank">星际尘埃</a></h2>
                            星际尘埃是分散在星际气体中的固态小颗粒。尘埃的物质可能是由硅酸盐、石墨晶粒以及水、甲烷等冰状物所组成。
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide" id="类星体">
                        <div class="text torgba">
                            <h2><a href="http://fz.wanfangdata.com.cn/" target="_blank">类星体</a></h2>
                            类星体又称为似星体、魁霎或类星射电源。它是宇宙早期星系核心，由星系中心的超大质量黑洞驱动。与普通星系相比，类星体直径小，但亮度大。自被人类发现以来，类星体就一直存在相互融合的趋势。与脉冲星、微波背景辐射和星际有机分子一道并称为1960年代天文学“四大发现”。
                        </div>
                    </div>
                    <div class="bannerfcon astronomyType hide" id="宇宙线" name="astronomyType">
                        <div class="text torgba">
                            <h2><a href="http://video.wanfangdata.com.cn/" target="_blank">宇宙线</a></h2>
                            宇宙线亦称为宇宙射线，是来自外太空的带电高能次原子粒子。它们可能会产生二次粒子穿透地球的大气层和表面。射线这个名词源自于曾被认为是电磁辐射的历史。
                        </div>
                    </div>
                </div>
                <img class="prev" src="${pageContext.request.contextPath}/static/images/cj/prev.png"/>
                <img class="next" src="${pageContext.request.contextPath}/static/images/cj/next.png"/>
                <!--
                <span class="prev"></span> <span class="next"></span>
                -->
            </div>
            <div class="BrainShadow"></div>
            <div class="BrainMapMain" id="D1fBtb">
                <div class="focus jianjie">
                    <a target="_blank" href="javascript:void(0);">系统介绍</a>
                </div>
                <div class="focus qikan">
                    <a target="_blank" href="searchbyclass.do?pclass=1">星际尘埃</a>
                </div>
                <div class="focus xuewei">
                    <a target="_blank" href="searchbyclass.do?pclass=1">引力波</a>
                </div>
                <div class="focus hylw">
                    <a target="_blank" href="searchbyclass.do?pclass=1">暗物质</a>
                </div>
                <div class="focus zhuanli">
                    <a target="_blank" href="searchbyclass.do?pclass=1">时空扭曲</a>
                </div>
                <div class="focus kjbg">
                    <a target="_blank" href="searchbyclass.do?pclass=1">粒子对</a>
                </div>
                <div class="focus kjcg">
                    <a target="_blank" href="searchbyclass.do?pclass=1">量子力学</a>
                </div>
                <div class="focus biaozhun">
                    <a target="_blank" href="searchbyclass.do?pclass=1">相对论</a>
                </div>
                <div class="focus fagui">
                    <a target="_blank" href="searchbyclass.do?pclass=1">类星体</a>
                </div>
                <div class="focus dfz">
                    <a target="_blank" href="searchbyclass.do?pclass=1">宇宙线</a>
                </div>
                <div class="focus shipin">
                    <a target="_blank" href="searchbyclass.do?pclass=2" class="wfsp">红移</a>
                </div>
                <div class="focus more">
                    <a target="_blank" href="searchbyclass.do?pclass=">更多</a>
                </div>
            </div>
            <div class="BrainMap2"></div>
            <div class="BrainMap3"></div>
            <div class="BrainMap4"></div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cj/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cj/type.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cj/bootstrap.js"></script>
</body>
</html>
