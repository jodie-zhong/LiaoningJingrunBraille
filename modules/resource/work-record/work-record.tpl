<!-- 工作记录库 -->
<div class="row">
	<div class="col-xs-12">
		<div class="panel">
			<div class="panel-header custom-panel-header">
				<h3><i class="fa fa-database"></i> 资源库 - 工作记录库- 工作记录列表</h3>
			</div>
			<div class="panel-content border-bottom">
				<div class="form-horizontal" id="formSearchLog">
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">工作人</label>
								<div class="col-xs-8">
									<input type="text" maxlength="16" class="form-control" data-search="searchUserId" />
								</div>
							</div>
						</div>
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">所在部门</label>
								<div class="col-xs-8">
									<select class="form-control" data-search="searchDepartment" id="selUserOptionDept">
                    <option value="">全部</option>
                  </select>
								</div>
							</div>
						</div>
						<div class="col-xs-2"></div>
					</div>
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">开始时间</label>
								<div class="col-xs-8">
									<input type="text" name="datetime" class="form-control date-time" id="datetimeStart" data-search="searchWorkTimeBegin"/>
								</div>
							</div>
						</div>
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">结束时间</label>
								<div class="col-xs-8">
									<input type="text" name="datetime" class="form-control date-time" id="datetimeEnd" data-search="searchWorkTimeOver" />
								</div>
							</div>
						</div>
						<div class="col-xs-2">
							<button class="btn btn-primary" id="btnSearchLogs">查询</button>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-content" id="panelLogsManageList">
				<div class="table-10">
					<table class="table table-striped table-hover table-nowrap" style="table-layout: fixed;">
						<thead>
							<tr>
								<th style="width: 50px;">序号</th>
								<th>工作人</th>
								<th>所在部门</th>
								<th>工作时间</th>
								<th>选题/图书名称</th>
								<th>一级工作模块</th>
								<th>二级工作模块</th>
								<th>工作内容</th>
							</tr>
						</thead>
						<tbody id="logListTable"></tbody>
					</table>
				</div>
				<div id="logManagePaging" class="clearfix">

				</div>
			</div>
		</div>
	</div>
</div>