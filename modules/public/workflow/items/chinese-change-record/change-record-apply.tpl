<!-- 变更备案申请表 -->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">选题名称</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<%- info.bookName %>
					</p>
				</div>
				<div class="col-xs-6">
					<input type="hidden" name="bookId" value="<%- info.bookId %>" />
					<input type="hidden" name="changeFileId" value="<%- info.changeFileId %>" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">书号</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<%- info.bookIsbn %>
					</p>
				</div>
				<div class="col-xs-6">
					<input type="hidden" name="bookIsbn" value="<%- info.bookIsbn %>" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">变更项</label>
				<div class="col-xs-10">
					<label class="radio-inline">
            <% if(!info.mChangeFileItem ||info.mChangeFileItem === '1') { %>
            <input type="radio" name="mChangeFileItem" value="1" checked/>图书信息
            <% } else { %>
            <input type="radio" name="mChangeFileItem" value="1"/>图书信息
            <% } %>
          </label>
					<label class="radio-inline">
            <% if(info.mChangeFileItem === '2') { %>
            <input type="radio" name="mChangeFileItem" value="2" checked/>终止出版
            <% } else { %>
            <input type="radio" name="mChangeFileItem" value="2"/>终止出版           
            <% } %>
          </label>
				</div>
				<input type="hidden" name="handleState" value="<%- info.handleState %>" />
			</div>
		</div>
	</div>
	<div class="changeContent" data-area="content">
		<div data-type="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="form-group">
						<label class="col-xs-2 control-label">选择变更项</label>
						<div class="col-xs-4">
							<select class="form-control" name="" id="changeContentSelect">
							</select>
						</div>
						<div class="col-xs-6">
							<button class="btn btn-xs btn-success" data-type="change-plus"><i class="fa fa-plus box"></i></button>
						</div>
					</div>
				</div>
			</div>
			<div id="changeRecordContainer"></div>
		</div>
	</div>
	<% if(info.userTaskEntities) { %>
	<% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
	<div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" style="display: none; margin-top: 15px;">
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
						<input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly data-data="{searchRoleId: '', searchDepartmentId: ''}" required data-required-error="请选择任务人">
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
<div class="form-horizontal box-dashed">
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">选题名称</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<%- info.bookName %>
					</p>
				</div>
				<div class="col-xs-6"></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">书号</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<%- info.bookIsbn %>
					</p>
				</div>
				<div class="col-xs-6"></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">变更项</label>
				<div class="col-xs-10">
					<p class="form-control-static">
						<% if(info.mChangeFileItem === '1') { %> 图书信息
						<% } %>
						<% if(info.mChangeFileItem === '2') { %> 终止出版
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<% if(info.mChangeFileItem === '1') { %>
		<div class="fascicle">
	<% for (var i = 0; i < info.changeFileList.length; i++ ) { %>
	
	<div class="row fascicle-top-view">
		<div class="col-xs-12">
			<div class="form-group ">
				<label class="col-xs-2 control-label">变更名称</label>
				<div class="col-xs-10">
					<p class="form-control-static">
						<%- info.changeFileList[i].changeFileFieldName %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row fascicle-between-view">
		<div class="col-xs-12">
			<div class="form-group ">
				<label class="col-xs-2 control-label">变更前</label>
				<div class="col-xs-10">
					<p class="form-control-static">
						<%- info.changeFileList[i].changeFileBefore %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row fascicle-between-view">
		<div class="col-xs-12">
			<div class="form-group ">
				<label class="col-xs-2 control-label">变更后</label>
				<div class="col-xs-10">
					<p class="form-control-static">
						<%- info.changeFileList[i].changeFileAfter %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row fascicle-between-view">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">变更原因</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.changeFileList[i].changeFileCause %></pre>
				</div>
			</div>
		</div>
	</div>
	
	<% } %>
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