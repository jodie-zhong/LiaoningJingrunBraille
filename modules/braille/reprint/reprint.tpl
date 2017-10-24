<!-- 重印管理 -->
<div class="row">
  <div class="col-xs-3">
    <!-- 左侧树 -->
    <div class="panel panel-tree-1">
      <div class="panel-header custom-panel-header">
        <h3 class="modules-name" title="盲文读物管理 - 重印管理"><i class="fa fa-braille"></i> 盲文读物管理 - 重印管理</h3>
      </div>
      <div class="panel-content">
        <div id="monthTree">
        </div>
      </div>
    </div>
  </div>
  <div class="col-xs-9">
    <div class="panel panel-book-1">
        <div class="panel-header custom-panel-header">
          <h3>图书印制信息
            <span class="icheck-inline task-about" id="taskAboutArea"></span>
          </h3>
          <div class="control-btn">
            <button class="btn btn-xs btn-success" data-auth="03f1" id="btnAdd" disabled>新增</button>
            <button class="btn btn-xs btn-primary" data-auth="03f2" id="btnSingle" disabled>处理</button>
            <button class="btn btn-xs btn-default" data-auth="03f3" id="btnSearch" disabled>查看</button>
          </div>
        </div>
        <div class="panel-content border-bottom">
          <div class="form-horizontal" id="formSearchWork">
            <div class="row">
              <div class="col-xs-5">
                <div class="form-group">
                  <label class="col-xs-4 control-label">重印书名</label>
                  <div class="col-sm-8">
                    <input class="form-control" data-search="searchBookName">
                  </div>
                </div>
              </div>
              <div class="col-xs-5">
              </div>
              <div class="col-xs-2">
                <button type="button" class="btn btn-primary" id="btnSearchWork">搜索</button>
              </div>
            </div>
          </div>
        </div>
        <div class="panel-content">
          <div class="table-10 table-scroll">
            <table class="table table-striped table-hover table-nowrap" data-multi="true" id="workListTable">
              <thead>
              <tr>
                <th class="w-table">序号</th>
                <th class="w-table"><i class="fa fa-square-o" data-action="check"></i></th>
                <th style="width: 200px">书名</th>
                <th style="width: 100px">书号</th>
                <th style="width: 200px">原出版者</th>
                <th style="width: 150px">原书出版时间版次</th>
                <th style="width: 100px">盲文书版次</th>
                <th style="width: 100px">图书类别</th>
                <th style="width: 200px">最终盲文版数</th>
                <th style="width: 100px">定价</th>
                <th style="width: 150px">图书馆需要套数</th>
                <th style="width: 150px">读者服务部需要套数</th>
                <th style="width: 150px">总印制套数</th>
                <th style="width: 150px">总印张数</th>
                <th style="width: 150px">开本</th>
                <th style="width: 150px">用纸</th>
                <th style="width: 250px">建议印装完成时间</th>
                <th style="width: 150px">任务人</th>
                <th style="width: 300px">状态</th>
              </tr>
              </thead>
              <tbody id="workListTBody">

              </tbody>
            </table>
          </div>
          <div class="pagination-container" id="workListPaging">

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
                <th style="width: 50px">序号</th>
                <th style="width: 20%">状态</th>
                <th style="width: 20%">处理人</th>
                <th style="width: 20%">起始时间</th>
                <th style="width: 20%">完成时间</th>
                <th style="width: 20%">审核结果</th>
                <th style="width: 100px">详细信息</th>
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