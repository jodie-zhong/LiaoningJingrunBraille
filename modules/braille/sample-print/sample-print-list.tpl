<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-bookTopicId="<%- list[i].bookTopicId %>"
    data-deploy="<%- list[i].bookDeploymentKey %>" data-taskState="<%- list[i].taskState %>"
    data-flowId="<%- list[i].flowId %>" data-taskId="<%- list[i].taskId %>" data-urgent="<%- list[i].bookIsUrgent %>" data-users="<%- list[i].taskUsers %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-circle-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- list[i].bookType %>"><%- list[i].bookType %></td>
  <td title="<%- list[i].bookIsbn %>"><%- list[i].bookIsbn %></td>
  <td title="<%- list[i].bookDetailAuthor %>"><%- list[i].bookDetailAuthor %></td>
  <td title="<%- list[i].revision %>"><%- list[i].revision %></td>
  <td title="<%- list[i].dutyEditor %>"><%- list[i].dutyEditor %></td>
  <td title="<%- list[i].versionNum %>"><%- list[i].versionNum %></td>
  <td title="<%- list[i].bookPrice %>"><%- list[i].bookPrice %></td>
  <td title="<%- list[i].libraryNeedNum %>"><%- list[i].libraryNeedNum %></td>
  <td title="<%- list[i].readersServiceneedNum %>"><%- list[i].readersServiceneedNum %></td>
  <td title="<%- list[i].totalPrintNum %>"><%- list[i].totalPrintNum %></td>
  <td title="<%- list[i].totalPrintPaperNum %>"><%- list[i].totalPrintPaperNum %></td>
  <td title="<%- list[i].format %>"><%- list[i].format %></td>
  <td title="<%- list[i].usePaper %>"><%- list[i].usePaper %></td>
  <td title="<%- list[i].pubDate %>"><%- list[i].pubDate %></td>
  <td title="<%- list[i].taskUserNames %>"><%- list[i].taskUserNames %></td>
  <td title="<%- list[i].bookStageState %>"><%- list[i].bookStageState %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="19"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>