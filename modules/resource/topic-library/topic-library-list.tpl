<!--译校通读众包管理列表-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-topicId="<%- list[i].topicId %>" data-topicSelectProperty="<%- list[i].topicSelectProperty %>"
    data-createUserId="<%- list[i].createUserId %>" data-overTaskNumTopic="<%- list[i].overTaskNumTopic %>"
    data-overTaskNumBig="<%- list[i].overTaskNumBig %>" data-overTaskNumImported="<%- list[i].overTaskNumImported %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-circle-o" data-action="check"></i></td>
  <td title="<%- list[i].topicDetailName %>"><%- list[i].topicDetailName %></td>
  <td title="<%- list[i].topicDetailType %>"><%- list[i].topicDetailType %></td>

  <% if(list[i].topicDetailRecommendType === '1') { %>
  <td title="非社推荐选题">非社推荐选题</td>
  <% } else if(list[i].topicDetailRecommendType === '2') { %>
  <td title="社推荐选题">社推荐选题</td>
  <% } %>

  <% if(list[i].topicIsUrgent === '1') { %>
  <td title="否">否</td>
  <% } else if(list[i].topicIsUrgent === '2') { %>
  <td title="是">是</td>
  <% } else {%>
  <td></td>
  <% } %>

  <td title="<%- list[i].createUserName %>"><%- list[i].createUserName %></td>
  <% if(list[i].topicSelectProperty === '1') { %>
  <td class="record" title="未备案">未备案</td>
  <% } else if(list[i].topicSelectProperty === '2') { %>
  <td class="record" title="重大选题备案">重大选题备案</td>
  <% } else if(list[i].topicSelectProperty === '3') { %>
  <td class="record" title="引进选题备案">引进选题备案</td>
  <% } else {%>
  <td></td>
  <% } %>
  <td title="<%- list[i].topicResult %>"><%- list[i].topicResult %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="9"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>