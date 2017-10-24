<!--刻印-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
	<script type="text/template" id="workRowTemplate">
		<tr data-type="workload">
			<td data-value="number"></td>
			<td class="form-group">
				<select name="mWorkloadMachineModel" class="form-control" data-type="machine"></select>
			</td>
			<td class="form-group"><input type="text" class="form-control" name="mWorkloadOpenNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
			<td class="form-group"><input type="text" class="form-control" name="mWorkloadVersionNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
			<td class="form-group"><input type="text" class="form-control" name="mWorkloadPaperNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
			<td class="form-group"><input type="text" class="form-control" name="mWorkloadErrorRate" maxlength="8" /></td>
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
										<th style="width: 165px;">机器型号</th>
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
										<td class="form-group">
											<select name="mWorkloadMachineModel" class="form-control" data-type="machine"></select>
										</td>
										<td class="form-group"><input type="text" class="form-control" name="mWorkloadOpenNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
										<td class="form-group"><input type="text" class="form-control" name="mWorkloadVersionNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
										<td class="form-group"><input type="text" class="form-control" name="mWorkloadPaperNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
										<td class="form-group"><input type="text" class="form-control" name="mWorkloadErrorRate" maxlength="8" /></td>
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
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">图书信息</label>
				<div class="col-xs-10">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>分册名称</th>
								<th>类型</th>
								<th>附件名称</th>
								<th>下载</th>
							</tr>
						</thead>
						<tbody>
							<% for(var j = 0; j < info.bookFilelist.length; j++) { %>
							<tr>
								<td>
									<%- j+1 %>
								</td>
								<td>
									<%- info.bookFilelist[j].bookFascicleBookName %>
								</td>
								<td>
									<%- info.bookFilelist[j].bookFileType %>
								</td>
								<td>
									<%- info.bookFilelist[j].bookFileName %>
								</td>
								<% if(info.bookFilelist[j].bookFileAddress) { %>
								<td><button data-down="down" class="btn btn-default btn-xs" type="button" data-address="<%- info.bookFilelist[j].bookFileAddress %>">下载</button></td>
								<% } else { %>
								<td><button data-down="down" class="btn btn-default btn-xs" type="button" disabled>下载</button></td>
								<% } %>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<% for(var i = 0; i < info.resultMap.data.length; i++) { %>
	<div class="fascicle" data-area="resultMap">		
		<div class="row fascicle-top" data-time="workTime">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">工作日期<span class="must">*</span></label>
					<div class="col-xs-4">
						<input type="text" class="form-control date-time" value="<%- info.resultMap.data[i].workDate %>" name="mWorkloadDatetime" placeholder="工作日期" maxlength="20" data-fv-notempty="true" data-fv-notempty-message="请选择工作日期" />
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
									<th style="width: 165px;">机器型号</th>
									<th style="width: 80px;">开数</th>
									<th style="width: 80px;">版数</th>
									<th style="width: 80px;">张数</th>
									<th style="width: 80px;">差错率</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody data-area="workload">
								<% for (var j = 0; j < info.resultMap.data[i].workLoadBackEntity.length; j++) { %>
								<tr data-type="workload">
									<td data-value="number">
										<%- j+1 %>
									</td>
									<td class="form-group">
										<select name="mWorkloadMachineModel" class="form-control" data-type="machine" data-originValue="<%- info.resultMap.data[i].workLoadBackEntity[j].mWorkloadMachineModel %>"></select>
									</td>
									<td class="form-group"><input type="text" class="form-control" name="mWorkloadOpenNum" value="<%- info.resultMap.data[i].workLoadBackEntity[j].mWorkloadOpenNum %>" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td class="form-group"><input type="text" class="form-control" name="mWorkloadVersionNum" value="<%- info.resultMap.data[i].workLoadBackEntity[j].mWorkloadVersionNum %>" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td class="form-group"><input type="text" class="form-control" name="mWorkloadPaperNum" value="<%- info.resultMap.data[i].workLoadBackEntity[j].mWorkloadPaperNum %>" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" /></td>
									<td class="form-group"><input type="text" class="form-control" name="mWorkloadErrorRate" value="<%- info.resultMap.data[i].workLoadBackEntity[j].mWorkloadErrorRate %>" maxlength="8" /></td>
									<td><button class="btn btn-xs btn-success" data-type="work-plus"><i class="fa fa-plus box"></i></button></td>
									<td><button class="btn btn-xs btn-danger" data-type="work-minus"><i class="fa fa-close box"></i></button></td>
									<input type="hidden" name="taskId" value="<%- info.taskId %>">
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>		
	</div>
	<% } %>
	<% if(info.userTaskEntities) { %>
	<% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
	<div class="row" style="padding-top: 15px;">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">下一流程</label>
				<div class="col-xs-8">
					<% if(!info.userTaskEntities[i].deptNames) { %>
					<p class="form-control-static">
						<%- info.userTaskEntities[i].flowName %>
					</p>
					<% } else { %>
					<p class="form-control-static">
						<%- info.userTaskEntities[i].flowName %>（
						<%- info.userTaskEntities[i].deptNames %> -
						<%- info.userTaskEntities[i].roleNames %>）</p>
					<% } %>
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
						<input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly data-data="{searchRoleId: '', searchDepartmentId: ''}" data-fv-notempty="true" data-fv-notempty-message="请选择任务人">
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
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">图书信息</label>
				<div class="col-xs-10">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>分册名称</th>
								<th>类型</th>
								<th>附件名称</th>
								<th>下载</th>
							</tr>
						</thead>
						<tbody>
							<% for(var i = 0; i < info.bookFilelist.length; i++) { %>
							<tr>
								<td>
									<%- i+1 %>
								</td>
								<td>
									<%- info.bookFilelist[i].bookFascicleBookName %>
								</td>
								<td>
									<%- info.bookFilelist[i].bookFileType %>
								</td>
								<td>
									<%- info.bookFilelist[i].bookFileName %>
								</td>
								<% if(info.bookFilelist[i].bookFileAddress) { %>
								<td><button data-down="down" class="btn btn-default btn-xs" type="button" data-address="<%- info.bookFilelist[i].bookFileAddress %>">下载</button></td>
								<% } else { %>
								<td><button data-down="down" class="btn btn-default btn-xs" type="button" disabled>下载</button></td>
								<% } %>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<% for (var j = 0; j < info.resultMap.data.length; j++) { %>
	<div class="fascicle" >
		<div class="row fascicle-top-view" data-time="workTime">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">工作日期</label>
					<div class="col-xs-4">
						<p class="form-control-static">
							<%- info.resultMap.data[j].workDate %>
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
									<th style="width: 165px;">机器型号</th>
									<th style="width: 80px;">开数</th>
									<th style="width: 80px;">版数</th>
									<th style="width: 80px;">张数</th>
									<th style="width: 80px;">差错率</th>
								</tr>
							</thead>
							<tbody>
								<% for (var k = 0; k < info.resultMap.data[j].workLoadBackEntity.length; k++) { %>
								<tr data-type="workload">
									<td>
										<%- k+1 %>
									</td>
									<% if(info.resultMap.data[j].workLoadBackEntity[k].mWorkloadMachineModel === '1') { %>
									<td>一台机器(美国)</td>
									<% } else if(info.resultMap.data[j].workLoadBackEntity[k].mWorkloadMachineModel === '2') { %>
									<td>一台机器(比利时)</td>
									<% } else { %>
									<td>一台机器</td>
									<% } %>
									<td>
										<%- info.resultMap.data[j].workLoadBackEntity[k].mWorkloadOpenNum %>
									</td>
									<td>
										<%- info.resultMap.data[j].workLoadBackEntity[k].mWorkloadVersionNum %>
									</td>
									<td>
										<%- info.resultMap.data[j].workLoadBackEntity[k].mWorkloadPaperNum %>
									</td>
									<td>
										<%- info.resultMap.data[j].workLoadBackEntity[k].mWorkloadErrorRate %>
									</td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% } %>
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