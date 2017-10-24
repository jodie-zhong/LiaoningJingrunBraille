<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">本社选题种类</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookTopicClasses %>" name="bookTopicClasses"
                 placeholder="本社选题种类" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">重大选题备案号</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="importantTopicCode" value="<%- info.importantTopicCode %>"
                 placeholder="重大选题备案号" readonly/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">初审人员</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.firstInstanceOfficer %>" name="firstInstanceOfficer"
                 placeholder="初审人员"  readonly/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">复审人员</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="secondInstanceOfficer" value="<%- info.secondInstanceOfficer%>"
                  placeholder="复审人员" readonly/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">终审人员</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.lastInstanceOfficer %>" name="lastInstanceOfficer"
                 placeholder="终审人员" readonly/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书名（正书名）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookName %>" name="bookName"
                 placeholder="书名" maxlength="64"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">三审意见</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" name="threeOpinions" placeholder="三审意见（不超过1024字）" ><%-
            info.threeOpinions %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">第一作者</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="bookDetailAuthor" value="<%- info.bookDetailAuthor%>"
                 maxlength="32" placeholder="第一作者" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">第一著作方式</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookDetailWorkWay %>" name="bookDetailWorkWay"
                 placeholder="第一著作方式" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">其他作者</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="bookDetailOtherAuthor" value="<%- info.bookDetailOtherAuthor%>"
                 maxlength="32" placeholder="其他作者"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">其他著作方式</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookDetailOtherWorkWay %>"
                 name="bookDetailOtherWorkWay"
                 placeholder="其他著作方式" maxlength="64"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文文种</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="bookTextLanguage" value="<%- info.bookTextLanguage%>"
                 maxlength="32" placeholder="正文文种" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文文字</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookTextWords %>" name="bookTextWords"
                 placeholder="正文文字" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数（千字）</label>
        <div class="col-xs-8">
          <input type="text" pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$"
                 data-fv-regexp-message="请输入小于10000的数字,允许三位小数" class="form-control" name="bookDetailWordsNum" value="<%- info.bookDetailWordsNum%>"
                 maxlength="8" placeholder="字数（千字）" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="dutyEditor" value="<%- info.dutyEditor%>"
                 placeholder="责任编辑" readonly />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">电话</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.phone %>" name="phone"
                 placeholder="电话"  readonly/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书类型</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookType %>" name="bookType"
                 placeholder="图书类型" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">内容提要</label>
        <div class="col-xs-10">
          <textarea type="text" class="form-control" name="bookDetailSketched" maxlength="1024" placeholder="内容提要（不超过1024字）" ><%- info.bookDetailSketched%></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">作者简介</label>
        <div class="col-xs-10">
          <textarea type="text" class="form-control" name="bookDetailAuthorMsg"
                      maxlength="1024" placeholder="作者简介（不超过1024字）" ><%- info.bookDetailAuthorMsg%></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书分类</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="bookDetailKind" value="<%- info.bookDetailKind%>"
                 maxlength="32" placeholder="图书分类" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">发行范围</label>
        <div class="col-xs-8">
            <input type="text" class="form-control" name="bookDetailPublishScope"
                   value="<%- info.bookDetailPublishScope %>"
                   maxlength="32" placeholder="发行范围" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版次</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="revision" value="<%- info.revision%>"
                 maxlength="32" placeholder="版次" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印次</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookDetailLayoutOrder %>" name="bookDetailLayoutOrder"
                 placeholder="印次" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价（本册）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control"  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                 data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" value="<%- info.bookFasciclePrice %>" name="bookFasciclePrice"
                 placeholder="定价（本册）"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版方式</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookPublishMode %>" name="bookPublishMode"
                 placeholder="出版方式" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">分（辑）册号</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookFascicleNum %>" name="bookFascicleNum"
                 placeholder="分（辑）册号" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价（本套）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control"  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                 data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)"  name="bookPrice" value="<%- info.bookPrice %>"
                 placeholder="定价（本套）"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版社名称</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookPressName %>" name="bookPressName"
                 placeholder="出版社名称" maxlength="20"/>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0 ; i < info.userTaskEntities.length; i++) { %>
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">本社选题种类</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookTopicClasses %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">重大选题备案号</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.importantTopicCode %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">初审人员</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.firstInstanceOfficer %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">复审人员</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.secondInstanceOfficer %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">终审人员</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.lastInstanceOfficer %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书名（正书名）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">三审意见</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.threeOpinions%></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">第一作者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailAuthor %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">第一著作方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailWorkWay %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">其他作者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailWorkWay %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">其他著作方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailWorkWay %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文文种</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookTextLanguage %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文文字</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookTextWords %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailWordsNum %></p>
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">电话</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.phone %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书类型</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookType %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">内容提要</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.bookDetailSketched %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">作者简介</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.bookDetailAuthorMsg %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书分类</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailKind %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">发行范围</label>
        <div class="col-xs-8">
          <div class="input-group">
            <p class="form-control-static"><%- info.bookDetailPublishScope %></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版次</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.revision %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印次</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailLayoutOrder %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价（本册）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookFasciclePrice %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookPublishMode %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">分（辑）册号</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookFascicleNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价（本套）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookPrice %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版社名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookPressName %></p>
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
