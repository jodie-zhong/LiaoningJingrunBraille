<!--印前质检-质检-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <% if(info.readOrThirdEntity && info.readOrThirdEntity.flowId) { %>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label"><%- info.readOrThirdEntity.flowId %></label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.readOrThirdEntity.userName %></p>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">抽查数据表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th>序号</th>
              <th>册数</th>
              <th>抽查页码</th>
              <th>抽查图书版数</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.bookFascicleEntities) { %>
            <% for(var i = 0; i < info.bookFascicleEntities.length; i++) { %>
            <tr data-fascicule-id="<%- info.bookFascicleEntities[i].bookFascicleId %>">
              <td><%- (i + 1) %></td>
              <td><%- info.bookFascicleEntities[i].bookFascicleBookName %></td>
              <td><%- info.bookFascicleEntities[i].bookFascicleCheckPage %></td>
              <td><%- info.bookFascicleEntities[i].bookFascicleCheckVersion %></td>
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
        <label class="col-xs-2 control-label">质检正误表</label>
        <div class="col-xs-10 form-compact">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 90px;">册数</th>
              <th style="width: 120px;">页码<span class="must-td">*</span></th>
              <th style="width: 120px;">行<span class="must-td">*</span></th>
              <th>内容<span class="must-td">*</span></th>
              <th style="width: 90px;">系数</th>
              <th style="width: 50px;">
                <button class="addTableRow btn btn-xs btn-default"><i class="fa fa-plus box"></i></button>
              </th>
            </tr>
            </thead>
            <tbody data-name="trueOrFalseTb">

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">差错计算</label>
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
  <% if(info.readOrThirdEntity && info.readOrThirdEntity.flowId) { %>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label"><%- info.readOrThirdEntity.flowId %></label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.readOrThirdEntity.userName %></p>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">抽查数据表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th>序号</th>
              <th>册数</th>
              <th>抽查页码</th>
              <th>抽查图书版数</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.bookFascicleEntities) { %>
            <% for(var i = 0; i < info.bookFascicleEntities.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td><%- info.bookFascicleEntities[i].bookFascicleBookName %></td>
              <td><%- info.bookFascicleEntities[i].bookFascicleCheckPage %></td>
              <td><%- info.bookFascicleEntities[i].bookFascicleCheckVersion %></td>
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
        <label class="col-xs-2 control-label">质检正误表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 80px;">册数</th>
              <th style="width: 80px;">页码</th>
              <th style="width: 80px;">行</th>
              <th>内容</th>
              <th style="width: 50px;">系数</th>
            </tr>
            </thead>
            <tbody data-name="trueOrFalseTb">
            <% if(info.qualityRightWrongEntities) { %>
            <% for(var i = 0; i < info.qualityRightWrongEntities.length; i++) { %>
            <tr data-fascicule-id="<%- info.qualityRightWrongEntities[i].bookFascicleId %>" data-coefficient="<%- info.qualityRightWrongEntities[i].coefficient %>">
              <td><%- (i + 1) %></td>
              <td title="<%- info.qualityRightWrongEntities[i].bookFascicleBookName %>"><%- info.qualityRightWrongEntities[i].bookFascicleBookName %></td>
              <td><%- info.qualityRightWrongEntities[i].page %></td>
              <td><%- info.qualityRightWrongEntities[i].line %></td>
              <td title="<%- info.qualityRightWrongEntities[i].content %>"><%- info.qualityRightWrongEntities[i].content %></td>
              <td title="<%- info.qualityRightWrongEntities[i].coefficient %>" data-name="coefficient"><%- info.qualityRightWrongEntities[i].coefficient %></td>
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
        <label class="col-xs-2 control-label">差错计算</label>
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