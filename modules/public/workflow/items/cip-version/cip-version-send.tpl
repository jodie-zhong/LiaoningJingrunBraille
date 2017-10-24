<!--版署下发-->
<% if(isEdit) { %>
<div id="formCioIssuedEdit" class="form-horizontal">
  <div class="row">
    <h5 style="color: #a94442">注意：未通过图书下一流程为——未通过处理</h5>
    <div class="col-xs-12">
      <div class="form-group">
        <table class="table table-striped table-nowrap">
          <thead>
          <tr>
            <th style="width: 45px">序号</th>
            <th style="width: 80px">图书名称</th>
            <th style="width: 80px">图书类型</th>
            <th style="width: 75px">是否通过</th>
            <th style="width: 150px">未通过原因<span class="must-td">*</span></th>
            <th style="width: 100px">书号<span class="must-td">*</span></th>
            <th style="width: 150px">条形码<span class="must-td">*</span></th>
          </tr>
          </thead>
          <tbody id="selectIssuedTable">
          <% for(var i = 0; i < info.bookNameList.length; i++) { %>
          <% var bookList = info.bookNameList[i]; %>
          <tr style="min-height: 60px" data-id="<%- bookList.bookId %>" data-bookTypeCode="<%- bookList.bookTypeCode %>" data-taskId="<%- bookList.taskId %>" data-bookFileId="<%- bookList.bookFileId %>" data-flowId="<%- bookList.flowId %>"
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
            <td>
              <label class="radio-inline" style="margin: 0">
                <% if(!bookList.isPass || bookList.isPass === '1') { %>
                <input type="radio" name="isPass<%- ( i )%>" data-value="isPass" value="1"  checked="checked">通过
                <% } else { %>
                <input type="radio" name="isPass<%- ( i )%>" data-value="isPass" value="1" />通过
                <% } %>
              </label><br>
              <label class="radio-inline" style="margin: 0">
                <% if(bookList.isPass === '2') { %>
                <input type="radio" name="isPass<%- ( i )%>" value="2" data-value="isPass"  checked="checked"/>不通过
                <% } else { %>
                <input type="radio" name="isPass<%- ( i )%>" value="2" data-value="isPass" />不通过
                <% } %>
              </label>
            </td>
            <td>
              <% if(bookList.isPass === '2') { %>
              <div class="form-group" style="margin: 0">
                <input type="text" name="notPassCause" class="form-control" data-fv-notempty="true" placeholder="输入未通过原因"
                       data-fv-notempty-message="请填写未通过原因" maxlength="1024" value="<%- bookList.notPassCause %>">
              </div>
              <% }else { %>
              <div class="form-group" style="display: none;margin: 0">
                <input type="text" name="notPassCause" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请填写未通过原因" maxlength="1024" placeholder="输入未通过原因"
                       value="<%- bookList.notPassCause %>">
              </div>
              <% } %>
            </td>
            <td>
              <% if(!bookList.isPass || bookList.isPass === '1') { %>
              <div class="form-group" style="margin: 0">
                <input type="text" name="bookIsbn" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请填写书号" maxlength="32" placeholder="书号"
                       value="<%- bookList.bookIsbn %>">
              </div>
              <% }else { %>
              <div class="form-group" style="display: none;margin: 0">
                <input type="text" name="bookIsbn" data-fv-notempty="true" maxlength="32" data-fv-notempty-message="请填写书号" class="form-control" placeholder="书号"
                       value="<%- bookList.bookIsbn %>">
              </div>
              <% } %>
            </td>
            <td>
              <% if(!bookList.isPass || bookList.isPass === '1') { %>
              <div class="form-group" style="margin: 0">
                <div class="input-group fileUp with-clear">
                  <input type="text" class="form-control barCode" data-fv-notempty="true"
                         data-fv-notempty-message="请上传条形码" name="bookFileName"
                         data-value="<%- bookList.bookFileAddress %>" value="<%- bookList.bookFileName %>"
                         placeholder="条形码" readonly/>
                  <span class="input-group-btn">
                    <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                    <button class="btn btn-default" type="button" data-open="public/file/file-upload"
                            data-data='{"type": "*.jpg;*.jpeg;*.png"}'><i class="fa fa-file-o"></i>
                    </button>
                  </span>
                </div>
              </div>
              <% }else { %>
              <div class="form-group" style="display: none;margin: 0">
                <div class="input-group fileUp with-clear">
                  <input type="text" class="form-control barCode" data-fv-notempty="true"
                         data-fv-notempty-message="请上传条形码" name="bookFileName"
                         data-value="<%- bookList.bookFileAddress %>" value="<%- bookList.bookFileName %>"
                         placeholder="条形码" readonly/>
                  <span class="input-group-btn">
                    <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                    <button class="btn btn-default" type="button" data-open="public/file/file-upload"
                            data-data='{"type": "*.jpg;*.jpeg;*.png"}'><i class="fa fa-file-o"></i>
                    </button>
                </span>
                </div>
              </div>
              <% } %>
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
        <label class="col-xs-4 control-label">下一流程</label>
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
        <label class="col-xs-4 control-label">任务人<span class="c-red">*</span></label>
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
            <th style="width: 150px">未通过原因</th>
            <th style="width: 100px">书号</th>
            <th style="width: 150px">条形码</th>
          </tr>
          </thead>
          <tbody>
          <% for(var i = 0; i < info.bookNameList.length; i++) { %>
          <% var bookList = info.bookNameList[i]; %>
          <tr style="min-height: 60px" data-id="<%- bookList.bookId %>" data-taskId="<%- bookList.taskId %>" data-bookFileId="<%- bookList.bookFileId %>" data-flowId="<%- bookList.flowId %>"
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
            <td>
              <% if(bookList.isPass === '1') { %>
              通过
              <% } else { %>
              不通过
              <% } %>
            </td>
            <% if(bookList.isPass === '1') { %>
            <td></td>
            <td><%- bookList.bookIsbn %></td>
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
            <% } else { %>
            <td><%- bookList.notPassCause %></td>
            <td></td>
            <td></td>
            <% } %>
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