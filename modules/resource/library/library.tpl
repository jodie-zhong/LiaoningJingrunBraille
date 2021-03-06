<!--图书库-->
<div class="row">
	<div class="col-xs-12">
		<div class="panel">
			<div class="panel-header custom-panel-header">
				<h3><i class="fa fa-database"></i> 资源库 - 图书库 - 图书列表</h3>
				<div class="control-btn">
					<button class="btn btn-xs btn-blue" id="btnBookFlow" data-auth="0651" disabled>流程详情</button>
					<button class="btn btn-xs btn-blue" id="btnBookHistory" data-auth="0652" disabled>历史文件</button>
					<button class="btn btn-xs btn-blue" id="btnBookFinished" data-auth="0653" disabled>成品文件</button>
					<button class="btn btn-xs btn-blue" id="btnBookProcess" data-auth="0654" disabled>过程文件</button>
				</div>
			</div>
			<div class="panel-content border-bottom">
				<div class="form-horizontal" id="formSearchBook">
					<div class="row">
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">图书名称</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" data-search="searchBookName"/>
								</div>
							</div>
						</div>
						<div class="col-xs-5">
							<div class="form-group">
								<label class="col-xs-4 control-label">图书类别</label>
								<div class="col-xs-8">
									<select class="form-control" data-search = "searchBookType">
										<option value="">全部</option>
										<option value="1">盲文读物</option>
										<option value="3">普通读物</option>
										<option value="2">大字本读物</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-xs-2">
							<button class="btn btn-primary" id="btnSearchBook">查询</button>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-content">
				<div class="table-10">
					<table class="table table-striped table-hover table-nowrap" id="bookTable" style="table-layout: fixed;">
						<thead>
							<tr>
								<th style="width: 45px;">序号</th>
								<th style="width: 45px"></th>
								<th style="width: 25%">图书名称</th>
								<th style="width: 15%">图书类别</th>
								<th style="width: 15%">书号</th>
								<th style="width: 20%">责任编辑</th>
								<th style="width: 25%">图书状态</th>
							</tr>
						</thead>
						<tbody id="bookListTable">

						</tbody>
					</table>
				</div>
				<div id="bookManagePaging" class="clearfix">

				</div>
			</div>
		</div>
	</div>
</div>