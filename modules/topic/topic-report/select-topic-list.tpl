<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].topicId %>" data-name="<%- list[i].topicDetailName %>">
  <td style="width: 6%" class="w-table"><%- (i + 1) %></td>
  <td style="width: 6%" class="w-table" data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td style="width: 25%;" title="<%- list[i].topicDetailName %>"><%- list[i].topicDetailName %></td>
  <td style="width: 15%;" title="<%- list[i].submitDatetime %>"><%- list[i].submitDatetime %></td>
  <td style="width: 15%;" title="<%- list[i].topicDetailOldAuthor %>"><%- list[i].topicDetailOldAuthor %></td>
  <td style="width: 10%;" title="<%- list[i].topicDetailWords %>"><%- list[i].topicDetailWords %></td>
  <td style="width: 10%;" title="<%- list[i].topicDetailOneKindName %>"><%- list[i].topicDetailOneKindName %></td>
  <td style="width: 13%;" title="<%- list[i].createUserName %>"><%- list[i].createUserName %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="8"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>