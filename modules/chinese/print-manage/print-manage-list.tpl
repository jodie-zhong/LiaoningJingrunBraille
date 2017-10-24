<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-deploy="<%- list[i].bookDeploymentKey %>" data-taskState="<%- list[i].taskState %>" data-tprTaskType="<%- list[i].tprTaskType %>"
    data-flowId="<%- list[i].flowId %>" data-taskId="<%- list[i].taskId %>" data-users="<%- list[i].taskUsers %>" data-tprSeeType="<%- list[i].tprSeeType %>" data-num="<%- list[i].taskNum %>"
    data-isInFirst="<%- list[i].isInFirst %>" data-overTaskNum="<%- list[i].overTaskNum %>">
  <td style="width: 50px;"><%- (i + 1) %></td>
  <td data-check="true" style="width: 50px;"><i class="fa fa-circle-o" data-action="check"></i></td>
  <td style="width: 30%;" title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td><%- list[i].bookType%></td>
  <td><%- list[i].printState %></td>
  <td style="width: 30%;" title="<%- list[i].taskUsersNames %>"><%- list[i].taskUsersNames %></td>
  <td style="width: 30%;" title="<%- list[i].quickPrintStateName %>"><%- list[i].quickPrintStateName %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="7"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>