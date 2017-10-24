<!--版署下发-->
<% if(isEdit) { %>
<div id="formCioIssuedEdit">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <table class="table table-striped table-nowrap">
          <thead>
          <tr>
            <th style="width: 45px">序号</th>
            <th style="width: 80px">图书名称</th>
            <th style="width: 80px">图书类型</th>
            <th style="width: 75px">是否通过</th>
            <th style="width: 100px">书号</th>
            <th style="width: 50px">条形码</th>
            <th style="width: 150px">分类号<span class="must-td">*</span></th>
          </tr>
          </thead>
          <tbody id="selectIssuedTable">
          <% for(var i = 0; i < info.bookNameList.length; i++) { %>
          <% var bookList = info.bookNameList[i]; %>
          <tr style="min-height:60px" data-id="<%- bookList.bookId %>" data-taskId="<%- bookList.taskId %>"
              data-bookTypeCode="<%- bookList.bookTypeCode %>"
              data-bookFileId="<%- bookList.bookFileId %>" data-flowId="<%- bookList.flowId %>"
              data-name="<%- bookList.bookName %>">
            <td><%- (i + 1) %></td>
            <td title="<%- bookList.bookName %>"><%- bookList.bookName %></td>
            <td>
              <% if(bookList.bookTypeCode === '1') { %>
              盲文书
              <% } %>
              <% if(bookList.bookTypeCode === '2') { %>
              大字本
              <% } %>
              <% if(bookList.bookTypeCode === '3') { %>
              普通本
              <% } %>
            </td>
            <td>通过</td>
            <td title="<%- bookList.bookIsbn %>"><%- bookList.bookIsbn %></td>
            <td>
              <% if(!bookList.bookFileAddress || bookList.bookFileAddress === '') { %>
              <button class="btn btn-default btn-sm btn-rounded btn-download"
                      data-download="<%- bookList.bookFileAddress %>" disabled>下载
              </button>
              <% } else { %>
              <button class="btn btn-default btn-sm btn-rounded btn-download"
                      data-download="<%- bookList.bookFileAddress %>">下载
              </button>
              <% } %>
            </td>
            <td>
              <div class="form-group" style="margin: 0">
                <input type="text" name="bookDetailClassNum" maxlength="32" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请填写分类号" placeholder="分类号"
                       value="<%- bookList.bookDetailClassNum %>">
              </div>
            </td>
          </tr>
          <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0 ; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label" style="margin-top: 8px">下一流程</label>
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
        <label class="col-xs-4 control-label" style="margin-top: 8px">任务人<span class="c-red">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                   data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}" data-fv-notempty="true"
                   data-fv-notempty-message="请选择下一任务人">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i class="fa fa-user-o"></i>
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
        <table class="table table-striped table-nowrap">
          <thead>
          <tr>
            <th style="width: 45px">序号</th>
            <th style="width: 80px">图书名称</th>
            <th style="width: 80px">图书类型</th>
            <th style="width: 75px">是否通过</th>
            <th style="width: 100px">书号</th>
            <th style="width: 50px">条形码</th>
            <th style="width: 150px">分类号</th>
          </tr>
          </thead>
          <tbody>
          <% for(var i = 0; i < info.bookNameList.length; i++) { %>
          <% var bookList = info.bookNameList[i]; %>
          <tr style="min-height:60px" data-id="<%- bookList.bookId %>" data-taskId="<%- bookList.taskId %>" data-bookFileId="<%- bookList.bookFileId %>" data-flowId="<%- bookList.flowId %>"
              data-name="<%- bookList.bookName %>">
            <td><%- (i + 1) %></td>
            <td title="<%- bookList.bookName %>"><%- bookList.bookName %></td>
            <td>
              <% if(bookList.bookTypeCode === '1') { %>
              盲文书
              <% } %>
              <% if(bookList.bookTypeCode === '2') { %>
              大字本
              <% } %>
              <% if(bookList.bookTypeCode === '3') { %>
              普通本
              <% } %>
            </td>
            <td>通过</td>
            <td title="<%- bookList.bookIsbn %>"><%- bookList.bookIsbn %></td>
            <td>
              <% if(!bookList.bookFileAddress || bookList.bookFileAddress === '') { %>
              <button class="btn btn-default btn-sm btn-rounded btn-download"
                      data-download="<%- bookList.bookFileAddress %>" disabled>下载
              </button>
              <% } else { %>
              <button class="btn btn-default btn-sm btn-rounded btn-download"
                      data-download="<%- bookList.bookFileAddress %>">下载
              </button>
              <% } %>
            </td>
            <td title="<%- bookList.bookDetailClassNum %>"><%- bookList.bookDetailClassNum %></td>
          </tr>
          <% } %>
          </tbody>
        </table>
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