<!--清样稿管理-确认书稿-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <input type="hidden" name="handleState" value="1">
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
          <p class="form-control-static"><%- info.dutyEditor %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">发稿单</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <button style="margin-bottom: 0;" class="btn btn-xs btn-default printManuscript" data-download-address="<%- info.bookFileAddress %>">打印</button>
            <button style="margin-bottom: 0;" class="btn btn-xs btn-default downloadManuscript">下载</button>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <table class="table table-striped table-nowrap table-hover">
      <thead>
      <tr>
        <th style="width: 50px">序号</th>
        <th style="width: 150px">分册书名</th>
        <th style="width: 100px">类型</th>
        <th style="width: 150px">附件名称</th>
        <th style="width: 100px">操作</th>
      </tr>
      </thead>
      <tbody>
      <% for(var i = 0; i < info.clearDetailOneEntities.length; i++) { %>
      <tr>
        <td><%- (i + 1) %></td>
        <td><%- info.clearDetailOneEntities[i].bookFascicleBookName %></td>
        <td><%- ['汉文书稿', '盲文书稿', '盲封一', '盲封二', '汉封一', '汉封二', '汉封四', '条形码'][info.clearDetailOneEntities[i].bookFileType - 1] %></td>
        <td class="bookFileName" title="<%- info.clearDetailOneEntities[i].bookFileName %>"><%- info.clearDetailOneEntities[i].bookFileName %></td>
        <td>
          <% if(info.clearDetailOneEntities[i].bookFileAddress) { %>
          <button class="btn btn-xs btn-default btn-rounded downloadSeparated" data-download-address="<%- info.clearDetailOneEntities[i].bookFileAddress %>">下载</button>
          <% } else { %>
          <button class="btn btn-xs btn-default btn-rounded downloadSeparated" disabled>下载</button>
          <% } %>
          <!--盲封、汉封需要预览-->
          <% if(info.clearDetailOneEntities[i].bookFileType === '3' || info.clearDetailOneEntities[i].bookFileType === '4' || info.clearDetailOneEntities[i].bookFileType === '5' ||
          info.clearDetailOneEntities[i].bookFileType === '6' || info.clearDetailOneEntities[i].bookFileType === '7') { %>
          <% if(info.clearDetailOneEntities[i].bookFileAddress) { %>
          <button class="btn btn-xs btn-default btn-rounded preview" data-download-address="<%- info.clearDetailOneEntities[i].bookFileAddress %>">预览</button>
          <% } else { %>
          <button class="btn btn-xs btn-default btn-rounded preview" disabled>预览</button>
          <% } %>
          <% } %>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
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
</div>
<!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
<% } else { %>
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
          <p class="form-control-static"><%- info.dutyEditor %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">发稿单</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <button style="margin-bottom: 0;" class="btn btn-xs btn-default printManuscript" data-download-address="<%- info.bookFileAddress %>">打印</button>
            <button style="margin-bottom: 0;" class="btn btn-xs btn-default downloadManuscript">下载</button>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <table class="table table-striped table-nowrap table-hover">
      <thead>
      <tr>
        <th style="width: 50px">序号</th>
        <th style="width: 150px">分册书名</th>
        <th style="width: 100px">类型</th>
        <th style="width: 150px">附件名称</th>
        <th style="width: 100px">操作</th>
      </tr>
      </thead>
      <tbody>
      <% for(var i = 0; i < info.clearDetailOneEntities.length; i++) { %>
      <tr>
        <td><%- (i + 1) %></td>
        <td><%- info.clearDetailOneEntities[i].bookFascicleBookName %></td>
        <td><%- ['汉文书稿', '盲文书稿', '盲封一', '盲封二', '汉封一', '汉封二', '汉封四', '条形码'][info.clearDetailOneEntities[i].bookFileType - 1] %></td>
        <td class="bookFileName" title="<%- info.clearDetailOneEntities[i].bookFileName %>"><%- info.clearDetailOneEntities[i].bookFileName %></td>
        <td>
          <% if(info.clearDetailOneEntities[i].bookFileAddress) { %>
          <button class="btn btn-xs btn-default btn-rounded downloadSeparated" data-download-address="<%- info.clearDetailOneEntities[i].bookFileAddress %>">下载</button>
          <% } else { %>
          <button class="btn btn-xs btn-default btn-rounded downloadSeparated" disabled>下载</button>
          <% } %>
          <!--盲封、汉封需要预览-->
          <% if(info.clearDetailOneEntities[i].bookFileType === '3' || info.clearDetailOneEntities[i].bookFileType === '4' || info.clearDetailOneEntities[i].bookFileType === '5' ||
          info.clearDetailOneEntities[i].bookFileType === '6' || info.clearDetailOneEntities[i].bookFileType === '7') { %>
          <% if(info.clearDetailOneEntities[i].bookFileAddress) { %>
          <button class="btn btn-xs btn-default btn-rounded preview" data-download-address="<%- info.clearDetailOneEntities[i].bookFileAddress %>">预览</button>
          <% } else { %>
          <button class="btn btn-xs btn-default btn-rounded preview" disabled>预览</button>
          <% } %>
          <% } %>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
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