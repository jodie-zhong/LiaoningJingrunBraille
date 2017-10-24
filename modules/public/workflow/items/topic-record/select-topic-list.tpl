<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].topicId %>" data-name="<%- list[i].topicDetailName %>" data-userNameAuthor="<%- list[i].userName %>">
  <td><%- (i + 1) %></td>
  <td title="<%- list[i].topicDetailName %>"><%- list[i].topicDetailName %></td>
  <td title="<%- list[i].topicDetailOldAuthor %>"><%- list[i].topicDetailOldAuthor %></td>
  <td title="<%- list[i].topicDetailWorkWay %>"><%- list[i].topicDetailWorkWay %></td>
  <td title="<%- list[i].topicDetailWords %>"><%- list[i].topicDetailWords %></td>
  <td title="<%- list[i].topicDetailOldPublishingHouse %>"><%- list[i].topicDetailOldPublishingHouse %></td>
  <td title="<%- list[i].topicDetailOldPublicationDate %>"><%- list[i].topicDetailOldPublicationDate %></td>
  <% if(list[i].topicDetailRecommendType === '1') { %>
  <td title="非社推荐选题">非社推荐选题</td>
  <% } else { %>
  <td title="社推荐选题">社推荐选题</td>
  <% } %>
  <td title="<%- list[i].userName %>"><%- list[i].userName %></td>
  <td><button class="btn btn-rounded  btn-xs btn-default">选择</button></td>
</tr>
<% } %>