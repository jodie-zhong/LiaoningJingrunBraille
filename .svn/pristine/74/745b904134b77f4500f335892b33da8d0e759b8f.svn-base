<!--校对-校对-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">文稿</label>
        <div class="col-xs-10">
          <% if(info.hBookFileList && info.hBookFileList.length > 0 && info.hBookFileList[0].bookPath) { %>
          <p class="form-control-static">
            <%- info.hBookFileList[0].bookFileName %>
            <button style="margin-bottom: 0;" name="downloadFile" class="btn btn-xs btn-default downloadFile" data-download-address="<%- info.hBookFileList[0].bookPath %>">下载</button>
          </p>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">处理意见</label>
        <div class="col-xs-8">
          <% if(info.handleState === '2') { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1"/>发稿</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2" checked/>退改</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1" checked/>发稿</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>退改</label>
          <% } %>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">通读校样</label>
        <div class="col-xs-8">
          <% if(info.isHorsing === '2') { %>
          <label class="radio-inline"><input type="radio" name="isHorsing" value="1"/>是</label>
          <label class="radio-inline"><input type="radio" name="isHorsing" value="2" checked/>否</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="isHorsing" value="1" checked/>是</label>
          <label class="radio-inline"><input type="radio" name="isHorsing" value="2"/>否</label>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">文字质量</label>
        <div class="col-xs-8">
          <% if(info.wordsQuality === '2') { %>
          <label class="radio-inline"><input type="radio" name="wordsQuality" value="1"/>合格</label>
          <label class="radio-inline"><input type="radio" name="wordsQuality" value="2" checked/>不合格</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="wordsQuality" value="1" checked/>合格</label>
          <label class="radio-inline"><input type="radio" name="wordsQuality" value="2"/>不合格</label>
          <% } %>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书稿体例格式</label>
        <div class="col-xs-8">
          <% if(info.bookFormat === '2') { %>
          <label class="radio-inline"><input type="radio" name="bookFormat" value="1"/>一致</label>
          <label class="radio-inline"><input type="radio" name="bookFormat" value="2" checked/>不一致</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="bookFormat" value="1" checked/>一致</label>
          <label class="radio-inline"><input type="radio" name="bookFormat" value="2"/>不一致</label>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">形成校对记录报告送交责任编辑</label>
        <div class="col-xs-10">
          <% if(info.isDeliver === '2') { %>
          <label class="radio-inline"><input type="radio" name="isDeliver" value="1"/>是</label>
          <label class="radio-inline"><input type="radio" name="isDeliver" value="2" checked/>否</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="isDeliver" value="1" checked/>是</label>
          <label class="radio-inline"><input type="radio" name="isDeliver" value="2"/>否</label>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">校对质疑</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="proofQuestion" placeholder="校对质疑（最大256字）" maxlength="256"><%- info.proofQuestion %></textarea>
          <div><label class="len">0/256</label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">勘误表</label>
        <div class="col-xs-10 form-compact">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 120px;">页码<span class="must-td">*</span></th>
              <th style="width: 120px;">行<span class="must-td">*</span></th>
              <th>误<span class="must-td">*</span></th>
              <th>正<span class="must-td">*</span></th>
              <th>备注</th>
              <th style="width: 50px;">
                <button class="addTableRow btn btn-xs btn-default"><i class="fa fa-plus box"></i></button>
              </th>
            </tr>
            </thead>
            <tbody id="dataTBody">

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-index="<%- i %>" data-area="nextFlow" >
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptAndRoles) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
            <!--<%- info.userTaskEntities[i].flowName %>（-->
            <!--<%- info.userTaskEntities[i].deptNames %> - -->
            <!--<%- info.userTaskEntities[i].roleNames %>）-->
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
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
                   placeholder="任务人" data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}" data-fv-notempty="true"
                   data-fv-notempty-message="请选择下一任务人" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" readonly>
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'
                      data-open="public/user/select-users">
                <i class="fa fa-user-o"></i>
              </button>
            </span>
          </div>
          <div class="help-block with-errors"></div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <% } %>
  <% } %>
</div>
<!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">文稿</label>
        <div class="col-xs-10">
          <% if(info.hBookFileList && info.hBookFileList.length > 0 && info.hBookFileList[0].bookPath) { %>
          <p class="form-control-static">
            <%- info.hBookFileList[0].bookFileName %>
            <button style="margin-bottom: 0;" name="downloadFile" class="btn btn-xs btn-default downloadFile" data-download-address="<%- info.hBookFileList[0].bookPath %>">下载</button>
          </p>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">处理意见</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.handleState === '1' ? '发稿' : (info.handleState === '2' ? '退改' : '') %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">通读校样</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.isHorsing === '1' ? '是' : (info.isHorsing === '2' ? '否' : '') %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">文字质量</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.wordsQuality === '1' ? '合格' : (info.wordsQuality === '2' ? '不合格' : '') %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书稿体例格式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookFormat === '1' ? '一致' : (info.bookFormat === '2' ? '不一致' : '') %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">形成校对记录报告送交责任编辑</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.isDeliver === '1' ? '是' : (info.isDeliver === '2' ? '否' : '') %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">校对质疑</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.proofQuestion %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">勘误表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 80px;">页码</th>
              <th style="width: 80px;">行</th>
              <th>误</th>
              <th>正</th>
              <th>备注</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.proofRightOrWrongEntities) { %>
            <% for(var i = 0; i < info.proofRightOrWrongEntities.length; i++) { %>
            <tr>
              <td><%- (i + 1) %></td>
              <td><%- info.proofRightOrWrongEntities[i].page %></td>
              <td><%- info.proofRightOrWrongEntities[i].line %></td>
              <td title="<%- info.proofRightOrWrongEntities[i].wrongInformation %>"><%- info.proofRightOrWrongEntities[i].wrongInformation %></td>
              <td title="<%- info.proofRightOrWrongEntities[i].rigthInformation %>"><%- info.proofRightOrWrongEntities[i].rigthInformation %></td>
              <td title="<%- info.proofRightOrWrongEntities[i].remarks %>"><%- info.proofRightOrWrongEntities[i].remarks %></td>
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