<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr>
 	<td><%- (i + 1) %></td>
 	<td title="<%- list[i].mWorkloadDatetime %>"><%- list[i].mWorkloadDatetime %></td>
 	<td title="<%- list[i].taskName %>"><%- list[i].taskName %></td>
 	<td title="<%- list[i].mWorkloadMachineModel %>"><%- list[i].mWorkloadMachineModel %></td>
 	<td title="<%- list[i].mWorkloadOpenNum %>"><%- list[i].mWorkloadOpenNum %></td>
 	<td title="<%- list[i].mWorkloadVersionNum %>"><%- list[i].mWorkloadVersionNum %></td>
 	<td title="<%- list[i].mWorkloadPaperNum %>"><%- list[i].mWorkloadPaperNum %></td>
 	<td title="<%- list[i].mWorkloadErrorRate %>"><%- list[i].mWorkloadErrorRate %></td>
</tr>
<% } %> 					
<% } else { %>
<tr>
	<td colspan="8"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>