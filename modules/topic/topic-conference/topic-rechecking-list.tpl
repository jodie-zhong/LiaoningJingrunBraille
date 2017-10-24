<% if(list.length> 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].topicId %>" data-topicRepId="<%- list[i].topicReportId %>" data-relationId="<%- list[i].topicReportRelationId %>">
  <td class="w-table"><%- (i + 1) %></td>
  <td style="width: 20%;text-decoration:underline;cursor:pointer " class="topic-name"
      title="<%- list[i].topicDetailName %>"><%-
    list[i].topicDetailName
    %></td>
  <td style="width: 20%" title="<%- list[i].topicDetailOldAuthor %>"><%- list[i].topicDetailOldAuthor %></td>
  <td style="width: 20%" title="<%- list[i].topicDetailWorkWay %>"><%- list[i].topicDetailWorkWay %></td>
  <td style="width: 20%" title="<%- list[i].topicDetailWords %>"><%- list[i].topicDetailWords %></td>
  <td class="w-100" title="<%- list[i].topicDetailOldPublishingHouse %>"><%- list[i].topicDetailOldPublishingHouse %></td>
  <td class="w-100" title="<%- list[i].topicDetailOldPublicationDate %>"><%- list[i].topicDetailOldPublicationDate %></td>
  <td class="w-100" title="<%- list[i].topicDetailOneKindName %>"><%- list[i].topicDetailOneKindName %></td>
  <td class="w-100"></td>
  <td class="w-100"><input style="margin: 0" type="checkbox" class="btn btn-primary btn-xs reportSearch">放弃</td>
</tr>
<% } %>
<% } else { %>
<tr>
  <td colspan="10"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>