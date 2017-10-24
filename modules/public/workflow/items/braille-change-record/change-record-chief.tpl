<!--总编辑/副总编辑签署-->
<% if(isEdit) { %>
<div class="form-horizontal">
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">签署结果</label>
				<div class="col-xs-10">
					<label class="radio-inline">
          <% if(!info.handleState || info.handleState === '1') { %>
          <input type="radio" name="handleState" value="1" required checked>同意变更
          <% } else { %>
          <input type="radio" name="handleState" value="1" required>同意变更
          <% } %>
        </label>
					<label class="radio-inline">
          <% if(info.handleState === '2') { %>
          <input type="radio" name="handleState" value="2" required checked>不同意变更
          <% } else { %>
          <input type="radio" name="handleState" value="2" required>不同意变更
          <% } %>
        </label>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">签署意见</label>
				<div class="col-xs-10">
					<textarea class="form-control" name="handleContentOne" placeholder="签署意见（不超过1024字）" maxlength="1024"><%- info.handleContentOne %></textarea>
					<div><label class="len">0/1024</label></div>
				</div>
			</div>
		</div>
	</div>
	<% if(info.userTaskEntities) { %>
	<% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
	<div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" style="display: none;">
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
						<input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly data-data="{searchRoleId: '', searchDepartmentId: ''}">
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
				<label class="col-xs-2 control-label">签署结果</label>
				<div class="col-xs-10">
					<p class="form-control-static">
						<% if(!info.handleState || info.handleState === '1') { %> 同意变更
						<% } %>
						<% if(info.handleState === '2') { %> 不同意变更
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">签署意见</label>
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