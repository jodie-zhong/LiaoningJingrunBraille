<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-topicId="<%- list[i].topicId %>" data-deploy="<%- list[i].bookDeploymentKey %>" data-bookId="<%- list[i].bookId %>" data-taskState="<%- list[i].taskState %>"
    data-flowId="<%- list[i].flowId %>" data-taskId="<%- list[i].taskId %>" data-urgent="<%- list[i].bookIsUrgent %>" data-users="<%- list[i].taskUsers %>"
    data-taskNextUserId="<%- list[i].taskNextUserId %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- list[i].bookTypeName %>"><%- list[i].bookTypeName %></td>
  <td title="<%- list[i].submitDatetime %>"><%- list[i].submitDatetime %></td>
  <td title="<%- list[i].bookRecommendTypeName %>"><%- list[i].bookRecommendTypeName %></td>
  <td>
    <% if(list[i].bookIsUrgent === '2') { %>
    是
    <% } else if(list[i].bookIsUrgent === '1') { %>
    否
    <% } %>
  </td>
  <td title="<%- list[i].taskUserNames %>"><%- list[i].taskUserNames %></td>
  <td title="<%- list[i].bookStateName %>"><%- list[i].bookStateName %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="9"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>