<!--签发-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row-bach row">
    <div class="col-xs-7">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.wordsNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-5">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.author %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row-bach row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">书稿名称</label>
        <div class="col-xs-4">
          <% for(var i=0;i < info.cnBookFileOfManuscriptList.length;i++) { %>
          <p class="form-control-static"><%- info.cnBookFileOfManuscriptList[i].bookFileName  %></p>
          <% } %>
        </div>
        <div class="col-xs-4">
          <% for(var i=0;i < info.cnBookFileOfManuscriptList.length;i++) { %>
          <% if( !info.cnBookFileOfManuscriptList[i].bookFileAddress ||
          info.cnBookFileOfManuscriptList[i].bookFileAddress === '') { %>
          <button class="btn btn-default address" disabled>下载</button><br>
          <% } else {%>
          <button class="btn btn-default address"
                  data-address="<%- info.cnBookFileOfManuscriptList[i].bookFileAddress %>">下载</button><br>
          <% } %>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <% if(info.auditList && info.auditList.length > 0) { %>
  <% if(info.auditList[0]) { %>
  <div class="row-bach row border form-compact">
    <div class="col-xs-1 col-xs-offset-1">
      <div class="form-group">
        <div class="bold m-t-20">初<br>审<br>检<br>查</div>
      </div>
    </div>
    <div class="col-xs-10">
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿思想内容</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[0].content === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[0].content === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">文字质量</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[0].wordsQuality === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[0].wordsQuality === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿正文与目录</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[0].textCatalogue === '1') { %>
                一致
                <% } %>
                <% if(info.auditList[0].textCatalogue === '2') { %>
                不一致
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿体例格式</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[0].bookFormat === '1') { %>
                一致
                <% } %>
                <% if(info.auditList[0].bookFormat === '2') { %>
                不一致
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">责任编辑</label>
            <div class="col-xs-8">
              <p class="form-control-static"><%- info.auditList[0].dutyEditor %></p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">初审时间</label>
            <div class="col-xs-8">
              <p class="form-control-static"><%- info.auditList[0].auditDatetime %></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% if(info.auditList[1]) { %>
  <div class="row-bach row border m-t-10 m-b-10 form-compact">
    <div class="col-xs-1 col-xs-offset-1">
      <div class="form-group">
        <div class="bold m-t-30">复<br>审<br>检<br>查</div>
      </div>
    </div>
    <div class="col-xs-10">
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿思想内容</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[1].content === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[1].content === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">文字质量</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[1].wordsQuality === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[1].wordsQuality === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">处理意见</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[1].handleState === '1') { %>
                同意
                <% } %>
                <% if(info.auditList[1].handleState === '2') { %>
                不同意
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">复审人员</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[1].secondAuditUser %>"><%- info.auditList[1].secondAuditUser %></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">编辑室主任</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[1].editorialOfficeDirector %>"><%- info.auditList[1].editorialOfficeDirector %></p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">复审时间</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[1].auditDatetime %>"><%- info.auditList[1].auditDatetime %></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% if(info.auditList[2]) { %>
  <div class="row-bach row border form-compact">
    <div class="col-xs-1 col-xs-offset-1">
      <div class="form-group">
        <div class="bold m-t-30">终<br>审<br>检<br>查</div>
      </div>
    </div>
    <div class="col-xs-10">
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <% if(info.auditList[2].finishType === '1') { %>
            <label class="col-xs-4 control-label">通读全部书稿</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[2].percentage %>"><%- info.auditList[2].percentage %></p>
            </div>
            <% } %>
            <% if(info.auditList[2].finishType === '2') { %>
            <label class="col-xs-4 control-label">抽审书稿</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="（<%-
                info.auditList[2].startPage %> - <%-
                info.auditList[2].endPage %>）">（<%-
                info.auditList[2].startPage %> - <%-
                info.auditList[2].endPage %>）</p>
            </div>
            <% } %>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿思想内容</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[2].content === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[2].content === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">文字质量</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[2].wordsQuality === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[2].wordsQuality === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿体例格式</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[2].bookFormat === '1') { %>
                一致
                <% } %>
                <% if(info.auditList[2].bookFormat === '2') { %>
                不一致
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">处理意见</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[2].handleState === '1') { %>
                同意
                <% } %>
                <% if(info.auditList[2].handleState === '2') { %>
                不同意
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">终审人员</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[2].finalAuditUser %>"><%- info.auditList[2].finalAuditUser %></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">副总编辑</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[2].deputyChiefEditor %>"><%- info.auditList[2].deputyChiefEditor %></p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">终审时间</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[2].auditDatetime %>"><%- info.auditList[2].auditDatetime %></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% } %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
        <div class="col-xs-10">
          <label class="radio-inline">
            <% if(!info.handleState||  info.handleState === '1') { %>
            <input type="radio" name="handleState" value="1" required checked="checked">同意签发
            <% } else { %>
            <input type="radio" name="handleState" value="1" required>同意签发
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.handleState === '2') { %>
            <input type="radio" name="handleState" value="2" required checked="checked">废弃
            <% } else { %>
            <input type="radio" name="handleState" value="2" required>废弃
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.handleState === '3') { %>
            <input type="radio" name="handleState" value="3" required checked="checked">变更备案登记
            <% } else { %>
            <input type="radio" name="handleState" value="3" required>变更备案登记
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.handleState === '4') { %>
            <input type="radio" name="handleState" value="4" required checked="checked">回到初审
            <% } else { %>
            <input type="radio" name="handleState" value="4" required>回到初审
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
          <textarea class="form-control" maxlength="1024" placeholder="（不超过1024字）" name="handleContentOne"><%-
            info.handleContentOne
            %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0 ; i < info.userTaskEntities.length; i++) { %>
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
                   data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}"
                   data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i
                      class="fa fa-user-o"></i>
              </button>
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
    <div class="col-xs-7">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.wordsNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-5">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.author %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">书稿名称</label>
        <div class="col-xs-4">
          <% for(var i=0;i < info.cnBookFileOfManuscriptList.length;i++) { %>
          <p class="form-control-static"><%- info.cnBookFileOfManuscriptList[i].bookFileName  %></p>
          <% } %>
        </div>
        <div class="col-xs-4">
          <% for(var i=0;i < info.cnBookFileOfManuscriptList.length;i++) { %>
          <% if( !info.cnBookFileOfManuscriptList[i].bookFileAddress ||
          info.cnBookFileOfManuscriptList[i].bookFileAddress === '') { %>
          <button class="btn btn-default address" disabled>下载</button><br>
          <% } else {%>
          <button class="btn btn-default address"
                  data-address="<%- info.cnBookFileOfManuscriptList[i].bookFileAddress %>">下载</button><br>
          <% } %>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <% if(info.auditList && info.auditList.length > 0) { %>
  <% if(info.auditList[0]) { %>
  <div class="row border form-compact">
    <div class="col-xs-1 col-xs-offset-1">
      <div class="form-group">
        <div class="bold m-t-20">初<br>审<br>检<br>查</div>
      </div>
    </div>
    <div class="col-xs-10">
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿思想内容</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[0].content === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[0].content === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">文字质量</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[0].wordsQuality === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[0].wordsQuality === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿正文与目录</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[0].textCatalogue === '1') { %>
                一致
                <% } %>
                <% if(info.auditList[0].textCatalogue === '2') { %>
                不一致
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿体例格式</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[0].bookFormat === '1') { %>
                一致
                <% } %>
                <% if(info.auditList[0].bookFormat === '2') { %>
                不一致
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">责任编辑</label>
            <div class="col-xs-8">
              <p class="form-control-static"><%- info.auditList[0].dutyEditor %></p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">初审时间</label>
            <div class="col-xs-8">
              <p class="form-control-static"><%- info.auditList[0].auditDatetime %></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% if(info.auditList[1]) { %>
  <div class="row border m-t-10 m-b-10 form-compact">
    <div class="col-xs-1 col-xs-offset-1">
      <div class="form-group">
        <div class="bold m-t-30">复<br>审<br>检<br>查</div>
      </div>
    </div>
    <div class="col-xs-10">
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿思想内容</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[1].content === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[1].content === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">文字质量</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[1].wordsQuality === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[1].wordsQuality === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">处理意见</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[1].handleState === '1') { %>
                同意
                <% } %>
                <% if(info.auditList[1].handleState === '2') { %>
                不同意
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">复审人员</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[1].secondAuditUser %>"><%- info.auditList[1].secondAuditUser %></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">编辑室主任</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[1].editorialOfficeDirector %>"><%- info.auditList[1].editorialOfficeDirector %></p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">复审时间</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[1].auditDatetime %>"><%- info.auditList[1].auditDatetime %></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% if(info.auditList[2]) { %>
  <div class="row border form-compact">
    <div class="col-xs-1 col-xs-offset-1">
      <div class="form-group">
        <div class="bold m-t-30">终<br>审<br>检<br>查</div>
      </div>
    </div>
    <div class="col-xs-10">
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <% if(info.auditList[2].finishType === '1') { %>
            <label class="col-xs-4 control-label">通读全部书稿</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[2].percentage %>"><%- info.auditList[2].percentage %></p>
            </div>
            <% } %>
            <% if(info.auditList[2].finishType === '2') { %>
            <label class="col-xs-4 control-label">抽审书稿</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="（<%-
                info.auditList[2].startPage %> - <%-
                info.auditList[2].endPage %>）">（<%-
                info.auditList[2].startPage %> - <%-
                info.auditList[2].endPage %>）</p>
            </div>
            <% } %>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿思想内容</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[2].content === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[2].content === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">文字质量</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[2].wordsQuality === '1') { %>
                合格
                <% } %>
                <% if(info.auditList[2].wordsQuality === '2') { %>
                不合格
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">书稿体例格式</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[2].bookFormat === '1') { %>
                一致
                <% } %>
                <% if(info.auditList[2].bookFormat === '2') { %>
                不一致
                <% } %>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">处理意见</label>
            <div class="col-xs-8">
              <p class="form-control-static">
                <% if(info.auditList[2].handleState === '1') { %>
                同意
                <% } %>
                <% if(info.auditList[2].handleState === '2') { %>
                不同意
                <% } %>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">终审人员</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[2].finalAuditUser %>"><%- info.auditList[2].finalAuditUser %></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">副总编辑</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[2].deputyChiefEditor %>"><%- info.auditList[2].deputyChiefEditor %></p>
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label class="col-xs-4 control-label">终审时间</label>
            <div class="col-xs-8">
              <p class="form-control-static" title="<%- info.auditList[2].auditDatetime %>"><%- info.auditList[2].auditDatetime %></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% } %>
  <% } %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">审核结果</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(info.handleState === '1') { %>
            同意签发
            <% } %>
            <% if(info.handleState === '2') { %>
            废弃
            <% } %>
            <% if(info.handleState === '3') { %>
            变更备案登记
            <% } %>
            <% if(info.handleState === '4') { %>
            回到初审
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
