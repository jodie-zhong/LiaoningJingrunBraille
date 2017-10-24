<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].bookId %>" data-name="<%- list[i].bookName %>" data-bookTypeCode="<%- list[i].bookTypeCode %>" data-taskId="<%-
    list[i].taskId %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td class="bookType">
    <% if(list[i].bookTypeCode === '1') { %>
    盲文书
    <% } %>
    <% if(list[i].bookTypeCode === '2') { %>
    大字本
    <% } %>
    <% if(list[i].bookTypeCode === '3') { %>
    普通本
    <% } %>
  </td>
  <td><%- list[i].bookName %></td>
</tr>
<% } %>
<% }else{ %>
<tr data-noselect="true">
  <td colspan="4"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>