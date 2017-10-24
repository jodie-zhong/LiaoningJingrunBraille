<!-- 部门管理 -->
<div class="form-horizontal" id="formDeptEdit">
  <!--<div class="form-group">-->
  	<!--<label class="col-xs-4 control-label">部门<%- departmentName?'修改':'新增' %></label>-->
  <!--</div>-->
  <div class="form-group">
    <label class="col-xs-4 control-label">部门名称 <span class="must">*</span></label>
    <div class="col-xs-8">
      <input class="form-control" maxlength="32" type="text" name="departmentName" value="<%- departmentName %>"
             placeholder="部门名称" data-fv-notempty="true" data-fv-notempty-message="请填写部门名称">
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">部门电话 <span class="must">*</span></label>
    <div class="col-xs-8">
      <input class="form-control" maxlength="12"
             pattern="(^(0\d{2,3}-\d{7,8})$)|(^0[1-9]\d{8,10}$)|(^[1-9]\d{6,7}$)|(^1[3|4|5|7|8][0-9]\d{8}$)" type="text"
             name="departmentPhone" value="<%- departmentPhone %>"
             placeholder="部门电话" data-fv-regexp-message="请输入正确的部门电话" data-fv-notempty="true"
             data-fv-notempty-message="请输入电话号码">
      <div class="help-block with-errors"></div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">部门负责人</label>
    <div class="col-xs-8">
      <div class="input-group with-clear">
        <input type="text" class="form-control" name="departmentPrincipal" value="<%- departmentPrincipalName %>"
               data-value="<%- departmentPrincipal %>" placeholder="部门负责人" readonly>
        <span class="input-group-btn">
          <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
          <button class="btn btn-default" type="button" data-open="public/user/select-user" data-data='{"deptIds": "<%- departmentId %>"}'><i
                  class="fa fa-user-o"></i></button>
        </span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-xs-4 control-label">直属领导</label>
    <div class="col-xs-8">
      <div class="input-group with-clear">
        <input type="text" class="form-control" name="departmentLeader" value="<%- departmentLeaderName %>"
               data-value="<%- departmentLeader %>" placeholder="直属领导" readonly>
        <span class="input-group-btn">
          <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
          <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data="{}"><i
                  class="fa fa-user-o"></i></button>
      </span>
      </div>
    </div>
  </div>
</div>