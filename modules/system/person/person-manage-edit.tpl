<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header">
        <h3><i class="fa fa-user-o"></i> 人员<%- info.userLoginName?'修改':'新增' %></h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formPersonEdit">
          <div class="row">
            <% if(!info.userName ) { %>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">登录账号 <span class="must">*</span></label>
                <div class="col-xs-8" style="position: relative">
                  <input type="text" maxlength="16" value="<%- info.userLoginName %>" name="userLoginName" class="form-control" pattern="^[a-zA-Z0-9]{3,16}$" data-fv-notempty="true"
                         data-fv-notempty-message="请填写登录账号" data-fv-regexp-message="请输入3-16位登录账号 不区分大小写 只支持数字、字母">
                  <i class="repeat-name fa fa-chevron-circle-down" style="position: absolute;right: 20px;top: 10px;display:
								none"
                     aria-hidden="true"></i>
                </div>
              </div>
            </div>
            <% } else { %>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">登录账号 <span class="must">*</span></label>
                <div class="col-xs-8">
                  <input type="text" maxlength="16" value="<%- info.userLoginName %>" name="userLoginName" class="form-control" pattern="^[a-zA-Z0-9]{3,16}$"
                         data-fv-regexp-message="请输入3-16位登录账号 区分大小写 只支持数字、字母" readonly>
                </div>
              </div>
            </div>
            <% } %>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">用户姓名 <span class="must">*</span></label>
                <div class="col-xs-8">
                  <input type="text" maxlength="32" value="<%- info.userName %>" name="userName" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请填写用户姓名">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">所属部门 <span class="must">*</span></label>
                <div class=" col-xs-8">
                  <div class="input-group with-clear departmentId">
                    <input type="text" class="form-control" name="departmentId" value="<%- info.departmentName %>" data-value="<%- info.departmentId %>" placeholder="所属部门" readonly
                           data-fv-notempty="true" data-fv-notempty-message="请选择所属部门">
                    <span class="input-group-btn">
                    <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                    <button class="btn btn-default" type="button"
                            data-open="public/department/select-department"
                            data-data="{}"><i class="fa fa-sitemap"></i></button>
                  </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">角色 <span class="must">*</span></label>
                <div class=" col-xs-8">
                  <div class="input-group with-clear">
                    <input type="text" class="form-control" name="roleId" value="<%- info.roleName %>" data-value="<%- info.roleId %>" placeholder="角色" readonly data-fv-notempty="true"
                           data-fv-notempty-message="请选择角色">
                    <span class="input-group-btn">
                    <button class="btn btn-clear" type="button" data-action="clear"><i
                        class="fa fa-remove box"></i></button>
                    <button class="btn btn-default" type="button" id="role" data-data="{}"><i class="fa fa-graduation-cap"></i></button>
                  </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">用户手机</label>
                <div class=" col-xs-8">
                  <input type="text" maxlength="11" pattern="^1[3|4|5|7|8][0-9]\d{8}$" value="<%- info.userPhone %>" name="userPhone" class="form-control" data-fv-regexp-message="请输入正确的11位手机号">
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">办公室电话</label>
                <div class=" col-xs-8">
                  <input type="text" maxlength="12" pattern="(^(0\d{2,3}-\d{7,8})$)|(^0[1-9]\d{8,10}$)|(^[1-9]\d{6,7}$)|(^1[3|4|5|7|8][0-9]\d{8}$)" value="<%- info.officeTelephone %>"
                         name="officeTelephone" class="form-control" data-fv-regexp-message="请输入正确的电话号">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">出生年月</label>
                <div class=" col-xs-8">
                  <input type="text" value="<%- info.userBir %>" maxlength="20" name="userBir" class="form-control date-time">
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">性别</label>
                <div class=" col-xs-8">
                  <label class="radio-inline">
                    <% if(!info.userSex || info.userSex === '1') { %>
                    <input type="radio" name="userSex" value="1" checked data-fv-notempty="true"> 男
                    <% } else { %>
                    <input type="radio" name="userSex" value="1" data-fv-notempty="true"> 男
                    <% } %>
                  </label>
                  <label class="radio-inline">
                    <% if(info.userSex === '2') { %>
                    <input type="radio" name="userSex" value="2" checked data-fv-notempty="true"> 女
                    <% } else { %>
                    <input type="radio" name="userSex" value="2" data-fv-notempty="true"> 女
                    <% } %>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">邮件地址</label>
                <div class="col-xs-8">
                  <input type="email" maxlength="32" value="<%- info.userEmail %>" name="userEmail" class="form-control">
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">身份证号码</label>
                <div class=" col-xs-8">
                  <input type="text" maxlength="18" pattern="(^\d{18}$)|(^\d{17}(\d|X|x)$)" value="<%- info.userIdCard %>" name="userIdCard" class="form-control" data-fv-regexp-message="请输入正确的身份证号码">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">职称 </label>
                <div class=" col-xs-8">
                  <input type="text" maxlength="32" value="<%- info.userTitle %>" name="userTitle" class="form-control">
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">专业 </label>
                <div class=" col-xs-8">
                  <input type="text" maxlength="32" value="<%- info.userSpecialty %>" name="userSpecialty" class="form-control">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <% if(!info.userName) { %>
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">密码 <span class="must">*</span></label>
                <div class=" col-xs-8">
                  <input type="password" maxlength="16" pattern="^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{8,16}$" value="<%- info.userPwd %>" name="userPwd" class="form-control" id="inputPassword" autocomplete="new-password"
                         data-fv-notempty="true" data-fv-notempty-message="请输入密码" data-fv-regexp-message="8-16位 区分大小写 只支持数字、字母">
                </div>
              </div>
            </div>
            <% } else { %>
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">密码 </label>
                <div class=" col-xs-8">
                  <input type="password" maxlength="16" pattern="^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{8,16}$" value="<%- info.userPwd %>" name="userPwd" class="form-control" id="inputPassword" autocomplete="new-password"
                         data-fv-regexp-message="8-16位 区分大小写 只支持数字、字母">
                </div>
              </div>
            </div>
            <% } %>
            <% if(!info.userName) { %>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">确认密码 <span class="must">*</span></label>
                <div class="col-xs-8">
                  <input type="password" class="form-control" id="inputPasswordConfirm" maxlength="32" name="confirmPassword" data-fv-notempty="true" data-fv-notempty-message="请确认密码"
                         autocomplete="off" data-fv-identical="true" data-fv-identical-field="userPwd" data-fv-identical-message="密码输入不一致请重新输入"/>
                </div>
              </div>
            </div>
            <% } else { %>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">确认密码</label>
                <div class="col-xs-8">
                  <input type="password" class="form-control" id="inputPasswordConfirm" maxlength="32" name="confirmPassword" autocomplete="off" data-fv-identical="true"
                         data-fv-identical-field="userPwd" data-fv-identical-message="密码输入不一致请重新输入"/>
                </div>
              </div>
            </div>
            <% } %>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">头像</label>
                <div class="col-xs-8">
                  <div class="input-group with-clear">
                    <input type="text" class="form-control" name="userHead" value="<%- info.userHead %>" data-id="<%- info.userHead %>" placeholder="头像" readonly>
                    <span class="input-group-btn">
                    					<button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                    					<button class="btn btn-default" type="button" data-open="public/file/file-upload"
                                      data-data='{"type": "*.jpg;*.jpeg;*.png"}'><i class="fa fa-file-o"></i></button>
                  					</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row" data-type="img">
            <div class="col-xs-6">
              <div class="form-group">
                <img id="previewUserHead" src="" style="width: 100px; height: 100px; display: block; margin: 0 auto;"/>
              </div>
            </div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-primary" id="btnPersonSave">保存</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>