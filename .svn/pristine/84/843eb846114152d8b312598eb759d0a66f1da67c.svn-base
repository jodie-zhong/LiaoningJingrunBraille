<!--告知责编-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <% if(info.nextFlowInfoEntities) { %>
  <% for(var i = 0; i < info.nextFlowInfoEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.nextFlowInfoEntities[i].nextFlowId %>" data-area="nextFlow">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程<span class="must">*</span></label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptNames) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
            <%- info.userTaskEntities[i].flowName %>（
            <%- info.userTaskEntities[i].deptNames %> -
            <%- info.userTaskEntities[i].roleNames %>）</p>
          <% } %>
          <input type="hidden" name="userTaskId" value="<%- info.userTaskEntities[i].userTaskId %>">
          <input type="hidden" name="userTaskName" value="<%- info.userTaskEntities[i].userTaskName %>">
          <input type="hidden" name="nextCategory" value="<%- info.userTaskEntities[i].category %>">
          <input type="hidden" name="deptIds" value="<%- info.userTaskEntities[i].deptIds %>">
          <input type="hidden" name="roleIds" value="<%- info.userTaskEntities[i].roleIds %>">
          <input type="hidden" name="taskId" value="<%- info.taskId %>">
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <% if(info.userTaskEntities[i].roleIds) { %>
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人</label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers"
                   value="<%- info.nextFlowInfoEntities[i].nextFlowTaskUserNames %>"
                   data-value="<%- info.nextFlowInfoEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                   data-data="{searchRoleId: '', searchDepartmentId: ''}">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-user-check"
                      data-data="{}"><i class="fa fa-user-o"></i></button>
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
<% } %>
