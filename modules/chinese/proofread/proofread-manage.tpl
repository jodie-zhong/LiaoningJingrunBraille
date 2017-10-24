<!-- 校对 -->
<div class="row">
  <div class="col-xs-3">
    <!-- 左侧树 -->
    <div class="panel panel-tree-0">
      <div class="panel-header custom-panel-header">
        <h3 class="modules-name" title="汉文读物管理 - 校对管理"><i class="fa fa-book"></i>汉文读物管理 - 校对管理</h3>
      </div>
      <div class="panel-content">
        <div id="monthTree">

        </div>
      </div>
    </div>
  </div>
  <div class="col-xs-9">
    <div class="row">
      <div class="col-lg-12 col-xlg-6">
        <div class="panel panel-book-0">
          <div class="panel-header custom-panel-header">
            <h3>图书列表
              <span class="icheck-inline task-about" id="taskAboutArea"></span>
            </h3>
            <div class="control-btn">
              <button class="btn btn-xs btn-primary" id="btnTaskAssignment"  data-auth="0541">发起校对</button>
              <button class="btn btn-xs btn-blue" id="btnDeal"  data-auth="0542">处理</button>
              <button class="btn btn-xs btn-default" id="btnView"  data-auth="0543">查看</button>
            </div>
          </div>
          <div class="panel-content">
            <div class="table-10">
              <table class="table table-striped table-hover table-nowrap" id="workListTable">
                <thead>
                <tr>
                  <th style="width: 50px;">序号</th>
                  <th style="width: 40px;"></th>
                  <th>图书名称</th>
                  <th>图书类型</th>
                  <th>任务人</th>
                  <th>阶段</th>
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
      <div class="col-xlg-6 hidden-xs hidden-sm hidden-md hidden-lg">
        <div class="panel">
          <div class="panel-header custom-panel-header">
            <h3>图书基本信息</h3>
          </div>
          <div class="panel-content book-detail">
            <div class="form-horizontal" id="bookDetailPanel">

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
                <th style="width: 50px;">序号</th>
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