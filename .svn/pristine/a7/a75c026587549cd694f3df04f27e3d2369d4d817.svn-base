<% if(list && list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].roleId %>" data-name="<%- list[i].roleName %>">
  <td><%- (i + 1) %></td>
  <td><%- list[i].roleName %></td>
  <td><%- list[i].roleDesc %></td>
  <td><button class="btn btn-rounded  btn-xs btn-default">选择</button></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="4"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>