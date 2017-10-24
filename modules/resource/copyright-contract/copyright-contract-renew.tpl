<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-contractId = "<%- list[i].contractSignId %>" data-isUse = "<%- list[i].renewState %>">
  <td width="50px"><%- (i + 1) %></td>
  <td title="<%- list[i].renewUserName %>"><%- list[i].renewUserName %></td>
  <td title="<%- list[i].roleName %>"><%- list[i].roleName %></td>
  <td width="100px" title="<%- list[i].renewDate %>"><%- list[i].renewDate %></td>
  <% if(!list[i].renewState || list[i].renewState === '1' ) { %>
  <td width="80px">未提交</td>	
  <% } else if(list[i].renewState === '2' ) { %>
  <td width="80px">已续约</td>		
  <% } %>
  <td title="<%- list[i].remark %>"><%- list[i].remark %></td>
  <td width="75px"><button class="btn btn-xs btn-white btn-rounded task-detail-btn" data-id = "<%- list[i].contractSignId %>" data-type = "check">查看</button></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect = "true">
	<td colspan="7"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>	
<% } %>
