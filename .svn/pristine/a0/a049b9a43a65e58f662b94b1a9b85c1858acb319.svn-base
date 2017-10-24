<!-- 出版计划提交版署 -->
<% if(isEdit) { %>
<div class="form-horizontal">
  <input type="hidden" name="taskId" value="<%- info.taskId %>" />
  <input type="hidden" name="zPublishPlanReportId" value="<%- info.zPublishPlanReportId %>" />
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">备注</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="handleContentOne" placeholder="备注（不超过1024字）" maxlength="1024"><%- info.handleContentOne %></textarea>
          <div><label class="len">0/1024</label></div>
        </div>
      </div>
    </div>
  </div>
</div>
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">备注</label>
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