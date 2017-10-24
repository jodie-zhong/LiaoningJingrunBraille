<!-- 选题征集 -->
<div class="row">
  <div class="col-xs-3">
    <!-- 左侧树 -->
    <div class="panel panel-tree-1">
      <div class="panel-header custom-panel-header">
        <h3 class="modules-name" title="选题管理 - 选题申报管理"><i class="fa fa-book"></i> 选题管理 - 选题申报管理</h3>
      </div>
      <div class="panel-content panel-height-1">
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
            <h3>选题列表
              <span class="icheck-inline task-about" id="taskAboutArea"></span>
            </h3>
            <div class="control-btn">
              <button class="btn btn-xs btn-success" id="btnTopicAdd" data-auth="0211" disabled>新增</button>
              <button class="btn btn-xs btn-blue" id="btnTopicModify" data-auth="0212" disabled>修改</button>
              <button class="btn btn-xs btn-danger" id="btnTopicDelete" data-auth="0213" disabled>删除</button>
              <button class="btn btn-xs btn-blue" id="btnTopicSubmit" data-auth="0214" disabled>申报</button>
              <button class="btn btn-xs btn-blue" id="btnTopicSubmitBatch" data-auth="0218" disabled>批量申报</button>
              <button class="btn btn-xs btn-blue" id="btnTopicHandle" data-auth="0216" disabled>处理</button>
              <button class="btn btn-xs btn-blue" id="btnTopicBatch" data-auth="0217" disabled>批量处理</button>
              <button class="btn btn-xs btn-default" id="btnTopicView" data-auth="0215" disabled>查看</button>
            </div>
          </div>
          <div class="panel-content border-bottom">
            <div class="form-horizontal" id="formSearchWork">
              <div class="row">
                <div class="col-xs-5">
                  <div class="form-group">
                    <label class="col-xs-4 control-label">选题名称</label>
                    <div class="col-xs-8">
                      <input type="text" maxlength="32" class="form-control" data-search="searchTopicName"/>
                    </div>
                  </div>
                </div>
                <div class="col-xs-5"></div>
                <div class="col-xs-2">
                  <button class="btn btn-primary" id="btnSearchWork">查询</button>
                </div>
              </div>
            </div>
          </div>
          <div class="panel-content">
            <div class="table-10">
              <table class="table table-striped table-hover table-nowrap dataTable" data-multi="true" id="workListTable">
                <thead>
                <tr>
                  <th style="width: 6%;">序号</th>
                  <th style="width: 5%;"><i class="fa fa-square-o" data-action="check"></i></th>
                  <th style="width: 15%">选题名称</th>
                  <th style="width: 10%" data-name="topicDetailTypeFlag" class="sorting sorts">选题类别</th>
                  <th style="width: 14%" data-name="submitDatetimeFlag" class="sorting sorts">提交时间</th>
                  <th style="width: 10%">选题来源</th>
                  <th style="width: 10%">是否加急</th>
                  <th style="width: 16%">任务人</th>
                  <th style="width: 14%">选题状态</th>
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