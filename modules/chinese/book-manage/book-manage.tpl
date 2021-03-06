<!-- 样书管理-->
<div class="row">
  <div class="col-xs-12">
    <!-- 样书列表-->
    <div class="col-xs-6">
      <div class="panel">
        <div class="panel-header custom-panel-header">
          <h3><i class="fa fa-cogs"></i> 汉文读物管理 - 样书管理 - 样书列表</h3>
          <div class="control-btn">
            <button type="button" class="btn btn-xs btn-success" data-auth="" id="btnApplyBook" disabled>领用申请</button>
          </div>
        </div>
        <div class="panel-content border-bottom">
          <div class="form-horizontal" id="formSearchBook">
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="col-xs-4 control-label">书名</label>
                  <div class="col-xs-8">
                    <input type="text" maxlength="32" class="form-control" data-search="searchBookName"/>
                  </div>
                </div>
              </div>
              <!--<div class="col-xs-5"></div>-->
              <div class="col-xs-2">
                <button class="btn btn-primary" id="btnSearchBook">查询</button>
              </div>
            </div>
          </div>
        </div>
        <div class="panel-content">
          <div class="table-10">
            <table class="table table-striped table-nowrap table-hover" id="bookList">
              <thead>
              <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 45px;"></th>
                <th style="width: 20%">书名</th>
                <th style="width: 10%">图书类型</th>
                <th style="width: 10%">样书数量</th>
                <th style="width: 20%">是否超过500码洋</th>
              </tr>
              </thead>
              <tbody id="bookListTable"></tbody>
            </table>
          </div>
          <div id="bookListPaging" class="clearfix"></div>
        </div>
      </div>
    </div>
    <!--领用记录-->
    <div class="col-xs-6">
      <div class="panel">
        <div class="panel-header custom-panel-header">
          <h3>领用记录</h3>
          <div class="control-btn">
            <button class="btn btn-xs btn-primary" data-auth="" id="btnDeal" disabled>处理</button>
          </div>
        </div>
        <div class="panel-content">
          <table class="table table-striped table-hover table-nowrap table-top">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 20%;">领用人</th>
              <th style="width: 20%;">领用时间</th>
              <th style="width: 20%;">领用数量</th>
              <th style="width: 20%;">状态</th>
              <th style="width: 20%;">操作</th>
            </tr>
            </thead>
          </table>
          <div class="tbody-10-static">
            <table class="table table-striped table-hover table-nowrap">
              <tbody id="bookRollTable"></tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <div class="panel panel-flow">
          <div class="panel-header custom-panel-header">
            <h3>流程查看</h3>
          </div>
          <div class="panel-content">
            <table class="table table-striped table-nowrap table-top">
              <thead>
              <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 20%;">状态</th>
                <th style="width: 20%;">负责人</th>
                <th style="width: 20%;">起始时间</th>
                <th style="width: 20%;">完成时间</th>
                <th style="width: 20%;">审核结果</th>
                <th style="width: 100px;">详细信息</th>
              </tr>
              </thead>
            </table>
            <div class="tbody-5-static">
              <table class="table table-striped table-nowrap">
                <tbody id="taskWorkflowTable"></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>