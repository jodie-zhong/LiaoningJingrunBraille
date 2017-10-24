<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-deploy="<%- list[i].bookDeploymentKey %>" data-isbncipApplyId="<%- list[i].isbncipApplyId %>"
    data-bookName="<%- list[i].isbncipApplyName %>"
     data-taskState="<%- list[i].taskState %>" data-isbncipApplyState="<%- list[i].isbncipApplyState %>"
    data-flowId="<%- list[i].flowId %>" data-taskId="<%- list[i].taskId %>" data-users="<%- list[i].taskUsers %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].isbncipApplyName %>"><%- list[i].isbncipApplyName %></td>
  <td title="<%- list[i].isbncipApplyUserName %>"><%- list[i].isbncipApplyUserName %></td>
  <td title="<%- list[i].isbncipApplyNum %>"><%- list[i].isbncipApplyNum %></td>
  <td title="<%- list[i].isbncipApplyDatetime %>"><%- list[i].isbncipApplyDatetime %></td>
  <td title="<%- list[i].taskUserNames %>"><%- list[i].taskUserNames %></td>
  <td title="<%- list[i].isbncipApplyState %>"><%- list[i].isbncipApplyState %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="8"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
