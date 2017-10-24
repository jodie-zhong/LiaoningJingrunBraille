<!--审核-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3><i class="fa fa-user-o"></i>审核</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formEdit">
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">审核结果:</label>
                <div class="col-xs-10">
                  <label class="radio-inline">
                    <% if(!info.handleState || info.handleState === '1') { %>
                    <input type="radio" name="handleState" value="1" required checked="checked">通过
                    <% } else { %>
                    <input type="radio" name="handleState" value="1" required>通过
                    <% } %>
                  </label>
                  <label class="radio-inline">
                    <% if(info.handleState === '2') { %>
                    <input type="radio" name="handleState" value="2" required checked="checked">不通过
                    <% } else { %>
                    <input type="radio" name="handleState" value="2" required>不通过
                    <% } %>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">审核意见:</label>
                <div class="col-xs-10">
                  <textarea class="form-control" maxlength="2048" placeholder="（不超过2048字）" name="handleContentOne"><%- info.handleContentOne
                    %></textarea>
                  <input type="hidden" name="taskId" value="<%- info.taskId %>">
                  <input type="hidden" name="taskUsers" value="<%- info.taskUsers %>">
                  <input type="hidden" name="submitUserId" value="<%- info.submitUserId %>">
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