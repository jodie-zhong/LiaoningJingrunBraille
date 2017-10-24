<!--批量审核-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3>批量审核</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content" id="panelWorkflowContent">
        <div class="dialog-resize" id="panelWorkflow" style="position: relative;">
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group text-center">
                <button class="btn btn-default" id="addBook"><i class="fa fa-book"></i> 选择待审核图书</button>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <table class="table table-striped table-nowrap table-hover">
                  <thead>
                  <tr>
                    <th style="width: 50px">序号</th>
                    <th style="width: 150px">图书名称</th>
                    <th style="width: 80px">图书类型</th>
                    <th style="width: 100px">类型</th>
                    <th style="width: 150px">原因</th>
                    <th style="width: 60px">录入状态</th>
                    <th style="width: 100px">操作</th>
                  </tr>
                  </thead>
                  <tbody id="selectBookTable">
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div id="formEnter" class="form-horizontal">

        </div>
        <div class="dialog-options">
          <!--<button class="btn btn-default" id="btnCipSave">保存</button>-->
          <button class="btn btn-primary" id="btnCipSubmit">提交</button>
        </div>
      </div>
    </div>
  </div>
</div>
