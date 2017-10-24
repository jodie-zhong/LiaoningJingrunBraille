<!--资源库-合同模板库-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].contractTemplateId %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].contractTemplateName %>"><%- list[i].contractTemplateName %></td>
  <td>
    <%- list[i].contractTemplateType === '1' ? '版权合同' : (list[i].contractTemplateType === '2' ? '采购合同' : (list[i].contractTemplateType === '3' ? '销售合同' : '')) %>
  </td>
  <td><%- list[i].contractTemplateNum %></td>
  <td><%- list[i].createUserName %></td>
  <td><%- list[i].createDatetime %></td>
  <td><%- list[i].updateUserName %></td>
  <td><%- list[i].updateDatetime %></td>
  <td title="<%- list[i].contractTemplateRemark %>"><%- list[i].contractTemplateRemark %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="10"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>