<!--培训管理-->
<div class="row">
	<div class="col-xs-12">
		<div class="panel">
			<div class="panel-header custom-panel-header">
				<h3><i class="fa fa-cogs"></i> 系统管理 - 培训管理- 培训列表</h3>
				<div class="control-btn">
					<button class="btn btn-xs btn-success" id="btnTrainAdd" data-auth="0121">新增</button>
					<button class="btn btn-xs btn-blue" id="btnTrainModify" data-auth="0122" disabled>修改</button>
					<button class="btn btn-xs btn-danger" id="btnTrainDel" data-auth="0123" disabled>删除</button>
					<button class="btn btn-xs btn-primary" id="btnTrainSubmit" data-auth="0124" disabled>提交</button>
					<button class="btn btn-xs btn-default" id="btnTrainCheck" data-auth="0125" disabled>查看</button>
				</div>
			</div>
			<div class="panel-content border-bottom">
				<div class="form-horizontal" id="formSearchTrain">
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">培训名称</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" data-search="searchTrainName" />
								</div>
							</div>
						</div>
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">培训编号</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" data-search="searchTrainNum" />
								</div>
							</div>
						</div>
						<div class="col-xs-2"></div>
					</div>
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">培训状态</label>
								<div class="col-xs-8">
									<select class="form-control" data-search = "searchTrainState">
										<option value="" selected>全部</option>
										<option value="1">未提交</option>
										<option value="2">已提交</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-xs-5"></div>
						<div class="col-xs-2">
							<button class="btn btn-primary" id="btnSearchTrain">查询</button>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-content">
				<div class="table-10">
					<table class="table table-striped table-hover table-nowrap" data-multi="true" id="trainListTableContainer">
						<thead>
							<tr>
								<th style="width: 50px;">序号</th>
								<th style="width: 50px;"><i class="fa fa-square-o" data-action="check"></i></th>
								<th>培训名称</th>
								<th>培训编号</th>
								<th>培训单位</th>
								<th>培训时间</th>
								<th>培训内容</th>
								<th style="width: 75px;">培训形式</th>
								<th>课时</th>
								<th>积分</th>
								<th style="width: 75px;">状态</th>
							</tr>
						</thead>
						<tbody id="trainListTable"></tbody>
					</table>
				</div>
				<div class="clearfix" id="trainListPaging"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-12">
		<div class="panel">
			<div class="panel-header custom-panel-header">
				<h3>人员列表</h3>
			</div>
			<div class="panel-content">
					<table class="table table-striped table-nowrap table-top">
						<thead>
							<tr>
								<th style="width: 50px;">序号</th>
								<th style="width: 20%;">姓名</th>
								<th style="width: 20%;">手机号</th>
								<th style="width: 20%;">部门</th>
								<th style="width: 20%;">角色</th>
								<th style="width: 80px;">积分</th>
							</tr>
						</thead>
					</table>
				<div class="tbody-5-static">
					<table class="table table-striped table-nowrap">
						<tbody id="trainRollTable"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>