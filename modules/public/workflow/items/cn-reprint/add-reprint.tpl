<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <div class="col-xs-11 col-xs-offset-1">
          <table class="table table-nowrap table-striped table-hover">
            <thead>
            <tr>
              <th style="width: 50px">序号</th>
              <th style="width: 150px">图书名称</th>
              <th style="width: 80px">图书类型</th>
              <th style="width: 60px">类型</th>
              <th>原因</th>
            </tr>
            </thead>
            <tbody id="selectBookTable">
            <tr>
              <td>1</td>
              <td title="<%- info.reprintBookInfoEntity.bookName %>"><%- info.reprintBookInfoEntity.bookName %></td>
              <%if(info.reprintBookInfoEntity.booktype ==='2'){ %>
              <td>大字本</td>
              <% }else{ %>
              <td>普通</td>
              <% } %>
              <%if(info.reprintBookInfoEntity.hBookPrintState ==='2'){ %>
              <td>重印</td>
              <% }else{ %>
              <td>再版</td>
              <% } %>
              <td title="<%- info.reprintBookInfoEntity.reprintReason %>"><%- info.reprintBookInfoEntity.reprintReason %></td>
            </tr>
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
          <p class="form-control-static">
            <%- info.submitUserName %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交时间</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <%- info.submitDatetime %>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
