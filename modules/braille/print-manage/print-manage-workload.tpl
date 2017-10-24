<div class="modal-dialog dialog-container">
	<div class="modal-content">
		<div class="panel">
			<div class="panel-header">
				<h3><i class="fa fa-user-o"></i> 工作量</h3>
				<div class="control-btn">
					<a class="panel-close btn-close"><i class="fa fa-close"></i></a>
				</div>
			</div>
			<div class="panel-content border-bottom">
				<div class="form-horizontal" id="formPrintWorkload">
					<div class="row">
						<div class="col-xs-6">
							<div class="form-group">
								<label class="col-xs-4 control-label">工作人</label>
								<div class="col-xs-8">
									<div class="input-group with-clear">
										<input type="text" class="form-control" data-search = "loginUserId" name="loginUserId" title="<%- info.loginUserName %>" value="<%- info.loginUserName %>" data-value="<%- info.loginUserId %>" placeholder="工作人" readonly data-data="{searchRoleId: '', searchDepartmentId: ''}">
										<span class="input-group-btn">
              				<button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
              				<button class="btn btn-default" type="button" data-open="public/user/select-user" data-data='{"deptIds": "<%- info.deptIds %>", "roleIds": "<%- info.roleIds %>"}'>
              				<i class="fa fa-user-o"></i></button>
            				</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group">
								<label class="col-xs-2 control-label">工作时间</label>
								<div class="col-xs-3">
									<input type="text" id="datetimeStart" value="<%- info.searchStartDate %>" data-search = "searchStartDate" name="searchStartDate" maxlength="10" class="form-control date-time" />
								</div>
								<label class="col-xs-1 control-label">至</label>
								<div class="col-xs-3">
									<input type="text" id="datetimeEnd" value="<%- info.searchEndDate %>" data-search = "searchEndDate" name="searchEndDate" maxlength="10" class="form-control date-time" />
								</div>
								<div class="col-xs-2">
									<button class="btn btn-primary" id="search">查询</button>
								</div>
							</div>
						</div>
					</div>					
				</div>
			</div>
			<div class="panel-content">
				<div class="table-10" >
					<table class="table table-striped table-hover table-nowrap" id="list">
						<thead>
							<tr>
								<th>序号</th>
								<th>日期</th>
								<th>类型</th>
								<th>机器型号</th>
								<th>开数</th>
								<th>版数</th>
								<th>张数</th>
								<th>差错率</th>
							</tr>
						</thead>
						<tbody id="listtbody"></tbody>
					</table>	
				</div>							
				<div id="personListPaging" class="clearfix"></div>
				<div class="row" data-type = "export" style="display: none">
					<div class="dialog-options">
						<button class="btn btn-primary" id="export">导出</button>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>