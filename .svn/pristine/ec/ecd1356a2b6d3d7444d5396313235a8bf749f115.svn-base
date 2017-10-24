<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">选题名称</label>
        <div class="col-xs-4">
          <p class="form-control-static"><%- info.bookTopicName %></p>
        </div>
        <div class="col-xs-6"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">书号</label>
        <div class="col-xs-4">
          <p class="form-control-static"><%- info.bookTopicName %></p>
        </div>
        <div class="col-xs-6"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">变更项</label>
        <div class="col-xs-10">
          <label class="checkbox-inline">
            <% if(info.bookTopicType && info.bookTopicType.indexOf('1') >= 0) { %>
            <input type="checkbox" name="bookTopicType" value="1" checked/>图书名称
            <% } else { %>
            <input type="checkbox" name="bookTopicType" value="1"/>图书名称
            <% } %>
          </label>
          <label class="checkbox-inline">
            <% if(info.bookTopicType && info.bookTopicType.indexOf('2') >= 0) { %>
            <input type="checkbox" name="bookTopicType" value="2" checked/>图书信息
            <% } else { %>
            <input type="checkbox" name="bookTopicType" value="2"/>图书信息
            <% } %>
          </label>
          <label class="checkbox-inline">
            <% if(info.bookTopicType && info.bookTopicType.indexOf('3') >= 0) { %>
            <input type="checkbox" name="bookTopicType" value="3" checked/>终止出版
            <% } else { %>
            <input type="checkbox" name="bookTopicType" value="3"/>终止出版
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group ">
        <label class="col-xs-2 control-label">变更前</label>
        <div class="col-xs-10">
          <input class="form-control" value="<%- info.bookDetailAuthorSpeciality %>" name="bookDetailAuthorSpeciality"
                 placeholder="变更前" maxlength="32">
          <div class="help-block with-errors"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group ">
        <label class="col-xs-2 control-label">变更后</label>
        <div class="col-xs-10">
          <input class="form-control" value="<%- info.bookDetailAuthorSpeciality %>" name="bookDetailAuthorSpeciality"
                 placeholder="变更后" maxlength="32">
          <div class="help-block with-errors"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">变更原因</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="bookDetailAuthorResult" placeholder="有何著作及科研成果(不超过256字)" maxlength="256"><%- info.bookDetailAuthorResult %></textarea>
          <div><label class="len">0/256</label></div>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row">
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
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers"
                   value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                   data-data="{searchRoleId: '', searchDepartmentId: ''}" required data-required-error="请选择任务人">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data="{}"><i
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
        <label class="col-xs-2 control-label">选题名称</label>
        <div class="col-xs-4">
          <p class="form-control-static"><%- info.bookTopicName %></p>
        </div>
        <div class="col-xs-6"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">书号</label>
        <div class="col-xs-4">
          <p class="form-control-static"><%- info.bookTopicName %></p>
        </div>
        <div class="col-xs-6"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">变更项</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(info.bookTopicType && info.bookTopicType.indexOf('1') >= 0) { %>
            图书名称
            <% } %>
            <% if(info.bookTopicType && info.bookTopicType.indexOf('2') >= 0) { %>
            图书信息
            <% } %>
            <% if(info.bookTopicType && info.bookTopicType.indexOf('3') >= 0) { %>
            终止出版
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group ">
        <label class="col-xs-2 control-label">变更前</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.bookDetailAuthorSpeciality %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group ">
        <label class="col-xs-2 control-label">变更后</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.bookDetailAuthorSpeciality %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">变更原因</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.bookDetailAuthorResult %></pre>
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