<% if(info.length > 0) { %>
<% for(var i = 0; i < info.length; i++) { %>
<tr data-id="<%- info[i].topicId %>">
  <td class="w-table"><%- (i + 1) %></td>
  <td class="w-table" data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td style="width: 15%" title="<%- info[i].topicDetailName %>"><%- info[i].topicDetailName %></td>
  <td style="width: 10%" title="<%- info[i].topicDetailOldAuthor %>"><%- info[i].topicDetailOldAuthor %></td>
  <td style="width: 10%" title="<%- info[i].topicDetailWorkWay %>"><%- info[i].topicDetailWorkWay %></td>
  <td style="width: 10%" title="<%- info[i].topicDetailWords %>"><%- info[i].topicDetailWords %></td>
  <td style="width: 10%" title="<%- info[i].topicDetailOldPublishingHouse %>"><%- info[i].topicDetailOldPublishingHouse %></td>
  <td style="width: 15%" title="<%- info[i].topicDetailOldPublicationDate %>"><%-
    info[i].topicDetailOldPublicationDate %></td>
  <td style="width: 15%" title="<%- info[i].topicDetailOneKindName %>-<%- info[i].topicDetailTwoKindName %>"><%- info[i].topicDetailOneKindName %>-<%- info[i].topicDetailTwoKindName %></td>
  <td style="width: 15%" title="<%- info[i].createUserName %>"><%- info[i].createUserName %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="12"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>