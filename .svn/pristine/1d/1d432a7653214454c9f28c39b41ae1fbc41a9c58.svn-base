<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id = "<%- list[i].bookAndTopicId %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].bookAndTopicName %>"><%- list[i].bookAndTopicName %></td>
  <td title="<%- list[i].bookType %>"><%- list[i].bookType %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="4"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>