<!--快印通知单录入-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书全名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
          <input type="hidden" name="quickPrintId" value="<%- info.quickPrintId %>">
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">新/重</label>
        <div class="col-xs-8">
          <label class="radio-inline">
            <% if(!info.quickPrintType || info.quickPrintType === '1') { %>
            <input type="radio" name="quickPrintType" value="1" data-fv-notempty="true"
                   data-fv-notempty-message="请选择新书" checked disabled/>新书
            <% } else { %>
            <input type="radio" name="quickPrintType" value="1" data-fv-notempty="true"
                   data-fv-notempty-message="请选择新书" disabled/>新书
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.quickPrintType && info.quickPrintType === '2') { %>
            <input type="radio" name="quickPrintType" value="2" data-fv-notempty="true"
                   data-fv-notempty-message="请选择重印" checked disabled/>重印
            <% } else { %>
            <input type="radio" name="quickPrintType" value="2" data-fv-notempty="true"
                   data-fv-notempty-message="请选择重印" disabled/>重印
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">出版单位</label>
        <div class="col-xs-8">
          <label class="radio-inline">
            <% if(!info.quickPrintPublisher || info.quickPrintPublisher === '1') { %>
            <input type="radio" name="quickPrintPublisher" value="1" data-fv-notempty="true"
                   data-fv-notempty-message="请选择求真" checked/>求真
            <% } else { %>
            <input type="radio" name="quickPrintPublisher" value="1" data-fv-notempty="true"
                   data-fv-notempty-message="请选择求真"/>求真
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.quickPrintPublisher && info.quickPrintPublisher === '2') { %>
            <input type="radio" name="quickPrintPublisher" value="2" data-fv-notempty="true"
                   data-fv-notempty-message="请选择盲文" checked/>盲文
            <% } else { %>
            <input type="radio" name="quickPrintPublisher" value="2" data-fv-notempty="true"
                   data-fv-notempty-message="请选择盲文"/>盲文
            <% } %>
          </label>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书种类</label>
        <div class="col-xs-8">
          <select name="printType" class="form-control" id="bookPrintType" data-type = "machineBook"
                  data-fv-notempty="true">
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面排版人</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="coverLayoutUser" value="<%- info.coverLayoutUser %>"
                 maxlength="32" placeholder="封面排版人" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文排版人</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.textUser %>" name="textUser"
                 placeholder="正文排版人" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书定价<span class="must">*</span></label>
        <div class="col-xs-8">
          <input type="text"  pattern="^(([0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*\.[0-9]{1,2})|([0-9]*[1-9][0-9]*))$" data-fv-regexp-message="请输入大于零的数字（允许两位小数）" class="form-control" name="bookPricing" data-fv-notempty="true"
                 data-fv-notempty-message="请填写图书定价" value="<%- info.bookPricing %>"
                 max="99999.99" placeholder="图书定价"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">成品尺寸</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.finishedSize %>" name="finishedSize"
                 placeholder="成品尺寸" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本<span class="must">*</span></label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="format" data-fv-notempty="true"
                 data-fv-notempty-message="请填写开本" value="<%-info.format%>"
                 maxlength="32" placeholder="开本" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数<span class="must">*</span></label>
        <div class="col-xs-8">
          <input type="text" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" class="form-control"
                 data-fv-notempty="true"
                 data-fv-notempty-message="请填写印数" value="<%- info.printNum %>" name="printNum"
                 placeholder="印数" maxlength="8"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印张/页码<span class="must">*</span></label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="printPaperNum" data-fv-notempty="true"
                 data-fv-notempty-message="请填写印张/页码" value="<%-info.printPaperNum%>"
                 maxlength="32" placeholder="印张/页码" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">封面工艺</label>
        <div class="col-xs-4">
          <select name="coverProcess" class="form-control" id="coverProcessOne" data-fv-notempty="true" data-type = "machineCover">
          </select>
        </div>
        <div class="col-xs-4">
          <input class="form-control" name="coverProcessDescribe" value="<%-info.coverProcessDescribe %>"
                 maxlength="64">
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">勒口</label>
        <div class="col-xs-8">
          <label class="radio-inline">
            <% if(!info.isHaveFlap || info.isHaveFlap === '1') { %>
            <input type="radio" name="isHaveFlap" value="1" checked/>有
            <% } else { %>
            <input type="radio" name="isHaveFlap" value="1" />有
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.isHaveFlap && info.isHaveFlap === '2') { %>
            <input type="radio" name="isHaveFlap" value="2"  checked/>无
            <% } else { %>
            <input type="radio" name="isHaveFlap" value="2" />无
            <% } %>
          </label>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口尺寸cm</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.flapSize %>" name="flapSize"
                 placeholder="勒口尺寸cm" maxlength="16" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">环衬</label>
        <div class="col-xs-8">
          <label class="radio-inline">
            <% if(!info.lining || info.lining === '1') { %>
            <input type="radio" name="lining" value="1"  checked/>前
            <% } else { %>
            <input type="radio" name="lining" value="1" />前
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.lining && info.lining === '2') { %>
            <input type="radio" name="lining" value="2"  checked/>后
            <% } else { %>
            <input type="radio" name="lining" value="2" />后
            <% } %>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面用纸（克）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="coverPaper" value="<%-info.coverPaper%>"
                 maxlength="16" placeholder="封面用纸（克）" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面用纸种类</label>
        <div class="col-xs-8">
          <select name="coverPaperType" class="form-control" id="coverPaperType" data-fv-notempty="true" data-type = "machinePaper">
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文用纸（克）</label>
        <div class="col-xs-8">
          <input type="text" maxlength="16" class="form-control" name="textPaper" value="<%-info.textPaper%>" placeholder="正文用纸（克）" />
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文用纸种类</label>
        <div class="col-xs-8">
          <select name="textPaperType" class="form-control" id="textPaperType" data-fv-notempty="true" data-type = "machineMain">
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">环衬用纸<span class="must">*</span></label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="liningPaper" value="<%-info.liningPaper%>"
                 maxlength="11" placeholder="环衬用纸" data-required-error="请填写环衬用纸"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">彩插</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.colorInsert %>" name="colorInsert"
                 placeholder="彩插" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">印制地点</label>
        <div class="col-xs-8">
          <label class="radio-inline">
            <% if(!info.printAddress || info.printAddress === '1') { %>
            <input type="radio" name="printAddress" value="1" data-fv-notempty="true"
                   data-fv-notempty-message="请选择印制地点" checked/>社内
            <% } else { %>
            <input type="radio" name="printAddress" value="1" data-fv-notempty="true"
                   data-fv-notempty-message="请选择印制地点"/>社内
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.printAddress && info.printAddress === '2') { %>
            <input type="radio" name="printAddress" value="2" data-fv-notempty="true"
                   data-fv-notempty-message="请选择印制地点" checked/>其他
            <% } else { %>
            <input type="radio" name="printAddress" value="2" data-fv-notempty="true"
                   data-fv-notempty-message="请选择印制地点"/>其他
            <% } %>
          </label>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装订方式</label>
        <div class="col-xs-8">
          <select name="bindingWay" class="form-control" id="bindingWay" data-fv-notempty="true" data-type = "machineBinding">
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">装订顺序<span class="must">*</span></label>
        <div class="col-xs-10">
          <textarea type="text" class="form-control" name="bindingOrder"
                    maxlength="100" placeholder="装订顺序（不超过100字）" data-fv-notempty="true"
                    data-fv-notempty-message="请填写装订顺序"><%- info.bindingOrder %></textarea>
          <div><label class="len"></label></div>
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
        <label class="col-xs-4 control-label">图书全名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">新/重</label>
        <div class="col-xs-8">
            <p class="form-control-static">
            <% if(!info.quickPrintType || info.quickPrintType === '1') { %>
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
      <div class="form-group ">
        <label class="col-xs-4 control-label">出版单位</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(!info.quickPrintPublisher || info.quickPrintPublisher === '1') { %>
            求真
            <% } else { %>
            盲文
            <% } %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书种类</label>
        <div class="col-xs-8">
          <pre class="form-control-static"><%- info.printTypeName %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面排版人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.coverLayoutUser %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文排版人</label>
        <div class="col-xs-8">
            <p class="form-control-static"><%- info.textUser %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书定价</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookPricing %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">成品尺寸</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.finishedSize %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%-info.format%></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.printNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印张/页码</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%-info.printPaperNum%></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">封面工艺</label>
        <div class="col-xs-4">
          <p class="form-control-static"><%-info.coverProcessName %></p>
        </div>
        <div class="col-xs-4">
          <p class="form-control-static"><%-info.coverProcessDescribe %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">勒口</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(!info.isHaveFlap || info.isHaveFlap === '1') { %>
            有
            <% } else { %>
            无
            <% } %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口尺寸cm</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.flapSize %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">环衬</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(!info.lining || info.lining === '1') { %>
            前
            <% } else { %>
            后
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面用纸（克）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%-info.coverPaper%></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面用纸种类</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%-info.coverPaperTypeName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文用纸（克）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%-info.textPaper %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文用纸种类</label>
        <div class="col-xs-8">
            <p class="form-control-static"><%-info.textPaperTypeName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">环衬用纸</label>
        <div class="col-xs-8">
          <P class="form-control-static"><%-info.liningPaper%></P>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">彩插</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.colorInsert %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">印制地点</label>
        <div class="col-xs-8">
            <p class="form-control-static">
            <% if(!info.printAddress || info.printAddress === '1') { %>
              社内
            <% } else { %>
              其他
            <% } %>
            </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装订方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bindingWayName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">装订顺序</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.bindingOrder %></pre>
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

