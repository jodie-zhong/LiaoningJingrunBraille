<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-reprintBookAuditId="<%- list[i].reprintBookAuditId  %>"
    data-reNum="<%- list[i].isInFirst %>"
    data-name="<%- list[i].reprintBookAuditName %>"
    data-bookTopicId="<%- list[i].bookTopicId %>" data-taskState="<%- list[i].taskState %>"
    data-flowId="<%- list[i].flowId %>" data-deploy="<%- list[i].bookDeploymentKey %>"
    data-taskId="<%- list[i].taskId %>"
    data-taskUsers="<%- list[i].taskUsers %>" data-users="<%-
    list[i].taskUsers %>"
    data-state="<%- list[i].bookPrintState %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].reprintBookAuditName %>"><%- list[i].reprintBookAuditName %></td>
  <td title="<%- list[i].reprintBookAuditNum %>"><%- list[i].reprintBookAuditNum %></td>
  <td title="<%- list[i].taskUsersNames %>"><%- list[i].taskUsersNames %></td>
  <td title="<%- list[i].bookStateName %>"><%- list[i].bookStateName %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="6"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
