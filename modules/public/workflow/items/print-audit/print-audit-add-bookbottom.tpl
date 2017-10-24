<!--典藏借阅部部门负责人审核-->
<% if(isEdit) { %>
<div class="form-horizontal form-compact">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审批结果：</label>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(!info.handleState || info.handleState === '1') { %>
            <input type="radio" name="handleState" value="1" required checked="checked">通过
            <% } else { %>
            <input type="radio" name="handleState" value="1" required>通过
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.handleState === '2') { %>
            <input type="radio" name="handleState" value="2" required checked="checked">不通过
            <% } else { %>
            <input type="radio" name="handleState" value="2" required>不通过
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核意见：</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="2048" placeholder="（不超过2048字）" name="handleContentOne"><%- info.handleContentOne %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row" id="needNumber">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">所需套数：</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th class="w-table">序号</th>
              <th class="w-200">图书名称</th>
              <th>所需数量<span class="must-td">*</span></th>
            </tr>
            </thead>
            <tbody id="formEdit">
            <% for(var i = 0; i < info.bookPrintList.length; i++) { %>
            <tr data-bookPrintDetailId="<%- info.bookPrintList[i].bookPrintDetailId %>"
                data-name="<%- info.bookPrintList[i].bookName %>" data-bookId="<%- info.bookPrintList[i].bookId %>">
              <td class="w-table"><%- (i + 1) %></td>
              <td title="<%- info.bookPrintList[i].bookName %>"><%- info.bookPrintList[i].bookName %></td>
              <td>
                <div class="col-xs-6">
                  <div class="form-group">
                    <input type="text" name="libraryNeedNum" class="form-control" data-fv-notempty="true"
                           pattern="^[0-9]*$" maxlength="8" data-fv-regexp-message="请输入大于等于0的整数"
                           data-fv-notempty-message="请填写所需数量"
                           value="<%- info.bookPrintList[i].libraryNeedNum %>"/>
                  </div>
                </div>
              </td>
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
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow"
       style="display: none;margin-top: 10px">
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
          <input type="hidden" name="bookPrintId" value="<%- info.bookPrintId %>">
          <input type="hidden" name="taskId" value="<%- info.taskId %>">
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <% if(info.userTaskEntities[i].roleIds) { %>
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].roleNames %>"
                   value="<%- info.userTaskEntities[i].roleNames %>"
                   data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                   data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}"
                   data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
            <!--<span class="input-group-btn">-->
            <!--<button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>-->
            <!--<button class="btn btn-default" type="button" data-open="public/user/select-users"-->
            <!--data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i-->
            <!--class="fa fa-user-o"></i>-->
            <!--</button>-->
            <!--</span>-->
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
        <label class="col-xs-2 control-label">审批结果</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(!info.handleState || info.handleState === '1') { %>
            通过
            <% } %>
            <% if(info.handleState === '2') { %>
            不通过
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.handleContentOne %></pre>
        </div>
      </div>
    </div>
  </div>
  <% if(!info.handleState || info.handleState === '1') { %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">所需套数</label>
        <div class="col-xs-10">
          <table class="table table-nowrap table-striped table-hover">
            <thead>
            <tr>
              <th style="width: 50px">序号</th>
              <th style="width: 200px">图书名称</th>
              <th >所需数量</th>
            </tr>
            </thead>
            <tbody>
            <% for(var i = 0; i < info.bookPrintList.length; i++) { %>
            <tr data-printId="<%- info.bookPrintList[i].bookPrintId %>"
                data-name="<%- info.bookPrintList[i].bookName %>" data-bookId="<%- info.bookPrintList[i].bookId %>">
              <td class="w-table"><%- (i + 1) %></td>
              <td title="<%- info.bookPrintList[i].bookName %>"><%- info.bookPrintList[i].bookName %></td>
              <td>
                <div class="input-group">
                  <p class="form-control-static"><%- info.bookPrintList[i].libraryNeedNum %></p>
                </div>
              </td>
            </tr>
            <% } %>
            </tbody>
          </table>
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