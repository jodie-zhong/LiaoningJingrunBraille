<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr>
  <td class="w-table"><%- (i + 1) %></td>
  <td style="width: 20%;"><%- list[i].flowName %></td>
  <td style="width: 20%;"><%- list[i].handleUserName %></td>
  <td style="width: 20%;"><%- list[i].submitDatetime %></td>
  <td style="width: 20%;"><%- list[i].handleDatetime %></td>
  <td style="width: 20%;"><%- list[i].handleStateName %></td>
  <td style="width: 100px;">
    <button class="btn btn-xs btn-white btn-rounded task-detail-btn" data-taskId="<%- list[i].taskId %>" data-printId="<%- list[i].bookPrintId %>" data-bookId="<%- list[i].bookId %>" data-flowId="<%- list[i].flowId %>" data-deploy="<%- list[i].deploymentKey %>">查看</button>
  </td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="7"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
