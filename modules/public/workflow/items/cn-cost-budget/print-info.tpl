<!--成本预算-印制信息填写-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnBookPrintEntity.printNum %>" name="printNum" placeholder="印数" pattern="^[1-9]\d{0,5}$" data-fv-regexp-message="请输入大于0的整数，最大6位" data-fv-notempty="true"
                   data-fv-notempty-message="请填写印数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-6 control-label">页数</label>
        <div class="col-xs-6">
          <input class="form-control" value="<%- info.cnBookPrintEntity.pageNum %>" name="pageNum" placeholder="页数" maxlength="7" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">印张</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnBookPrintEntity.printSheet %>" name="printSheet" placeholder="印张" pattern="^[1-9]\d{0,6}$" data-fv-regexp-message="请输入大于0的整数，最大7位"/>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-6 control-label">成品尺寸（mm）</label>
        <div class="col-xs-6">
          <input class="form-control" value="<%- info.cnBookPrintEntity.finishedSize %>" name="finishedSize" placeholder="成品尺寸" maxlength="16"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面用纸</label>
        <div class="col-xs-8">
          <div class="col-xs-6 form-group" style="padding: 0; margin: 0;">
            <input style="width: 80%;" class="form-control" value="<%- info.cnBookPrintEntity.coverGram %>" name="coverGram" placeholder="封面用纸" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数"/>
            克
          </div>
          <div class="col-xs-6 form-group" style="padding: 0; margin: 0;">
            <input style="width: 80%;" class="form-control" value="<%- info.cnBookPrintEntity.coverPaper %>" name="coverPaper" placeholder="封面用纸" maxlength="10"/>
            纸
          </div>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印刷色数</label>
        <div class="col-xs-8">
          <select name="coverColor" class="form-control" title="印刷色数">
            <% if(info.printColorMap) { %>
            <% for(var k in info.printColorMap) { %>
            <% if(k === info.cnBookPrintEntity.coverColor){ %>
            <option value='<%- k %>' selected><%- info.printColorMap[k] %></option>
            <% }else{ %>
            <option value='<%- k %>'><%- info.printColorMap[k] %></option>
            <% } %>
            <% } %>
            <% } %>
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">环衬</label>
        <div class="col-xs-2">
          <% if(info.cnBookPrintEntity.endPaper === '2') { %>
          <label class="radio-inline"><input type="radio" name="endPaper" value="1"/>前</label>
          <label class="radio-inline"><input type="radio" name="endPaper" value="2" checked/>后</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="endPaper" value="1" checked/>前</label>
          <label class="radio-inline"><input type="radio" name="endPaper" value="2"/>后</label>
          <% } %>
        </div>
        <div class="col-xs-4" style="padding: 0;">
          <div class="col-xs-6 form-group" style="padding: 0; margin: 0;">
            <input style="width: 80%;" class="form-control" value="<%- info.cnBookPrintEntity.endPaperGram %>" name="endPaperGram" placeholder="环衬" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数"/>
            克
          </div>
          <div class="col-xs-6 form-group" style="padding: 0; margin: 0;">
            <input style="width: 80%;" class="form-control" value="<%- info.cnBookPrintEntity.endPaperNum %>" name="endPaperNum" placeholder="环衬" maxlength="10"/>
            纸
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">勒口</label>
        <div class="col-xs-2">
          <% if(info.cnBookPrintEntity.flap === '2') { %>
          <label class="radio-inline"><input type="radio" name="flap" value="1"/>有</label>
          <label class="radio-inline"><input type="radio" name="flap" value="2" checked/>无</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="flap" value="1" checked/>有</label>
          <label class="radio-inline"><input type="radio" name="flap" value="2"/>无</label>
          <% } %>
        </div>
        <div class="col-xs-4" style="width: 10%; padding: 8px 0 0 0;">尺寸（mm）</div>
        <div class="col-xs-4 form-group" style="width: 20%; padding: 0; margin: 0;">
          <input class="form-control" value="<%- info.cnBookPrintEntity.flapSize %>" name="flapSize" placeholder="勒口尺寸" maxlength="10"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文用纸</label>
        <div class="col-xs-8">
          <div class="col-xs-6 form-group" style="padding: 0; margin: 0;">
            <input style="width: 80%;" class="form-control" value="<%- info.cnBookPrintEntity.textPaperGram %>" name="textPaperGram" placeholder="封面用纸" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数"/>
            克
          </div>
          <div class="col-xs-6 form-group" style="padding: 0; margin: 0;">
            <input style="width: 80%;" class="form-control" value="<%- info.cnBookPrintEntity.textPaperNum %>" name="textPaperNum" placeholder="封面用纸" maxlength="10"/>
            纸
          </div>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印刷色数</label>
        <div class="col-xs-8">
          <select name="textPaperPrintColor" class="form-control" title="印刷色数">
            <% if(info.printColorMap) { %>
            <% for(var k in info.printColorMap) { %>
            <% if(k === info.cnBookPrintEntity.textPaperPrintColor){ %>
            <option value='<%- k %>' selected><%- info.printColorMap[k] %></option>
            <% }else{ %>
            <option value='<%- k %>'><%- info.printColorMap[k] %></option>
            <% } %>
            <% } %>
            <% } %>
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">彩插</label>
        <div class="col-xs-2">
          <% if(info.cnBookPrintEntity.colorInsert === '2') { %>
          <label class="radio-inline"><input type="radio" name="colorInsert" value="1"/>有</label>
          <label class="radio-inline"><input type="radio" name="colorInsert" value="2" checked/>无</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="colorInsert" value="1" checked/>有</label>
          <label class="radio-inline"><input type="radio" name="colorInsert" value="2"/>无</label>
          <% } %>
        </div>
        <div class="col-xs-8">
          <div class="col-xs-4 form-group" style="margin: 0; padding: 0;">
            <div class="col-xs-3" style="padding: 8px 0 0 0;">
              页数
            </div>
            <div class="col-xs-9 form-group" style="padding-right: 0">
              <input class="form-control" value="<%- info.cnBookPrintEntity.colorInsertNum %>" name="colorInsertNum" placeholder="彩插页数" maxlength="7" pattern="^[0-9]*$"
                     data-fv-regexp-message="请输入大于0的整数"/>
            </div>
          </div>
          <div class="col-xs-4 form-group" style="margin: 0; padding: 0;">
            <input style="width: 83%;" class="form-control" value="<%- info.cnBookPrintEntity.colorInsertGram %>" name="colorInsertGram" placeholder="彩插" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数"/>
            克
          </div>
          <div class="col-xs-4 form-group" style="margin: 0; padding: 0;">
            <input style="width: 83%;" class="form-control" value="<%- info.cnBookPrintEntity.colorInsertPaper %>" name="colorInsertPaper" placeholder="彩插" maxlength="10"/>
            纸
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装订方式</label>
        <div class="col-xs-8">
          <select name="bindingStyle" class="form-control" title="装订方式">
            <% if(info.bindingStyleMap) { %>
            <% for(var k in info.bindingStyleMap) { %>
            <% if(k === info.cnBookPrintEntity.bindingStyle){ %>
            <option value='<%- k %>' selected><%- info.bindingStyleMap[k] %></option>
            <% }else{ %>
            <option value='<%- k %>'><%- info.bindingStyleMap[k] %></option>
            <% } %>
            <% } %>
            <% } %>
          </select>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面装订后处理</label>
        <div class="col-xs-8">
          <select name="usePaperBinding" class="form-control" title="封面装订后处理">
            <% if(info.coverBindHandleMap) { %>
            <% for(var k in info.coverBindHandleMap) { %>
            <% if(k === info.cnBookPrintEntity.usePaperBinding){ %>
            <option value='<%- k %>' selected><%- info.coverBindHandleMap[k] %></option>
            <% }else{ %>
            <option value='<%- k %>'><%- info.coverBindHandleMap[k] %></option>
            <% } %>
            <% } %>
            <% } %>
          </select>
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
            <input class="form-control" name="taskUsers" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>"
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.printNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">页数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.pageNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">印张</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.printSheet %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">成品尺寸（mm）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.finishedSize %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面用纸</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.coverGram %>克<%- info.cnBookPrintEntity.coverPaper %>纸</p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印刷色数</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.printColorMap) { %>
            <% for(var k in info.printColorMap) { %>
            <% if(k === info.cnBookPrintEntity.coverColor){ %>
            <%- info.printColorMap[k] %>
            <% } %>
            <% } %>
            <% } else { %>
            <%- info.cnBookPrintEntity.coverColor %>
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">环衬</label>
        <div class="col-xs-1">
          <p class="form-control-static"><%- info.cnBookPrintEntity.endPaper === '1' ? '前' : (info.cnBookPrintEntity.endPaper === '2' ? '后' : '') %></p>
        </div>
        <div class="col-xs-7">
          <p class="form-control-static"><%- info.cnBookPrintEntity.endPaperGram %>克<%- info.cnBookPrintEntity.endPaperNum %>纸</p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口</label>
        <div class="col-xs-1">
          <p class="form-control-static"><%- info.cnBookPrintEntity.flap === '1' ? '有' : (info.cnBookPrintEntity.flap === '2' ? '无' : '') %></p>
        </div>
        <div class="col-xs-7">
          <p class="form-control-static">尺寸（mm）<%- info.cnBookPrintEntity.flapSize %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文用纸</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.textPaperGram %>克<%- info.cnBookPrintEntity.textPaperNum %>纸</p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印刷色数</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.printColorMap) { %>
            <% for(var k in info.printColorMap) { %>
            <% if(k === info.cnBookPrintEntity.textPaperPrintColor){ %>
            <%- info.printColorMap[k] %>
            <% } %>
            <% } %>
            <% } else { %>
            <%- info.cnBookPrintEntity.textPaperPrintColor %>
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">彩插</label>
        <div class="col-xs-1">
          <p class="form-control-static"><%- info.cnBookPrintEntity.colorInsert === '1' ? '有' : (info.cnBookPrintEntity.colorInsert === '2' ? '无' : '') %></p>
        </div>
        <div class="col-xs-3">
          <p class="form-control-static">页数<%- info.cnBookPrintEntity.colorInsertNum %></p>
        </div>
        <div class="col-xs-4">
          <p class="form-control-static"><%- info.cnBookPrintEntity.colorInsertGram %>克<%- info.cnBookPrintEntity.colorInsertPaper %>纸</p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装订方式</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.bindingStyleMap) { %>
            <% for(var k in info.bindingStyleMap) { %>
            <% if(k === info.cnBookPrintEntity.bindingStyle){ %>
            <%- info.bindingStyleMap[k] %>
            <% } %>
            <% } %>
            <% } else { %>
            <%- info.cnBookPrintEntity.bindingStyle %>
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面装订后处理</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.coverBindHandleMap) { %>
            <% for(var k in info.coverBindHandleMap) { %>
            <% if(k === info.cnBookPrintEntity.usePaperBinding){ %>
            <%- info.coverBindHandleMap[k] %>
            <% } %>
            <% } %>
            <% } else { %>
            <%- info.cnBookPrintEntity.usePaperBinding %>
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.submitUserName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交时间</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnBookPrintEntity.submitDatetime %></p>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>