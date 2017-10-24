<!--印前质检-核红-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">处理意见</label>
        <div class="col-xs-8">
          <% if(info.handleState === '2') { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1"/>退改</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2" checked/>定稿</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1" checked/>退改</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>定稿</label>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div id="missedArea">
    <div class="row">
      <div class="col-xs-12">
        <div class="form-group">
          <label class="col-xs-2 control-label">漏改位置</label>
          <div class="col-xs-10 form-compact">
            <table class="table table-striped table-hover table-nowrap">
              <thead>
              <tr>
                <th style="width: 100px;">序号</th>
                <th>页数（P）<span class="must-td">*</span></th>
                <th>行号<span class="must-td">*</span></th>
                <th style="width: 50px;">
                  <button class="addTableRow btn btn-xs btn-default"><i class="fa fa-plus box"></i></button>
                </th>
              </tr>
              </thead>
              <tbody id="dataTBody">

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-6">
        <div class="form-group">
          <label class="col-xs-4 control-label">漏改数量</label>
          <div class="col-xs-8">
            <input name="missNum" class="form-control" value="<%- info.qualityRedList.length %>" title="<%- info.qualityRedList.length %>" readonly/>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities && info.userTaskEntities.length > 0) { %>
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
          <input type="hidden" name="flowId" value="<%- info.userTaskEntities[0].flowId %>">
          <input type="hidden" name="flowName" value="<%- info.userTaskEntities[0].flowName %>">
          <input type="hidden" name="nextCategory" value="<%- info.userTaskEntities[0].category %>">
          <input type="hidden" name="deptIds" value="<%- info.userTaskEntities[0].deptIds %>">
          <input type="hidden" name="roleIds" value="<%- info.userTaskEntities[0].roleIds %>">
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">处理意见</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.handleState === '1' ? '退改' : (info.handleState === '2' ? '打样' : '') %></p>
        </div>
      </div>
    </div>
  </div>
  <% if(info.handleState === '1') { %>
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">漏改数量</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.qualityRedList.length %></p>
        </div>
      </div>
    </div>
  </div>
  <% } %>
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