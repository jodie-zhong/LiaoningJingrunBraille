<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].editIdAndStateEntity.bookEditTprStatisticsId %>" data-name="<%- list[i].bookName %>"
    data-bookIdOnly="<%- list[i].bookId %>"
    data-taskState="<%- list[i].taskState %>"
    data-deploy="<%- list[i].bookDeploymentKey %>" data-taskId="<%- list[i].taskId %>"
    data-taskUsers="<%- list[i].taskUsers %>" data-users="<%- list[i].taskUsers %>"
    data-state="<%- list[i].editIdAndStateEntity.bookEditTprStatisticsState %>">
  <td ><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- list[i].bookOneKind %>"><%- list[i].bookOneKind %></td>
  <!--末交一次-->
  <td>
    <% for(var j = 0; j < list[i].lastRevisalOneVersionNumList.length; j++) { %>
    <div title="<%- list[i].lastRevisalOneVersionNumList[j].handleUserName %>"><%- list[i].lastRevisalOneVersionNumList[j].handleUserName %></div>
    <% } %>
  </td>
  <td>
    <% for(var j = 0; j < list[i].lastRevisalOneVersionNumList.length; j++) { %>
    <div title="<%- list[i].lastRevisalOneVersionNumList[j].bookWrongVersionNum %>"><%- list[i].lastRevisalOneVersionNumList[j].bookWrongVersionNum %></div>
    <% } %>
  </td>
  <!--末交二次-->
  <td>
    <% for(var j = 0; j < list[i].lastRevisalTwoVersionNumList.length; j++) { %>
    <div title="<%- list[i].lastRevisalTwoVersionNumList[j].handleUserName %>"><%- list[i].lastRevisalTwoVersionNumList[j].handleUserName %></div>
    <% } %>
  </td>
  <td>
    <% for(var j = 0; j < list[i].lastRevisalTwoVersionNumList.length; j++) { %>
    <div title="<%- list[i].lastRevisalTwoVersionNumList[j].bookWrongVersionNum %>"><%- list[i].lastRevisalTwoVersionNumList[j].bookWrongVersionNum %></div>
    <% } %>
  </td>
  <!--通读-->
  <td>
    <% for(var j = 0; j < list[i].readRevisalVersionNumList.length; j++) { %>
    <div title="<%- list[i].readRevisalVersionNumList[j].handleUserName %>"><%- list[i].readRevisalVersionNumList[j].handleUserName %></div>
    <% } %>
  </td>
  <td>
    <% for(var j = 0; j < list[i].readRevisalVersionNumList.length; j++) { %>
    <div title="<%- list[i].readRevisalVersionNumList[j].bookWrongVersionNum %>"><%- list[i].readRevisalVersionNumList[j].bookWrongVersionNum %></div>
    <% } %>
  </td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td  colspan="10"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
