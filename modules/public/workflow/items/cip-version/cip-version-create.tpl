<!--版署申请新增-->
<div class="form-horizontal" id="formReportEdit">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">申请名称</label>
        <div class="col-xs-4">
          <p class="form-control-static cip-name"><%- info.isbncipApplyName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">申请备注</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.isbncipApplyRemarks %></pre>
        </div>
      </div>
    </div>
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">图书名称</label>
        <div class="col-xs-10">
          <button id="btnDetailBook" class="btn btn-default" type="button"><i class="fa fa-book"> 查看详情</i></button>
          <button id="btnDownloadBook" class="btn btn-default" type="button"><i class="fa fa-book"> 下载</i></button>
        </div>
      </div>
    </div>
    <div class="col-xs-12">
      <div class="form-group">
        <div class="col-xs-8 col-xs-offset-2">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px">序号</th>
              <th style="width: 100px">图书类型</th>
              <th>图书名称</th>
            </tr>
            </thead>
            <tbody id="selectBookTable">
            <% for(var i = 0; i < info.bookNameList.length; i++) { %>
            <% var bookList = info.bookNameList[i]; %>
            <tr data-id="<%- bookList.bookId %>">
              <td><%- (i + 1) %></td>
              <td class="bookType">
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
              <td title="<%- bookList.bookName %>"><%- bookList.bookName %></td>
            </tr>
            <% } %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>