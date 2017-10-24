<% for(var i = 0; i < listchild.length; i++) { %>
<tr data-id="<%- listchild[i].codeId %>" data-use="<%- listchild[i].isUse %>">
  <td style="width: 50px;"><%- (i + 1) %></td>
  <td style="width: 25%;"><%- listchild[i].value %></td>
  <td style="width: 25%;"><%- listchild[i].code %></td>
  <td style="width: 25%;"><%- listchild[i].remark %></td>
  <% if(listchild[i].isUse === '1') { %>
  <td style="width: 25%;">可用</td>
  <% } else { %>
  <td style="width: 25%;">不可用</td>
  <% } %>
</tr>
<% } %>
