<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].topicReportId %>" data-name="<%- list[i].topicReportName %>">
  <td class="w-table"><%- (i + 1) %></td>
  <td style="width: 20%" data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td style="width: 20%" title="<%- list[i].topicReportName %>"><%- list[i].topicReportName %></td>
  <td style="width: 20%" title="<%- list[i].topicReportDepartmentName %>"><%- list[i].topicReportDepartmentName %></td>
  <td style="width: 20%" title="<%- list[i].topicReportNum %>"><%- list[i].topicReportNum %></td>
  <td style="width: 20%" title="<%- list[i].topicReportDatetime %>"><%- list[i].topicReportDatetime %></td>
  <td class="w-100"><button type="button" class="btn btn-default btn-rounded btn-xs reportSearch">查看</button></td>
</tr>
<% } %>
<% } else { %>
<tr>
  <td colspan="7"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>