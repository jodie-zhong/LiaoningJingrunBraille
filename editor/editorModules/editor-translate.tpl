<div class="editor-container">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-horizontal">
        <div class="row">
          <div class="col-xs-3">
            <div class="form-group">
              <label class="col-xs-6 control-label">行数：</label>
              <div class="col-xs-6">
                <input type="text" class="form-control" id="textRows" placeholder="行数" maxlength="2">
              </div>
            </div>
          </div>
          <div class="col-xs-3">
            <div class="form-group">
              <label class="col-xs-6 control-label">方数：</label>
              <div class="col-xs-6">
                <input type="text" class="form-control" id="textCols" placeholder="方数" maxlength="2">
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <span class="pull-right">
              <span class="c-red p-r-20" id="editorTip"></span>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="editor-container">
      <textarea class="braille-editor" id="brailleEditor" style="display: none;"></textarea>
    </div>
  </div>
  <div class="row">
    <div class="dialog-options">
      <button class="btn btn-default" id="btnSave">保存</button>
      <button class="btn btn-primary" id="btnSaveAndExit">保存并退出</button>
    </div>
  </div>
</div>
