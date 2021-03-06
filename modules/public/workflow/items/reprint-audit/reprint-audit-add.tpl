<!--新增-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-4 control-label">重印名称<span class="must">*</span></label>
        <div class="col-xs-4">
          <input type="text" value="<%- info.reprintBookAuditName %>" maxlength="128" name="reprintBookAuditName"
                 class="form-control"
                 data-fv-notempty="true" data-fv-notempty-message="请填写重印名称"/>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <button class="btn btn-default" id="addBook">选择图书</button>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <div class="col-xs-10 col-xs-offset-1">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px">序号</th>
              <th style="width: 150px">图书名称</th>
              <th style="width: 150px">读者服务部所需数量</th>
              <th style="width: 150px">典藏借阅部所需数量</th>
              <th style="width: 60px">操作</th>
            </tr>
            </thead>
            <tbody id="selectBookTable">
            <% if(info.reprintBookInfoList) { %>
            <% for(var i = 0; i < info.reprintBookInfoList.length; i++) { %>
            <tr data-id="<%- info.reprintBookInfoList[i].bookId %>">
              <td data-value="number"><%- (i + 1) %></td>
              <td><%- info.reprintBookInfoList[i].bookName %></td>
              <td><%- info.reprintBookInfoList[i].libraryNeedNum %></td>
              <td><%- info.reprintBookInfoList[i].readersServiceNeedNum %></td>
              <td><button data-id="<%- info.reprintBookInfoList[i].bookId %>" class="btn btn-xs btn-danger btn-rounded book-delete">删除</button></td>
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
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程<span class="must">*</span></label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptAndRoles) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
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
          <div class="input-group">
            <div class="input-group with-clear">
              <input type="text" class="form-control" name="taskUsers"
                     title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                     value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                     data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                     data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}"
                     data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
              <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i
                      class="fa fa-user-o"></i>
              </button>
            </span>
            </div>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <% } %>
  <% } %>
</div>
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">重印名称</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.reprintBookAuditName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">重印名称</label>
        <div class="col-xs-10">
          <table class="table table-nowrap table-striped table-hover">
            <thead>
            <tr>
              <th style="width: 50px">序号</th>
              <th>图书名称</th>
              <th style="width: 150px">读者服务部所需数量</th>
              <th style="width: 150px">典藏借阅部所需数量</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.reprintBookInfoList) { %>
            <% for(var i = 0; i < info.reprintBookInfoList.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td title="<%- info.reprintBookInfoList[i].bookName %>"><%- info.reprintBookInfoList[i].bookName %></td>
              <td><%- info.reprintBookInfoList[i].libraryNeedNum %></td>
              <td><%- info.reprintBookInfoList[i].readersServiceNeedNum %></td>
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