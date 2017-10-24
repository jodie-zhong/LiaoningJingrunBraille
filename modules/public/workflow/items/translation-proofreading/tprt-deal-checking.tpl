<!--译校通读-正误表审核-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: 8px;"><%- info.flowName %>正误表</label>
        <div class="col-xs-10 form-compact">
          <div class="table-scroll">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 60px;">序号</th>
              <th style="width: 70px;">册数</th>
              <th style="width: 70px;">页码</th>
              <th style="width: 70px;">行</th>
              <th style="width: 200px;">内容</th>
              <th style="width: 60px;">系数</th>
              <th style="width: 180px;">确认结果</th>
              <th>不确认原因</th>
              <th style="width: 180px; white-space: normal;">
                <label class="checkbox-inline" style="font-weight: bold; margin-top: 0; margin-bottom: 1px;"><input type="checkbox" name="checkResultBatch"/>确认结果审核</label>
              </th>
              <th style="width: 300px;">审核意见<span class="must-td uncheckMust">*</span></th>
            </tr>
            </thead>
            <tbody data-name="trueOrFalseTb">
            <% if(info.rightWrongList) { %>
            <% for(var i = 0; i < info.rightWrongList.length; i++) { %>
            <tr data-right-wrong-id="<%- info.rightWrongList[i].rigthWrongId %>" data-fascicule-id="<%- info.rightWrongList[i].bookFascicleId %>"
                data-fascicule-name="<%- info.rightWrongList[i].bookFascicleBookName %>" data-is-confirm="<%- info.rightWrongList[i].isConfirm %>"
                data-coefficient="<%- info.rightWrongList[i].coefficient %>">
              <td><%- (i + 1) %></td>
              <td title="<%- info.rightWrongList[i].bookFascicleBookName %>"><%- info.rightWrongList[i].bookFascicleBookName %></td>
              <td><%- info.rightWrongList[i].page %></td>
              <td><%- info.rightWrongList[i].line %></td>
              <td title="<%- info.rightWrongList[i].content %>"><%- info.rightWrongList[i].content %></td>
              <td title="<%- info.rightWrongList[i].coefficient %>" data-name="coefficient"><%- info.rightWrongList[i].coefficient %></td>
              <td>
                <%- info.rightWrongList[i].isConfirm === '1' ? '确认' : (info.rightWrongList[i].isConfirm === '2' ? '不确认' : '') %>
              </td>
              <td title="<%- info.rightWrongList[i].confirmCause %>"><%- info.rightWrongList[i].confirmCause %></td>
              <td>
                <% if(info.rightWrongList[i].isConfirm !== '1') { %>
                <% if(!info.rightWrongList[i].checkResult || info.rightWrongList[i].checkResult === '1') { %>
                <label class="checkbox-inline" style="margin-bottom: 1px; margin-top: 0;"><input type="checkbox" name="checkResult" checked/>同意</label>
                <% } else { %>
                <label class="checkbox-inline" style="margin-bottom: 1px; margin-top: 0;"><input type="checkbox" name="checkResult"/>同意</label>
                <% } %>
                <% } %>
              </td>
              <td title="<%- info.rightWrongList[i].checkIdea %>">
                <% if(info.rightWrongList[i].isConfirm !== '1') { %>
                <div class="form-group">
                  <div class="col-xs-12" style="padding: 10px;">
                    <input class="form-control" value="<%- info.rightWrongList[i].checkIdea %>" name="checkIdea" placeholder="审核意见" maxlength="128" data-fv-notempty="true"
                           data-fv-notempty-message="请填写审核意见">
                  </div>
                </div>
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
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: -2px;">差错计算</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th>序号</th>
              <th>册数</th>
              <th>差错数</th>
              <th>差错率（千分比）</th>
            </tr>
            </thead>
            <tbody data-name="diffTb">
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
            <input type="text" class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人" data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}" data-fv-notempty="true"
                   data-fv-notempty-message="请选择下一任务人" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" readonly>
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'
                      data-open="public/user/select-users">
                <i class="fa fa-user-o"></i>
              </button>
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
        <label class="col-xs-2 control-label" style="margin-top: 8px;"><%- info.flowName %>正误表</label>
        <div class="col-xs-10">
        	<div class="table-scroll">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 60px;">序号</th>
              <th style="width: 70px;">册数</th>
              <th style="width: 70px;">页码</th>
              <th style="width: 70px;">行</th>
              <th style="width: 200px;">内容</th>
              <th style="width: 60px;">系数</th>
              <th style="width: 180px;">确认结果</th>
              <th>不确认原因</th>
              <th style="width: 180px; white-space: normal;">确认结果审核</th>
              <th style="width: 300px;">不同意原因</th>
            </tr>
            </thead>
            <tbody data-name="trueOrFalseTb">
            <% if(info.rightWrongList) { %>
            <% for(var i = 0; i < info.rightWrongList.length; i++) { %>
            <tr data-fascicule-id="<%- info.rightWrongList[i].bookFascicleId %>" data-fascicule-name="<%- info.rightWrongList[i].bookFascicleBookName %>"
                data-is-confirm="<%- info.rightWrongList[i].isConfirm %>" data-check-result="<%- info.rightWrongList[i].checkResult %>" data-coefficient="<%- info.rightWrongList[i].coefficient %>">
              <td><%- (i + 1) %></td>
              <td title="<%- info.rightWrongList[i].bookFascicleBookName %>"><%- info.rightWrongList[i].bookFascicleBookName %></td>
              <td><%- info.rightWrongList[i].page %></td>
              <td><%- info.rightWrongList[i].line %></td>
              <td title="<%- info.rightWrongList[i].content %>"><%- info.rightWrongList[i].content %></td>
              <td title="<%- info.rightWrongList[i].coefficient %>" data-name="coefficient"><%- info.rightWrongList[i].coefficient %></td>
              <td>
                <%- info.rightWrongList[i].isConfirm === '1' ? '确认' : (info.rightWrongList[i].isConfirm === '2' ? '不确认' : '') %>
              </td>
              <td title="<%- info.rightWrongList[i].confirmCause %>"><%- info.rightWrongList[i].confirmCause %></td>
              <td>
                <% if(info.rightWrongList[i].isConfirm !== '1') { %>
                <%- info.rightWrongList[i].checkResult === '1' ? '同意' : (info.rightWrongList[i].checkResult === '2' ? '不同意' : '') %>
                <% } %>
              </td>
              <td title="<%- info.rightWrongList[i].checkIdea %>"><%- info.rightWrongList[i].isConfirm !== '1' ? info.rightWrongList[i].checkIdea : '' %></td>
            </tr>
            <% } %>
            <% } %>
            </tbody>
          </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: -2px;">差错计算</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th>序号</th>
              <th>册数</th>
              <th>差错数</th>
              <th>差错率（千分比）</th>
            </tr>
            </thead>
            <tbody data-name="diffTb">
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