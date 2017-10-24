<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].departmentId %>">
  <td><%- (i + 1) %></td>
  <!--<td><input type="checkbox"></td>-->
  <td title="<%- list[i].departmentName %>"><%- list[i].departmentName %></td>
  <td title="<%- list[i].departmentUserNum %>"><%- list[i].departmentUserNum %></td>
  <td title="<%- list[i].departmentPhone %>"><%- list[i].departmentPhone %></td>
  <td title="<%- list[i].departmentPrincipalName %>"><%- list[i].departmentPrincipalName %></td>
  <td title="<%- list[i].departmentLeaderName %>"><%- list[i].departmentLeaderName %></td>
</tr>
<% } %>