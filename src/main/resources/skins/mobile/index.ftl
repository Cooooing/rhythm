<#--

    Symphony - A modern community (forum/BBS/SNS/blog) platform written in Java.
    Copyright (C) 2012-present, b3log.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#include "macro-head.ftl">
<#include "common/sub-nav.ftl">
<!DOCTYPE html>
<html>
<head>
    <@head title="${symphonyLabel}">
        <meta name="description" content="${symDescriptionLabel}"/>
    </@head>
</head>
<body class="index">
${HeaderBannerLabel}
<#include "header.ftl">
<@subNav '' ''/>
<div class="main">
    <div class="wrapper fn-clear">
        <div class="module">
            <div class="module-header" style="background-color: #97cf76;">
                <a href="${servePath}/recent">${latestLabel}</a>
            </div>
            <div class="module-panel">
                <ul class="module-list">
                    <#list recentArticles as article>
                        <li<#if !article_has_next> class="last"</#if>>
                            <a rel="nofollow" href="${servePath}/member/${article.articleAuthorName}">
                                    <span class="avatar-small tooltipped tooltipped-se slogan"
                                          aria-label="${article.articleAuthorName}"
                                          style="background-image:url('${article.articleAuthorThumbnailURL20}')"></span>
                            </a>
                            <a rel="nofollow" class="title fn-ellipsis"
                               href="${servePath}${article.articlePermalink}">${article.articleTitleEmoj}</a>
                            <a class="fn-right count ft-gray ft-smaller"
                               href="${servePath}${article.articlePermalink}"><#if article.articleViewCount < 1000>
                                    ${article.articleViewCount}<#else>${article.articleViewCntDisplayFormat}</#if></a>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>
        <div class="module-panel">
            <div class="module-header" style="background-color: #69b6df;">
                <a onclick="randomArticles()" style="cursor: pointer">
                    <svg><use xlink:href="#refresh"></use></svg>
                    换一批&nbsp;&nbsp;
                    随便看看
                </a>
            </div>
            <ul class="module-list" id="randomArticles">
                <#list indexRandomArticles as article>
                    <li class="fn-flex">
                        <a rel="nofollow" href="${servePath}/member/${article.articleAuthorName}">
                                    <span class="avatar-small tooltipped tooltipped-se slogan"
                                          aria-label="${article.articleAuthorName}"
                                          style="background-image:url('${article.articleAuthorThumbnailURL20}')"></span>
                        </a>
                        <a rel="nofollow" class="title fn-ellipsis fn-flex-1"
                           href="${servePath}${article.articlePermalink}">${article.articleTitleEmoj}</a>
                        <a class="fn-right count ft-gray ft-smaller"
                           href="${servePath}${article.articlePermalink}"><#if article.articleViewCount < 1000>
                                ${article.articleViewCount}<#else>${article.articleViewCntDisplayFormat}</#if></a>
                    </li>
                </#list>
            </ul>
        </div>
        <div class="module">
            <div class="module-header" style="background-color: #dfb169;">
                <a href="${servePath}/perfect">${perfectLabel}</a>
            </div>
            <div class="module-panel">
                <ul class="module-list">
                    <#list perfectArticles as article>
                        <li<#if !article_has_next> class="last"</#if>>
                            <a rel="nofollow" href="${servePath}/member/${article.articleAuthorName}">
                                    <span class="avatar-small tooltipped tooltipped-se slogan"
                                          aria-label="${article.articleAuthorName}"
                                          style="background-image:url('${article.articleAuthorThumbnailURL20}')"></span>
                            </a>
                            <a rel="nofollow" class="title fn-ellipsis"
                               href="${servePath}${article.articlePermalink}">${article.articleTitleEmoj}</a>
                            <a class="fn-right count ft-gray ft-smaller"
                               href="${servePath}${article.articlePermalink}">${article.articleViewCount}</a>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>
        <div class="module">
            <div class="module-header" style="background-color: #69dfac;">
                <a href="${servePath}/cr">聊天室</a>
            </div>
            <div class="module-panel">
                <div style="margin: 15px 0 5px 0">
                    <a href="${servePath}/cr">点击加入聊天</a>
                </div>
                <ul class="module-list" id="chatRoomIndex">
                    <#if messages?size != 0>
                        <#list messages as msg>
                            <#if msg_index <= 9>
                                <li class="fn-flex">
                                    <a rel="nofollow" href="${servePath}/member/${msg.userName}">
                                        <div class="avatar tooltipped tooltipped-n"
                                             aria-label="${msg.userName}"
                                             style="background-image:url('${msg.userAvatarURL}')"></div>
                                    </a>
                                    <div class="fn-flex-1">
                                        <div class="ft-smaller">
                                            <a rel="nofollow" href="${servePath}/member/${msg.userName}">
                                                <span class="ft-gray">${msg.userName}</span>
                                            </a>
                                        </div>
                                        <div class="vditor-reset comment<#if 0 == chatRoomPictureStatus> blur</#if>">
                                            ${msg.content}
                                        </div>
                                    </div>
                                </li>
                            </#if>
                        </#list>
                    <#else>
                        <li class="ft-center ft-gray" id="emptyChatRoom">${chickenEggLabel}</li>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</div>
<#if tags?size != 0>
    <div class="index-wrap">
        <div class="wrapper">
            <ul class="tag-desc fn-clear">
                <#list tags as tag>
                    <li>
                        <a rel="nofollow" href="${servePath}/tag/${tag.tagURI}">
                            <#if tag.tagIconPath!="">
                                <img src="${tag.tagIconPath}" alt="${tag.tagTitle}"/>
                            </#if>
                            ${tag.tagTitle}
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
</#if>
<div class="fn-hr10"></div>
<div class="main">
    <div class="wrapper">
        <#if ADLabel != ''>
            <div class="module">
                <div class="module-header" style="background-color: #7ea5c8">
                    <a href="${servePath}/about">${sponsorLabel}</a>
                </div>
                <div class="ad module-panel fn-clear">
                    ${ADLabel}
                </div>
            </div>
        </#if>
        <div class="module">
            <div class="module-header" style="background-color: #9cd462">
                <a href="${servePath}/pre-post">${postArticleLabel}</a>
            </div>
            <div class="module-panel">
                <ul class="module-list">
                    <li><a class="title" href="${servePath}/activity/daily-checkin">${activityDailyCheckinLabel}</a>
                    </li>
                    <li><a class="title"
                           href="${servePath}/activity/yesterday-liveness-reward">${activityYesterdayLivenessRewardLabel}</a>
                    </li>
                    <li><a class="title" href="${servePath}/activity/1A0001">${activity1A0001Label}</a></li>
                    <li><a class="title" href="${servePath}/activity/character">${characterLabel}</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="slogan">
    ${indexIntroLabel}&nbsp;
    <a href="https://github.com/88250/symphony" target="_blank">
        <svg>
            <use xlink:href="#github"></use>
        </svg>
    </a>
</div>
<#include "footer.ftl">
</body>
<script>
    var chatRoomPictureStatus = "<#if 0 == chatRoomPictureStatus> blur</#if>";

    var fishingPiVersion = "${fishingPiVersion}";
    $("#fs").append('<div class="fn-hr5"></div><div><a href="${servePath}/article/1630856648465">🐟&nbsp;&nbsp;摸鱼派社区，用爱发电 | Beta v' + fishingPiVersion + '</a></div>');

    function randomArticles() {
        $.ajax({
            url: "${servePath}/article/random/10",
            method: "GET",
            cache: false,
            async: false,
            success: function (result) {
                $("#randomArticles").html('');
                for (let articleCur in result.articles) {
                    let article = result.articles[articleCur];
                    let viewCount = article.articleViewCount;
                    if (viewCount >= 1000) {
                        viewCount = article.articleViewCntDisplayFormat;
                    }
                    $("#randomArticles").append('<li class="fn-flex">' +
                        '<a rel="nofollow" href="${servePath}/member/' + article.articleAuthorName + '">' +
                        '<span class="avatar-small tooltipped tooltipped-se slogan" aria-label="' + article.articleAuthorName + '" style="background-image:url(\'' + article.articleAuthorThumbnailURL20 + '\')"></span></a>' +
                        '<a rel="nofollow" class="title fn-ellipsis fn-flex-1" href="${servePath}' + article.articlePermalink + '">' + article.articleTitleEmoj + '</a>' +
                        '<a class="fn-right count ft-gray ft-smaller" href="${servePath}' + article.articlePermalink + '">' + viewCount + '</a>' +
                        '</li>');
                }
            }
        });
    }
</script>
</html>
