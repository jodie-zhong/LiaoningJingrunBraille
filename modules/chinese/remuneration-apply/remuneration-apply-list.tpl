<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-hRewardState="<%- list[i].hRewardState %>"
    data-taskState="<%- list[i].taskState %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-circle-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- list[i].bookType %>"><%- list[i].bookType %></td>
  <td>
    <% if( list[i].hRewardState === '0') { %>
    未提交
    <% } %>
    <% if( list[i].hRewardState === '1') { %>
    待提交
    <% } %>
    <% if( list[i].hRewardState === '2') { %>
    已完成
    <% } %>
  </td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="5"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
