<!--图书排版-排版通知单-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
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
        <label class="col-xs-4 control-label">编室</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.editRoom %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书稿形式</label>
        <div class="col-xs-8">
          <select name="bookForm" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请选择印刷色数" title="印刷色数">
            <% if(info.bookForm === '2') { %>
            <option value='1'>书</option>
            <option value='2' selected>电子版</option>
            <option value='3'>手写稿</option>
            <% } else if(info.bookForm === '3') { %>
            <option value='1'>书</option>
            <option value='2'>电子版</option>
            <option value='3' selected>手写稿</option>
            <% } else { %>
            <option value='1' selected>书</option>
            <option value='2'>电子版</option>
            <option value='3'>手写稿</option>
            <% } %>
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数（千字）<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.wordsNum %>" name="wordsNum" placeholder="字数（千字）" data-fv-notempty="true" data-fv-notempty-message="请填写字数（千字）"
                 pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入小于10000的数字,允许三位小数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文用纸（g）<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.textPaper %>" name="textPaper" placeholder="正文用纸（g）" maxlength="16" data-fv-notempty="true" data-fv-notempty-message="请填写正文用纸（g）"
                 pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">成品尺寸（mm）<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.finishedSize %>" name="finishedSize" placeholder="成品尺寸（mm）" maxlength="16" data-fv-notempty="true" data-fv-notempty-message="请填写成品尺寸（mm）"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版心尺寸（mm）<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.typeAreaSize %>" name="typeAreaSize" placeholder="版心尺寸（mm）" maxlength="16" data-fv-notempty="true" data-fv-notempty-message="请填写版心尺寸（mm）"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">每页行数<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.paperLineNum %>" name="paperLineNum" placeholder="每页行数" maxlength="8" data-fv-notempty="true" data-fv-notempty-message="请填写每页行数"
                 pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">每行字数<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.lineWordsNum %>" name="lineWordsNum" placeholder="每行字数" maxlength="8" data-fv-notempty="true" data-fv-notempty-message="请填写每行字数"
                 pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文字号<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.textWordSize %>" name="textWordSize" placeholder="正文字号" maxlength="16" data-fv-notempty="true" data-fv-notempty-message="请填写正文字号"
                 pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文字体<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.textFace %>" name="textFace" placeholder="正文字体" maxlength="16" data-fv-notempty="true" data-fv-notempty-message="请填写正文字体"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印刷色数</label>
        <div class="col-xs-8">
          <select name="printingColorNum" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请选择印刷色数" title="印刷色数">
            <% if(info.printingColorNum === '2') { %>
            <option value='1'>单黑</option>
            <option value='2' selected>两色</option>
            <option value='3'>四色</option>
            <% } else if(info.printingColorNum === '3') { %>
            <option value='1'>单黑</option>
            <option value='2'>两色</option>
            <option value='3' selected>四色</option>
            <% } else { %>
            <option value='1' selected>单黑</option>
            <option value='2'>两色</option>
            <option value='3'>四色</option>
            <% } %>
          </select>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装订方式</label>
        <div class="col-xs-8">
          <select name="bindingWay" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请选择装订方式" title="装订方式">
            <% if(info.bindingWay === '2') { %>
            <option value='1'>骑马钉</option>
            <option value='2' selected>胶钉</option>
            <option value='3'>折页</option>
            <% } else if(info.bindingWay === '3') { %>
            <option value='1'>骑马钉</option>
            <option value='2'>胶钉</option>
            <option value='3' selected>折页</option>
            <% } else { %>
            <option value='1' selected>骑马钉</option>
            <option value='2'>胶钉</option>
            <option value='3'>折页</option>
            <% } %>
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">排版顺序<span class="must">*</span></label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.typesettingOrder %>" name="typesettingOrder" placeholder="排版顺序" maxlength="16" data-fv-notempty="true" data-fv-notempty-message="请填写排版顺序"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">电子书稿<span class="must">*</span></label>
        <div class="col-xs-10">
          <div class="input-group with-clear">
            <% if(info.bookFileEntity) { %>
            <input style="margin-right: 7px;" class="form-control uploadFile" name="bookPath" value="<%- info.bookFileEntity.hBookFileName %>" placeholder="请选择文件" data-fv-notempty="true"
                   data-fv-notempty-message="请选择文件" data-file="bookFileName" data-value="<%- info.bookFileEntity.bookPath %>" readonly>
            <% } else { %>
            <input style="margin-right: 7px;" class="form-control uploadFile" name="bookPath" placeholder="请选择文件" data-fv-notempty="true" data-fv-notempty-message="请选择文件" data-file="bookFileName"
                   readonly>
            <% } %>
            <span class="input-group-btn" style="width: auto;">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button style="padding-left: 14px;" class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*.doc;*.docx;*.pdf"}'>
                <i class="fa fa-file-o"></i>
              </button>
            </span>
            <% if(info.bookFileEntity && info.bookFileEntity.bookPath) { %>
            <button style="margin: -25px 0 0 0;" class="btn btn-xs btn-default downloadFile" data-download-address="<%- info.bookFileEntity.bookPath %>">下载</button>
            <button style="margin: -25px 0 0 5px;" class="btn btn-xs btn-default preview" data-download-address="<%- info.bookFileEntity.bookPath %>">预览</button>
            <% } else { %>
            <button style="margin: -25px 0 0 0;" class="btn btn-xs btn-default downloadFile" disabled>下载</button>
            <button style="margin: -25px 0 0 5px;" class="btn btn-xs btn-default preview" disabled>预览</button>
            <% } %>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">排版设计要求</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="layoutDesigner" placeholder="排版设计要求（最大1024字）" maxlength="1024"><%- info.layoutDesigner %></textarea>
          <div><label class="len">0/1024</label></div>
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
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
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
        <label class="col-xs-4 control-label">编室</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.editRoom %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书稿形式</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.bookForm === '1') { %>
            书
            <% } else if(info.bookForm === '2') { %>
            电子版
            <% } else if(info.bookForm === '3') { %>
            手写稿
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.wordsNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文用纸（g）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.textPaper %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">成品尺寸（mm）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.finishedSize %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版心尺寸（mm）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.typeAreaSize %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">每页行数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.paperLineNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">每行字数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.lineWordsNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文字号</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.textWordSize %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">正文字体</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.textFace %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印刷色数</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.printingColorNum === '2') { %>
            两色
            <% } else if(info.printingColorNum === '3') { %>
            四色
            <% } else { %>
            单黑
            <% } %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装订方式</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.bindingWay === '2') { %>
            胶钉
            <% } else if(info.bindingWay === '3') { %>
            折页
            <% } else { %>
            骑马钉
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">排版顺序</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.typesettingOrder %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">电子书稿</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(info.bookFileEntity) { %>
            <%- info.bookFileEntity.hBookFileName %>
            <% if(info.bookFileEntity.bookPath) { %>
            <button style="margin: 0;" class="btn btn-xs btn-default downloadFile" data-download-address="<%- info.bookFileEntity.bookPath %>">下载</button>
            <button style="margin: 0 0 0 5px;" class="btn btn-xs btn-default preview" data-download-address="<%- info.bookFileEntity.bookPath %>">预览</button>
            <% } else { %>
            <button style="margin: 0;" class="btn btn-xs btn-default downloadFile">下载</button>
            <button style="margin: 0 0 0 5px;" class="btn btn-xs btn-default preview">预览</button>
            <% } %>
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">排版设计要求</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.layoutDesigner %></p>
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