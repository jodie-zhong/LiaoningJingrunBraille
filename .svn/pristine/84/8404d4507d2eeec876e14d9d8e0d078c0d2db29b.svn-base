<!--版署申请新增-->
<div class="form-horizontal" id="formReportEdit">
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">申请名称<span class="must">*</span></label>
      <div class="col-xs-4">
        <input type="text" value="<%- info.isbncipApplyName %>" maxlength="64" name="isbncipApplyName" class="form-control"
               data-fv-notempty="true" data-fv-notempty-message="请填写申请名称" maxlength="64"/>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">申请备注<span class="must">*</span></label>
      <div class="col-xs-10">
          <textarea type="text" name="isbncipApplyRemarks" class="form-control"
                    data-fv-notempty="true" data-fv-notempty-message="请填写申请备注" placeholder="请填写申请备注（不超过1024字）" maxlength="1024"><%-
            info.isbncipApplyRemarks %></textarea>
          <div><label class="len">0/1024</label></div>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <label class="col-xs-2 control-label">图书名称<span class="must">*</span></label>
      <div class="col-xs-10">
        <button id="btnAddBook" class="btn btn-default" type="button"><i class="fa fa-book"> 添加图书</i></button>
        <button id="btnDetailBook" class="btn btn-default" type="button"><i class="fa fa-book"> 查看详情</i></button>
        <button id="btnDownloadBook" class="btn btn-default" type="button"><i class="fa fa-book"> 下载</i></button>
      </div>
    </div>
  </div>
  <div class="col-xs-12">
    <div class="form-group">
      <div class="col-xs-8 col-xs-offset-2">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th style="width: 50px">序号</th>
              <th style="width: 100px">图书类型</th>
              <th>图书名称</th>
              <th style="width: 70px">操作</th>
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
            <input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
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