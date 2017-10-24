<!--角色新增-->
<div class="modal-dialog dialog-container" style="width: 500px">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3><i class="fa fa-user-o"></i> 角色管理</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formRoleCreateEdit">
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-3 control-label">角色名称:</label>
                <div class="col-xs-9">
                  <p class="form-control-static"><%-info.roleName %></p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-3 control-label">角色描述<span class="must">*</span></label>
                <div class="col-xs-9">
                  <input type="text" value="<%-info.roleDesc %>" name="roleDesc" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请填写角色描述" maxlength="64"/>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class=" col-xs-3 control-label">所属部门 <span class="must">*</span></label>
                <div class=" col-xs-9">
                  <div class="input-group with-clear">
                    <input type="text" class="form-control" name="departmentId" value="<%- info.departmentName %>"
                           data-value="<%- info.departmentId %>" placeholder="所属部门" readonly
                           data-fv-notempty="true" data-fv-notempty-message="请选择所属部门">
                    <span class="input-group-btn">
                    <button class="btn btn-clear" type="button" data-action="clear"><i
                        class="fa fa-remove box"></i></button>
                    <button class="btn btn-default" type="button" data-open="public/department/select-departments"
                            data-data="{}"><i class="fa fa-sitemap"></i></button>
                  </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-primary" id="btnRoleSave">保存</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>