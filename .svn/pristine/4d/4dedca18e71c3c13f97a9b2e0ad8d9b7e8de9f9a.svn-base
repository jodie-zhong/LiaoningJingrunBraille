<% if(list && list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr>
  <td style="width: 50px;"><%- (i + 1) %></td>
  <td style="width: 20%;" title="<%- list[i].taskName %>"><%- list[i].taskName %></td>
  <td style="width: 20%;" title="<%- list[i].userName %>"><%- list[i].userName %></td>
  <td style="width: 20%;" title="<%- list[i].submitDatetime %>"><%- list[i].submitDatetime %></td>
  <td style="width: 20%;" title="<%- list[i].updateDatetime %>"><%- list[i].updateDatetime %></td>
  <td style="width: 20%;" title="<%- list[i].handleStateName %>"><%- list[i].handleStateName %></td>
  <td style="width: 100px;">
    <button class="btn btn-xs btn-white btn-rounded task-detail-btn" data-taskId="<%- list[i].taskId %>"
            data-flowId="<%- list[i].flowId %>" data-deploy="<%- list[i].deploymentKey %>" data-styleBookGetId="<%- list[i].stylebookGetId %>"
            data-bookId="<%- list[i].bookId %>" data-isbncipApplyId="<%- list[i].isbncipApplyId %>">查看
    </button>
  </td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="7"><p class="empty-tips">没有符合指定条件的数据或未选择任何图书</p></td>
</tr>
<% } %>