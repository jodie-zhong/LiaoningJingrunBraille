<% if(roll.length > 0) { %>
<% for(var i = 0; i < roll.length; i++) { %>
<tr data-id="<%- roll[i].stylebookGetId %>" data-bookId="<%- roll[i].bookId %>" data-deploy="<%- roll[i].deploy %>"
    data-taskId="<%- roll[i].taskId %>" data-users="<%- roll[i].taskUsers %>" data-taskNum="<%- roll[i].taskNum %>"
    data-taskState="<%- roll[i].taskState %>" >
  <td style="width: 50px;"><%- (i + 1) %></td>
  <td style="width: 20%;"><%- roll[i].userName %></td>
  <td style="width: 20%;"><%- roll[i].stylebookGetDatetime %></td>
  <td style="width: 20%;"><%- roll[i].stylebookGetNum %></td>
  <% if(roll[i].taskState==='2'){ %>
  <td style="width: 20%;">已完成</td>
  <% }else{ %>
  <td style="width: 20%;"><%- roll[i].taskStateName %></td>
  <% } %>
  <td style="width:20%" class="viewTd">
   <% if(roll[i].taskNum==='0'){ %>
    <button class="btn btn-default btn-rounded btn-xs reportSearch btnView" data-bookId="<%- roll[i].bookId %>"
            data-id="<%- roll[i].stylebookGetId %>" data-taskId="<%- roll[i].taskId %>" data-taskNum="<%- roll[i].taskNum %>" disabled>查看
    </button>
    <% }else{  %>
    <button class="btn btn-default btn-rounded btn-xs reportSearch btnView" data-bookId="<%- roll[i].bookId %>"
            data-id="<%- roll[i].stylebookGetId %>" data-taskId="<%- roll[i].taskId %>" data-taskNum="<%- roll[i].taskNum %>">查看
    </button>
    <% }  %>
  </td>
</tr>
<% } %>
<% } else { %>
<tr>
  <td colspan="11"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>