<!--成本预算-成本预算设置-列表-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-id="<%- list[i].costSetId %>">
  <td data-name="orderNo"><%- (i + 1) %></td>
  <td>
    <input class="form-control" value="<%- list[i].costSetName %>" name="costSetName" placeholder="档位名称" maxlength="32" title="<%- list[i].costSetName %>" readonly/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].numberGroup %>" name="numberGroup" placeholder="社组选" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].numberMarket %>" name="numberMarket" placeholder="市场书" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].numberLargePrint %>" name="numberLargePrint" placeholder="大字本" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].firstAuditOne %>" name="firstAuditOne" placeholder="甲" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].firstAuditTwo %>" name="firstAuditTwo" placeholder="乙" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td><input class="form-control" value="<%- list[i].firstAuditThree %>" name="firstAuditThree" placeholder="丙" maxlength="9"
             pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].secondAuditOne %>" name="secondAuditOne" placeholder="甲" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].secondAuditTwo %>" name="secondAuditTwo" placeholder="乙" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control" value="<%- list[i].secondAuditThree %>" name="secondAuditThree" placeholder="丙" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].thirdAudit %>" name="thirdAudit" placeholder="三审(元/千字)" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].costSetCheck %>" name="costSetCheck" placeholder="质检(元/千字)" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].coverDesign %>" name="coverDesign" placeholder="封面设计(元/种)" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].authorPayment %>" name="authorPayment" placeholder="作者稿酬" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
  <td>
    <input class="form-control digitalInput" value="<%- list[i].editingAffairsCost %>" name="editingAffairsCost" placeholder="编务费(元/种)" maxlength="9"
           pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于0的数字（最大2位小数）"/>
  </td>
</tr>
<% } %>
<% } %>