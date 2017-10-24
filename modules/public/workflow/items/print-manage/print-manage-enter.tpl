<!--另件付印单录入-->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
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
        <label class="col-xs-4 control-label">印件名称</label>
        <div class="col-xs-8">
        	<p class="form-control-static"><%- info.mAnotherPrintName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书馆</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.libraryNeedNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">读者服务部</label>
        <div class="col-xs-8">
        	<p class="form-control-static"><%- info.readersServiceneedNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">新/重</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.printState %>" name="newEditionWeight" readonly
                 placeholder="新/重" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">板块</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.plate %>" name="plate" placeholder="板块" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
  	<div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数<span class="c-red">*</span></label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.printNum %>" name="printNum"
                 placeholder="印数" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数"  data-fv-notempty="true" data-fv-notempty-message="请选择印数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印张</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.sheet %>" name="sheet" placeholder="印张" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本（毫米）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.format %>"
                 name="format" placeholder="开本（毫米）" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">书厚</label>
        <div class="col-xs-8">
          <input type="text " class="form-control" value="<%- info.bookThickness %>" name="bookThickness"
                 placeholder="书厚" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.flap %>"
                 name="flap" placeholder="勒口" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">用纸（克）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.usePaper %>"
                 name="usePaper" placeholder="用纸（克）" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">纸开正数（张）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.usePaperNum %>" name="usePaperNum"
                 placeholder="纸开正数（张）" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开放（张）</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.disparkPaper %>" name="disparkPaper"
                 placeholder="开放（张）" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装帧方式</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.bindingWay %>"
                 name="bindingWay" placeholder="装帧方式" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">纸切</label>
        <div class="col-xs-3">
          <input type="text" class="form-control" value="<%- info.sheetingOne %>"
                 name="sheetingOne" maxlength="32"/>
        </div>
        <label class="col-xs-1" style="line-height: 30px;">X</label>
        <div class="col-xs-3">
          <input type="text" class="form-control" value="<%- info.sheetingTwo %>"
                 name="sheetingTwo" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">封面工艺</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.coverCraft %>"
                 name="coverCraft" placeholder="封面工艺" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">照付印样</label>
        <div class="col-xs-2">
          <div class="input-group">
            <input type="text" class="form-control" name="sampleColour" value="<%- info.sampleColour %>"
                   placeholder="色" maxlength="32">
            <span class="input-group-addon">色</span>
          </div>
        </div>
        <div class="col-xs-2">
          <div class="input-group">
            <input type="text" class="form-control" name="sampleFace" value="<%- info.sampleFace %>" placeholder="面" maxlength="32">
            <span class="input-group-addon">面</span>
          </div>
        </div>
        <div class="col-xs-3">
          <div class="input-group">
            <input type="text" class="form-control" name="samplePrint" value="<%- info.samplePrint %>" placeholder="联印" maxlength="32">
            <span class="input-group-addon">联印</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">注意事项</label>
        <div class="col-xs-10">
          <textarea class="form-control" name="note" placeholder="注意事项（不超过1000字）" maxlength="1000"><%- info.note %></textarea>
          <div><label class="len">0/1000</label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row" data-type = "procedure">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-2 control-label">工序选择</label>
  			<div class="col-xs-10">
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId="engraving" data-flowName = "刻印" data-bookId = "<%- info.bookId %>" />刻印
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "cuttingEdge" data-flowName = "裁边" data-bookId = "<%- info.bookId %>" />裁边
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "plate" data-flowName = "制版" data-bookId = "<%- info.bookId %>" />制版
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "flatPrint" data-flowName = "平印" data-bookId = "<%- info.bookId %>" />平印
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "roundRobin" data-flowName = "轮转" data-bookId = "<%- info.bookId %>" />轮转
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "grabPage" data-flowName = "抓页" data-bookId = "<%- info.bookId %>" />抓页
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "folding" data-flowName = "折页" data-bookId = "<%- info.bookId %>" />折页
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "cableLine" data-flowName = "索线" data-bookId = "<%- info.bookId %>" />索线
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "checkThePage" data-flowName = "查页" data-bookId = "<%- info.bookId %>" />查页
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "binding" data-flowName = "装订" data-bookId = "<%- info.bookId %>" />装订
  				</label>
  				<label class="checkbox-inline">
  					<input type="checkbox" value="1" name="isUse" data-flowId = "bundleOfBooks" data-flowName = "捆书配套" data-bookId = "<%- info.bookId %>" />捆书配套
  				</label>
  				<label class="checkbox-inline">
  					<input type="hidden" value="1" name="isUse"  data-flowId = "printingConfirm" data-flowName = "印刷流程确认" data-bookId = "<%- info.bookId %>" />
  				</label>
  			</div>
  		</div>
  	</div>
  </div>
  <div class="row">  	
  	<div class="col-xs-6">
  		<div class="form-group">
  			<label class="col-xs-4 control-label">封面设计</label>
  			<div class="col-xs-8">
  				<label class="radio-inline">
            <% if(!info.deptChoose || info.deptChoose === '1') { %>
            <input type="radio" name="deptChoose" value="1"checked/>盲文印制部
            <% } else { %>
            <input type="radio" name="deptChoose" value="1"/>盲文印制部
            <% } %>
          </label>
          <label class="radio-inline">
            <% if(info.deptChoose === '2') { %>
            <input type="radio" name="deptChoose" value="2" checked/>出版部
            <% } else { %>
            <input type="radio" name="deptChoose" value="2"/>出版部
            <% } %>
          </label>
  			</div>
  		</div>
  	</div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" style="display: none;">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptNames) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
            <%- info.userTaskEntities[i].flowName %>（
            <%- info.userTaskEntities[i].deptNames %> -
            <%- info.userTaskEntities[i].roleNames %>）</p>
          <% } %>
          <input type="hidden" name="flowId" value="<%- info.userTaskEntities[i].flowId %>">
          <input type="hidden" name="flowName" value="<%- info.userTaskEntities[i].flowName %>">
          <input type="hidden" name="nextCategory" value="<%- info.userTaskEntities[i].category %>">
          <input type="hidden" name="deptIds" value="<%- info.userTaskEntities[i].deptIds %>">
          <input type="hidden" name="roleIds" value="<%- info.userTaskEntities[i].roleIds %>">
          <input type="hidden" name="taskId" value="<%- info.taskId %>">
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <% if(info.userTaskEntities[i].roleIds) { %>
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人<span class="c-red">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                   data-data="{searchRoleId: '', searchDepartmentId: ''}" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'>
              	<i class="fa fa-user-o"></i></button>
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
        <label class="col-xs-4 control-label">书号</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookIsbn %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印件名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mAnotherPrintName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书馆</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.libraryNeedNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">读者服务部</label>
        <div class="col-xs-8">
        	<p class="form-control-static"><%- info.readersServiceneedNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">新/重</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.newEditionWeight %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">板块</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.plate %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.printNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印张</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.sheet %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开本（毫米）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.format %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">书厚</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookThickness %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.flap %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">用纸（克）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.usePaper %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">纸张正数（张）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.usePaperNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">开放（张）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.disparkPaper %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">装帧方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bindingWay %></p>
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
        <label class="col-xs-4 control-label">封面工艺</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.coverCraft %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">照付印样</label>
        <div class="col-xs-2">
          <p class="form-control-static"><%- info.sampleColour %>色</p>
        </div>
        <div class="col-xs-2">
          <p class="form-control-static"><%- info.sampleFace %>面</p>
        </div>
        <div class="col-xs-2">
          <p class="form-control-static"><%- info.samplePrint %>联印</p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">注意事项</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.note %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-2 control-label">工序选择</label>
  			<div class="col-xs-10">
  				<p class="form-control-static">
  				<% for(var i = 0; i < info.listPrintingFlow.length; i++) { %>
  					<% if((info.listPrintingFlow[i].flowId !== 'printingConfirm') && (info.listPrintingFlow[i].flowId !=='publicationDeptDesignHeadIssued') && (info.listPrintingFlow[i].flowId !=='braillePrintDeptDesignLeaderIssued')) { %>
  					<%- info.listPrintingFlow[i].flowName %>
  					<% } %>
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