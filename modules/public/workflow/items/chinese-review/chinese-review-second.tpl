<!--复审-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
	<input type="hidden" name="bookId" value="<%- info.bookId %>" />
	<input type="hidden" name="taskId" value="<%- info.taskId %>" />
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">书稿思想内容</label>
				<div class="col-xs-8">
					<label class="radio-inline">
            			<% if(!info.mwHAuditProofread.content || info.mwHAuditProofread.content === '1') { %>
            			<input type="radio" name="content" value="1" checked/>合格
            			<% } else { %>
            			<input type="radio" name="content" value="1"/>合格
            			<% } %>
          			</label>
					<label class="radio-inline">
            			<% if(info.mwHAuditProofread.content === '2') { %>
            			<input type="radio" name="content" value="2" checked/>不合格
            			<% } else { %>
            			<input type="radio" name="content" value="2"/>不合格
            			<% } %>
          			</label>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">文字质量</label>
				<div class="col-xs-8">
					<label class="radio-inline">
            			<% if(!info.mwHAuditProofread.wordsQuality || info.mwHAuditProofread.wordsQuality === '1') { %>
            			<input type="radio" name="wordsQuality" value="1" checked/>合格
            			<% } else { %>
            			<input type="radio" name="wordsQuality" value="1"/>合格
            			<% } %>
          			</label>
					<label class="radio-inline">
            			<% if(info.mwHAuditProofread.wordsQuality === '2') { %>
            			<input type="radio" name="wordsQuality" value="2" checked/>不合格
            			<% } else { %>
            			<input type="radio" name="wordsQuality" value="2"/>不合格
            			<% } %>
          			</label>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">加工记录</label>
				<div class="col-xs-10" data-type="mach-record">
					<% for(var j = 0; j < info.machiningRecordList.length; j++) { %>
					<div class="row" data-area="machining">
						<div class="col-xs-1" style="padding-top: 10px;">
							<span class="badge badge-primary" data-value="number"></span>
						</div>
						<div class="col-xs-9" style="padding-bottom: 10px;">
							<textarea class="form-control" name="machiningRecord" placeholder="加工记录" maxlength="256"><%- info.machiningRecordList[j].machiningRecord %></textarea>
							<div><label class="len">0/1024</label></div>
						</div>
						<div class="col-xs-2">
							<button class="btn btn-xs btn-success" data-type="record-plus"><i class="fa fa-plus box"></i></button>
							<button class="btn btn-xs btn-danger" data-type="record-minus"><i class="fa fa-close box"></i></button>
						</div>
					</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">复审意见<span class="must">*</span></label>
				<div class="col-xs-10">
					<textarea class="form-control" name="handleContentOne" placeholder="复审意见(不超过1024字)" maxlength="1024" data-fv-notempty="true" data-fv-notempty-message="请填写复审意见"><%- info.handleContentOne %></textarea>
					<div><label class="len">0/1024</label></div>
				</div>
			</div>
		</div>
	</div>
	<% if(info.userTaskEntities[0].flowId === 'cn_secondRewrite') { %>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">复审报告</label>
				<div class="col-xs-10">
					<button data-down="preview" class="btn btn-default">预览</button>	
					<button data-down="down" class="btn btn-default">下载</button>	
				</div>
			</div>
		</div>
	</div>
	<% } %>
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
<div class="form-horizontal box-dashed" id="formEdit">
	<input type="hidden" name="bookId" value="<%- info.bookId %>" />
	<input type="hidden" name="taskId" value="<%- info.taskId %>" />
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
				<div class="col-xs-10">
					<% for(var j = 0; j < info.machiningRecordList.length; j++) { %>
					<% if(info.machiningRecordList[j].machiningRecord) { %>
					<div data-area="machining">
						<pre class="form-control-static"><%- j+1 %>、<%- info.machiningRecordList[j].machiningRecord %></pre>
						<textarea name="machiningRecord" style="display: none;"><%- info.machiningRecordList[j].machiningRecord %></textarea>
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
				<label class="col-xs-2 control-label">复审意见</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.handleContentOne %></pre>
					<textarea name="handleContentOne" style="display: none;"><%- info.handleContentOne %></textarea>
				</div>
			</div>
		</div>
	</div>
	<% if(info.handleContentTwo === '1') { %>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">复审报告</label>
				<div class="col-xs-10">
					<button data-down="preview" class="btn btn-default">预览</button>	
					<button data-down="down" class="btn btn-default">下载</button>	
				</div>
			</div>
		</div>
	</div>
	<% } %>
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