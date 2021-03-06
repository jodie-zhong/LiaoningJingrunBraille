<!-- 图书印制单审核管理 -->
<div class="row">
  <div class="col-xs-3">
    <!-- 左侧树 -->
    <div class="panel panel-tree-0">
      <div class="panel-header custom-panel-header">
        <h3 class="modules-name" title="盲文读物管理 - 图书印制单审核管理"><i class="fa fa-braille"></i> 盲文读物管理 - 图书印制单审核管理</h3>
      </div>
      <div class="panel-content">
        <div id="monthTree">
        </div>
      </div>
    </div>
  </div>
  <div class="col-xs-9">
    <div class="row">
      <div class="col-xs-12">
        <div class="panel panel-book-0">
          <div class="panel-header custom-panel-header">
            <h3>图书印制信息<span class="icheck-inline task-about" id="taskAboutArea"></span>
            </h3>
            <div class="control-btn">
              <button class="btn btn-xs btn-success" data-auth="0391" id="btnPrintedAdd" disabled>添加</button>
              <button class="btn btn-xs btn-danger" data-auth="0392" id="btnPrintedDel" disabled>删除</button>
              <button class="btn btn-xs btn-blue" data-auth="0393" id="btnPrintedSubmit" disabled>提交</button>
              <button class="btn btn-xs btn-blue" data-auth="0394" id="btnPrintedSingle" disabled>处理</button>
              <button class="btn btn-xs btn-primary" data-auth="0396" id="btnPrintedExport" disabled>导出</button>
              <button class="btn btn-xs btn-default" data-auth="0397" id="btnPrintedSearch" disabled>查看</button>
            </div>
          </div>
          <div class="panel-content">
            <div class="table-10 table-scroll">
              <table class="table table-striped table-hover table-nowrap" data-multi="true" id="workListTable">
                <thead>
                <tr>
                  <th class="w-table">序号</th>
                  <th class="w-table"><i class="fa fa-square-o" data-action="check"></i></th>
                  <th style="width: 200px">种类</th>
                  <th style="width: 200px">书名</th>
                  <th style="width: 200px">书号</th>
                  <th style="width: 200px">作者</th>
                  <th style="width: 100px">盲文书版次</th>
                  <th style="width: 100px">责任编辑</th>
                  <th style="width: 100px">最终盲文版数</th>
                  <th style="width: 100px">定价</th>
                  <th style="width: 150px">图书馆需要套数</th>
                  <th style="width: 150px">读者服务部需要套数</th>
                  <th style="width: 150px">总印制套数</th>
                  <th style="width: 150px">总印张数</th>
                  <th style="width: 150px">开本</th>
                  <th style="width: 150px">用纸</th>
                  <th style="width: 150px">出书时间</th>
                  <th style="width: 150px">任务人</th>
                  <th style="width: 300px">审核状态</th>
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
                <th class="w-table">序号</th>
                <th style="width: 20%;">状态</th>
                <th style="width: 20%;">处理人</th>
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