<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].userId %>" data-name = "<%- list[i].userName %>" data-use="<%- list[i].isUse %>">
	<td><%- (i + 1) %></td>
	<td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
	<td title="<%- list[i].userName %>"><%- list[i].userName %></td>
	<td title="<%- list[i].userLoginName %>"><%- list[i].userLoginName %></td>
	<td title="<%- list[i].userPhone %>"><%- list[i].userPhone %></td>
	<td title="<%- list[i].departmentName %>"><%- list[i].departmentName %></td>
	<td title="<%- list[i].roleName %>"><%- list[i].roleName %></td>
	<% if(list[i].isUse === 1) { %>
	<td>在职</td>
	<% } else { %>
	<td>离职</td>
	<% } %>
</tr>
<% } %><% } else { %>
<tr>
	<td colspan="8"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>

