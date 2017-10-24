<!--校对-核红-->
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
          <label class="radio-inline"><input type="radio" name="handleState" value="2" checked/>打样</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1" checked/>退改</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>打样</label>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div name="editArea">
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
              <% if(info.proofRedEntities) { %>
              <% for(var i = 0; i < info.proofRedEntities.length; i++) { %>
              <tr>
                <td><%- (i + 1) %></td>
                <td>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <input class="form-control" value="<%- info.proofRedEntities[i].auditRedMissPage %>" name="auditRedMissPage" placeholder="页数" pattern="^[1-9]\d{0,3}$" data-fv-regexp-message="请输入大于0的整数，最大4位"
                             data-fv-notempty="true" data-fv-notempty-message="请填写页数">
                    </div>
                  </div>
                </td>
                <td>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <input class="form-control" value="<%- info.proofRedEntities[i].auditRedMissLine %>" name="auditRedMissLine" placeholder="行号" pattern="^[1-9]\d{0,3}$" data-fv-regexp-message="请输入大于0的整数，最大4位"
                             data-fv-notempty="true" data-fv-notempty-message="请填写行号">
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
      <div class="col-xs-6">
        <div class="form-group">
          <label class="col-xs-4 control-label">漏改数量</label>
          <div class="col-xs-8">
            <input name="missNum" class="form-control" value="" title="" readonly/>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" >
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
            <% if(info.proofRedEntities) { %>
            <% for(var i = 0; i < info.proofRedEntities.length; i++) { %>
            <tr>
              <td style="width: 100px;"><%- (i + 1) %></td>
              <td><%- info.proofRedEntities[i].auditRedMissPage %></td>
              <td><%- info.proofRedEntities[i].auditRedMissLine %></td>
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
          <p class="form-control-static"><%- info.proofRedEntities.length %></p>
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