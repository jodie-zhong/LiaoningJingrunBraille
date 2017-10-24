<!--校对-任务确认-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">任务确认</label>
        <div class="col-xs-8">
          <% if(info.handleState === '2') { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1"/>接受</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2" checked/>拒绝</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="3"/>待定</label>
          <% } else if(info.handleState === '3') { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1"/>接受</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>拒绝</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="3" checked/>待定</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1" checked/>接受</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>拒绝</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="3"/>待定</label>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" style="display:none">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptAndRoles) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
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
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.userTaskEntities[i].handleUserName %></p>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% } %>
</div>

<!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">任务简介</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(info.handleState === '1') { %>
            接受
            <% } else if(info.handleState === '2') { %>
            拒绝
            <% } else if(info.handleState === '3') { %>
            待定
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