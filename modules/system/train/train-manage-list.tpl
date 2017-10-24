<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].trainId %>" data-name="<%- list[i].trainName %>" data-state="<%- list[i].trainState %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].trainName %>"><%- list[i].trainName %></td>
  <td title="<%- list[i].trainNum %>"><%- list[i].trainNum %></td>
  <td title="<%- list[i].trainUnitName %>"><%- list[i].trainUnitName %></td>
  <td title="<%- list[i].trainDatetime %>"><%- list[i].trainDatetime %></td>
  <td title="<%- list[i].trainContent %>"><%- list[i].trainContent %></td>
  <td title="<%- list[i].trainFormName %>"><%- list[i].trainFormName %></td>
  <td title="<%- list[i].trainHour %>"><%- list[i].trainHour %></td>
  <td title="<%- list[i].trainIntegral %>"><%- list[i].trainIntegral %></td>
  <% if(list[i].trainState === '1') { %>
  <td>未提交</td>
  <% } else { %>
  <td>已提交</td>
  <% } %>
</tr>
<% } %>
<% } else { %>
<tr>
  <td colspan="11"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>