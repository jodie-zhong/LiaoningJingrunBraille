<!--责任编辑审核-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
  <div class="row">
    <table class="table table-striped table-nowrap table-hover">
      <thead>
      <tr>
        <th class="w-table">序号</th>
        <th class="w-200">文件名称</th>
        <th class="w-200">上传时间</th>
        <th class="w-100">上传人</th>
        <th class="w-100">附件</th>
      </tr>
      </thead>
      <tbody>
      <% if(info.coverInfoEntities.length>0) {%>
      <% for(var i = 0; i < info.coverInfoEntities.length; i++) { %>
      <tr data-createUserId="<%- info.coverInfoEntities[i].createUserId %>" data-type="ebook" data-bookFileId="<%- info.coverInfoEntities[i].bookFileId %>"
          data-bookFileType="<%- info.coverInfoEntities[i].bookFileType %>" data-bookFascicleId="<%- info.coverInfoEntities[i].bookFascicleId %>">
        <td><%- (i + 1) %></td>
        <td class="bookFileName"><%- info.coverInfoEntities[i].bookFileName %></td>
        <td class="createDatetime"><%- info.coverInfoEntities[i].createDatetime %></td>
        <td><%- info.coverInfoEntities[i].createUserName %></td>
        <td>
          <% if(!info.coverInfoEntities[i].bookFileAddress || info.coverInfoEntities[i].bookFileAddress === '') { %>
          <button class="btn btn-default btn-rounded btn-sm address"
                  data-address="<%- info.coverInfoEntities[i].bookFileAddress %>" disabled>下载
          </button>
          <button class="btn btn-default btn-rounded btn-sm btn-preview"
                  data-preview="<%- info.coverInfoEntities[i].bookFileAddress %>" disabled>预览
          </button>
          <% } else { %>
          <button class="btn btn-default btn-rounded btn-sm address"
                  data-address="<%- info.coverInfoEntities[i].bookFileAddress %>">下载
          </button>
          <button class="btn btn-default btn-rounded btn-sm btn-preview"
                  data-preview="<%- info.coverInfoEntities[i].bookFileAddress %>">预览
          </button>
          <% } %>
        </td>
      </tr>
      <% } %>
      <% }else{%>
      <tr>
        <td colspan="7"><p class="empty-tips">没有符合指定条件的数据</p></td>
      </tr>
      <% }%>
      </tbody>
    </table>
  </div>
  <% if( info.isLoginUser ==='1' ){ %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">委托审核人审核结果：</label>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(!info.deputeReviewEntity.handleState || info.deputeReviewEntity.handleState === '1') { %>
            <input type="radio" name="handleStateAuthorized" class="deputeHandleState" value="1" required checked="checked">通过
            <% } else { %>
            <input type="radio" name="handleStateAuthorized" class="deputeHandleState" value="1" required>通过
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.deputeReviewEntity.handleState === '2') { %>
            <input type="radio" name="handleStateAuthorized" class="deputeHandleState" value="2" required checked="checked">拒绝
            <% } else { %>
            <input type="radio" name="handleStateAuthorized" class="deputeHandleState" value="2" required>拒绝
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">委托审核人审核意见：</label>
        <div class="col-xs-10">
        <textarea class="form-control deputeHandleContentOne" maxlength="1024" placeholder="审核意见(不超过1024字)"><%- info.deputeReviewEntity.handleContentOne
          %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <% } else{ %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(!info.handleState || info.handleState === '1') { %>
            <input type="radio" name="handleState" value="1" required checked="checked">通过
            <% } else { %>
            <input type="radio" name="handleState" value="1" required>通过
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.handleState === '2') { %>
            <input type="radio" name="handleState" value="2" required checked="checked">拒绝
            <% } else { %>
            <input type="radio" name="handleState" value="2" required>拒绝
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" placeholder="审核意见(不超过1024字)" name="handleContentOne"><%- info.handleContentOne
            %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group deputeUsers">
        <label class="col-xs-2 control-label">委托审核人</label>
        <div class="col-xs-4">
          <div class="input-group with-clear">
            <input type="text" class="form-control" title="<%- info.deputeTaskUserNames %>" name="deputeTaskUsers" value="<%- info.deputeTaskUserNames %>"
                   data-value="<%- info.deputeTaskUsers %>" readonly/>
            <span class="input-group-btn">
            <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
            <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data="{}"><i
                class="fa fa-user-o"></i></button>
          </span>
          </div>
        </div>
        <% if(info.deputeTaskId) { %>
        <div class="col-xs-6">
          <button data-bookDeploymentKey="<%- info.bookDeploymentKey %>" data-bookId="<%- info.bookId %>" class="btn btn-primary" disabled>下发</button>
        </div>
        <% }else{ %>
        <div class="col-xs-6">
          <button  data-bookDeploymentKey="<%- info.bookDeploymentKey %>" data-bookId="<%- info.bookId %>" id="depute" data-taskId="<%- info.taskId
            %>"
                    class="btn btn-primary"
          >下发
          </button>
        </div>
        <% } %>
      </div>
    </div>
  </div>
  <% if(info.deputeTaskId) { %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">委托审核人审核结果</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if( info.deputeReviewEntity.handleState === '1') { %>
            通过
            <% } %>
            <% if(info.deputeReviewEntity.handleState === '2') { %>
            拒绝
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">委托审核人审核意见</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.deputeReviewEntity.handleContentOne %></pre>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" style="display: none;">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程<span class="must">*</span></label>
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
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <% if(info.userTaskEntities[i].roleIds) { %>
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group">
            <div class="input-group with-clear">
              <input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                     value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                     data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                     data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}"
                     data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
              <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i
                  class="fa fa-user-o"></i>
              </button>
            </span>
            </div>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <% } %>
  <% } %>
  <% } %>
</div>
<% }else{ %>
<div class="form-horizontal">
  <div class="row">
    <table class="table table-striped table-nowrap table-hover">
      <thead>
      <tr>
        <th class="w-table">序号</th>
        <th class="w-200">文件名称</th>
        <th class="w-200">上传时间</th>
        <th class="w-100">上传人</th>
        <th class="w-150">附件</th>
      </tr>
      </thead>
      <tbody>
      <% for(var i = 0; i < info.coverInfoEntities.length; i++) { %>
      <tr data-id="<%- info.coverInfoEntities[i].bookTopicId %>"
          data-name="<%- info.coverInfoEntities[i].bookTopicName %>">
        <td><%- (i + 1) %></td>
        <td class="bookFileName" title="<%- info.coverInfoEntities[i].bookFileName %>"><%- info.coverInfoEntities[i].bookFileName %></td>
        <td title="<%- info.coverInfoEntities[i].createDatetime %>"><%- info.coverInfoEntities[i].createDatetime %></td>
        <td title="<%- info.coverInfoEntities[i].createUserName %>"><%- info.coverInfoEntities[i].createUserName %></td>
        <td>
          <% if(!info.coverInfoEntities[i].bookFileAddress || info.coverInfoEntities[i].bookFileAddress === '') { %>
          <button class="btn btn-default btn-rounded btn-sm address"
                  data-address="<%- info.coverInfoEntities[i].bookFileAddress %>" disabled>下载
          </button>
          <button class="btn btn-default btn-rounded btn-sm btn-preview"
                  data-preview="<%- info.coverInfoEntities[i].bookFileAddress %>" disabled>预览
          </button>
          <% } else { %>
          <button class="btn btn-default btn-rounded btn-sm address"
                  data-address="<%- info.coverInfoEntities[i].bookFileAddress %>">下载
          </button>
          <button class="btn btn-default btn-rounded btn-sm btn-preview"
                  data-preview="<%- info.coverInfoEntities[i].bookFileAddress %>">预览
          </button>
          <% } %>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
  <% if( info.isLoginUser !=='1' ){ %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">委托审核人</label>
        <div class="col-xs-10">
          <% if( info.deputeTaskUserNames ) { %>
          <p class="form-control-static"><%- info.deputeTaskUserNames %></p>
          <% } else {%>
          <p class="form-control-static">无委托人</p>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">委托审核人审核结果</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(  info.deputeReviewEntity && info.deputeReviewEntity.handleState === '1') { %>
            通过
            <% } %>
            <% if( info.deputeReviewEntity && info.deputeReviewEntity.handleState === '2') { %>
            拒绝
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">委托审核人审核意见</label>
        <div class="col-xs-10">
          <% if( info.deputeReviewEntity && info.deputeReviewEntity.handleContentOne ) { %>
          <pre class="form-control-static"><%- info.deputeReviewEntity.handleContentOne %></pre>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <% if( info.isLoginUser !=='1' ){ %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(info.handleState === '1') { %>
            通过
            <% } %>
            <% if(info.handleState === '2') { %>
            拒绝
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核意见</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.handleContentOne %></pre>
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
