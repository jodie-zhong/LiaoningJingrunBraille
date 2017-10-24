<% if(list && list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].userId %>" data-name="<%- list[i].userName %>">
  <td><%- (i + 1) %></td>
  <td><%- list[i].userName %></td>
  <td><%- list[i].departmentName %></td>
  <td><%- list[i].roleName %></td>
  <% if(list[i].isUse == '1') { %>
  <td>是</td>
  <% } else { %>
  <td>否</td>
  <% } %>
  <td><button class="btn btn-rounded btn-xs btn-default">选择</button></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="5"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>