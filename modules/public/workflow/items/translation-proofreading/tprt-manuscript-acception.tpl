<!--译校通读-接收书稿-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">接收书稿确认</label>
        <div class="col-xs-8">
          <% if(!info.handleState || info.handleState === '1') { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1" checked/>接收</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>未接收</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1"/>接收</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2" checked/>未接收</label>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-index="<%- i %>" data-area="nextFlow" style="display: none;">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptAndRoles) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
            <!--<%- info.userTaskEntities[i].flowName %>（-->
            <!--<%- info.userTaskEntities[i].deptNames %> - -->
            <!--<%- info.userTaskEntities[i].roleNames %>）-->
            <%- info.userTaskEntities[i].flowName %>（<%- info.userTaskEntities[i].deptAndRoles %>）
          </p>
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
      <!--拒绝不选人-->
      <% if(i===1) { %>
      <div class="form-group with-clear">
        <label class="col-xs-4 control-label">任务人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.userTaskEntities[i].handleUserName %></p>
          <input type="hidden" name="taskUsers" data-value="<%- info.userTaskEntities[i].handleUserId %>">
        </div>
      </div>
      <!--非拒绝选任务人-->
      <% } else { %>
      <div class="form-group with-clear">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <!--译录接收书稿正常选人-->
          <% if(info.flowId === 'translationAcceptBook') { %>
          <div class="input-group with-clear">
            <input class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人" data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}" data-fv-notempty="true"
                   data-fv-notempty-message="请选择下一任务人" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" readonly>
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'
                      data-open="public/user/select-users">
                <i class="fa fa-user-o"></i>
              </button>
            </span>
          </div>
          <!--其他接收书稿需要排除部分人员-->
          <% } else { %>
          <div class="input-group with-clear">
            <input class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" readonly
                   data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>', excludedUserId: '<%- info.excludedUserId %>'}">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>", "excludedUserId": "<%- info.excludedUserId %>"}'>
                <i class="fa fa-user-o"></i>
              </button>
            </span>
          </div>
          <% } %>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <% } %>
  <% } %>
</div>
<!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">接收书稿确认</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.handleState==='1' ? '接收' : (info.handleState==='2' ? '未接收' : '') %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.submitUserName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交时间</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.submitDatetime %></p>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>