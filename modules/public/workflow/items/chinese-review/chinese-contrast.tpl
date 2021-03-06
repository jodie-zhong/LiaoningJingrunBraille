<!--审稿核红-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group ">
        <label class="col-xs-2 control-label">处理意见</label>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(!info.handleState || info.handleState === '1') { %>
            <input type="radio" name="handleState" value="1" checked/>退改
            <% } else { %>
            <input type="radio" name="handleState" value="1"/>退改
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.handleState === '2') { %>
            <input type="radio" name="handleState" value="2" checked/>打样
            <% } else { %>
            <input type="radio" name="handleState" value="2"/>打样
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row" data-name = "mwHAuditRedList">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-2 control-label">漏改位置</label>
  			<div class="col-xs-10">
  				<table class="table table-striped">
  					<thead>
  						<tr>
  							<th>序号</th>
  							<th>页数(P)<span class="must-td">*</span></th>
  							<th>行号<span class="must-td">*</span></th>
  							<th style="width: 60px;">
  								<button class="btn btn-xs btn-success" data-type="contract-plus"><i class="fa fa-plus box"></i></button>
  							</th>
  						</tr>
  					</thead>
  					<tbody data-wrap = "change">
  						<% if(!info.mwHAuditRedList.length) { %>
  						<tr data-area = "page">
  							<td data-type = "number"></td>
  							<td class="form-group">
  								<input type="text" class="form-control" name="auditRedMissPage" value="" data-fv-notempty="true" data-fv-notempty-message="请输入页数" maxlength="7" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
  							</td>
  							<td class="form-group">
  								<input type="text" class="form-control" name="auditRedMissLine" value="" data-fv-notempty="true" data-fv-notempty-message="请输入行号" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
  							</td>
  							<td>  								
  								<button class="btn btn-xs btn-danger" data-type="contract-minus"><i class="fa fa-close box"></i></button>
  							</td>
  						</tr>	
  						<% } else { %>
  						<% for(var i = 0; i < info.mwHAuditRedList.length; i++) { %>
  						<tr data-area = "page">
  							<td data-type = "number"></td>
  							<td class="form-group">
  								<input type="text" class="form-control" name="auditRedMissPage" value="<%- info.mwHAuditRedList[i].auditRedMissPage %>" data-fv-notempty="true" data-fv-notempty-message="请输入页数" maxlength="7" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
  							</td>
  							<td class="form-group">
  								<input type="text" class="form-control" name="auditRedMissLine" value="<%- info.mwHAuditRedList[i].auditRedMissLine %>" data-fv-notempty="true" data-fv-notempty-message="请输入行号" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
  							</td>
  							<td>  								
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
  <div class="row" data-name = "mwHAuditRedList">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-2 control-label">漏改数量</label>
  			<div class="col-xs-4">
  				<input type="text" class="form-control" name="missNum" value="'input'" readonly />
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
      <div class="form-group ">
        <label class="col-xs-2 control-label">处理意见</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.handleState === '1') { %>
            退改
            <% } %>
            <% if(info.handleState === '2') { %>
            打样
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <% if(info.handleState === '1') { %>
  <div class="row">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-2 control-label">漏改位置</label>
  			<div class="col-xs-10">
  				<table class="table table-striped">
  					<thead>
  						<tr>
  							<th>序号</th>
  							<th>页数(P)</th>
  							<th>行号</th>
  						</tr>
  					</thead>
  					<tbody>
  						<% for(var i = 0; i < info.mwHAuditRedList.length; i++) { %>
  						<tr>
  							<td><%- i+1 %></td>
  							<td><%- info.mwHAuditRedList[i].auditRedMissPage %></td>
  							<td><%- info.mwHAuditRedList[i].auditRedMissLine %></td>
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
        <label class="col-xs-2 control-label">漏改数量</label>
        <div class="col-xs-4">
        	<p class="form-control-static"><%- info.mwHAuditRedList[0].missNum %></p>
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