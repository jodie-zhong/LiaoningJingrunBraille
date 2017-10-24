<!--清样稿管理-图书印制单-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.handleState === '1' ? '通过' : '不通过' %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核人</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.submitUserName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.handleContentOne %></p>
        </div>
      </div>
    </div>
  </div>
</div>
<!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.handleState === '1' ? '通过' : '不通过' %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核人</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.submitUserName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.handleContentOne %></p>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>