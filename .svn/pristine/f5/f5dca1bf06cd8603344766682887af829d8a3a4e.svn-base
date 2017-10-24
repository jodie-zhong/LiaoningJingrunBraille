<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].editIdAndStateEntity.bookEditTprStatisticsId %>" data-name="<%- list[i].bookName %>"
    data-bookIdOnly="<%- list[i].bookId %>"
    data-taskState="<%- list[i].taskState %>"
    data-deploy="<%- list[i].bookDeploymentKey %>" data-taskId="<%- list[i].taskId %>"
    data-taskUsers="<%- list[i].taskUsers %>" data-users="<%- list[i].taskUsers %>"
    data-state="<%- list[i].editIdAndStateEntity.bookEditTprStatisticsState %>">
  <td ><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- list[i].bookOneKind %>"><%- list[i].bookOneKind %></td>
  <td title="<%- list[i].bookIsbn %>"><%- list[i].bookWordsNum %></td>
  <td title="<%- list[i].bookDetailAuthor %>"><%- list[i].dutyEditor %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td  colspan="6"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
