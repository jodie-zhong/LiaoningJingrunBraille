<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-topicId="<%- list[i].topicId %>"
    data-deploy="<%- list[i].bookDeploymentKey %>"
	 data-taskState="<%- list[i].taskState %>" data-flowId="<%- list[i].flowId %>" data-taskId="<%- list[i].taskId %>" 
	 data-urgent="<%- list[i].topicIsUrgent %>" data-users="<%- list[i].taskUsers %>" data-num="<%- list[i].taskNum %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].topicDetailName %>"><%- list[i].topicDetailName %></td>
  <td title="<%- list[i].bookTypeName %>"><%- list[i].bookTypeName %></td>
  <td title="<%- list[i].submitDatetime %>"><%- list[i].submitDatetime %></td>
  <% if(!list[i].topicDetailRecommendType || list[i].topicDetailRecommendType === '1') { %>
  <td>非社推荐选题</td>
  <% } else { %>
  <td>社推荐选题</td>
  <% } %>
  <% if(list[i].topicSelectProperty === '1') { %>
  <td>普通</td>
  <% } else if(list[i].topicSelectProperty === '2') { %>
  <td>重大选题备案</td>
  <% } else if(list[i].topicSelectProperty === '3') { %>
  <td>引进选题备案</td>
  <% } %>
  <% if(!list[i].topicIsUrgent || list[i].topicIsUrgent === '1') { %>
  <td>否</td>
  <% } else { %>
  <td>是</td>
  <% } %>
  <td title="<%- list[i].taskUserNames %>"><%- list[i].taskUserNames %></td>
  <td title="<%- list[i].topicFileState %>"><%- list[i].topicFileState %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="10"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>