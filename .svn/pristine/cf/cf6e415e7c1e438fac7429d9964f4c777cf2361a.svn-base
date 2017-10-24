<!--补全图书信息-->
<% if(isEdit) { %>
<script type="text/template" id="phoneTemplate">
  <div class="clearfix addphone">
    <div class="col-xs-5 m-t-10">
      <input class="form-control phone-number" maxlength="100" placeholder="电话" name="phoneOne"  value=""/>
    </div>
    <div class="col-xs-5 m-t-10">
      <button class="btn btn-xs btn-success" data-type="phone-plus"><i class="fa fa-plus box"></i></button>
      <button class="btn btn-xs btn-danger" data-type="phone-minus"><i class="fa fa-close box"></i></button>
    </div>
  </div>
</script>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="dutyEditorIds" title="<%- info.dutyEditor %>" value="<%- info.dutyEditor %>"
                   data-value="<%- info.dutyEditorIds %>" readonly />
            <span class="input-group-btn">
            <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
            <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data="{}"><i
                    class="fa fa-user-o"></i></button>
          </span>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任校对</label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="checkStaffIds" title="<%- info.checkStaff %>" value="<%- info.checkStaff %>"
                   data-value="<%- info.checkStaffIds %>" readonly />
            <span class="input-group-btn">
            <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
            <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data="{}"><i
                    class="fa fa-user-o"></i></button>
          </span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面设计</label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="coverDesignerIds" title="<%- info.coverDesigner %>" value="<%- info.coverDesigner %>"
                   data-value="<%- info.coverDesignerIds %>" readonly />
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data="{}"><i
                      class="fa fa-user-o"></i></button>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书名</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookName %>" name="bookName"
                 placeholder="书名" maxlength="64"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">编著者</label>
        <div class="col-xs-8">
            <input type="text" class="form-control" name="bookDetailAuthor" value="<%- info.bookDetailAuthor%>"
                   maxlength="32" placeholder="编著者" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版发行</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookDetailPublishScope %>"
                 name="bookDetailPublishScope"
                 placeholder="出版发行" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">社址</label>
        <div class="col-xs-8">
            <input type="text" class="form-control" name="pressAddress" value="<%- info.pressAddress%>"
                   maxlength="128" placeholder="社址" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">邮政编码</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.postCode %>" name="postCode"
                 placeholder="邮政编码" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">电话</label>
        <div class="col-xs-10 phoneList" style="padding-left: 0">
          <% if(info.phoneList && info.phoneList.length >0 ) { %>
          <% for(var i=0; i < info.phoneList.length;i++){ %>
          <% if(i===0) {%>
          <div class="clearfix addphone">
            <div class="col-xs-5">
              <input class="form-control phone-number" maxlength="100" placeholder="电话" name="phoneOne"  value="<%- info.phoneList[0] %>"/>
            </div>
            <div class="col-xs-5">
              <button class="btn btn-xs btn-success" data-type="phone-plus"><i class="fa fa-plus box"></i></button>
              <button class="btn btn-xs btn-danger" data-type="phone-minus"><i class="fa fa-close box"></i></button>
            </div>
          </div>
          <% } else{%>
          <div class="clearfix addphone">
            <div class="col-xs-5 m-t-10">
              <input class="form-control phone-number" maxlength="100" placeholder="电话" name="phoneOne"
                     value="<%- info.phoneList[i] %>"/>
            </div>
            <div class="col-xs-5 m-t-10">
              <button class="btn btn-xs btn-success" data-type="phone-plus"><i class="fa fa-plus box"></i></button>
              <button class="btn btn-xs btn-danger" data-type="phone-minus"><i class="fa fa-close box"></i></button>
            </div>
          </div>
          <% } %>
          <% } %>
          <% } else {%>
          <div class="clearfix addphone">
            <div class="col-xs-5">
              <input class="form-control phone-number" maxlength="12" placeholder="电话" name="phoneOne"  value="<%- info.phoneList[0] %>"/>
            </div>
            <div class="col-xs-5">
              <button class="btn btn-xs btn-success" data-type="phone-plus"><i class="fa fa-plus box"></i></button>
              <button class="btn btn-xs btn-danger" data-type="phone-minus"><i class="fa fa-close box"></i></button>
            </div>
          </div>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">盲文版</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="bookDetailMEditionNum" value="<%- info.bookDetailMEditionNum %>"
                 maxlength="64" placeholder="盲文版"  />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版次</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="revision" value="<%- info.revision %>"
                 maxlength="32" placeholder="版次" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印刷</label>
        <div class="col-xs-8">
            <input type="text" class="form-control" name="print" value="<%- info.print%>"
                   maxlength="64" placeholder="印刷" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.folio %>" name="folio"
                 placeholder="开本" maxlength="64"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数（千字）</label>
        <div class="col-xs-8">
            <input type="text" class="form-control" name="bookDetailWordsNum" pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入小于10000的数字,允许三位小数" value="<%- info.bookDetailWordsNum%>"
                   maxlength="8" placeholder="字数（千字）" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版数<span class="must">*</span></label>
        <div class="col-xs-8">
          <input type="text" class="form-control" pattern="^[0-9]*$" data-fv-notempty="true" data-fv-regexp-message="请输入大于等于0的整数"
                 value="<%- info.versionNum %>" name="versionNum"
                 placeholder="版数" maxlength="5"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">原出版社</label>
        <div class="col-xs-8">
            <input type="text" class="form-control" name="bookDetailPublishingHouse"
                   value="<%- info.bookDetailPublishingHouse%>"
                   maxlength="128" placeholder="原出版社" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <label class="col-xs-2 control-label">原书出版时间及版次</label>
    <div class="col-xs-10 changeableRow" name="dateAndVersionArray">

    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书号</label>
        <div class="col-xs-8">
            <input type="text" class="form-control" name="bookIsbn" value="<%- info.bookIsbn %>"
                   maxlength="32" placeholder="书号" readonly />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookPrice %>" name="bookPrice"
                 placeholder="定价" pattern="^(([1-9][0-9]{0,6})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,6}\.[0-9]{1,2}))$"
                 data-fv-regexp-message="请输入大于0小于10000000的数字（允许两位小数）" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">主题词</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" name="bookSubjectHeadings" placeholder="主题词（不超过1024字）" ><%-
            info.bookSubjectHeadings%></textarea>
          <div><label class="len"></label></div>
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
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers"
                   value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
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
          <div class="help-block with-errors"></div>
        </div>
      </div>
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
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.dutyEditor %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任校对</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.checkStaff %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面设计</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.coverDesigner %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">编著者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailAuthor %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版发行</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailPublishScope %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">社址</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.pressAddress %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">邮政编码</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.postCode %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">电话</label>
        <% if(info.phoneList && info.phoneList.length >0) { %>
        <% for(var i=0; i < info.phoneList.length;i++){ %>
        <% if(i===0) {%>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.phoneList[i] %></p>
        </div>
        <% } else {%>
        <div class="col-xs-10 col-xs-offset-2">
          <p class="form-control-static"><%- info.phoneList[i] %></p>
        </div>
        <% } %>
        <% } %>
        <% } %>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印刷</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.print %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.folio %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数</label>
        <div class="col-xs-8">
          <div class="input-group">
            <p class="form-control-static"><%- info.bookDetailWordsNum %></p>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.versionNum %></p>
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
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">原出版社</label>
        <div class="col-xs-8">
          <div class="input-group">
            <p class="form-control-static"><%- info.bookDetailPublishingHouse %></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <label class="col-xs-2 control-label">原书出版时间及版次</label>
    <div class="col-xs-10" name="dateAndVersionArray">

    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">盲文版</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailMEditionNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookPrice %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书号</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookIsbn %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">主题词</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.bookSubjectHeadings %></pre>
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