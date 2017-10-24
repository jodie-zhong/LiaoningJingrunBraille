<!--版权页设计单-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <input type="hidden" name="hColophonId" value="<%- info.mwHColophonEntity.hColophonId %>">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书名</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookName %>" name="bookName"
                 placeholder="书名" readonly/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印制状态</label>
        <div class="col-xs-8">
          <label class="radio-inline">
            <% if( !info.mwHColophonEntity.printState || info.mwHColophonEntity.printState === '1') { %>
            <input type="radio" name="printState" value="1" required checked="checked" disabled>新书
            <% } else { %>
            <input type="radio" name="printState" value="1" required disabled>新书
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.mwHColophonEntity.printState === '2') { %>
            <input type="radio" name="printState" value="2" required checked="checked" disabled>重印
            <% } else { %>
            <input type="radio" name="printState" value="2" required disabled>重印
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bookDetailDutyEditor %>" name="bookDetailDutyEditor"
                 placeholder="责任编辑"  readonly/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任印制</label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="dutyPrint" title="<%- info.mwHColophonEntity.dutyPrint %>" value="<%- info.mwHColophonEntity.dutyPrint %>"
                   data-value="<%- info.mwHColophonEntity.dutyPrintId %>" readonly />
            <span class="input-group-btn">
            <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
            <button class="btn btn-default" type="button" data-open="public/user/select-user" data-data="{}"><i
                    class="fa fa-user-o"></i></button>
          </span>
          </div>
        </div>
        <!--<div class="col-xs-8">-->
          <!--<input type="text" class="form-control" value="<%- info.mwHColophonEntity.dutyPrint %>" name="dutyPrint"-->
                 <!--placeholder="责任印制"  maxlength="128"/>-->
        <!--</div>-->
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面设计</label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="coverDesign" title="<%- info.mwHColophonEntity.coverDesign %>" value="<%- info.mwHColophonEntity.coverDesign %>"
                   data-value="<%- info.mwHColophonEntity.coverDesignId %>" readonly />
            <span class="input-group-btn">
            <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
            <button class="btn btn-default" type="button" data-open="public/user/select-user" data-data="{}"><i
                    class="fa fa-user-o"></i></button>
          </span>
          </div>
        </div>
        <!--<div class="col-xs-8">-->
          <!--<input type="text" class="form-control" value="<%- info.mwHColophonEntity.coverDesign %>" name="coverDesign"-->
                 <!--placeholder="封面设计" maxlength="128"/>-->
        <!--</div>-->
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版单位</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="publisher" value="<%- info.mwHColophonEntity.publisher %>"
                 placeholder="出版单位" maxlength="128" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印厂</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHColophonEntity.print %>" name="print"
                 placeholder="印厂" maxlength="128" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面印刷</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="coverPrint" value="<%- info.mwHColophonEntity.coverPrint%>"
                 maxlength="128" placeholder="封面印刷"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">成品尺寸（mm）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHColophonEntity.finishedSize %>"
                 name="finishedSize"
                 placeholder="成品尺寸（mm）" maxlength="16"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="format" value="<%- info.mwHColophonEntity.format %>"
                 maxlength="16" placeholder="开本" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印张</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHColophonEntity.printSheet %>" name="printSheet" pattern="^[0-9]*$"
                 data-fv-regexp-message="请输入大于0的整数"
                 placeholder="印张" maxlength="9" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="printNum" value="<%- info.mwHColophonEntity.printNum%>" pattern="^[0-9]*$"
                 data-fv-regexp-message="请输入大于0的整数"
                  placeholder="印数" maxlength="9" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数(千字)</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="wordsNum" value="<%- info.mwHColophonEntity.wordsNum%>"
                 placeholder="字数(千字)" pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$"
                 data-fv-regexp-message="请输入小于10000的数字,允许三位小数" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">版次</label>
        <div class="clearfix" style="margin-bottom: 15px">
          <div class="col-xs-4">
            <input type="text" style="" class="form-control date-time" name="editionDate"
                   value="<%- info.mwHColophonEntity.editionDate%>"
                   placeholder="版次" />
          </div>
          <div class="dis-inline">
            <span class="pull-left" style="margin-top: 8px">第</span>
            <div class="col-xs-4">
              <input type="text" class="form-control" name="editionNum" value="<%- info.mwHColophonEntity.editionNum%>"
                      maxlength="9" pattern="^[0-9]*$"
                     data-fv-regexp-message="请输入大于0的整数"/>
            </div>
            <span class="pull-left" style="margin-top: 8px">版</span>
          </div>
        </div>
        <div class="clearfix">
          <div class="col-xs-offset-2 col-xs-4">
            <input type="text" style="" class="form-control date-time" name="editionPrintDate"
                   value="<%- info.mwHColophonEntity.editionPrintDate%>"
                   placeholder="版次" />
          </div>
          <div class="dis-inline">
            <span class="pull-left" style="margin-top: 8px">第</span>
            <div class="col-xs-4">
              <input type="text" class="form-control" name="editionPrintNum"
                     value="<%- info.mwHColophonEntity.editionPrintNum%>"
                     pattern="^[0-9]*$"
                     data-fv-regexp-message="请输入大于0的整数" maxlength="9" />
            </div>
            <span class="pull-left" style="margin-top: 8px">次印刷</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书号</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="isbn" value="<%- info.mwHColophonEntity.isbn%>"
                 placeholder="书号" readonly />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
        <div class="form-group">
          <label class="col-xs-4 control-label">定价<span class="must">*</span></label>
          <div class="col-xs-8">
            <input type="text" class="form-control" name="pricing" data-fv-notempty="true"
                   data-fv-notempty-message="请填写定价" value="<%- info.mwHColophonEntity.pricing%>"
                   placeholder="定价"  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                   data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" />
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
        <label class="col-xs-4 control-label">书名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印制状态</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if( !info.mwHColophonEntity.printState || info.mwHColophonEntity.printState === '1') { %>
            新书
            <% } else { %>
            重印
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
          <p class="form-control-static"><%- info.bookDetailDutyEditor %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任印制</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <%- info.mwHColophonEntity.dutyPrint %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面设计</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.coverDesign %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版单位</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.publisher %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印厂</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.print %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面印刷</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.coverPrint %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">成品尺寸（mm）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.finishedSize %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.format %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印张</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.printSheet %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.printNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数(千字)</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.wordsNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">版次</label>
        <div class="clearfix" style="margin-bottom: 15px">
          <div class="col-xs-4">
            <p class="form-control-static"><%- info.mwHColophonEntity.editionDate %></p>
          </div>
          <div class="dis-inline">
            <span class="pull-left" style="margin-top: 8px">第</span>
            <div class="col-xs-4">
              <p class="form-control-static"><%- info.mwHColophonEntity.editionNum %></p>
            </div>
            <span class="pull-left" style="margin-top: 8px">版</span>
          </div>
        </div>
        <div class="clearfix">
          <div class="col-xs-offset-2 col-xs-4">
            <p class="form-control-static"><%- info.mwHColophonEntity.editionPrintDate %></p>
          </div>
          <div class="dis-inline">
            <span class="pull-left" style="margin-top: 8px">第</span>
            <div class="col-xs-4">
              <p class="form-control-static"><%- info.mwHColophonEntity.editionPrintNum %></p>
            </div>
            <span class="pull-left" style="margin-top: 8px">次印刷</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书号</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.isbn %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHColophonEntity.pricing %></p>
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
