<!--译校通读-校对和通读的发送书稿-->
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">汉文文稿</label>
        <div class="col-xs-10">
          <% if(info.bookFileEntity) { %>
          <p class="form-control-static">
            <%- info.bookFileEntity.bookFileName %>
            <% if(info.bookFileEntity.bookFileAddress && info.bookFileEntity.bookFileAddress !== '') { %>
            <button style="margin-bottom: 0;" name="downloadCnManuscript" class="btn btn-xs btn-default" data-download-address="<%- info.bookFileEntity.bookFileAddress %>">下载</button>
            <% } else { %>
            <button style="margin-bottom: 0;" name="downloadCnManuscript" class="btn btn-xs btn-default" data-download-address="<%- info.bookFileEntity.bookFileAddress %>" disabled>下载</button>
            <% } %>
          </p>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">书稿附件表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 60px;">册数</th>
              <th style="width: 120px;">版数</th>
              <th>盲文文稿</th>
              <th style="width: 70px;">操作</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.bookFascicleList) { %>
            <% for(var i = 0; i < info.bookFascicleList.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td title="<%- info.bookFascicleList[i].bookFascicleBookName %>"><%- info.bookFascicleList[i].bookFascicleBookName %></td>
              <td><%- info.bookFascicleList[i].bookFascicleVersionNum %></td>
              <td><p class="form-control-static"><%- info.bookFascicleList[i].bookFileName %> </p></td>
              <td>
                <% if(info.bookFascicleList[i].bookFileAddress && info.bookFascicleList[i].bookFileAddress !=='') { %>
                <button class="btn btn-xs btn-default btn-rounded downloadSeparated" data-download-address="<%- info.bookFascicleList[i].bookFileAddress %>">下载</button>
                <% } else { %>
                <button class="btn btn-xs btn-default btn-rounded downloadSeparated" data-download-address="<%- info.bookFascicleList[i].bookFileAddress %>" disabled>下载</button>
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
        <label class="col-xs-2 control-label">任务要求</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.handleContentOne %></p>
        </div>
      </div>
    </div>
  </div>
  <!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
  <% if(isEdit) { %>
  <% if(info.userTaskEntities && info.userTaskEntities.length > 0) { %>
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
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-5 control-label">下一流程任务人</label>
        <div class="col-xs-7">
          <p class="form-control-static"><%- info.userTaskEntities[i].handleUserName %></p>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% } %>
  <!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
  <% } else { %>
  <div class="row">
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
</div>