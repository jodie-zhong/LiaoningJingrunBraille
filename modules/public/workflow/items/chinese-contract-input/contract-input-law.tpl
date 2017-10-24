<!--上传法律评估报告-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
  <div class="row">
  	<div class="col-xs-12">
  		<div class="form-group" data-area = "law">
  			<label class="col-xs-2 control-label">法律评估报告<span class="must">*</span></label>
  			<% if(!info.legalReportFileList.length) { %>
  			<div class="col-xs-4">
  				<input type="hidden" data-name="lawNum" value="" />
  				<div class="input-group with-clear">
						<input type="text" class="form-control" data-name="law" name="contractFileName" value="" title="" data-value="" placeholder="法律评估报告" readonly data-fv-notempty="true" data-fv-notempty-message="请选择法律评估报告">
						<span class="input-group-btn">
             	<button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*.pdf"}'><i class="fa fa-file-o"></i></button>
            </span>
					</div>
  			</div>
  			<div class="col-xs-6">
  				<button data-down="view" class="btn btn-default" disabled>预览</button>
  				<button data-down="downView" class="btn btn-default" disabled>下载</button>
  			</div>
  			<% } else { %>
  			<div class="col-xs-4">
  				<input type="hidden" data-name="lawNum" value="<%- info.legalReportFileList[0].contractFileTypeCode %>" />
  				<div class="input-group with-clear">
						<input type="text" data-name="law" class="form-control" name="contractFileName" value="<%- info.legalReportFileList[0].contractFileName %>" title="<%- info.legalReportFileList[0].contractFileName %>" data-value="<%- info.legalReportFileList[0].contractFilePath %>" placeholder="法律评估报告" readonly data-fv-notempty="true" data-fv-notempty-message="请选择法律评估报告">
						<span class="input-group-btn">
             	<button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*.pdf"}'><i class="fa fa-file-o"></i></button>
            </span>
					</div>
  			</div>	
  			<div class="col-xs-6">
  				<button data-down="view" class="btn btn-default">预览</button>
  				<button data-down="downView" class="btn btn-default">下载</button>
  			</div>
  			<% } %>
  		</div>
  	</div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptAndRoles) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
            <%- info.userTaskEntities[i].flowName %>（<%- info.userTaskEntities[i].deptAndRoles %>）
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
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                   data-data="{searchRoleId: '', searchDepartmentId: ''}" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
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
  		<label class="col-xs-2 control-label">法律评估报告</label>
  		<div class="col-xs-4"><p class="form-control-static"><%- info.legalReportFileList[0].contractFileName %></p></div>	
  		<div class="col-xs-6">
  			<button data-down="htmlView" class="btn btn-default" data-address="<%- info.legalReportFileList[0].contractFilePath %>">预览</button>
  			<button data-down="View" class="btn btn-default" data-address="<%- info.legalReportFileList[0].contractFilePath %>">下载</button>
  		</div>
  	</div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.submitUserName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交时间</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.submitDatetime %></p>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>