<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].topicReportId %>" data-state = "<%- list[i].topicReportState %>" data-number= "<%- list[i].topicReportNum %>" data-name="<%- list[i].topicReportName %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].topicReportName %>"><%- list[i].topicReportName %></td>
  <td title="<%- list[i].topicReportDepartmentName %>"><%- list[i].topicReportDepartmentName %></td>
  <td title="<%- list[i].topicReportNum %>"><%- list[i].topicReportNum %></td>
  <td title="<%- list[i].topicReportDatetime %>"><%- list[i].topicReportDatetime %></td>
  <% if(list[i].topicReportState === '1') { %>
  	<td>待上报</td>
  <% } else { %>
  	<td>已完成</td>
  <% } %>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="7"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>