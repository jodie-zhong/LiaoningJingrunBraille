<!--封面发行初审-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">选择方案<span class="must">*</span></label>
        <% for(var i=0;i< info.mwHBookCoverSchemeList.length;i++){ %>
        <% if(i > 0) { %>
        <div class="col-xs-10 col-xs-offset-2">
          <label class="radio-inline">
            <% if(info.mwHBookCoverSchemeList[i].isSelect === '2') { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required data-fv-notempty="true" data-fv-notempty-message="请选择一个方案" checked="checked"><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } else { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required data-fv-notempty="true" data-fv-notempty-message="请选择一个方案"><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } %>
          </label>
        </div>
        <% } else {%>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(info.mwHBookCoverSchemeList[i].isSelect === '2') { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required data-fv-notempty="true" data-fv-notempty-message="请选择一个方案" checked="checked"><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } else { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required data-fv-notempty="true" data-fv-notempty-message="请选择一个方案"><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } %>
          </label>
        </div>
        <% } %>
        <% } %>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
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
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="handleContentOne" maxlength="1024" placeholder="审核意见（不超过1024字）"><%-
            info.handleContentOne %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <% if(info.taskCopyRightState !== "3"){ %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">版权页设计是否完成</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(info.taskCopyRightState  === "1") { %>
            否
            <% } else { %>
            是
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" style="display: none;">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptAndRoles) { %>
          <p class="form-control-static">
            <%- info.userTaskEntities[i].flowName %>
          </p>
          <% } else { %>
          <p class="form-control-static">
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
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人" readonly data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人" data-data="{searchRoleId: '', searchDepartmentId: ''}"
                   title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'>
                <i class="fa fa-user-o"></i></button>
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
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">选择方案</label>
        <% for(var i=0;i< info.mwHBookCoverSchemeList.length;i++){ %>
        <% if(i > 0) { %>
        <div class="col-xs-10 col-xs-offset-2">
          <label class="radio-inline">
            <% if(info.mwHBookCoverSchemeList[i].isSelect === '2') { %>
            <input type="radio" name="hBookCoverSchemeName" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required checked="checked" disabled><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } else { %>
            <input type="radio" name="hBookCoverSchemeName" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required disabled><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } %>
          </label>
        </div>
        <% } else {%>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(info.mwHBookCoverSchemeList[i].isSelect === '2') { %>
            <input type="radio" name="hBookCoverSchemeName" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required checked="checked" disabled><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } else { %>
            <input type="radio" name="hBookCoverSchemeName" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required disabled><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } %>
          </label>
        </div>
        <% } %>
        <% } %>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审批结果</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(info.handleState === '1') { %> 通过
            <% } %>
            <% if(info.handleState === '2') { %> 不通过
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