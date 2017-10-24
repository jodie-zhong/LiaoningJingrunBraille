<!--译校通读众包管理列表-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].tprTaskId %>" data-name="<%- list[i].bookName %>" data-bookId="<%- list[i].bookId %>" data-tprTaskGetUserIds="<%- list[i].tprTaskGetUserIds %>"
    data-flowName="<%- list[i].tprTaskFlowName %>" data-taskContent="<%- list[i].tprTaskContent %>" data-tprTaskState="<%- list[i].tprTaskState %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-circle-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- list[i].tprTaskFlowName %>"><%- list[i].tprTaskFlowName %></td>
  <td title="<%- list[i].dutyEditor %>"><%- list[i].dutyEditor %></td>
  <td title="<%- list[i].tprTaskUserName %>" data-id="<%- list[i].tprTaskUserId%>"><%- list[i].tprTaskUserName %></td>
  <td title="<%- list[i].tprTaskGetUserNames %>"><%- list[i].tprTaskGetUserNames %></td>
  <td><%- (list[i].tprTaskUseCount - list[i].receivedCount) %>/<%- list[i].tprTaskUseCount %></td>
  <td title="<%- list[i].tprTaskDatetime %>"><%- list[i].tprTaskDatetime %></td>
  <td title="<%- list[i].tprTaskContent %>"><%- list[i].tprTaskContent %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="10"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>