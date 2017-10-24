<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header bg-primary">
        <h3><i class="fa fa-info-circle"></i> 三级字典<%- info.code?'修改':'新增' %></h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formDictionEdit">
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">字典编码<span class="must">*</span></label>
                <div class="col-xs-4">
                  <input type="text" maxlength="16" value="<%- info.code %>" name="code" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请填写字典编码"/>
                </div>
                <div class="col-xs-6"></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">字典标题<span class="must">*</span></label>
                <div class="col-xs-4">
                  <input type="text" maxlength="32" value="<%- info.value %>" name="value" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请填写字典标题"/>
                </div>
                <div class="col-xs-6"></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">备注</label>
                <div class="col-xs-10">
                  <textarea class="form-control" name="remark" placeholder="备注" maxlength="64"><%- info.remark %></textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-primary" id="btnDictionSave">保存</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>