<!--劳务录入社外-->
<div class="row">
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">姓名<span class="must">*</span></label>
      <div class="col-xs-5">
        <input type="text" name="jobOutsideName" class="form-control" value="<%- list.jobOutsideName %>"
               placeholder="姓名(最多32个字)" data-fv-notempty="true" data-fv-notempty-message="请填写姓名"
               maxlength="32"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">身份证号</label>
      <div class="col-xs-5">
        <input type="text" name="jobOutsideIdCard"
               class="form-control" placeholder="身份证号（18位）" value="<%- list.jobOutsideIdCard %>"
               pattern="(^\d{18}$)|(^\d{17}(\d|X|x)$)" data-fv-regexp-message="请输入正确的身份证号"
               maxlength="18"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">金额</label>
      <div class="col-xs-5">
        <input type="text" name="jobOutsideMoney" value="<%- list.jobOutsideMoney || '0.00' %>"
               class="form-control" placeholder=""
               pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">税额</label>
      <div class="col-xs-5">
        <input type="text" name="jobOutsideTax"
               pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" class="form-control"
               value="<%- list.jobOutsideTax || '0.00' %>"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">实付金额</label>
      <div class="col-xs-5">
        <input type="text" name="jobOutsideRealMoney"
               pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" value="<%- list.jobOutsideRealMoney || '0.00' %>"
               class="form-control" readonly/>
      </div>
    </div>
  </div>
  <div class="dialog-options">
    <button class="btn btn-primary" id="btnSave">保存</button>
  </div>
</div>
