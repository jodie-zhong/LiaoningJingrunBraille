<!--校对-勘误表确认-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: -2px;">勘误表</label>
        <div class="col-xs-10 form-compact">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 50px;">页码</th>
              <th style="width: 50px;">行</th>
              <th>误</th>
              <th>正</th>
              <th style="width: 100px;"><label class="checkbox-inline"
                                               style="font-weight: bold; margin-top: 0; margin-bottom: 1px;"><input
                      type="checkbox" name="isConfirmBatch"/>是否确认</label>
              </th>
              <th>不确认原因<span class="must-td uncheckMust">*</span></th>
            </tr>
            </thead>
            <tbody data-name="trueOrFalseTb" id="proofRightOrWrongTbody">
            <% if(info.proofRightOrWrongEntities) { %>
            <% for(var i = 0; i < info.proofRightOrWrongEntities.length; i++) { %>
            <tr data-rigthWrongId="<%- info.proofRightOrWrongEntities[i].rigthWrongId %>">
              <td><%- (i + 1) %></td>
              <td><%- info.proofRightOrWrongEntities[i].page %></td>
              <td><%- info.proofRightOrWrongEntities[i].line %></td>
              <td title="<%- info.proofRightOrWrongEntities[i].wrongInformation %>"><%-
                info.proofRightOrWrongEntities[i].wrongInformation %>
              </td>
              <td title="<%- info.proofRightOrWrongEntities[i].rigthInformation %>"><%-
                info.proofRightOrWrongEntities[i].rigthInformation %>
              </td>
              <td>
                <% if(!info.proofRightOrWrongEntities[i].isConfirm || info.proofRightOrWrongEntities[i].isConfirm ===
                '1') { %>
                <label class="checkbox-inline" style="margin-bottom: 1px; margin-top: 0;"><input type="checkbox"
                                                                                                 name="isConfirm"
                                                                                                 checked/>确认</label>
                <% } else { %>
                <label class="checkbox-inline" style="margin-bottom: 1px; margin-top: 0;"><input type="checkbox"
                                                                                                 name="isConfirm"/>确认</label>
                <% } %>
              </td>
              <td>
                <div class="form-group">
                  <div class="col-xs-12">
                    <input type="text" class="form-control reasonWithFv"
                           value="<%- info.proofRightOrWrongEntities[i].confirmCause %>" name="confirmCause"
                           placeholder="不确认原因" maxlength="128"
                           data-fv-notempty="true" data-fv-notempty-message="请填写不确认原因">
                  </div>
                </div>
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
        <label class="col-xs-2 control-label">校对报告</label>
        <div class="col-xs-7">
          <div class="input-group">
            <p class="form-control-static" data-name="previewName">
              <%- info.reportName %>
            </p>
          </div>
        </div>
        <div class="col-xs-3">
          <% if( !info.reportAddress || info.reportAddress === '') { %>
          <button class="btn btn-default" data-down="download" data-address="" disabled>下载</button>
          <% } else {%>
          <button class="btn btn-default address" data-down="download"
                  data-address="<%- info.reportAddress %>">下载</button>
          <% } %>
          <button class="btn btn-default" type="button" name="preview">预览</button>
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
            <input type="text" class="form-control" name="taskUsers"
                   value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人"
                   data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}"
                   data-fv-notempty="true"
                   data-fv-notempty-message="请选择下一任务人" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   readonly>
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'
                      data-open="public/user/select-users">
                <i class="fa fa-user-o"></i>
              </button>
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
<!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: -2px;"><%- info.flowName %>正误表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 50px;">页码</th>
              <th style="width: 50px;">行</th>
              <th>误</th>
              <th>正</th>
              <th style="width: 80px;">是否确认</th>
              <th>不确认原因</th>
            </tr>
            </thead>
            <tbody data-name="trueOrFalseTb">
            <% if(info.proofRightOrWrongEntities) { %>
            <% for(var i = 0; i < info.proofRightOrWrongEntities.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td><%- info.proofRightOrWrongEntities[i].page %></td>
              <td><%- info.proofRightOrWrongEntities[i].line %></td>
              <td title="<%- info.proofRightOrWrongEntities[i].wrongInformation %>"><%-
                info.proofRightOrWrongEntities[i].wrongInformation %>
              </td>
              <td title="<%- info.proofRightOrWrongEntities[i].rigthInformation %>"><%-
                info.proofRightOrWrongEntities[i].rigthInformation %>
              </td>
              <td>
                <%- (info.proofRightOrWrongEntities[i].isConfirm === '1') ? '确认' :
                (info.proofRightOrWrongEntities[i].isConfirm === '2' ? '不确认' : '') %>
              </td>
              <td title="<%- info.proofRightOrWrongEntities[i].isConfirm %>"><%-
                info.proofRightOrWrongEntities[i].isConfirm !== '1' ? info.proofRightOrWrongEntities[i].confirmCause :
                '' %>
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
        <label class="col-xs-2 control-label">校对报告</label>
        <div class="col-xs-7">
          <div class="input-group">
            <p class="form-control-static" data-name="previewName">
              <%- info.reportName %>
            </p>
          </div>
        </div>
        <div class="col-xs-3">
          <% if( !info.reportAddress || info.reportAddress === '') { %>
          <button class="btn btn-default" type="button" data-down="download" disabled>下载</button>
          <button class="btn btn-default" type="button"  disabled>预览</button>
          <% } else {%>
          <button class="btn btn-default address" data-down="download"
                  data-address="<%- info.reportAddress %>">下载</button>
          <button class="btn btn-default btn-preview" type="button" data-preview="<%- info.reportAddress %>">预览</button>
          <% } %>
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