<!--译校通读-任务接受-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header">
        <h3><i class="fa fa-user-o"></i>任务接受</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formDiv">
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">图书名称</label>
                <div class="col-xs-8">
                  <p class="form-control-static"><%- info.bookName %></p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">任务阶段</label>
                <div class="col-xs-8">
                  <p class="form-control-static"><%- info.flowName %></p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">任务简介</label>
                <div class="col-xs-10">
                  <p class="form-control-static"><%- info.tprTaskContent %></p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">是否接受</label>
                <div class="col-xs-8">
                  <% if(!info.tprTaskGetState || info.tprTaskGetState === '1') { %>
                  <label class="radio-inline"><input type="radio" name="tprTaskGetState" value="1" checked/>接受</label>
                  <label class="radio-inline"><input type="radio" name="tprTaskGetState" value="2"/>拒绝</label>
                  <% } else { %>
                  <label class="radio-inline"><input type="radio" name="tprTaskGetState" value="1"/>接受</label>
                  <label class="radio-inline"><input type="radio" name="tprTaskGetState" value="2" checked/>拒绝</label>
                  <% } %>
                </div>
              </div>
            </div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-default" id="btnSave">保存</button>
            <button class="btn btn-primary" id="btnSubmit">提交</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>