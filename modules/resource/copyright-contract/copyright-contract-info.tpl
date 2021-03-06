<!-- 版权合同库 -->
<% if(info) { %>
<div class="form-horizontal">
  <div class="form-group">
    <label class="col-xs-4 control-label">录入人</label>
    <div class="col-xs-8">
      <p class="form-control-static"><%- info.writeUserName %></p>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">录入人职务</label>
    <div class="col-xs-8">
      <p class="form-control-static"><%- info.writeRoleName %></p>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">录入日期</label>
    <div class="col-xs-8">
      <p class="form-control-static"><%- info.writeStartDate %></p>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">审核人</label>
    <div class="col-xs-8">
      <p class="form-control-static"><%- info.checkUserName %></p>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">审核人职务</label>
    <div class="col-xs-8">
      <p class="form-control-static"><%- info.checkRoleName %></p>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">审核日期</label>
    <div class="col-xs-8">
      <p class="form-control-static"><%- info.checkDate %></p>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">到期日期</label>
    <div class="col-xs-8">
      <p class="form-control-static"><%- info.writeEndDate %></p>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">备注</label>
    <div class="col-xs-8">
      <pre class="form-control-static"><%- info.remark %></pre>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">合同附件</label>
    <div class="col-xs-8">
      <button class="btn btn-xs btn-success" type="button" style="margin: 8px 0 0;" data-id = "<%- info.contractSignId %>" data-type = "check">查看</button>
    </div>
  </div>
</div>
<% } else { %>
<p>请选择一条合同信息</p>	
<% } %>

