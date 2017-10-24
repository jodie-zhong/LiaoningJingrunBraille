<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].trainId %>">
<td class="w-table"><%- (i + 1) %></td>
<td class="w-100" title="<%- list[i].trainName %>"><%- list[i].trainName %></td>
<td class="w-150" title="<%- list[i].trainUnitName %>"><%- list[i].trainUnitName %></td>
<td class="w-100" title="<%- list[i].trainDatetime %>"><%- list[i].trainDatetime %></td>
<td class="w-100" title="<%- list[i].trainContent %>"><%- list[i].trainContent %></td>
<td class="w-100" title="<%- list[i].trainFormName %>"><%- list[i].trainFormName %></td>
<td style="width: 80px" title="<%- list[i].trainHour %>"><%- list[i].trainHour %></td>
<td style="width: 80px" title="<%- list[i].trainIntegral %>"><%- list[i].trainIntegral %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="8"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
