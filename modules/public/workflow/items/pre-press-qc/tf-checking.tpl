<!--印前质检-正误表审核-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label" style="margin-top: 8px;">质检正误表</label>
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
            <% if(info.qualityRightWrongEntities) { %>
            <% for(var i = 0; i < info.qualityRightWrongEntities.length; i++) { %>
            <tr data-right-wrong-id="<%- info.qualityRightWrongEntities[i].rigthWrongId %>" data-fascicule-id="<%- info.qualityRightWrongEntities[i].bookFascicleId %>"
                data-fascicule-name="<%- info.qualityRightWrongEntities[i].bookFascicleBookName %>" data-is-confirm="<%- info.qualityRightWrongEntities[i].isConfirm %>"
                data-coefficient="<%- info.qualityRightWrongEntities[i].coefficient %>">
              <td><%- (i + 1) %></td>
              <td title="<%- info.qualityRightWrongEntities[i].bookFascicleBookName %>"><%- info.qualityRightWrongEntities[i].bookFascicleBookName %></td>
              <td><%- info.qualityRightWrongEntities[i].page %></td>
              <td><%- info.qualityRightWrongEntities[i].line %></td>
              <td title="<%- info.qualityRightWrongEntities[i].content %>"><%- info.qualityRightWrongEntities[i].content %></td>
              <td title="<%- info.qualityRightWrongEntities[i].coefficient %>" data-name="coefficient"><%- info.qualityRightWrongEntities[i].coefficient %></td>
              <td>
                <%- info.qualityRightWrongEntities[i].isConfirm === '1' ? '确认' : (info.qualityRightWrongEntities[i].isConfirm === '2' ? '不确认' : '') %>
              </td>
              <td title="<%- info.qualityRightWrongEntities[i].confirmCause %>"><%- info.qualityRightWrongEntities[i].confirmCause %></td>
              <td>
                <% if(info.qualityRightWrongEntities[i].isConfirm !== '1') { %>
                <% if(!info.qualityRightWrongEntities[i].checkResult || info.qualityRightWrongEntities[i].checkResult === '1') { %>
                <label class="checkbox-inline" style="margin-bottom: 1px; margin-top: 0;"><input type="checkbox" name="checkResult" checked/>同意</label>
                <% } else { %>
                <label class="checkbox-inline" style="margin-bottom: 1px; margin-top: 0;"><input type="checkbox" name="checkResult"/>同意</label>
                <% } %>
                <% } %>
              </td>
              <td>
                <% if(info.qualityRightWrongEntities[i].isConfirm !== '1') { %>
                <div class="form-group">
                  <div class="col-xs-12">
                    <input class="form-control" value="<%- info.qualityRightWrongEntities[i].checkIdea %>" name="checkIdea" placeholder="审核意见" maxlength="128" data-fv-notempty="true"
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
            <input class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" readonly>
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'
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
        <label class="col-xs-2 control-label" style="margin-top: 8px;">质检正误表</label>
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
            <% if(info.qualityRightWrongEntities) { %>
            <% for(var i = 0; i < info.qualityRightWrongEntities.length; i++) { %>
            <tr data-fascicule-id="<%- info.qualityRightWrongEntities[i].bookFascicleId %>" data-fascicule-name="<%- info.qualityRightWrongEntities[i].bookFascicleBookName %>"
                data-is-confirm="<%- info.qualityRightWrongEntities[i].isConfirm %>" data-check-result="<%- info.qualityRightWrongEntities[i].checkResult %>"
                data-coefficient="<%- info.qualityRightWrongEntities[i].coefficient %>">
              <td><%- (i + 1) %></td>
              <td title="<%- info.qualityRightWrongEntities[i].bookFascicleBookName %>"><%- info.qualityRightWrongEntities[i].bookFascicleBookName %></td>
              <td><%- info.qualityRightWrongEntities[i].page %></td>
              <td><%- info.qualityRightWrongEntities[i].line %></td>
              <td title="<%- info.qualityRightWrongEntities[i].content %>"><%- info.qualityRightWrongEntities[i].content %></td>
              <td title="<%- info.qualityRightWrongEntities[i].coefficient %>" data-name="coefficient"><%- info.qualityRightWrongEntities[i].coefficient %></td>
              <td>
                <%- info.qualityRightWrongEntities[i].isConfirm === '1' ? '确认' : (info.qualityRightWrongEntities[i].isConfirm === '2' ? '不确认' : '') %>
              </td>
              <td title="<%- info.qualityRightWrongEntities[i].confirmCause %>"><%- info.qualityRightWrongEntities[i].confirmCause %></td>
              <td>
                <% if(info.qualityRightWrongEntities[i].isConfirm !== '1') { %>
                <%- info.qualityRightWrongEntities[i].checkResult === '1' ? '同意' : (info.qualityRightWrongEntities[i].checkResult === '2' ? '不同意' : '') %>
                <% } %>
              </td>
              <td title="info.qualityRightWrongEntities[i].checkIdea"><%- info.qualityRightWrongEntities[i].isConfirm !== '1' ? info.qualityRightWrongEntities[i].checkIdea : '' %></td>
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