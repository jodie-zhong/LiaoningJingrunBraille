<!-- 再版重印管理 -->
<div class="row">
  <div class="col-xs-3">
    <!-- 左侧树 -->
    <div class="panel panel-tree-1">
      <div class="panel-header custom-panel-header">
        <h3 class="modules-name" title="汉文读物管理 - 再版重印管理"><i class="fa fa-language"></i> 汉文读物管理 -
          再版重印管理</h3>
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
        <div class="panel panel-book-1">
          <div class="panel-header custom-panel-header">
            <h3>申请列表
              <span class="icheck-inline task-about" id="taskAboutArea"></span>
            </h3>
            <div class="control-btn">
              <button class="btn btn-xs btn-success" id="btnTopicAdd" data-auth="05h1" disabled>新增</button>
              <button class="btn btn-xs btn-blue" id="btnTopicHandle" data-auth="05h2" disabled>处理</button>
              <button class="btn btn-xs btn-blue" id="btnBach" data-auth="05h4">批量处理</button>
              <button class="btn btn-xs btn-default" id="btnTopicView" data-auth="05h3" disabled>查看</button>
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
            <div class="table-10">
              <table class="table table-striped table-nowrap table-hover" data-multi="true" id="workListTable">
                <thead id="workListTHeader">
                <tr>
                  <th style="width: 50px">序号</th>
                  <th style="width: 50px">
                    <i class="fa fa-square-o" data-action="check"></i>
                  </th>
                  <th style="width: 20%">图书名称</th>
                  <th style="width: 13%">图书类型</th>
                  <th style="width: 15%">责任编辑</th>
                  <th style="width: 10%">书号</th>
                  <th style="width: 12%">发起人</th>
                  <th style="width: 15%">发起时间</th>
                  <th style="width: 15%">状态</th>
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