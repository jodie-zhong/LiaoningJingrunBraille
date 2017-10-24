<!-- 上报选题 -->
<div class="row">
	<!-- 左侧树 -->
	<div class="col-xs-3">
		<div class="panel panel-tree-1">
			<div class="panel-header custom-panel-header">
				<h3 class="modules-name" title="选题管理 - 上报选题"><i class="fa fa-book"></i> 选题管理 - 上报选题</h3>
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
						<h3>上报列表</h3>
						<div class="control-btn">
							<button type="button" class="btn btn-xs btn-success" data-auth="0221" id="btnReportAdd" disabled>新增</button>
							<button type="button" class="btn btn-xs btn-blue" data-auth="0222" id="btnReportModify" disabled>修改</button>
							<button type="button" class="btn btn-xs btn-danger" data-auth="0223" id="btnReportDel" disabled>删除</button>
							<button type="button" class="btn btn-xs btn-primary" data-auth="0224" id="btnReportSubmit" disabled>提交</button>
						</div>
					</div>
					<div class="panel-content border-bottom">
						<div class="form-horizontal" id="formSearchWork">
							<div class="row">
								<div class="col-xs-5">
									<div class="form-group">
										<label class="col-xs-4 control-label">上报名称</label>
										<div class="col-sm-8">
											<input class="form-control" data-search="searchTopicReportName" id="searchReportName">
										</div>
									</div>
								</div>
								<div class="col-xs-5">
									<div class="form-group">
										<label class="col-xs-4 control-label">上报状态</label>
										<div class="col-sm-8">
											<select class="form-control" id="selectState">
												<option value="">全部</option>
												<option value="1">待上报</option>
												<option value="2">已完成</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-xs-2">
									<button type="button" class="btn btn-primary" id="btnSearchWork">搜索</button>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-content">
						<div class="table-10">
							<table class="table table-striped table-nowrap table-hover" data-multi="true" id="reportContentTable">
								<thead>
								<tr>
									<th class="w-table">序号</th>
									<th class="w-table">
                    <i class="fa fa-square-o" data-action="check"></i>
                  </th>
									<th>上报名称</th>
									<th>上报部门</th>
									<th>上报选题数量</th>
									<th>上报时间</th>
									<th>状态</th>
								</tr>
								</thead>
								<tbody id="reportListTable">

								</tbody>
							</table>
						</div>
						<div class="pagination-container" id="reportListPaging">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-flow">
					<div class="panel-header custom-panel-header">
						<h3>选题列表</h3>
						<div class="control-btn">
							<button type="button" class="btn btn-xs btn-success" data-auth="0225" id="btnBookAdd" disabled>添加选题</button>
							<button type="button" class="btn btn-xs btn-danger" data-auth="0226" id="btnBookRemove" disabled>移除选题</button>
						</div>
					</div>
					<div class="panel-content">
						<table class="table table-striped table-nowrap table-top dataTable" data-multi="true"
									 id="reportBottomContentTable">
							<thead>
							<tr>
								<th class="w-table">序号</th>
								<th class="w-table"><i class="fa fa-square-o" data-action="check"></i></th>
								<th class="sorting sorts" style="width: 15%" data-name="topicDetailNameSort">选题名称</th>
								<th style="width: 10%">作者</th>
								<th style="width: 10%">著作方式</th>
								<th style="width: 10%">字数</th>
								<th style="width: 10%">原出版社</th>
								<th style="width: 15%">原出版时间</th>
								<th style="width: 15%" class="sorting sorts" data-name="kindSort">类别</th>
								<th style="width: 15%" class="sorting sorts" data-name="createUserNameSort">选题编辑</th>
							</tr>
							</thead>
						</table>
						<div class="tbody-5-static">
							<table class="table table-striped table-nowrap">
								<tbody id="reportContentListTable"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>