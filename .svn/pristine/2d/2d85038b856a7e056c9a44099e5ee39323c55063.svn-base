<!--印前质检-核红改稿-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">漏改位置</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 100px;">序号</th>
              <th>页数（P）</th>
              <th>行号</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.qualityRedList) { %>
            <% for(var i = 0; i < info.qualityRedList.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td><%- info.qualityRedList[i].auditRedMissPage %></td>
              <td><%- info.qualityRedList[i].auditRedMissLine %></td>
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
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: -2px;">录排文件</label>
        <div class="col-xs-10 form-compact">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 100px;">分册书</th>
              <th style="width: 120px;">页数<span class="must-td">*</span></th>
              <th>附件<span class="must-td">*</span></th>
              <th style="width: 70px;"></th>
            </tr>
            </thead>
            <tbody id="dataTBody">
            <% if(info.fileList) { %>
            <% for(var i = 0; i < info.fileList.length; i++) { %>
            <tr data-fasciculeId="<%- info.fileList[i].bookFascicleId %>">
              <td><%- (i + 1) %></td>
              <td title="<%- info.fileList[i].bookFascicleBookName %>"><%- info.fileList[i].bookFascicleBookName %></td>
              <td>
                <div class="form-group">
                  <div class="col-xs-12">
                    <input class="form-control" value="<%- info.fileList[i].hTaskPageNum %>" name="hTaskPageNum" placeholder="页数" maxlength="7" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" data-fv-notempty="true"
                           data-fv-notempty-message="请填写页数">
                  </div>
                </div>
              </td>
              <td>
                <div class="form-group">
                  <div class="col-xs-12">
                    <div class="input-group with-clear">
                      <input minlength="1" class="form-control uploadFile" value="<%- info.fileList[i].hBookFileName %>" data-value="<%- info.fileList[i].hBookFileAddress %>" placeholder="请选择文件"
                             name="hBookFileName" data-fv-notempty="true" data-fv-notempty-message="请选择文件" title="<%- info.fileList[i].hBookFileName %>" readonly>
                      <span class="input-group-btn">
                        <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                        <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*.doc;*.docx;*.pdf"}'><i class="fa fa-file-o"></i></button>
                      </span>
                    </div>
                  </div>
                </div>
              </td>
              <td>
                <% if(info.fileList[i].hBookFileAddress && info.fileList[i].hBookFileAddress !=='') { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.fileList[i].hBookFileAddress %>">下载</button>
                <% } else { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.fileList[i].hBookFileAddress %>" disabled>下载</button>
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
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">录排备注</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="handleContentOne" placeholder="录排备注（最大1024字）" maxlength="1024"><%- info.handleContentOne %></textarea>
          <div><label class="len">0/1024</label></div>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities && info.userTaskEntities.length > 0) { %>
  <input type="hidden" name="flowId" value="<%- info.userTaskEntities[0].flowId %>">
  <input type="hidden" name="flowName" value="<%- info.userTaskEntities[0].flowName %>">
  <input type="hidden" name="nextCategory" value="<%- info.userTaskEntities[0].category %>">
  <input type="hidden" name="deptIds" value="<%- info.userTaskEntities[0].deptIds %>">
  <input type="hidden" name="roleIds" value="<%- info.userTaskEntities[0].roleIds %>">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[0].deptAndRoles) { %>
          <p class="form-control-static"><%- info.userTaskEntities[0].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
            <!--<%- info.userTaskEntities[0].flowName %>（-->
            <!--<%- info.userTaskEntities[0].deptNames %> - -->
            <!--<%- info.userTaskEntities[0].roleNames %>）-->
            <%- info.userTaskEntities[0].flowName %>（<%- info.userTaskEntities[0].deptAndRoles %>）
          </p>
          <% } %>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <% if(info.userTaskEntities[0].roleIds) { %>
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input class="form-control" name="taskUsers" value="<%- info.userTaskEntities[0].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[0].nextFlowTaskUserIds %>"
                   placeholder="任务人" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人" data-data="{searchRoleId: '', searchDepartmentId: ''}"
                   title="<%- info.userTaskEntities[0].nextFlowTaskUserNames %>" readonly>
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-data='{"roleIds": "<%- info.userTaskEntities[0].roleIds %>", "deptIds": "<%- info.userTaskEntities[0].deptIds %>"}'
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
</div>
<!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">漏改位置</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 100px;">序号</th>
              <th>页数（P）</th>
              <th>行号</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.qualityRedList) { %>
            <% for(var i = 0; i < info.qualityRedList.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td><%- info.qualityRedList[i].auditRedMissPage %></td>
              <td><%- info.qualityRedList[i].auditRedMissLine %></td>
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
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: -2px;">录排文件</label>
        <div class="col-xs-10 form-compact">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 80px;">序号</th>
              <th style="width: 150px;">分册书</th>
              <th style="width: 80px;">页数</th>
              <th>附件</th>
              <th style="width: 70px;"></th>
            </tr>
            </thead>
            <tbody>
            <% if(info.fileList) { %>
            <% for(var i = 0; i < info.fileList.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td title="<%- info.fileList[i].bookFascicleBookName %>"><%- info.fileList[i].bookFascicleBookName %></td>
              <td><%- info.fileList[i].hTaskPageNum %></td>
              <td><p class="form-control-static"><%- info.fileList[i].hBookFileName %></p></td>
              <td>
                <% if(info.fileList[i].hBookFileAddress && info.fileList[i].hBookFileAddress !=='') { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.fileList[i].hBookFileAddress %>">下载</button>
                <% } else { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.fileList[i].hBookFileAddress %>" disabled>下载</button>
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
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">录排备注</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.handleContentOne %></p>
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