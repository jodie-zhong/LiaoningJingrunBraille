<!-- 稿酬管理 -->
<div class="row">
  <div class="col-xs-3">
    <!-- 左侧树 -->
    <div class="panel panel-tree-2">
      <div class="panel-header custom-panel-header">
        <h3 class="modules-name" title="汉文读物管理 - 稿酬管理"><i class="fa fa-language"></i> 汉文读物管理 - 稿酬管理</h3>
      </div>
      <div class="panel-content">
        <div id="monthTree" style="height:494px;overflow-y: auto">
        </div>
      </div>
    </div>
  </div>
  <div class="col-xs-9">
    <div class="row">
      <div class="col-xs-12 col-xlg-6">
        <div class="panel">
          <div class="panel-header custom-panel-header">
            <h3>申请列表</h3>
            <div class="control-btn">
              <button class="btn btn-default btn-xs" data-auth="05d1" id="btnSearch">稿酬通知单</button>
            </div>
          </div>
          <div class="panel-content">
            <div class="table-10">
              <table class="table table-striped table-nowrap table-hover" id="workListTable">
                <thead id="workListTHeader">
                <tr>
                  <th style="width: 50px">序号</th>
                  <th style="width: 50px"></th>
                  <th style="width: 50%">图书名称</th>
                  <th style="width: 25%">图书类型</th>
                  <th style="width: 25%">稿酬状态</th>
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
  </div>
</div>