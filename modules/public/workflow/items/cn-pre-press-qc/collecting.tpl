<!--印前质检-收集书稿-->
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailDutyEditorName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">报告列表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px">序号</th>
              <th>表格名称</th>
              <th style="width: 120px">操作</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.reportList) { %>
            <% for(var i = 0; i < info.reportList.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td title="<%- info.reportList[i].hBookFileName %>"><%- info.reportList[i].hBookFileName %></td>
              <td>
                <% if(info.reportList[i].hBookFileAddress) { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.reportList[i].hBookFileAddress %>">下载</button>
                <button class="btn btn-xs btn-default btn-rounded preview" data-download-address="<%- info.reportList[i].hBookFileAddress %>">预览</button>
                <% } else { %>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" disabled>下载</button>
                <button class="btn btn-xs btn-default btn-rounded preview" disabled>预览</button>
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
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">附件列表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 150px">分册书名</th>
              <th style="width: 100px;">类型</th>
              <th>附件名称</th>
              <th style="width: 120px;">操作</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.fileList) { %>
            <% for(var i = 0; i < info.fileList.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td title="<%- info.fileList[i].bookFascicleBookName %>"><%- info.fileList[i].bookFascicleBookName %></td>
              <td title="<%- info.fileList[i].hBookFileType === '1' ? '汉文书稿' : (info.fileList[i].hBookFileType === '5' ? '汉文封面' : (info.fileList[i].hBookFileType === '22' ? '版权页设计' : '')) %>">
                <%- info.fileList[i].hBookFileType === '1' ? '汉文书稿' : (info.fileList[i].hBookFileType === '5' ? '汉文封面' : (info.fileList[i].hBookFileType === '22' ? '版权页设计' : '')) %>
              </td>
              <td title="<%- info.fileList[i].hBookFileName %>"><%- info.fileList[i].hBookFileName %></td>
              <td>
                <button class="btn btn-xs btn-default btn-rounded downloadFile" data-download-address="<%- info.fileList[i].hBookFileAddress %>">下载</button>
                <!--汉文封面和版权设计页可以预览-->
                <% if(info.fileList[i].hBookFileType === '5' || info.fileList[i].hBookFileType === '22') { %>
                <% if(info.fileList[i].hBookFileAddress) { %>
                <button class="btn btn-xs btn-default btn-rounded preview" data-download-address="<%- info.fileList[i].hBookFileAddress %>">预览</button>
                <% } else { %>
                <button class="btn btn-xs btn-default btn-rounded preview" data-download-address="<%- info.fileList[i].hBookFileAddress %>" disabled>预览</button>
                <% } %>
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
  <!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
  <% if(isEdit) { %>
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
  <!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
  <% } else { %>
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
  <% } %>
</div>