<!--印刷管理-->
<div class="row">
	<div class="col-xs-3">
		<!-- 左侧树 -->
		<div class="panel panel-tree-0">
			<div class="panel-header custom-panel-header">
				<h3 class="modules-name" title="盲文读物管理 - 印刷管理"><i class="fa fa-book"></i> 盲文读物管理 - 印刷管理</h3>
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
				<div class="panel panel-book-0">
					<div class="panel-header custom-panel-header">
						<h3>
							图书列表
							<span class="icheck-inline task-about" id="taskAboutArea"></span>
						</h3>
						<div class="control-btn">
							<button class="btn btn-xs btn-primary" id="btnPrintHandle" data-auth="03b1" disabled>处理</button>
							<button class="btn btn-xs btn-default" id="btnPrintCheck" data-auth="03b2" disabled>查看</button>
							<button class="btn btn-xs btn-default" id="btnPrintWork" data-auth="03b3">工作量</button>
						</div>
					</div>
					<div class="panel-content">
						<div class="table-10 table-scroll">
							<table class="table table-striped table-hover table-nowrap" id="workListTable" style="width: 2380px; overflow-y: auto;">
								<thead>
								<tr>
									<th style="width: 50px;">序号</th>
									<th style="width: 50px;"></th>
									<th>图书名称</th>
									<th style="width: 100px;">图书类别</th>
									<th>书号</th>
									<th>作者</th>
									<th>版次</th>
									<th>责任编辑</th>
									<th>版数</th>
									<th>定价</th>
									<th style="width: 125px;">图书馆需要套数</th>
									<th style="width: 150px;">读者服务部需要套数</th>
									<th style="width: 90px;">总印制套数</th>
									<th>总印张数</th>
									<th>开本</th>
									<th>用纸</th>
									<th>出书时间</th>
									<th>任务人</th>
									<th style="width: 180px;">印刷状态</th>
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