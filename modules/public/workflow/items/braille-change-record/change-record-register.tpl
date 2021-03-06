<!--备案登记-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">CIP信息<span class="must">*</span></label>
				<div class="col-xs-4">
					<div class="input-group with-clear">
						<input type="text" class="form-control" name="bookCipSynopsis" value="<%- info.bookCipSynopsis %>" data-value = "<%- info.bookCipSynopsis %>" title="<%- info.bookCipSynopsis %>" placeholder="CIP信息" data-fv-notempty="true" data-fv-notempty-message="请上传CIP信息" />
						<span class="input-group-btn">
              <button class="btn btn-default" type="button" data-bookId = "<%- info.bookId %>" data-name = "bookCipSynopsis" style="width: auto;">上传</button>
           </span>
					</div>
				</div>
				<div class="col-xs-6">
					<% if(info.bookCipSynopsis) { %>
					<button class="btn btn-default" data-type = "down" data-state = "handle" type="button" data-bookId = "<%- info.bookId %>">下载</button>
					<% } else { %>
					<button class="btn btn-default" data-type = "down" type="button" data-bookId = "<%- info.bookId %>" disabled>下载</button>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">备案信息</label>
				<div class="col-xs-10">
					<textarea class="form-control" name="handleContentOne" placeholder="备案信息（不超过1024字）" maxlength="1024"><%- info.handleContentOne %></textarea>
					<div><label class="len">0/1024</label></div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="handleState" value="1" />
	<% if(info.userTaskEntities) { %>
	<% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">下一流程</label>
				<div class="col-xs-8">
					<% if(!info.userTaskEntities[i].deptAndRoles) { %>
					<p class="form-control-static">
						<%- info.userTaskEntities[i].flowName %>
					</p>
					<% } else { %>
					<p class="form-control-static">
						<%- info.userTaskEntities[i].flowName %>（
						<%- info.userTaskEntities[i].deptAndRoles %>）
					</p>
					<% } %>
					<input type="hidden" name="flowId" value="<%- info.userTaskEntities[i].flowId %>">
					<input type="hidden" name="flowName" value="<%- info.userTaskEntities[i].flowName %>">
					<input type="hidden" name="userTaskId" value="<%- info.userTaskEntities[i].userTaskId %>">
					<input type="hidden" name="userTaskName" value="<%- info.userTaskEntities[i].userTaskName %>">
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
              <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i
                      class="fa fa-user-o"></i></button>
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
				<label class="col-xs-2 control-label">CIP信息</label>
				<div class="col-xs-10">
					<button class="btn btn-default" type="button" data-bookId = "<%- info.bookId %>" data-type = "down">下载</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">备案信息</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.handleContentOne %></pre>
				</div>
			</div>
		</div>
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