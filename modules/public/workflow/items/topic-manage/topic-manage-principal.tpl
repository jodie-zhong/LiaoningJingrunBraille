<!--部门负责人审核-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(!info.handleState || info.handleState === '1') { %>
            <input type="radio" name="handleState" value="1" data-fv-notempty="true" data-fv-notempty-message="请选择审核结果"
                   checked>建议申报
            <% } else { %>
            <input type="radio" name="handleState" value="1" data-fv-notempty="true" data-fv-notempty-message="请选择审核结果">建议申报
            <% } %>
          </label>

          <label class="radio-inline">
            <% if(info.handleState === '5') { %>
            <input type="radio" name="handleState" value="5" data-fv-notempty="true" data-fv-notempty-message="请选择审核结果"
                   checked>不建议申报
            <% } else { %>
            <input type="radio" name="handleState" value="5" data-fv-notempty="true" data-fv-notempty-message="请选择审核结果">不建议申报
            <% } %>
          </label>

          <label class="radio-inline">
            <% if(info.handleState === '3') { %>
            <input type="radio" name="handleState" value="3" data-fv-notempty="true" data-fv-notempty-message="请选择审核结果"
                   checked>待定
            <% } else { %>
            <input type="radio" name="handleState" value="3" data-fv-notempty="true" data-fv-notempty-message="请选择审核结果">待定
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核意见<span class="must">*</span></label>
        <div class="col-xs-10">
          <textarea class="form-control" name="handleContentOne" placeholder="审核意见（不超过2048字）" maxlength="2048" data-fv-notempty="true"
                    data-fv-notempty-message="请输入审核意见"><%- info.handleContentOne %></textarea>
          <div><label class="len">0/2048</label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">部门选题<br />论证会意见</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="handleContentTwo" placeholder="部门选题论证会意见（不超过2048字）" maxlength="2048"><%- info.handleContentTwo %></textarea>
          <div><label class="len">0/2048</label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row" data-area="urgent">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">是否加急选题</label>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(!info.topicIsUrgent || info.topicIsUrgent === '1') { %>
            <input type="radio" name="topicIsUrgent" value="1" data-fv-notempty="true"
                   data-fv-notempty-message="请判断是否加急" checked>常规
            <% } else { %>
            <input type="radio" name="topicIsUrgent" value="1" data-fv-notempty="true"
                   data-fv-notempty-message="请判断是否加急">常规
            <% } %>
          </label>

          <label class="radio-inline">
            <% if(info.topicIsUrgent === '2') { %>
            <input type="radio" name="topicIsUrgent" value="2" data-fv-notempty="true"
                   data-fv-notempty-message="请判断是否加急" checked>加急
            <% } else { %>
            <input type="radio" name="topicIsUrgent" value="2" data-fv-notempty="true"
                   data-fv-notempty-message="请判断是否加急">加急
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" style="display: none;">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptAndRoles || info.userTaskEntities[i].flowId === 'brailleTopicReport' || info.userTaskEntities[i].flowId === 'abandoned') { %>
          <p class="form-control-static">
            <%- info.userTaskEntities[i].flowName %>
          </p>
          <% } else { %>
          <p class="form-control-static">
            <!--<%- info.userTaskEntities[i].flowName %>（-->
            <!--<%- info.userTaskEntities[i].deptNames %> - -->
            <!--<%- info.userTaskEntities[i].roleNames %>）-->
            <%- info.userTaskEntities[i].flowName %>（
            <%- info.userTaskEntities[i].deptAndRoles %>）
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
      <% if(info.userTaskEntities[i].roleIds) { %>
      <div class="form-group forHideTaskUsers">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人" readonly data-data="{searchRoleId: '', searchDepartmentId: ''}" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人"
                   title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i
                  class="fa fa-user-o"></i></button>
            </span>
          </div>
          <div class="help-block with-errors"></div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <% } %>
  <% } %>
</div>
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(!info.handleState || info.handleState === '1') { %> 建议申报
            <% } %>
            <% if(info.handleState === '5') { %> 不建议申报
            <% } %>
            <% if(info.handleState === '3') { %> 待定
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.handleContentOne %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">部门选题<br />论证会意见</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.handleContentTwo %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">是否加急选题</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(!info.topicIsUrgent || info.topicIsUrgent === '1') { %> 常规
            <% } %>
            <% if(info.topicIsUrgent === '2') { %> 加急
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交人</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <%- info.submitUserName %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交时间</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <%- info.submitDatetime %>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>