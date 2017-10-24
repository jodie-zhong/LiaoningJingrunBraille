<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header">
        <h3><i class="fa fa-user-o"></i> 模板编辑</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formTemplateEdit">
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">模板名称<span class="must">*</span></label>
                <div class="col-xs-4">
                  <input type="text" value="<%- info.contractTemplateName %>" name="contractTemplateName"
                         class="form-control" required data-required-error="请填写模板名称"/>
                  <div class="help-block with-errors"></div>
                </div>
                <div class="col-xs-6"></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">附件上传<span class="must">*</span></label>
                <div class="col-xs-4">
                  <div class="input-group with-clear">
                    <input type="text" value="<%- info.contractTemplatePath %>" name="contractTemplatePath"
                           class="form-control" readonly required data-required-error="请选择附件"/>
                    <span class="input-group-btn">
                    <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
										<button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data="{}"><i
                        class="fa fa-file-o"></i></button>
									</span>
                  </div>

                  <div class="help-block with-errors"></div>
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
                  <input type="text" class="form-control" value="<%- info.contractTemplateRemark %>"
                         name="contractTemplateRemark"></input>
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