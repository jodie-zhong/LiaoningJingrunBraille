<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-deploy="<%- list[i].bookDeploymentKey %>"
    data-taskState="<%- list[i].taskState %>"
    data-flowId="<%- list[i].flowId %>" data-taskId="<%- list[i].taskId %>" data-users="<%- list[i].taskUsers %>">
  <td ><%- (i + 1) %></td>
  <td data-check="true" ><i class="fa fa-circle-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- list[i].bookType %>"><%- list[i].bookType %></td>
  <td title="<%- list[i].taskUserNames %>"><%- list[i].taskUserNames %></td>
  <td title="<%- list[i].bookStateName %>"><%- list[i].bookStateName %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="6"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>