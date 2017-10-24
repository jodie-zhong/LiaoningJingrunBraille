<!-- 盲文图书编辑译校统计 -->
<div class="row">
  <div class="col-xs-3">
    <!-- 左侧树 -->
    <div class="panel panel-tree-0">
      <div class="panel-header custom-panel-header">
        <h3 class="modules-name" title="盲文读物管理 - 发稿完成情况统计表"><i class="fa fa-braille"></i> 盲文读物管理 - 发稿完成情况统计表 </h3>
      </div>
      <div class="panel-content">
        <div id="monthTree">
        </div>
      </div>
    </div>
  </div>
  <div class="col-xs-9">
    <div class="row">
      <div class="col-xs-6">
        <div class="panel panel-book-0">
          <div class="panel-header custom-panel-header">
            <h3>发稿完成情况统计表</h3>
            <div class="control-btn">
              <button class="btn btn-xs btn-success" data-auth="03e31" id="btnAdd" disabled>添加</button>
              <button class="btn btn-xs btn-danger" data-auth="03e32" id="btnDel" disabled>删除</button>
              <button class="btn btn-xs btn-blue" data-auth="03e33" id="btnSubmit" disabled>提交</button>
              <button class="btn btn-xs btn-primary" data-auth="03e34" id="btnSingle" disabled>审核</button>
            </div>
          </div>
          <div class="panel-content book-detail">
              <div class="table-10 table-scroll">
                <table class="table table-striped table-hover table-nowrap" data-multi="true" id="workListTable">
                  <thead>
                  <tr>
                    <th class="w-table">序号</th>
                    <th class="w-table"><i class="fa fa-square-o" data-action="check"></i></th>
                    <th style="width: 20%">书名</th>
                    <th style="width: 20%">类别</th>
                    <th style="width: 20%">字数(千)</th>
                    <th style="width: 20%">责编</th>
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
      <div class="col-xs-6">
        <div class="panel">
          <div class="panel-header custom-panel-header">
            <h3>统计列表</h3>
          </div>
          <div class="panel-content book-detail">
            <div class="table-10 table-scroll">
                <table class="table table-striped table-top table-hover table-nowrap" data-multi="true" id="workListTableRight">
                  <thead>
                  <tr>
                    <th style="width: 20%" title="种类">种类</th>
                    <th class="number-species text-center" style="width: 20%" title="品种数量">品种数量</th>
                    <th class="text-center" style="width: 20%" title="累计字数(千/月)">累计字数(千/月)</th>
                    <th class="text-center" style="width: 20%" title="品种数量(年)">品种数量(年)</th>
                    <th class="text-center" style="width: 20%" title="累计字数(千/年)">累计字数(千/年)</th>
                  </tr>
                  </thead>
                </table>
                <div style="height: 420px;overflow-y: auto">
                  <table class="table table-striped table-nowrap">
                    <tbody id="workListTBodyRight"></tbody>
                  </table>
                </div>
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