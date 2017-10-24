<!--资源库-库存管理-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].id %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-circle-o" data-action="check"></i></td>
  <td><%- list[i].shudaihao %></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td><%- list[i].danjia %></td>
  <td><%- list[i].chubanriqi %></td>
  <td><%- list[i].kucunceshu %></td>
  <td><%- list[i].kucunmayang %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="8"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>