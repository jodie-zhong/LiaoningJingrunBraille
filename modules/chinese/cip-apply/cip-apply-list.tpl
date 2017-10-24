<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-deploy="<%- list[i].bookDeploymentKey %>" data-bookTopicId="<%- list[i].bookTopicId %>"
    data-taskState="<%- list[i].taskState %>"
    data-flowId="<%- list[i].flowId %>" data-taskId="<%- list[i].taskId %>" data-users="<%- list[i].taskUsers %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- list[i].bookType %>"><%- list[i].bookType %></td>
  <td title="<%- list[i].dutyEditor %>"><%- list[i].dutyEditor %></td>
  <td title="<%- list[i].bookIsbn %>"><%- list[i].bookIsbn %></td>
  <td title="<%- list[i].taskUsersName %>"><%- list[i].taskUsersName %></td>
  <td title="<%- list[i].bookStageState %>"><%- list[i].bookStageState %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="8"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
