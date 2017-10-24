<% if(list && list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].departmentId %>" data-name="<%- list[i].departmentName %>" data-check="check">
  <td><%- (i + 1) %></td>
  <% if(ids.indexOf(list[i].departmentId) >= 0) { %>
  <td><i class="fa fa-check-square-o" data-action="check"></i></td>
  <% } else { %>
  <td><i class="fa fa-square-o" data-action="check"></i></td>
  <% } %>
  <td><%- list[i].departmentName %></td>
  <td><%- list[i].departmentUserNum %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="4"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>