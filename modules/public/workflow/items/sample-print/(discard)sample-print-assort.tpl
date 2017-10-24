<!--捆书配套-->
<% if(isEdit) { %>
<script type="text/template" id="workRowTemplate">
	<tr data-type="workload">
		<td data-value="number"></td>
		<td><input type="text" class="form-control" name="mWorkloadMachineModel" maxlength="16" /></td>
		<td><input type="text" class="form-control" name="mWorkloadOpenNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
		<td><input type="text" class="form-control" name="mWorkloadVersionNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
		<td><input type="text" class="form-control" name="mWorkloadPaperNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
		<td><input type="text" class="form-control" name="mWorkloadErrorRate" maxlength="8" /></td>
		<td>
			<button class="btn btn-xs btn-success" data-type="work-plus"><i class="fa fa-plus box"></i></button>
		</td>
		<td>
			<button class="btn btn-xs btn-danger" data-type="work-minus"><i class="fa fa-close box"></i></button>
		</td>
		<input type="hidden" name="taskId" value="<%- info.taskId %>">
	</tr>
</script>
<script type="text/template" id="workDayTemplate">
	<div class="fascicle" data-area="resultMap">
		<div class="row fascicle-top" data-time="workTime">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">工作日期<span class="must">*</span></label>
					<div class="col-xs-4">
						<input type="text" class="form-control date-time" name="mWorkloadDatetime" placeholder="工作日期" maxlength="20" data-fv-notempty="true" data-fv-notempty-message="请选择工作日期" />
					</div>
					<div class="col-xs-6">
						<button class="btn btn-xs btn-success" data-type="day-plus"><i class="fa fa-plus box"></i></button>
						<button class="btn btn-xs btn-danger" data-type="day-minus"><i class="fa fa-close box"></i></button>
					</div>
				</div>
			</div>
		</div>
		<div class="row fascicle-between">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">工作量</label>
					<div class="col-xs-10">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th style="width: 45px;">序号</th>
									<th style="width: 180px;">机器型号</th>
									<th style="width: 80px;">开数</th>
									<th style="width: 80px;">版数</th>
									<th style="width: 80px;">张数</th>
									<th style="width: 80px;">差错率</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody data-area="workload">
								<tr data-type="workload">
									<td data-value="number">1</td>
									<td><input type="text" class="form-control" name="mWorkloadMachineModel" maxlength="16" /></td>
									<td><input type="text" class="form-control" name="mWorkloadOpenNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td><input type="text" class="form-control" name="mWorkloadVersionNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td><input type="text" class="form-control" name="mWorkloadPaperNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td><input type="text" class="form-control" name="mWorkloadErrorRate" maxlength="8" /></td>
									<td>
										<button class="btn btn-xs btn-success" data-type="work-plus"><i class="fa fa-plus box"></i></button>
									</td>
									<td>
										<button class="btn btn-xs btn-danger" data-type="work-minus"><i class="fa fa-close box"></i></button>
									</td>
									<input type="hidden" name="taskId" value="<%- info.taskId %>">
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</script>
<div class="form-horizontal" id="formEdit">
	<% for (var i in info.resultMap.data) { %>
	<div class="fascicle" data-area="resultMap">
		<% if (info.resultMap.data.hasOwnProperty(i)) { %>
		<div class="row fascicle-top" data-time="workTime">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">工作日期<span class="must">*</span></label>
					<div class="col-xs-4">
						<input type="text" class="form-control date-time" value="<%- i %>" name="mWorkloadDatetime" placeholder="工作日期" maxlength="20" data-fv-notempty="true" data-fv-notempty-message="请选择工作日期" />
					</div>
					<div class="col-xs-6">
						<button class="btn btn-xs btn-success" data-type="day-plus"><i class="fa fa-plus box"></i></button>
						<button class="btn btn-xs btn-danger" data-type="day-minus"><i class="fa fa-close box"></i></button>
					</div>
				</div>
			</div>
		</div>
		<div class="row fascicle-between">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">工作量</label>
					<div class="col-xs-10">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th style="width: 45px;">序号</th>
									<th style="width: 180px;">机器型号</th>
									<th style="width: 80px;">开数</th>
									<th style="width: 80px;">版数</th>
									<th style="width: 80px;">张数</th>
									<th style="width: 80px;">差错率</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody data-area="workload">
								<% for (var j = 0; j < info.resultMap.data[i].length; j++) { %>
								<tr data-type="workload">
									<td data-value="number">
										<%- j+1 %>
									</td>
									<td><input type="text" class="form-control" name="mWorkloadMachineModel" value="<%- info.resultMap.data[i][j].mWorkloadMachineModel %>" maxlength="16" /></td>
									<td><input type="text" class="form-control" name="mWorkloadOpenNum" value="<%- info.resultMap.data[i][j].mWorkloadOpenNum %>" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td><input type="text" class="form-control" name="mWorkloadVersionNum" value="<%- info.resultMap.data[i][j].mWorkloadVersionNum %>" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td><input type="text" class="form-control" name="mWorkloadPaperNum" value="<%- info.resultMap.data[i][j].mWorkloadPaperNum %>" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td><input type="text" class="form-control" name="mWorkloadErrorRate" value="<%- info.resultMap.data[i][j].mWorkloadErrorRate %>" maxlength="8" /></td>
									<td>
										<button class="btn btn-xs btn-success" data-type="work-plus"><i class="fa fa-plus box"></i></button>
									</td>
									<td>
										<button class="btn btn-xs btn-danger" data-type="work-minus"><i class="fa fa-close box"></i></button>
									</td>
									<input type="hidden" name="taskId" value="<%- info.taskId %>">
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<% } %>
	</div>
	<% } %>
	<% if(info.userTaskEntities) { %>
	<% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
	<div class="row" style="padding-top: 15px;">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">下一流程</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.userTaskEntities[i].flowName %>（
						<%- info.userTaskEntities[i].deptNames %> -
						<%- info.userTaskEntities[i].roleNames %>）</p>
					<input type="hidden" name="flowId" value="<%- info.userTaskEntities[i].flowId %>">
					<input type="hidden" name="flowName" value="<%- info.userTaskEntities[i].flowName %>">
					<input type="hidden" name="nextCategory" value="<%- info.userTaskEntities[i].category %>">
					<input type="hidden" name="deptIds" value="<%- info.userTaskEntities[i].deptIds %>">
					<input type="hidden" name="roleIds" value="<%- info.userTaskEntities[i].roleIds %>">
					<input type="hidden" name="taskId" value="<%- info.taskId %>">
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<% if(info.userTaskEntities[i].roleIds) { %>
			<div class="form-group">
				<label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
				<div class="col-xs-8">
					<div class="input-group with-clear">
						<input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly data-data="{searchRoleId: '', searchDepartmentId: ''}" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
						<span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'>
              	<i class="fa fa-user-o"></i></button>
            </span>
					</div>
				</div>
			</div>
			<% } %>
		</div>
	</div>
	<% } %>
	<% } %>
</div>
<% } else { %>
<div class="form-horizontal">
	<div class="pageInfo">
	<% for (var i in info.resultMap.data) { %>
		<div class="fascicle-view">
	<% if (info.resultMap.data.hasOwnProperty(i)) { %>
	<div class="row fascicle-top-view" data-time="workTime">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">工作日期</label>
				<div class="col-xs-4">
					<p>
						<%- i %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row fascicle-between-view">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">工作量</label>
				<div class="col-xs-10">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th style="width: 45px;">序号</th>
								<th style="width: 180px;">机器型号</th>
								<th style="width: 80px;">开数</th>
								<th style="width: 80px;">版数</th>
								<th style="width: 80px;">张数</th>
								<th style="width: 80px;">差错率</th>
							</tr>
						</thead>
						<tbody>
							<% for (var j = 0; j < info.resultMap.data[i].length; j++) { %>
							<tr data-type="workload">
								<td>
									<%- j+1 %>
								</td>
								<td>
									<%- info.resultMap.data[i][j].mWorkloadMachineModel %>
								</td>
								<td>
									<%- info.resultMap.data[i][j].mWorkloadOpenNum %>
								</td>
								<td>
									<%- info.resultMap.data[i][j].mWorkloadVersionNum %>
								</td>
								<td>
									<%- info.resultMap.data[i][j].mWorkloadPaperNum %>
								</td>
								<td>
									<%- info.resultMap.data[i][j].mWorkloadErrorRate %>
								</td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<% } %>
	</div>
	<% } %>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">提交人</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.submitUserName %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">提交时间</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.submitDatetime %>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<% } %>