<!--合同录入-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.dutyEditor %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">图书类型</label>
        <div class="col-xs-4">
        	<p class="form-control-static"><%- info.bookType %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-2 control-label">合同附件</label>
  			<div class="col-xs-10">
  				<table class="table table-striped">
  					<thead>
  						<tr>
  							<th style="width: 50px;">序号</th>
  							<th>合同附件<span class="must-td">*</span></th>
  							<th style="width: 75px;">下载</th>
  							<th style="width: 75px;">预览</th>
  							<th style="width: 100px;">操作</th>
  						</tr>
  					</thead>
  					<tbody data-wrap = "contrat">
  						<% if(!info.contractFileList.length) { %>
  						<tr data-area = "contrat">
  							<td data-type = "number"></td>
  							<td class="form-group">
  								<div class="input-group with-clear">
										<input type="text" class="form-control" name="contractFileName" value="" data-value="" placeholder="合同附件" readonly data-fv-notempty="true" data-fv-notempty-message="请选择合同附件">
										<span class="input-group-btn">
                    	<button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                      <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*doc,*.docx"}'><i class="fa fa-file-o"></i></button>
                    </span>
									</div>
  							</td>
  							<td>
  								<input type="hidden" name="contractFileTypeCode" value="" />
  								<button data-down="down" class="btn btn-xs btn-default btn-rounded" disabled>下载</button>
  							</td>	
  							<td>
  								<button data-down="view" class="btn btn-xs btn-default btn-rounded" disabled>预览</button>
  							</td>
  							<td>
  								<button class="btn btn-xs btn-success" data-type="contract-plus"><i class="fa fa-plus box"></i></button>
  								<button class="btn btn-xs btn-danger" data-type="contract-minus"><i class="fa fa-close box"></i></button>
  							</td>
  						</tr>
  						<% } else { %>
  						<% for(var i = 0; i< info.contractFileList.length; i++) { %>
  						<tr data-area = "contrat">
  							<td data-type = "number"></td>
  							<td class="form-group">
  								<div class="input-group with-clear">
										<input type="text" class="form-control" name="contractFileName" value="<%- info.contractFileList[i].contractFileName %>" data-value="<%- info.contractFileList[i].contractFilePath %>" placeholder="合同附件" readonly data-fv-notempty="true" data-fv-notempty-message="请选择合同附件">
										<span class="input-group-btn">
                    	<button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                      <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data="{}"><i class="fa fa-file-o"></i></button>
                    </span>
									</div>
  							</td>
  							<% if(!info.contractFileList[i].contractFilePath) { %>
  							<td>
  								<button data-down="down" class="btn btn-default btn-rounded" disabled>下载</button>
  								<input type="hidden" name="contractFileTypeCode" value="<%- info.contractFileList[i].contractFileTypeCode %>" />
  							</td>
  							<td>
  								<button data-down="view" class="btn btn-xs btn-default btn-rounded" disabled>预览</button>
  							</td>
  							<% } else { %>
  							<td>
  								<button data-down="down" class="btn btn-xs btn-default btn-rounded">下载</button>
  								<input type="hidden" name="contractFileTypeCode" value="<%- info.contractFileList[i].contractFileTypeCode %>" />
  							</td>	
  							<td>
  								<button data-down="view" class="btn btn-xs btn-default btn-rounded">预览</button>
  							</td>
  							<% } %>
  							
  							<td>
  								<button class="btn btn-xs btn-success" data-type="contract-plus"><i class="fa fa-plus box"></i></button>
  								<button class="btn btn-xs btn-danger" data-type="contract-minus"><i class="fa fa-close box"></i></button>
  							</td>
  						</tr>
  						<% } %>
  						<% } %>
  					</tbody>
  				</table>
  			</div>
  		</div>
  	</div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">备注</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="handleContentOne" placeholder="备注（不超过1024字）" maxlength="1024"><%- info.handleContentOne %></textarea>
          <div><label class="len">0/1024</label></div>
        </div>
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.dutyEditor %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">图书类型</label>
        <div class="col-xs-4">
        	<p class="form-control-static"><%- info.bookType %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-2 control-label">合同附件</label>
  			<div class="col-xs-10">
  				<table class="table table-striped">
  					<thead>
  						<tr>
  							<th style="width: 50px;">序号</th>
  							<th>合同附件</th>
  							<th style="width: 75px;">下载</th>
  							<th style="width: 75px;">预览</th>
  						</tr>
  					</thead>
  					<tbody data-wrap = "contrat">
  						<% for(var i = 0; i< info.contractFileList.length; i++) { %>
  						<tr data-area = "contrat">
  							<td><%- i+1 %></td>
  							<td><%- info.contractFileList[i].contractFileName %></td>
  							<% if(!info.contractFileList[i].contractFilePath) { %>
  							<td><button data-down="downView" class="btn btn-xs btn-default btn-rounded" disabled>下载</button></td>	
  							<td><button data-down="checkView" class="btn btn-xs btn-default btn-rounded" disabled>预览</button></td>	
  							<% } else { %>
  							<td><button data-down="downView" class="btn btn-xs btn-default btn-rounded" data-address = "<%- info.contractFileList[i].contractFilePath %>" >下载</button></td>	
  							<td><button data-down="checkView" class="btn btn-xs btn-default btn-rounded" data-address = "<%- info.contractFileList[i].contractFilePath %>" >预览</button></td>	
  							<% } %>
  						</tr>
  						<% } %>
  					</tbody>
  				</table>
  			</div>
  		</div>
  	</div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">备注</label>
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