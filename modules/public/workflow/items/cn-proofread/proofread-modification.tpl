<!--校对-改稿-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: -2px;">录排文件</label>
        <div class="col-xs-10 form-compact">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 150px;">页数<span class="must-td">*</span></th>
              <th>附件<span class="must-td">*</span></th>
              <th style="width: 70px;"></th>
            </tr>
            </thead>
            <tbody id="dataTBody">
            <% if(info.inputEntities) { %>
            <% for(var i = 0; i < info.inputEntities.length; i++) { %>
            <tr data-hBookFileId="<%- info.inputEntities[i].hBookFileId %>">
              <td><%- (i + 1) %></td>
              <td>
                <div class="form-group">
                  <div class="col-xs-12">
                    <input class="form-control" value="<%- info.inputEntities[i].hTaskPageNum %>" name="hTaskPageNum" placeholder="页数" pattern="^[1-9]\d{0,3}$" data-fv-regexp-message="请输入大于0的整数，<br>最大4位"
                           data-fv-notempty="true" data-fv-notempty-message="请填写页数">
                  </div>
                </div>
              </td>
              <td>
                <div class="form-group">
                  <div class="col-xs-12">
                    <div class="input-group with-clear">
                      <input minlength="1" class="form-control uploadFile" value="<%- info.inputEntities[i].hBookFileName %>" placeholder="请选择文件" data-value="<%- info.inputEntities[i].hBookFileAddress %>"
                             readonly>
                      <span class="input-group-btn">
                        <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                        <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data="{}"><i class="fa fa-file-o"></i></button>
                      </span>
                    </div>
                  </div>
                </div>
              </td>
              <td>
                <% if(info.inputEntities[i].hBookFileAddress && info.inputEntities[i].hBookFileAddress !=='') { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.inputEntities[i].hBookFileAddress %>">下载</button>
                <% } else { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.inputEntities[i].hBookFileAddress %>" disabled>下载</button>
                <% } %>
              </td>
            </tr>
            <% } %>
            <% } %>
            </tbody>
          </table>
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
      <% if(info.userTaskEntities[i].roleIds) { %>
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人" data-data="{searchRoleId: '', searchDepartmentId: ''}"
                   title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" readonly>
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'
                      data-open="public/user/select-users">
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
<!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">录排文件</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 100px;">页数</th>
              <th>附件</th>
              <th style="width: 70px;"></th>
            </tr>
            </thead>
            <tbody>
            <% if(info.inputEntities) { %>
            <% for(var i = 0; i < info.inputEntities.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td><%- info.inputEntities[i].hTaskPageNum %></td>
              <td title="<%- info.inputEntities[i].hBookFileName %>"><%- info.inputEntities[i].hBookFileName %></td>
              <td>
                <% if(info.inputEntities[i].hBookFileAddress && info.inputEntities[i].hBookFileAddress !=='') { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.inputEntities[i].hBookFileAddress %>">下载</button>
                <% } else { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.inputEntities[i].hBookFileAddress %>" disabled>下载</button>
                <% } %>
              </td>
            </tr>
            <% } %>
            <% } %>
            </tbody>
          </table>
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