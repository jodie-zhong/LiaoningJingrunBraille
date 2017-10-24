<!--附加申请-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row" id="needNumber">
    <div class="col-xs-12">
      <div class="form-group">
        <div class="col-xs-12">
          <table class="table table-striped table-nowrap table-hover">
            <thead>
            <tr>
              <th class="w-table">序号</th>
              <th class="w-200">图书名称</th>
              <th style="width: 100px">所需数量<span class="must-td">*</span></th>
              <th >备注</th>
              <!--<th style="width: 60px">操作</th>-->
            </tr>
            </thead>
            <tbody id="formEdit">
            <% for(var i = 0; i < info.bookList.length; i++) { %>
            <tr data-name="<%- info.bookList[i].bookName %>" data-bookId="<%- info.bookList[i].bookId %>"
                data-taskId="<%- info.bookList[i].taskId %>">
              <td data-value="number" class="w-table"><%- (i + 1) %></td>
              <td title="<%- info.bookList[i].bookName %>"><%- info.bookList[i].bookName %></td>
              <td class="form-group">
                <input type="text" name="needNum" class="form-control small"
                       pattern="^[0-9]*$" maxlength="8" data-fv-notempty="true" data-fv-notempty-message="请填写数量"  data-fv-regexp-message="输入8位以下整数"
                       value="<%- info.bookList[i].libraryNeedNum %>"/>
              </td>
              <td class="form-group">
                <input type="text" maxlength="512" placeholder="最长输入(512个字符)" class="form-control small" name="remark" value="<%- info.bookList[i].reprintLaunchRemarks %>">
              </td>
              <!--<td>-->
                <!--<button class="btn btn-danger btn-xs btn-rounded delete">删除</button>-->
              <!--</td>-->
            </tr>
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
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptNames) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
            <%- info.userTaskEntities[i].flowName %>（
            <%- info.userTaskEntities[i].deptNames %> -
            <%- info.userTaskEntities[i].roleNames %>）</p>
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
            <input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
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
        <div class="col-xs-11 col-xs-offset-1">
          <table class="table table-striped table-nowrap table-hover">
            <thead>
            <tr>
              <th class="w-table">序号</th>
              <th class="w-200">图书名称</th>
              <th style="width: 100px">所需数量</th>
              <th >备注</th>
            </tr>
            </thead>
            <tbody id="selectBookTable">
            <% for(var i = 0; i < info.bookList.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td title="<%- info.bookList[i].bookName %>"><%- info.bookList[i].bookName %></td>
              <% if(info.sponsorDept==='典藏借阅部') {%>
              <td title="<%- info.bookList[i].readersServiceNeedNum %>">
                <%- info.bookList[i].readersServiceNeedNum %>
              </td>
              <% }else {%>
              <td title="<%- info.bookList[i].libraryNeedNum %>">
                <%- info.bookList[i].libraryNeedNum %>
              </td>
              <% } %>
              <td title="<%- info.bookList[i].reprintLaunchRemarks %>"><%- info.bookList[i].reprintLaunchRemarks %></td>
            </tr>
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
