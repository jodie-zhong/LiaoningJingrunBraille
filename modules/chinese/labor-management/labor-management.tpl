<!--劳务管理-->
<div class="row">
  <div class="col-xs-3">
    <div class="panel panel-tree-3">
      <div class="panel-header custom-panel-header">
        <h3 class="modules-name" title="汉文读物管理 - 劳务管理"><i class="fa fa-language"></i> 汉文读物管理 - 劳务管理</h3>
      </div>
      <div class="panel-content">
        <div style="height: 40px;text-align: center">
          <label class="radio-inline p-r-20"><input type="radio" name="handleState" value="1" checked/>社内</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>社外</label>
        </div>
        <div id="monthTree" style="height: 454px;overflow-y: auto">
        </div>
      </div>
    </div>
  </div>
  <div class="col-xs-9">
    <div class="row">
      <div class="col-xs-12">
        <div class="panel panel-book-1">
          <div class="panel-header custom-panel-header">
            <h3>流程查看</h3>
            <div class="control-btn">
              <button class="btn btn-xs btn-primary" data-auth="05e1" id="btnLeadIn" disabled>导入</button>
              <button class="btn btn-xs btn-success" data-auth="05e2" id="btnEntering" disabled>新增</button>
              <button class="btn btn-xs btn-blue" data-auth="05e3" id="btnModify" disabled>修改</button>
              <button class="btn btn-xs btn-danger" data-auth="05e4" id="btnDelete" disabled>删除</button>
            </div>
          </div>
          <div class="panel-content border-bottom">
            <div class="form-horizontal" id="formSearchWork">
              <div class="row">
                <div class="col-xs-5">
                  <div class="form-group">
                    <label class="col-xs-4 control-label">姓名</label>
                    <div class="col-xs-8">
                      <input type="text" class="form-control" data-search="searchUserName"/>
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
              <table class="table table-striped table-nowrap table-hover" data-multi="true" id="jobIn">
                <thead>
                <tr>
                  <th style="width: 6%">序号</th>
                  <th style="width: 50px"><i class="fa fa-square-o" data-action="check"></i></th>
                  <th style="width: 8%">姓名</th>
                  <th style="width: 15%">身份证号码</th>
                  <th style="width: 10%">出勤天数</th>
                  <th style="width: 7%">全勤奖</th>
                  <th style="width: 7%">加班费</th>
                  <th style="width: 7%">劳务费</th>
                  <th style="width: 10%">效益津贴</th>
                  <th style="width: 10%">伙食补贴</th>
                  <th style="width: 9%">郊区补贴</th>
                  <th style="width: 7%">合计</th>
                </tr>
                </thead>
                <tbody id="jobListIn"></tbody>
              </table>
              <table class="table table-striped table-nowrap table-hover" data-multi="true" id="jobOut"
                     style="display: none">
                <thead>
                <tr>
                  <th style="width: 10%">序号</th>
                  <th style="width: 10%"><i class="fa fa-square-o" data-action="check"></i></th>
                  <th style="width: 15%">姓名</th>
                  <th style="width: 20%">身份证号码</th>
                  <th style="width: 15%">金额</th>
                  <th style="width: 15%">税额</th>
                  <th style="width: 15%">实付金额</th>
                </tr>
                </thead>
                <tbody id="jobListOut"></tbody>
              </table>
            </div>
            <div id="jobListPaging"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>