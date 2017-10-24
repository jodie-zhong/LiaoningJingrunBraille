<!--资源库-库存管理-->
<div class="row">
  <div class="col-xs-12">
    <div class="panel">
      <div class="panel-header custom-panel-header">
        <h3><i class="fa fa-braille"></i>库存管理</h3>
        <div class="control-btn">
          <button class="btn btn-xs btn-default" id="btnBatchImport" data-auth="" disabled>批量导入</button>
          <button class="btn btn-xs btn-default" id="btnView" data-auth="" disabled>查看</button>
          <button class="btn btn-xs btn-default" id="btnInbound" data-auth="" disabled>入库</button>
          <button class="btn btn-xs btn-default" id="btnOutbound" data-auth="" disabled>出库</button>
        </div>
      </div>
      <div class="panel-content border-bottom">
        <div class="form-horizontal">
          <div class="row">
            <div class="col-xs-4">
              <div class="form-group">
                <label class="col-xs-4 control-label">书代号</label>
                <div class="col-xs-8">
                  <input type="text" maxlength="32" class="form-control" id="searchBookCode" title="书代号"/>
                </div>
              </div>
            </div>
            <div class="col-xs-4">
              <div class="form-group">
                <label class="col-xs-4 control-label">书名</label>
                <div class="col-xs-8">
                  <input type="text" maxlength="32" class="form-control" id="searchBookName" title="书名"/>
                </div>
              </div>
            </div>
            <div class="col-xs-4">
              <button class="btn btn-primary" id="btnSearch">查询</button>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-content">
        <div class="table-10">
          <table class="table table-striped table-nowrap table-hover" id="dataTable">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 40px;"></th>
              <th>书代号</th>
              <th>书名</th>
              <th>单价</th>
              <th>出版日期</th>
              <th>库存册数</th>
              <th>库存码洋</th>
            </tr>
            </thead>
            <tbody id="dataTBody">

            </tbody>
          </table>
        </div>
        <div class="clearfix" id="listPaging"></div>
      </div>
    </div>
  </div>
</div>