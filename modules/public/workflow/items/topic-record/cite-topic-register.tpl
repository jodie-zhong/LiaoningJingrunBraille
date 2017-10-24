<!--引用选题备案登记表-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-12" style="text-align: center;">引用选题备案登记表</label>
  		</div>
  	</div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作品名称(原文)<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group">
            <input type="text" class="form-control" name="bookName" value="<%- info.bookName %>" readonly
                   maxlength="64" placeholder="作品名称(原文)"/>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作品翻译名称</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.translateName %>" name="translateName"
                 placeholder="作品翻译名称" maxlength="64"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">拟中文出版名称</label>
        <div class="col-xs-8">
          <div class="input-group">
            <input type="text" class="form-control" name="planPublishName" value="<%- info.planPublishName %>"
                   maxlength="64" placeholder="拟中文出版名称"/>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">原作品出版日期</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.publishDatetime %>" name="publishDatetime"
                 placeholder="原书名称" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.author %>" name="author"
                 placeholder="作者" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">国籍</label>
        <div class="col-xs-8">
        	<select class="form-control" name="authorNationality" id="authorNationality"></select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">著作权人</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.copyrightUser %>"
                 name="copyrightUser" placeholder="著作权人" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">国籍</label>
        <div class="col-xs-8">
          <select class="form-control" name="copyrightUserNationality" id="copyrightUserNationality"></select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">著作权持有者</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.copyrightHolder %>"
                 name="copyrightHolder" placeholder="著作权持有者" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">国籍</label>
        <div class="col-xs-8">
          <select class="form-control" name="copyrightHolderNationality" id="copyrightHolderNationality"></select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">合同签订日期</label>
        <div class="col-xs-8">
          <input type="text" class="form-control date-time" value="<%- info.contractSignDate %>" name="contractSignDate"
                 placeholder="合同签订日期" maxlength="10"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">合同有效日期</label>
        <div class="col-xs-8">
          <input type="text" class="form-control date-time" value="<%- info.contractEffectiveDate %>"
                 name="contractEffectiveDate"
                 placeholder="合同有效日期" maxlength="10"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">授权内容</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.authorityScope %>"
                 name="authorityScope" placeholder="授权内容" maxlength="1024"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">发行范围</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.issuanceArea %>"
                 name="issuanceArea" placeholder="发行范围" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">付酬方式</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.paymentType %>"
                 name="paymentType" placeholder="付酬方式" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">付酬标准</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.paymentStandard %>"
                 name="paymentStandard" placeholder="付酬标准" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">支持币种</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.paymentCurrency %>"
                 name="paymentCurrency" placeholder="支持币种" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">最低印数</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.minPrint %>"
                 name="minPrint" placeholder="最低印数" maxlength="8" pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版权联系人</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.copyrightContact %>"
                 name="copyrightContact" placeholder="版权联系人" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.executiveEditor %>"
                 name="executiveEditor" placeholder="责任编辑" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" name="topicIntroduceFileId" value="<%- info.topicIntroduceFileId %>"/>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptNames) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %>（<%- info.userTaskEntities[i].deptAndRoles %>）</p>
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
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
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
          <div class="help-block with-errors"></div>
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
  <div class="dialog-options">
    <button class="btn btn-xs btn-default" id="printPage">打印</button>
  </div>
  <div class="row">
  	<div class="col-xs-12">
  		<div class="form-group">
  			<label class="col-xs-12" style="text-align: center;">引用选题备案登记表</label>
  		</div>
  	</div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作品名称(原文)</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作品翻译名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.translateName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">拟中文出版名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.planPublishName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6"></div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.author %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">国籍</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.authorNationalityName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">著作权人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.copyrightUser %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">国籍</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.copyrightUserNationalityName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">著作权持有人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.copyrightHolder %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group ">
        <label class="col-xs-4 control-label">国籍</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.copyrightHolderNationalityName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">原作品出版日期</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.publishDatetime %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">合同签订日期</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.contractSignDate %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">有效日期</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.contractEffectiveDate %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">授权内容</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.authorityScope %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">发行范围</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.issuanceArea %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">付酬方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.paymentType %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">付酬标准</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.paymentStandard %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">支付币种</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.paymentCurrency %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">最低印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.minPrint %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">版权联系人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.copyrightContact %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.executiveEditor %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row" style="display: none;">
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