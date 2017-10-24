<!--设计-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
  <% if(info.bookPrintType==='2') { %>
  <div class="row">
    <h3 class="text-center">印装通知单</h3>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书号</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.bookIsbn %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印件名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.mAnotherPrintName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">新/重</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.newEditionWeight %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.printNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本（毫米）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.format %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书厚</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.bookThickness %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.flap %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">用纸（克）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.usePaper %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">纸开正数（张）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.usePaperNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开放（张）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.disparkPaper %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">照付印样</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <span><%- info.anotherBasicInfoEntity.sampleColour %></span>
            <span><%- info.anotherBasicInfoEntity.sampleFace %></span>
            <span><%- info.anotherBasicInfoEntity.samplePrint %></span>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">纸切</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.sheetingOne %>X<%- info.sheetingTwo %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装帧方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.bindingWay %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">要求发页日期</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.requestDatetime %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">注意事项</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.anotherBasicInfoEntity.note %></pre>
        </div>
      </div>
    </div>
  </div>
  <% }%>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <button type="button" class="btn btn-default" id="downCip" data-Id="<%- info.bookId %>">下载CIP数据</button>
      </div>
    </div>
  </div>
  <div class="row">
    <table class="table table-striped table-nowrap table-hover">
      <thead>
      <tr>
        <th class="w-table">序号</th>
        <th class="w-100">文件名称</th>
        <th class="w-100">上传时间</th>
        <th class="w-100">上传人</th>
        <th class="w-150 text-center">附件</th>
        <th class="text-center">操作</th>
      </tr>
      </thead>
      <tbody>
      <% if(info.coverInfoEntities.length > 0 ) { %>
      <% for(var i = 0; i < info.coverInfoEntities.length; i++) { %>
      <tr data-createUserId="<%- info.coverInfoEntities[i].createUserId %>" data-type="ebook"
          data-bookFileId="<%- info.coverInfoEntities[i].bookFileId %>"
          data-bookFileType="<%- info.coverInfoEntities[i].bookFileType %>"
          data-bookFascicleId="<%- info.coverInfoEntities[i].bookFascicleId %>">
        <td><%- (i + 1) %></td>
        <td class="bookFileName" title="<%- info.coverInfoEntities[i].bookFileName %>"><%-
          info.coverInfoEntities[i].bookFileName %>
        </td>
        <td class="createDatetime" title="<%- info.coverInfoEntities[i].createDatetime %>"><%-
          info.coverInfoEntities[i].createDatetime %>
        </td>
        <td class="createUserName" title="<%- info.coverInfoEntities[i].createUserName %>"><%-
          info.coverInfoEntities[i].createUserName
          %>
        </td>
        <td>
          <% if(!info.coverInfoEntities[i].bookFileAddress || info.coverInfoEntities[i].bookFileAddress === '') { %>
          <button class="btn btn-default btn-rounded btn-sm btn-download"
                  data-address="<%- info.coverInfoEntities[i].bookFileAddress %>" disabled>下载
          </button>
          <button class="btn btn-default btn-rounded btn-sm btn-preview"
                  data-preview="<%- info.coverInfoEntities[i].bookFileAddress %>" disabled>预览
          </button>
          <% } else { %>
          <button class="btn btn-default btn-rounded btn-sm btn-download"
                  data-address="<%- info.coverInfoEntities[i].bookFileAddress %>">下载
          </button>
          <button class="btn btn-default btn-rounded btn-sm btn-preview"
                  data-preview="<%- info.coverInfoEntities[i].bookFileAddress %>">预览
          </button>
          <% } %>
        </td>
        <td>
          <div class="col-xs-12">
            <div class="col-xs-8">
              <div class="input-group input-group-xs fileUp with-clear">
                <input type="text" class="form-control bookAddress" name="bookFileAddress"
                       data-value="<%- info.coverInfoEntities[i].bookFileAddress %>"
                       value="<%- info.coverInfoEntities[i].bookFileName %>"
                       placeholder="上传" readonly/>
                <span class="input-group-btn">
                  <button class="btn btn-clear" type="button" data-action="clear"><i
                          class="fa fa-remove box"></i></button>
                  <button class="btn btn-default" type="button" data-open="public/file/file-upload"
                          data-data='{"type": "*.doc;*.docx"}'><i class="fa fa-file-o"></i>
                  </button>
                </span>
              </div>
            </div>
            <div class="col-xs-4">
              <button class="btn btn-default btn-rounded btn-design btn-sm m-t-5">在线设计</button>
            </div>
          </div>
        </td>
      </tr>
      <% } %>
      <% }else{%>
      <tr>
        <td colspan="6"><p class="empty-tips">没有符合指定条件的数据</p></td>
      </tr>
      <% }%>
      </tbody>
    </table>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow">
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
              <input type="text" class="form-control" name="taskUsers"
                     title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
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
</div>
<% }else{ %>
<div class="form-horizontal">
  <% if(info.bookPrintType==='2') { %>
  <div class="row">
    <h3 class="text-center">印装通知单</h3>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书号</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.bookIsbn %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印件名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.mAnotherPrintName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">新/重</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.newEditionWeight %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.printNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本（毫米）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.format %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书厚</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.bookThickness %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.flap %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">用纸（克）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.usePaper %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">纸开正数（张）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.usePaperNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开放（张）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.disparkPaper %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">照付印样</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <span><%- info.anotherBasicInfoEntity.sampleColour %></span>
            <span><%- info.anotherBasicInfoEntity.sampleFace %></span>
            <span><%- info.anotherBasicInfoEntity.samplePrint %></span>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">纸切</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.sheetingOne %>X<%- info.sheetingTwo %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装帧方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.bindingWay %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">要求发页日期</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.anotherBasicInfoEntity.requestDatetime %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">注意事项</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.anotherBasicInfoEntity.note %></pre>
        </div>
      </div>
    </div>
  </div>
  <% }%>
  <div class="row">
    <table class="table table-striped table-nowrap table-hover">
      <thead>
      <tr>
        <th class="w-table">序号</th>
        <th class="w-100">文件名称</th>
        <th class="w-100">上传时间</th>
        <th class="w-100">上传人</th>
        <th class="w-100">附件</th>
      </tr>
      </thead>
      <tbody>
      <% for(var i = 0; i < info.coverInfoEntities.length; i++) { %>
      <tr data-id="<%- info.coverInfoEntities[i].bookTopicId %>"
          data-name="<%- info.coverInfoEntities[i].bookTopicName %>">
        <td><%- (i + 1) %></td>
        <td title="<%- info.coverInfoEntities[i].bookFileName %>"><%- info.coverInfoEntities[i].bookFileName %></td>
        <td title="<%- info.coverInfoEntities[i].createDatetime %>"><%- info.coverInfoEntities[i].createDatetime %></td>
        <td title="<%- info.coverInfoEntities[i].createUserName %>"><%- info.coverInfoEntities[i].createUserName %></td>
        <td>
          <% if(!info.coverInfoEntities[i].bookFileAddress || info.coverInfoEntities[i].bookFileAddress === '') { %>
          <button class="btn btn-default btn-rounded btn-sm btn-download"
                  data-address="<%- info.coverInfoEntities[i].bookFileAddress %>" disabled>下载
          </button>
          <button class="btn btn-default btn-rounded btn-sm btn-preview"
                  data-preview="<%- info.coverInfoEntities[i].bookFileAddress %>" disabled>预览
          </button>
          <% } else { %>
          <button class="btn btn-default btn-rounded btn-sm btn-download"
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
