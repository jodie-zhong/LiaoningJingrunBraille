<!--印前质检-质检修改-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12 form-compact">
      <div class="form-group">
        <table class="table table-striped table-hover table-nowrap">
          <thead>
          <tr>
            <th style="width: 50px;">序号</th>
            <th style="width: 80px;">册数</th>
            <th style="width: 150px;">字数（千字）<span class="must-td">*</span></th>
            <th style="width: 120px;">版数<span class="must-td">*</span></th>
            <th>盲文文稿</th>
            <th style="width: 70px;">操作</th>
          </tr>
          </thead>
          <tbody id="dataTBody">
          <% if(info.bookFascicleEntities) { %>
          <% for(var i = 0; i < info.bookFascicleEntities.length; i++) { %>
          <tr data-fascicule-id="<%- info.bookFascicleEntities[i].bookFascicleId %>">
            <td><%- (i + 1) %></td>
            <td title="<%- info.bookFascicleEntities[i].bookFascicleBookName %>"><%- info.bookFascicleEntities[i].bookFascicleBookName %></td>
            <td>
              <div class="col-xs-12">
                <div class="form-group">
                  <input class="form-control" value="<%- info.bookFascicleEntities[i].tprQualityWordNum %>" name="tprQualityWordNum" placeholder="质检字数" data-fv-notempty="true"
                         data-fv-notempty-message="请填写质检字数" pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入小于10000的数字,<br>允许三位小数"/>
                </div>
              </div>
            </td>
            <td>
              <div class="col-xs-12">
                <div class="form-group">
                  <input class="form-control" value="<%- info.bookFascicleEntities[i].bookFascicleVersionNum %>" name="bookFascicleVersionNum" placeholder="盲文版数" maxlength="5" pattern="^[1-9][0-9]*$"
                         data-fv-regexp-message="请输入大于0的整数" data-fv-notempty="true" data-fv-notempty-message="请填写盲文版数">
                </div>
              </div>
            </td>
            <td>
              <div class="input-group with-clear">
                <input minlength="1" class="form-control" name="uploadFile" value="<%- info.bookFascicleEntities[i].bookFileName %>" placeholder="请选择文件"
                       data-value="<%- info.bookFascicleEntities[i].bookFileAddress %>" readonly>
                <span class="input-group-btn">
                <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data="{}"><i class="fa fa-file-o"></i></button>
              </span>
              </div>
            </td>
            <td>
              <% if(info.bookFascicleEntities[i].bookFileAddress && info.bookFascicleEntities[i].bookFileAddress !=='') { %>
              <button class="btn btn-xs btn-default btn-rounded downloadSeparated" data-download-address="<%- info.bookFascicleEntities[i].bookFileAddress %>">下载</button>
              <% } else { %>
              <button class="btn btn-xs btn-default btn-rounded downloadSeparated" data-download-address="<%- info.bookFascicleEntities[i].bookFileAddress %>" disabled>下载</button>
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
    <div class="col-xs-12">
      <table class="table table-striped table-hover table-nowrap">
        <thead>
        <tr>
          <th style="width: 50px;">序号</th>
          <th style="width: 80px;">册数</th>
          <th style="width: 120px;">字数（千字）</th>
          <th style="width: 120px;">版数</th>
          <th>盲文文稿</th>
          <th style="width: 70px;">操作</th>
        </tr>
        </thead>
        <tbody>
        <% if(info.bookFascicleEntities) { %>
        <% for(var i = 0; i < info.bookFascicleEntities.length; i++) { %>
        <tr>
          <td><%- (i + 1) %></td>
          <td><%- info.bookFascicleEntities[i].bookFascicleBookName %></td>
          <td><%- info.bookFascicleEntities[i].tprQualityWordNum %></td>
          <td><%- info.bookFascicleEntities[i].bookFascicleVersionNum %></td>
          <td><p class="form-control-static"><%- info.bookFascicleEntities[i].bookFileName %></p></td>
          <td>
            <% if(info.bookFascicleEntities[i].bookFileAddress && info.bookFascicleEntities[i].bookFileAddress !=='') { %>
            <button class="btn btn-xs btn-default btn-rounded downloadSeparated" data-download-address="<%- info.bookFascicleEntities[i].bookFileAddress %>">下载</button>
            <% } else { %>
            <button class="btn btn-xs btn-default btn-rounded downloadSeparated" data-download-address="<%- info.bookFascicleEntities[i].bookFileAddress %>" disabled>下载</button>
            <% } %>
          </td>
        </tr>
        <% } %>
        <% } %>
        </tbody>
      </table>
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