<!--清样稿管理-图书印制单-->
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
        <label class="col-xs-4 control-label">图书类别</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookOnekind %></p>
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailAuthor %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">盲文书版次</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailEdition %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">最终盲文版数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.versionNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价</label>
        <div class="col-xs-8">
          <input name="bookPrice" class="form-control" value="<%- ((info.bookPrice * 100) * ([0.35, 0.4, 0.3, 0.2][info.bookPrintType ? (info.bookPrintType - 1) : 0] * 100) / 10000).toFixed(2) %>" title="定价" readonly>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价计算公式</label>
        <div class="col-xs-8">
          <select name="bookPrintType" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请选择定价计算公式" title="定价计算公式">
            <% if(!info.bookPrintType || info.bookPrintType === '1') { %>
            <option value='1' selected>文学、政治：0.35/版</option>
            <% } else { %>
            <option value='1'>文学、政治：0.35/版</option>
            <% } %>
            <% if(info.bookPrintType === '2') { %>
            <option value='2' selected>音乐：0.4/版</option>
            <% } else { %>
            <option value='2'>音乐：0.4/版</option>
            <% } %>
            <% if(info.bookPrintType === '3') { %>
            <option value='3' selected>医学：0.3/版</option>
            <% } else { %>
            <option value='3'>医学：0.3/版</option>
            <% } %>
            <% if(info.bookPrintType === '4') { %>
            <option value='4' selected>高中、大中专教材：0.2/版</option>
            <% } else { %>
            <option value='4'>高中、大中专教材：0.2/版</option>
            <% } %>
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书馆需要套数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.libraryNeedNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">读者服务部需要套数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.readersServiceneedNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">总印制套数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.totalPrintNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">总印张数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.totalPrintPaperNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.format %>" name="format" placeholder="开本" maxlength="30"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">用纸</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.usePaper %>" name="usePaper" placeholder="用纸" maxlength="30"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">编辑部门意见</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="mEdOpinion" placeholder="审核意见（最大1000字）" maxlength="1000"><%- info.mEdOpinion %></textarea>
          <div><label class="len">0/1000</label></div>
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
        <label class="col-xs-4 control-label">图书类别</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookOnekind %></p>
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailAuthor %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">盲文书版次</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailEdition %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">最终盲文版数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.versionNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookPrice * [0.35, 0.4, 0.3, 0.2][info.bookPrintType - 1] %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书馆需要套数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.libraryNeedNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">读者服务部需要套数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.readersServiceneedNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">总印制套数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.totalPrintNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">总印张数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.totalPrintPaperNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.format %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">用纸</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.usePaper %></p>
        </div>
      </div>
    </div>
    <!--<div class="col-xs-6">-->
    <!--<div class="form-group">-->
    <!--<label class="col-xs-4 control-label">出书时间</label>-->
    <!--<div class="col-xs-8">-->
    <!--<p class="form-control-static"><%- info.pubDate %></p>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">编辑部门意见</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.mEdOpinion %></p>
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