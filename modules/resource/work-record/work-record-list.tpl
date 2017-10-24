<!-- 工作记录库 -->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].logId %>">
	<td><%- (i + 1) %></td>
	<td title="<%- list[i].userName %>"><%- list[i].userName %></td>
	<td title="<%- list[i].departmentName %>"><%- list[i].departmentName %></td>
	<td title="<%- list[i].handleDatetime %>"><%- list[i].handleDatetime %></td>
	<td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
	<td title="<%- list[i].workModuleOne %>"><%- list[i].workModuleOne %></td>
	<td title="<%- list[i].workModuleTwo %>"><%- list[i].workModuleTwo %></td>
	<td title="<%- list[i].flowName %>"><%- list[i].flowName %></td>
</tr>
<% } %>
<% } else { %>
<tr>
	<td colspan="8">
		<p class="empty-tips">没有符合指定条件的数据</p>
	</td>
</tr>
<% } %>