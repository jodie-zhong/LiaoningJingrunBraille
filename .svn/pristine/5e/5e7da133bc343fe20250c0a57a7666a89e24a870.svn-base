<!--领用人领取样书-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div style="display: none">
    <input value="<%- info.stylebookGetId %>" name="stylebookGetId">
    <input value="<%- info.taskId %>" name="taskId">
    <input value="<%- info.stylebookGetNum %>" name="stylebookGetNum">
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">领用备注</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" placeholder="（不超过1024字）" name="handleContentOne"><%- info.handleContentOne %></textarea>
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
        <label class="col-xs-2 control-label">领用备注</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.handleContentOne %></pre>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>
