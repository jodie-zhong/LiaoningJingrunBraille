<div class="modal-dialog dialog-container">
	<div class="modal-content">
		<div class="panel">
			<div class="panel-header">
				<h3><i class="fa fa-user-o"></i> 添加选题</h3>
				<div class="control-btn">
					<a class="panel-close btn-close"><i class="fa fa-close"></i></a>
				</div>
			</div>
			<div class="panel-content border-bottom">
				<div class="form-horizontal" id="formSearchTopic">
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">选题名称</label>
								<div class="col-sm-8">
									<input class="form-control" type="text" id="queryConditions"  data-search="searchTopicDetailName" />
								</div>
							</div>
						</div>
						<div class="col-xs-5"></div>
						<div class="col-xs-2">
							<button type="button" class="btn btn-primary" id="btnSearchTopic">查询</button>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-content">
				<table class="table table-striped table-nowrap table-top dataTable" data-multi="true" id="selectTopicContentTable">
					<thead>
						<tr>
							<th style="width: 6%">序号</th>
							<th style="width: 6%" class="w-table"><i class="fa fa-square-o" data-action="check"></i></th>
							<th class="sorting sorts" data-name="topicDetailNameSort" style="width: 25%;">选题名称</th>
							<th class="sorting sorts" style="width: 15%" data-name="submitDatetimeFlag">提交时间</th>
							<th style="width: 15%;">作者</th>
							<th style="width: 10%;">字数</th>
							<th class="sorting sorts" data-name="kindSort" style="width: 10%;">类别</th>
							<th style="width: 13%;" class="sorting sorts" data-name="createUserNameSort">选题编辑</th>
						</tr>
					</thead>
				</table>
				<div style="height: 370px;overflow-y: auto">
					<table class="table table-striped table-nowrap">
						<tbody id="selectTopicTable">
						</tbody>
					</table>
				</div>
				<div class="dialog-options">
					<button type="button" class="btn btn-primary" id="btnTopicCheckSelect">添加</button>
				</div>
			</div>
		</div>
	</div>
</div>