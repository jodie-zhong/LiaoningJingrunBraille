<!--重印管理添加-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3 id="cipCreate">新增</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content" id="panelWorkflowContent">
        <div class="dialog-resize" id="panelWorkflow" style="position: relative;">
          <div class="form-horizontal" id="formReportEdit">
            <div class="row">
              <div class="col-xs-12">
                <div class="form-group text-center">
                  <button class="btn btn-default" id="addBook"><i class="fa fa-book"></i> 选择图书</button>
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
                      <th style="width: 150px">类型</th>
                      <th>原因</th>
                      <th style="width: 60px">操作</th>
                    </tr>
                    </thead>
                    <tbody id="selectBookTable">
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <% if(info.userTaskEntities) { %>
            <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
            <div data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="col-xs-4 control-label">下一流程</label>
                  <div class="col-xs-8">
                    <% if(!info.userTaskEntities[i].deptNames) { %>
                    <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
                    <% } else { %>
                    <p class="form-control-static">
                      <%- info.userTaskEntities[i].flowName %>（
                      <%- info.userTaskEntities[i].deptNames %> -
                      <%- info.userTaskEntities[i].roleNames %>）</p>
                    <% } %>
                    <input type="hidden" name="flowId" value="<%- info.userTaskEntities[i].flowId %>">
                    <input type="hidden" name="flowName" value="<%- info.userTaskEntities[i].flowName %>">
                    <input type="hidden" name="nextCategory" value="<%- info.userTaskEntities[i].category %>">
                    <input type="hidden" name="deptIds" value="<%- info.userTaskEntities[i].deptIds %>">
                    <input type="hidden" name="roleIds" value="<%- info.userTaskEntities[i].roleIds %>">
                  </div>
                </div>
              </div>
              <div class="col-xs-6">
                <% if(info.userTaskEntities[i].roleIds) { %>
                <div class="form-group">
                  <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
                  <div class="col-xs-8">
                    <div class="input-group with-clear">
                      <input type="text" class="form-control" name="taskUsers"
                             title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                             value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                             data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                             data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}"
                             data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
                      <span class="input-group-btn">
                        <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                        <button class="btn btn-default" type="button" data-open="public/user/select-users"
                                data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i
                                class="fa fa-user-o"></i>
                        </button>
                      </span>
                    </div>
                  </div>
                </div>
                <% } %>
              </div>
            </div>
            <% } %>
            <% } %>
          </div>
        </div>
        <div class="dialog-options">
          <!--<button class="btn btn-default" id="btnCipSave">保存</button>-->
          <button class="btn btn-primary" id="btnCipSubmit">提交</button>
        </div>
      </div>
    </div>
  </div>
</div>
