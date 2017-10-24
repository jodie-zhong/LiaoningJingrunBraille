<!-- 版权合同库 -->
<div class="row">
	<div class="col-xs-8">
		<!-- 左侧列表 -->
		<div class="panel panel-book-1">
			<div class="panel-header custom-panel-header">
				<h3><i class="fa fa-database"></i> 资源库 - 版权合同库 - 合同列表</h3>
				<div class="control-btn">
					<button class="btn btn-xs btn-success" id="btnRenew" data-auth="0621">续约</button>
				</div>
			</div>
			<div class="panel-content border-bottom">
				<div class="form-horizontal" id="formSearchContract">
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">图书名称</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" data-search="searchBookName" />
								</div>
							</div>
						</div>
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">合同状态</label>
								<div class="col-xs-8">
									<select class="form-control" data-search="searchContractState">
										<option value="">全部</option>
										<option value="1">未过期</option>
										<option value="3">要过期</option>
										<option value="2">已过期</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-xs-2">
							<button class="btn btn-primary" id="btnSearchContract">查询</button>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-content">
				<div class="table-10">
					<table class="table table-striped table-hover table-nowrap" id="workListTable">
						<thead>
							<tr>
								<th style="width:50px;">序号</th>
								<th style="width:50px;"></th>
								<th>合同编号</th>
								<th>图书名称</th>
								<th width="110px">图书类别</th>
								<th>作者</th>
								<th width="180px">合同有效期</th>
							</tr>
						</thead>
						<tbody id="contractListTable"></tbody>
					</table>
				</div>
				<div id="contractManagePaging" class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class="panel panel-book-1">
			<div class="panel-header custom-panel-header">
				<h3>首次录入合同详情</h3>
			</div>
			<div class="panel-content" id="departmentEditPanel"></div>
		</div>
	</div>
	<!-- 续约列表 -->
	<div class="col-xs-12">
		<div class="panel panel-flow">
			<div class="panel-header custom-panel-header">
				<h3>续约列表</h3>
				<div class="control-btn">
					<button class="btn btn-xs btn-blue" id="btnChange" data-auth="0622">修改</button>
					<button class="btn btn-xs btn-danger" id="btnDelete" data-auth="0623">删除</button>
				</div>
			</div>
			<div class="panel-content">
				<table class="table table-striped table-hover table-nowrap table-top">
					<thead>
						<tr>
							<th width="50px">序号</th>
							<th>续约人</th>
							<th>续约人角色</th>
							<th width="100px">续约时间</th>
							<th width="80px">续约状态</th>
							<th>备注</th>
							<th width="75px">操作</th>
						</tr>
					</thead>
				</table>
				<div class="tbody-5-static">
					<table class="table table-striped table-nowrap">
						<tbody id="renewListTable"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>