<!--封面发行初审-->
<% if(isEdit) { %>
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
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required checked="checked"><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } else { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } %>
          </label>
        </div>
        <% } else {%>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(info.mwHBookCoverSchemeList[i].isSelect === '2') { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required checked="checked"><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } else { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
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
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="handleContentOne" maxlength="1024" placeholder="审核意见（不超过1024字）"><%-
            info.handleContentOne %></textarea>
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
        <label class="col-xs-2 control-label">选择方案</label>
        <% for(var i=0;i< info.mwHBookCoverSchemeList.length;i++){ %>
        <% if(i > 0) { %>
        <div class="col-xs-10 col-xs-offset-2">
          <label class="radio-inline">
            <% if(info.mwHBookCoverSchemeList[i].isSelect === '2') { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required checked="checked" disabled><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } else { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required disabled><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } %>
          </label>
        </div>
        <% } else {%>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(info.mwHBookCoverSchemeList[i].isSelect === '2') { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required checked="checked" disabled><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
            <% } else { %>
            <input type="radio" name="hBookCoverSchemeId" value="<%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeId %>" required disabled><%- info.mwHBookCoverSchemeList[i].hBookCoverSchemeName %>
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
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%-info.handleContentOne %></pre>
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