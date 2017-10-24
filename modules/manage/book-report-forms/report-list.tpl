<!--汉文-图书季报--报告列表-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-reportId="<%- list[i].statisticsReportId %>" data-reportName="<%- list[i].statisticsReportName %>" data-bookNum="<%- list[i].statisticsReportNum %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].statisticsReportName %>"><%- list[i].statisticsReportName %></td>
  <td title="<%- list[i].statisticsReportNum %>" class="bookNum"><%- list[i].statisticsReportNum %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="4"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>