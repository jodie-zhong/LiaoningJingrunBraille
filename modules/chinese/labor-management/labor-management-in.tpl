<!--社内表-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].jobnIsideId %>" data-name="<%- list[i].userName %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].userName %>"><%- list[i].userName %></td>
  <td title="<%- list[i].userIdCard  %>"><%- list[i].userIdCard %></td>
  <td title="<%- list[i].jobInsideDays %>"><%- list[i].jobInsideDays %></td>
  <td title="<%- list[i].jobInsideReward %>"><%- list[i].jobInsideReward %></td>
  <td title="<%- list[i].overtimePay %>"><%- list[i].overtimePay %></td>
  <td title="<%- list[i].serviceFee %>"><%- list[i].serviceFee %></td>
  <td title="<%- list[i].benefitAllowance %>"><%- list[i].benefitAllowance %></td>
  <td title="<%- list[i].foodAllowance %>"><%- list[i].foodAllowance %></td>
  <td title="<%- list[i].suburbAllowance %>"><%- list[i].suburbAllowance %></td>
  <td title="<%- list[i].total %>"><%- list[i].total %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="12"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>