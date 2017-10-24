<!--字典管理-->
<div class="row">
	<!--一级字典表-->
	<div class="col-xs-6">
		<div class="panel">
			<div class="panel-header custom-panel-header">
				<h3><i class="fa fa-cogs"></i> 系统管理 - 字典表管理</h3>
			</div>
			<!--字典管理查询-->
			<div class="panel-content border-bottom">
				<div class="form-horizontal" id="formSearchDiction">
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">字典标题	</label>
								<div class="col-xs-8">
									<input type="text" maxlength="32" class="form-control" data-search="searchCodeName" />
								</div>
							</div>
						</div>
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">字典编码</label>
								<div class="col-xs-8">
									<input type="text" maxlength="16" class="form-control" data-search="searchCode" />
								</div>
							</div>
						</div>
						<div class="col-xs-2">
							<button class="btn btn-primary" id="btnSearchDiction">查询</button>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-content">
				<div class="table-10">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>字典标题</th>
								<th>字典编码</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody id="dictionListTable"></tbody>
					</table>
				</div>
				<div id="dictionListPaging" class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-6">
		<!--二级字典表-->
		<div class="row" style="margin-bottom: 12px;">
			<div class="col-xs-12">
				<div class="panel">
					<div class="panel-header custom-panel-header">
						<h3>二级字典表列表</h3>
						<div class="control-btn">
							<button class="btn btn-xs btn-success" id="btnDictionSecondAdd" data-auth="0151" disabled>新增</button>
							<button class="btn btn-xs btn-primary" id="btnDictionSecondModify" data-auth="0152" disabled>修改</button>
							<button class="btn btn-xs btn-primary" id="btnDictionSecondUse" data-auth="0153" disabled>启用</button>
							<button class="btn btn-xs btn-danger" id="btnDictionSecondChange" data-auth="0154" disabled>停用</button>
						</div>
					</div>
					<div class="panel-content" style="padding-bottom: 20px;">
						<table class="table table-striped table-hover table-nowrap table-top">
							<thead>
								<tr>
									<th style="width: 50px;">序号</th>
									<th>二级字典标题</th>
									<th>二级字典编码</th>
									<th>备注</th>
									<th>是否可用</th>
								</tr>
							</thead>
						</table>
						<div class="table-5-static">
							<table class="table table-striped table-hover table-nowrap">
								<tbody id="disctionListSecondTable"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--三级字典表-->
		<div class="row">
			<div class="col-xs-12">
				<div class="panel">
					<div class="panel-header custom-panel-header">
						<h3>三级字典表列表</h3>
						<div class="control-btn">
							<button class="btn btn-xs btn-success" id="btnDictionThreeAdd" data-auth="0155" disabled>新增</button>
							<button class="btn btn-xs btn-primary" id="btnDictionThreeModify" data-auth="0155" disabled>修改</button>
							<button class="btn btn-xs btn-primary" id="btnDictionThreeUse" data-auth="0157" disabled>启用</button>
							<button class="btn btn-xs btn-danger" id="btnDictionThreeChange" data-auth="0158" disabled>停用</button>
						</div>
					</div>
					<div class="panel-content" style="padding-bottom: 20px;">
						<table class="table table-striped table-hover table-nowrap table-top">
							<thead>
								<tr>
									<th style="width: 50px;">序号</th>
									<th>三级字典标题</th>
									<th>三级字典编码</th>
									<th>备注</th>
									<th>是否可用</th>
								</tr>
							</thead>
						</table>
						<div class="table-5-static">
							<table class="table table-striped table-hover table-nowrap">
								<tbody id="disctionListThreeTable"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
