<!--复审-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <input type="hidden" name="currentFlowId" value="secondAudit" />
  <input type="hidden" name="taskInformationId" value="<%- info.taskInformationId %>" />
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">复审结果</label>
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
    <div class="col-xs-6">
    	<div class="form-group">
    		<label class="col-xs-4 control-label">版心字数</label>
    		<div class="col-xs-3">
    			<input type="text" class="form-control" name="auditCenterWordOne" value="<%- info.auditCenterWordOne %>" maxlength="2" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数">
    		</div>
    		<label class="col-xs-1" style="line-height: 30px;">X</label>
    		<div class="col-xs-3">
    			<input type="text" class="form-control" name="auditCenterWordTwo" value="<%- info.auditCenterWordTwo %>" maxlength="2" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数">
        </div>
    	</div>
    </div>
  </div>
  <div class="row">
  	<div class="col-xs-6">
  		<div class="form-group">
  			<label class="col-xs-4 control-label">种别</label>
  			<div class="col-xs-8">
  				<select class="form-control" name="auditType">
  					<% if(!info.auditType || info.auditType === '1') { %>
  					<option value="1" selected>甲</option>
  					<option value="2">乙</option>
  					<option value="3">丙</option>
  					<% } else if(info.auditType === '2') { %>
  					<option value="1">甲</option>
  					<option value="2" selected>乙</option>
  					<option value="3">丙</option>
  					<% } else if(info.auditType === '3') { %>
  					<option value="1">甲</option>
  					<option value="2">乙</option>
  					<option value="3" selected>丙</option>
  					<% } %>
  				</select>
  			</div>
  		</div>
  	</div>
  	<div class="col-xs-6">
  		<div class="form-group">
  			<label class="col-xs-4 control-label">工种</label>
  			<div class="col-xs-8">
  				<select class="form-control" name="auditWorkway">
  					<% if(!info.auditWorkway || info.auditWorkway === '1') { %>
  					<option value="1" selected>录入</option>
  					<option value="2">转换</option>
  					<% } else if(info.auditWorkway === '2') { %>
  					<option value="1">录入</option>
  					<option value="2" selected>转换</option>
  					<% } %>
  				</select>
  			</div>
  		</div>
  	</div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">复审意见</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="handleContentOne" placeholder="复审意见(不超过2048字)" maxlength="2048"><%- info.handleContentOne %></textarea>
          <div><label class="len">0/2048</label></div>
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
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">复审结果</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.handleState === '1') { %>
            同意发稿
            <% } %>
            <% if(info.handleState === '2') { %>
            退编辑
            <% } %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
    	<div class="form-group">
    		<label class="col-xs-4 control-label">版心字数</label>
    		<div class="col-xs-8">
    			<p class="form-control-static">
    				<%- info.auditCenterWordOne %>X<%- info.auditCenterWordTwo %>
    			</p>
    		</div>
    	</div>
    </div>
  </div>
  <div class="row">
  	<div class="col-xs-6">
  		<div class="form-group">
  			<label class="col-xs-4 control-label">种别</label>
  			<div class="col-xs-8">
  				<p class="form-control-static">
  					<% if(info.auditType === '1') { %>
  					甲
  					<% } else if(info.auditType === '2') { %>
  					乙
  					<% } else if(info.auditType === '3') { %>
  					丙
  					<% } %>
  				</p>
  			</div>
  		</div>
  	</div>
  	<div class="col-xs-6">
  		<div class="form-group">
  			<label class="col-xs-4 control-label">工种</label>
  			<div class="col-xs-8">
  				<p class="form-control-static">
  					<% if(info.auditWorkway === '1') { %>
  					录入
  					<% } else if(info.auditWorkway === '2') { %>
  					转换
  					<% } %>
  				</p>
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