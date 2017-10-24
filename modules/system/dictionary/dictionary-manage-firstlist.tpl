<% for(var i = 0; i < list.length; i++) { %>
<tr data-id = "<%- list[i].codeId %>" data-use = "<%- list[i].isUse %>">
	<td><%- (i + 1) %></td>
    <td><%- list[i].value %></td>
    <td><%- list[i].code %></td>
    <td><%- list[i].remark %></td>
</tr>
<% } %>