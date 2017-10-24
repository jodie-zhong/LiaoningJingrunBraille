<!--日志管理列表-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].logId %>">
	<td>
		<%- (i + 1) %>
	</td>
	<td title="<%- list[i].operationName %>">
		<%- list[i].operationName %>
	</td>
	<td title="<%- list[i].operationContent %>">
		<%- list[i].operationContent %>
	</td>
	<td>
		<%- list[i].operationTime %>
	</td>
	<td>
		<%- list[i].computerIp %>
	</td>
</tr>
<% } %>
<% } else { %>
<tr>
	<td colspan="5">
		<p class="empty-tips">没有符合指定条件的数据</p>
	</td>
</tr>
<% } %>