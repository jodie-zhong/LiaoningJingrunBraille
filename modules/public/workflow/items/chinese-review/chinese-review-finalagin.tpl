<!--再次终审-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
	<input type="hidden" name="bookId" value="<%- info.bookId %>" />
	<input type="hidden" name="taskId" value="<%- info.taskId %>" />
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">终审方式</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.mwHAuditProofread.finishType === '1') { %>
						通读全书书稿
						<% } else { %>
            抽审书稿
            <% } %>
					</p>
				</div>
				<input type="hidden" name="finishType" value="<%- info.mwHAuditProofread.finishType %>" />
			</div>
		</div>
		<% if(info.mwHAuditProofread.finishType === '2') { %>
		<div class="col-xs-6">
			<div class="form-group">
				<div class="col-xs-12">
					<div class="col-xs-4">
						<p class="form-control-static"><%- info.mwHAuditProofread.percentage %>%</p>
						<input type="hidden" name="percentage" value="<%- info.mwHAuditProofread.percentage %>" />
					</div>
					<div class="col-xs-8">
						<p class="form-control-static"><%- info.mwHAuditProofread.startPage %>页至<%- info.mwHAuditProofread.endPage %>页</p>
						<input type="hidden" name="startPage" value="<%- info.mwHAuditProofread.startPage %>" />
						<input type="hidden" name="endPage" value="<%- info.mwHAuditProofread.endPage %>" />
					</div>
				</div>
			</div>
		</div>	
		<% } %>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">书稿思想内容</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.mwHAuditProofread.content === '1') { %>
            合格
            <% } else { %>
            不合格
            <% } %>
					</p>
					<input type="hidden" name="content" value="<%- info.mwHAuditProofread.content %>" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">文字质量</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.mwHAuditProofread.wordsQuality === '1') { %>
            合格
            <% } else { %>
            不合格
            <% } %>
					</p>
					<input type="hidden" name="wordsQuality" value="<%- info.mwHAuditProofread.wordsQuality %>" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">加工记录</label>
				<div class="col-xs-10">
					<% for(var i = 0; i < info.machiningRecordList.length; i++) { %>
					<% if(info.machiningRecordList[i].machiningRecord) { %>
					<div class="row" data-area="machining">
						<pre class="form-control-static"><%- i+1 %>、<%- info.machiningRecordList[i].machiningRecord %></pre>
						<textarea name="machiningRecord" style="display: none;"><%- info.machiningRecordList[i].machiningRecord %></textarea>
					</div>
					<% } %>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">终审意见</label>
				<div class="col-xs-10">
					<textarea class="form-control" name="handleContentOne" placeholder="终审意见(不超过1024字)" maxlength="1024"><%- info.handleContentOne %></textarea>
					<div><label class="len">0/1024</label></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">终审报告</label>
				<div class="col-xs-10">
					<button data-down="preview" class="btn btn-default">预览</button>	
					<button data-down="down" class="btn btn-default">下载</button>	
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">处理意见</label>
				<div class="col-xs-8">
					<label class="radio-inline">
            			<% if(!info.handleState || info.handleState === '1') { %>
            			<input type="radio" name="handleState" value="1" checked/>同意发稿
            			<% } else { %>
            			<input type="radio" name="handleState" value="1"/>同意发稿
            			<% } %>
          			</label>
					<label class="radio-inline">
            			<% if(info.handleState === '2') { %>
            			<input type="radio" name="handleState" value="2" checked/>退编辑
            			<% } else { %>
            			<input type="radio" name="handleState" value="2"/>退编辑
            			<% } %>
          			</label>
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
				<label class="col-xs-4 control-label">任务人<span class="c-red">*</span></label>
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
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">终审方式</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.mwHAuditProofread.finishType === '1') { %>
						通读全书书稿
						<% } else { %>
            抽审书稿
            <% } %>
					</p>
				</div>
			</div>
		</div>
		<% if(info.mwHAuditProofread.finishType === '2') { %>
		<div class="col-xs-6">
			<div class="form-group">
				<div class="col-xs-12">
					<div class="col-xs-4">
						<p class="form-control-static"><%- info.mwHAuditProofread.percentage %>%</p>
					</div>
					<div class="col-xs-8">
						<p class="form-control-static"><%- info.mwHAuditProofread.startPage %>页至<%- info.mwHAuditProofread.endPage %>页</p>
					</div>
				</div>
			</div>
		</div>	
		<% } %>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">书稿思想内容</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.mwHAuditProofread.content === '1') { %>
            合格
            <% } else { %>
            不合格
            <% } %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">文字质量</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.mwHAuditProofread.wordsQuality === '1') { %>
            合格
            <% } else { %>
            不合格
            <% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">加工记录</label>
				<div class="col-xs-10" data-type="mach-record">
					<% for(var i = 0; i < info.machiningRecordList.length; i++) { %>
					<% if(info.machiningRecordList[i].machiningRecord) { %>
					<pre class="form-control-static"><%- i+1 %>、<%- info.machiningRecordList[i].machiningRecord %></pre>
					<% } %>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">终审意见</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.handleContentOne %></pre>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">终审报告</label>
				<div class="col-xs-10">
					<button data-down="preview" class="btn btn-default">预览</button>	
					<button data-down="down" class="btn btn-default">下载</button>	
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">处理意见</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.handleState === '1') { %>
							同意发稿
						<% } else { %>
							退编辑
						<% } %>
					</p>
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