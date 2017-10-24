<div class="row">
  <div class="col-xs-12">
    <div class="panel">
      <div class="panel-header custom-panel-header">
        <h3>
          <i class="fa fa-database"></i>资源库 - 选题库
        </h3>
        <div class="control-btn">
          <button class="btn btn-xs btn-primary" data-auth="0611" id="btnFlow" disabled>流程信息</button>
          <button class="btn btn-xs btn-primary" data-auth="0612" id="btnRecord" disabled>备案信息</button>
        </div>
      </div>
      <div class="panel-content border-bottom">
        <div class="form-horizontal">
          <div class="row">
            <div class="col-xs-10">
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-4 control-label">选题名称</label>
                  <div class="col-xs-8">
                    <input type="text" class="form-control" data-search="searchTopicDetailName"/>
                  </div>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-4 control-label">选题类别</label>
                  <div class="col-xs-8">
                    <select class="form-control" data-search="searchTopicDetailType" data-type = "machineBook">
                      <option value="">全部</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-4 control-label">选题来源</label>
                  <div class="col-xs-8">
                    <select class="form-control" data-search="searchTopicDetailRecommendType">
                      <option value="">全部</option>
                      <option value="1">非社推荐选题</option>
                      <option value="2">社推荐选题</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-10">
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-4 control-label">是否加急</label>
                  <div class="col-xs-8">
                    <select class="form-control" data-search="searchTopicIsUrgent">
                      <option value="">全部</option>
                      <option value="1">否</option>
                      <option value="2">是</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-4 control-label">选题编辑</label>
                  <div class="col-xs-8">
                    <div class="input-group with-clear">
                      <input type="text" class="form-control"
                             value="" data-value="" data-search="searchCreateUserId" readonly />
                      <span class="input-group-btn">
                        <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                        <button class="btn btn-default" type="button" data-open="public/user/select-user" data-data="{}"><i
                                class="fa fa-user-o"></i></button>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-4 control-label">选题结果</label>
                  <div class="col-xs-8">
                    <select class="form-control" data-search="searchTopicResult">
                      <option value="">全部</option>
                      <option value="7">无</option>
                      <option value="0">选题成功</option>
                      <option value="3">不建议申报</option>
                      <option value="5">不同意申报</option>
                      <option value="6">会议不通过</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-2">
              <button type="button" class="btn btn-primary" id="btnSearch">查询</button>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-content">
        <div class="table-10">
          <table class="table table-striped table-nowrap table-hover" id="crowdSourceTable">
            <thead>
            <tr>
              <th style="width: 45px">序号</th>
              <th style="width: 45px"></th>
              <th>选题名称</th>
              <th>选题类别</th>
              <th>选题来源</th>
              <th>是否加急</th>
              <th>选题编辑</th>
              <th>是否备案</th>
              <th>选题结果</th>
            </tr>
            </thead>
            <tbody id="crowdSourceList"></tbody>
          </table>
        </div>
        <div class="clearfix" id="crowdSourceListPaging"></div>
      </div>
    </div>
  </div>
</div>