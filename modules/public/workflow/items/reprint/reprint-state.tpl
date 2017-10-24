<!--流程状态-->
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">所在流程</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.flowName %></p>
        </div>
      </div>
    </div>
    <% if(info.flowName ==='已完成' || info.taskUsers ==='' || info.taskUsers === null){ %>
    <div class="col-xs-6">
    </div>
    <% } else {%>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.taskUsersName %></p>
        </div>
      </div>
    </div>
    <% } %>
  </div>
</div>
