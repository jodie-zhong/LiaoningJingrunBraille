<!--劳务录入-->
<div class="row">
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">姓名</label>
      <div class="col-xs-5">
        <div class="input-group with-clear">
          <input type="text" class="form-control" name="userName" value="<%- list.userName %>"
                 data-value="<%- list.userName %>" placeholder="姓名" readonly>
          <span class="input-group-btn">
          <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
          <button class="btn btn-default choice-people" type="button"><i
                  class="fa fa-user-o"></i></button>
        </span>
        </div>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">身份证号<span class="must">*</span></label>
      <div class="col-xs-5">
        <input type="text" name="userIdCard" value="<%- list.userIdCard %>"
               class="form-control" placeholder="身份证号"
               data-fv-notempty="true" data-fv-notempty-message="请填写身份证号"
               readonly/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">出勤天数</label>
      <div class="col-xs-5">
        <input type="text" name="jobInsideDays" value="<%- list.jobInsideDays %>"
               class="form-control" pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9])|([1-9][0-9]{0,7}\.[0-9]))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许一位小数)"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">全勤奖</label>
      <div class="col-xs-5">
        <input type="text" name="jobInsideReward" value="<%- list.jobInsideReward || '0.00' %>"
               class="form-control" pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">加班费</label>
      <div class="col-xs-5">
        <input type="text" name="overtimePay" class="form-control" value="<%- list.overtimePay || '0.00' %>"
               pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">劳务费</label>
      <div class="col-xs-5">
        <input type="text" name="serviceFee" value="<%- list.serviceFee || '0.00' %>"
               class="form-control" pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">效益津贴</label>
      <div class="col-xs-5">
        <input type="text" name="benefitAllowance" value="<%- list.benefitAllowance || '0.00' %>"
               class="form-control" pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">伙食补贴</label>
      <div class="col-xs-5">
        <input type="text" name="foodAllowance" class="form-control" value="<%- list.foodAllowance || '0.00' %>"
               pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">郊区补贴</label>
      <div class="col-xs-5">
        <input type="text" name="suburbAllowance"
               class="form-control" value="<%- list.suburbAllowance || '0.00' %>"
               pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">合计</label>
      <div class="col-xs-5">
        <input type="text" name="total" value="<%- list.total || '0.00' %>"
               class="form-control" readonly/>
      </div>
    </div>
  </div>
</div>
<div class="dialog-options">
  <button class="btn btn-primary" id="btnSave">保存</button>
</div>