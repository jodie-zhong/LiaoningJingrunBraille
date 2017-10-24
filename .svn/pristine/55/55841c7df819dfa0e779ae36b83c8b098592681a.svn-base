<% if(list && list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].departmentId %>" data-name="<%- list[i].departmentName %>">
  <td><%- (i + 1) %></td>
  <td><%- list[i].departmentName %></td>
  <td><%- list[i].departmentUserNum %></td>
  <td><button class="btn btn-rounded btn-xs btn-default">选择</button></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="4"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>