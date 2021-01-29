<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入页面框架jsp文件 -->
<%@ include file="alx_framework.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>爱旅行 - 旅行日志</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/article.css" />
</head>
<body>
  <!-- 主体 -->
    <div id="content">
        <div class="banner"><a href="#"><img src="./upload/banner2.png" width="980" /></a></div>
        <div class="main">
            <div class="best">
                <div class="title"><h2>编辑推荐</h2></div>
                <div class="bestlist">
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath }/toAlxprose.action"><img src="./upload/best1.jpg" width="300" /></a>
                            <p><a href="./article_1.html">那些年，我们一起旅行过的地方</a></p>
                        </li>
                        <li>
                            <a href="./article_1.html"><img src="./upload/best2.jpg" width="300" /></a>
                            <p><a href="./article_1.html">那些年，我们一起旅行过的地方</a></p>
                        </li>
                        <li>
                            <a href="./article_1.html"><img src="./upload/best3.jpg" width="300" /></a>
                            <p><a href="./article_1.html">那些年，我们一起旅行过的地方</a></p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="new">
                <div class="title"><h2>最新发布</h2></div>
                <div class="newlist">
                    <ul>
                        <li>
                            <a href="./article_1.html"><img src="./upload/new1.jpg" /></a>
                            <div class="summary">
                                <h3>那些年，我们一起旅行过的地方</h3>
                                <p>评论：<span>35</span>热度：<span>5612</span>时间：<span>2013/8/24</span></p>
                                <p class="sum">我想要一次旅行，到处留下足迹，和你一起。我在别人眼里，你在我心里。我想要一次旅行，不留任何足迹，独自一起。我在你的记忆，却不在你心里。我们一起走过过去和现在。</p>
                            </div>
                        </li>
                        <li>
                            <a href="./article_1.html"><img src="./upload/new2.jpg" /></a>
                            <div class="summary">
                                <h3>那些年，我们一起旅行过的地方</h3>
                                <p>评论：<span>35</span>热度：<span>5612</span>时间：<span>2013/8/24</span></p>
                                <p class="sum">我想要一次旅行，到处留下足迹，和你一起。我在别人眼里，你在我心里。我想要一次旅行，不留任何足迹，独自一起。我在你的记忆，却不在你心里。我们一起走过过去和现在。</p>
                            </div>
                        </li>
                        <li>
                            <a href="./article_1.html"><img src="./upload/new3.jpg" /></a>
                            <div class="summary">
                                <h3>那些年，我们一起旅行过的地方</h3>
                                <p>评论：<span>35</span>热度：<span>5612</span>时间：<span>2013/8/24</span></p>
                                <p class="sum">我想要一次旅行，到处留下足迹，和你一起。我在别人眼里，你在我心里。我想要一次旅行，不留任何足迹，独自一起。我在你的记忆，却不在你心里。我们一起走过过去和现在。</p>
                            </div>
                        </li>
                        <li>
                            <a href="./article_1.html"><img src="./upload/new4.jpg" /></a>
                            <div class="summary">
                                <h3>那些年，我们一起旅行过的地方</h3>
                                <p>评论：<span>35</span>热度：<span>5612</span>时间：<span>2013/8/24</span></p>
                                <p class="sum">我想要一次旅行，到处留下足迹，和你一起。我在别人眼里，你在我心里。我想要一次旅行，不留任何足迹，独自一起。我在你的记忆，却不在你心里。我们一起走过过去和现在。</p>
                            </div>
                        </li>
                        <li>
                            <a href="./article_1.html"><img src="./upload/new5.jpg" /></a>
                            <div class="summary">
                                <h3>那些年，我们一起旅行过的地方</h3>
                                <p>评论：<span>35</span>热度：<span>5612</span>时间：<span>2013/8/24</span></p>
                                <p class="sum">我想要一次旅行，到处留下足迹，和你一起。我在别人眼里，你在我心里。我想要一次旅行，不留任何足迹，独自一起。我在你的记忆，却不在你心里。我们一起走过过去和现在。</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="pagelist">
                <ul>
                    <li><a href="#">首页</a></li>
                    <li><a href="#">上一页</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li>
                    <li><a href="#">11</a></li>
                    <li><a href="#">12</a></li>
                    <li><a href="#">下一页</a></li>
                    <li><a href="#">尾页</a></li>
                </ul>
            </div>
        </div>
        <div class="sider">
            <div class="sharewrap">
                <div class="sharebtn">
                    <!-- JiaThis Button BEGIN -->
                    <div class="jiathis_style_32x32">
                        <a class="jiathis_button_qzone"></a>
                        <a class="jiathis_button_tsina"></a>
                        <a class="jiathis_button_tqq"></a>
                        <a class="jiathis_button_weixin"></a>
                        <a class="jiathis_button_renren"></a>
                    </div>
                    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1377229801233346" charset="utf-8"></script>
                    <!-- JiaThis Button END -->                
                </div>
            </div>
            <div class="hotarc">
                <div class="title"><h3>热门推荐</h3></div>
                <ul>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                </ul>
            </div>
            <div class="hotarc">
                <div class="title"><h3>热门推荐</h3></div>
                <ul>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                </ul>
            </div>
            <div class="hotarc">
                <div class="title"><h3>热门推荐</h3></div>
                <ul>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                    <li><a href="#">那些年,我们一起旅行过的地方</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>