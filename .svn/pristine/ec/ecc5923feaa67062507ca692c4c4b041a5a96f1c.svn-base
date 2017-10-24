<!--社内表-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].jobOutsideId %>" data-name="<%- list[i].jobOutsideName %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].jobOutsideName %>"><%- list[i].jobOutsideName %></td>
  <td title="<%- list[i].jobOutsideIdCard %>"><%- list[i].jobOutsideIdCard %></td>
  <td title="<%- list[i].jobOutsideMoney %>"><%- list[i].jobOutsideMoney %></td>
  <td title="<%- list[i].jobOutsideTax %>"><%- list[i].jobOutsideTax %></td>
  <td title="<%- list[i].jobOutsideRealMoney %>"><%- list[i].jobOutsideRealMoney %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="7"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>