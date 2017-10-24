<% if(list && list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].userId %>" data-name="<%- list[i].userName %>">
  <td><%- (i + 1) %></td>
  <% if(ids.indexOf(list[i].userId) >= 0) { %>
  <td data-check="true"><i class="fa fa-check-square-o" data-action="check"></i></td>
  <% } else { %>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <% } %>
  <td><%- list[i].userName %></td>
  <td><%- list[i].departmentName %></td>
  <td><%- list[i].roleName %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="6"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>