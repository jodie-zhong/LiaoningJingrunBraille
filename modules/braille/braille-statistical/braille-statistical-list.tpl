<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr style="height: 50px">
    <td><%- (i + 1) %></td>
    <td title="<%- list[i].bookOneKind %>"><%- list[i].bookOneKind %></td>
    <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
</tr>
<% } %>
<% } else { %>
<tr style="height: 50px" data-noselect="true">
    <td colspan="3"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>