<!--备案登记-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">备案信息</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" placeholder="（不超过1024字）" name="bookRegistrationRemarks"><%-
            info.bookRegistrationRemarks
            %></textarea>
          <div><label class="len"></label></div>
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
        <label class="col-xs-2 control-label">备案信息</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.bookRegistrationRemarks %></pre>
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
