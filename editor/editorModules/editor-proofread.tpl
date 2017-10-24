<div class="editor-container">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-horizontal">
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group">
              <label class="col-xs-4 control-label">校对角色选择：</label>
              <div class="col-xs-4">
                <label class="radio-inline">
                  <input type="radio" name="proofreadRole" value="1" id="inputProofread" checked> 校对
                </label>
                <label class="radio-inline">
                  <input type="radio" name="proofreadRole" value="2" id="inputProofreadBraille"> 盲文校对
                </label>
              </div>
              <div class="col-xs-4">
                <button class="btn btn-primary" id="btnStartProofread">开始校对</button>
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
  <div id="editorArea" style="display: none;">
    <div class="row">
      <div class="dialog-options">
        <button class="btn btn-default" id="btnSave">保存</button>
        <button class="btn btn-primary" id="btnSaveAndExit">保存并退出</button>
      </div>
    </div>
  </div>
  <div id="proofreadArea" class="border-top" style="margin-top: 20px; display: none;">
    <div class="row">
      <div class="col-xs-12">
        <div class="form-group">
          <label class="col-xs-2 control-label">正误表：</label>
          <div class="col-xs-10">
            <table class="table table-striped">
              <thead>
              <tr>
                <td style="width: 80px">序号</td>
                <td style="width: 80px">页码</td>
                <td style="width: 80px">行</td>
                <td>内容</td>
                <td style="width: 100px">是否确认</td>
              </tr>
              </thead>
              <tbody id="errataDataTBody">
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="dialog-options">
        <button class="btn btn-success" id="btnCreateErrataData">重新生成正误表</button>
        <button class="btn btn-primary" id="btnSaveProofreadAndExit">保存并退出</button>
      </div>
    </div>
  </div>
</div>
