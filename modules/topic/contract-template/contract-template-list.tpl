<% for(var i = 0; i < list.length; i++) { %>
<tr data-id = "<%- list[i].contractTemplateId %>">
	<td><%- (i + 1) %></td>
    <td><%- list[i].contractTemplateName %></td>
    <td><%- list[i].contractTemplateNum %></td>
    <td><%- list[i].createUserName %></td>
    <td><%- list[i].createDatetime %></td>
    <td><%- list[i].updateUserName %></td>
    <td><%- list[i].updateDatetime %></td>
    <td><%- list[i].contractTemplateRemark %></td>
    <td><button>下载</button></td>
</tr>
<% } %>