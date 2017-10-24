<div class="row">
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">登录账号 <span class="must">*</span></label>
      <div class="col-xs-8">
        <input type="text" value="<%- info.userLoginName %>" name="userLoginName" class="form-control" readonly/>
        <div class="help-block with-errors"></div>
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">用户姓名 <span class="must">*</span></label>
      <div class="col-xs-8">
        <input type="text" value="<%- info.userName %>" name="userName" class="form-control"
               data-fv-notempty="true" maxlength="32" data-fv-notempty-message="请填写用户姓名"/>
        <div class="help-block with-errors"></div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">用户手机</label>
      <div class="col-xs-8">
        <input type="text" maxlength="11" pattern="^1[3|4|5|7|8][0-9]\d{8}$" value="<%- info.userPhone %>"
               data-fv-regexp-message="请输入正确的11位手机号" name="userPhone" class="form-control">
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="form-group">
      <label class=" col-xs-4 control-label">办公室电话</label>
      <div class=" col-xs-8">
        <input type="text" value="<%- info.officeTelephone %>" name="officeTelephone" class="form-control"
               maxlength="12" data-fv-regexp-message="请输入正确的电话号"
               pattern="(^(0\d{2,3}-\d{7,8})$)|(^0[1-9]\d{8,10}$)|(^[1-9]\d{6,7}$)|(^1[3|4|5|7|8][0-9]\d{8}$)"/>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-6">
    <div class="form-group">
      <label class=" col-xs-4 control-label">生日</label>
      <div class=" col-xs-8">
        <input type="text" maxlength="20" value="<%- info.userBir %>" name="userBir" class="form-control date-time">
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="form-group">
      <label class=" col-xs-4 control-label">性别</label>
      <div class=" col-xs-8">
        <label class="radio-inline">
          <% if(info.userSex !== '2') { %>
          <input type="radio" name="userSex" value="1" checked> 男
          <% } else { %>
          <input type="radio" name="userSex" value="1"> 男
          <% } %>
        </label>
        <label class="radio-inline">
          <% if(info.userSex === '2') { %>
          <input type="radio" name="userSex" value="2" checked> 女
          <% } else { %>
          <input type="radio" name="userSex" value="2"> 女
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
        <input type="text" maxlength="18" pattern="(^\d{18}$)|(^\d{17}(\d|X|x)$)"
               data-fv-regexp-message="请输入18位身份证号码"
               value="<%- info.userIdCard %>" name="userIdCard" class="form-control">
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-6">
    <div class="form-group">
      <label class=" col-xs-4 control-label">职称</label>
      <div class=" col-xs-8">
        <input type="text" maxlength="32" value="<%- info.userTitle %>" name="userTitle" class="form-control"/>
        <div class="help-block with-errors"></div>
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="form-group">
      <label class=" col-xs-4 control-label">用户专业</label>
      <div class=" col-xs-8">
        <input type="text" maxlength="32" value="<%- info.userSpecialty %>" name="userSpecialty" class="form-control"/>
        <div class="help-block with-errors"></div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">头像</label>
      <div class=" col-xs-8">
        <div class="input-group with-clear">
          <input type="text" minlength="1" class="form-control" name="userHead" data-value="<%- info.userHead %>" value="<%- info.userHead %>"
                 data-id="<%- info.userHead %>" placeholder="头像" readonly>
          <span class="input-group-btn">
          <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
          <button class="btn btn-default" type="button" data-open="public/file/file-upload"
                  data-data='{"type": "*.jpg;*.jpeg;*.png"}'><i class="fa fa-file-o"></i></button>
        </span>
        </div>
      </div>
      <div class="col-xs-offset-4 col-xs-8">
        <img data-type="img" id="userHeadImg" src="<%- info.userHead %>"
             style="width: 150px;height:150px">
      </div>
    </div>
  </div>
</div>
<div class="dialog-options">
  <button type="button" class="btn btn-primary" id="btnPersonSave">保存</button>
</div>