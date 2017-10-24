<div class="form-horizontal" style="background: url('../../../img/watermark.png') repeat">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版物名称</label>
        <p class="form-control-static"><%- info.bookName %></p>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">选题号/ISBN</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookIsbn %></p>
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
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">定价</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.hRewardPricing %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">本次印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.hRewardThisPrint %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">累计印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.hRewardAddPrint %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <table class="table table-hover no-footer" id="tableEditableTop">
      <thead>
      <tr>
        <th style="width: 10%" class="text-center">序号</th>
        <th style="width: 30%">作者</th>
        <th style="width: 25%">开户行</th>
        <th style="width: 20%">银行账号</th>
        <th style="width: 15%">预付金额</th>
      </tr>
      </thead>
      <tbody>
      <% if(info.rewardAuthorEntities.length > 0) { %>
      <% for(var i = 0; i < info.rewardAuthorEntities.length; i++) { %>
      <tr>
        <td class="text-center"><%- (i + 1) %></td>
        <td><%- info.rewardAuthorEntities[i].authorName %></td>
        <td><%- info.rewardAuthorEntities[i].openingBank %></td>
        <td><%- info.rewardAuthorEntities[i].bankAccount %></td>
        <td><%- info.rewardAuthorEntities[i].prepayment %></td>
      </tr>
      <% } %>
      <% } else {%>
      <tr data-noselect="true">
        <td colspan="5"><p class="empty-tips">没有符合指定条件的数据</p></td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
  <div class="row">
    <table class="table table-hover no-footer" id="tableEditableMiddle">
      <thead>
      <tr>
        <th class="text-center">付筹项目</th>
        <th>计酬标准</th>
        <th>字数(千字)</th>
        <th>印数</th>
        <th>应付金额</th>
        <th>减代扣代缴税额</th>
        <th>减预付金额</th>
        <th>减购书款</th>
        <th>减其他</th>
        <th>实付金额</th>
      </tr>
      </thead>
      <tbody>
      <% if(info.rewardDetailEntities.length > 0) { %>
      <% for(var j = 0; j < info.rewardDetailEntities.length; j++) { %>
      <tr>
        <td class="text-center"><%- info.rewardDetailEntities[j].payProject %></td>
        <td><%- info.rewardDetailEntities[j].hourlyStandard %></td>
        <td><%- info.rewardDetailEntities[j].wordsNum %></td>
        <td><%- info.rewardDetailEntities[j].printNum %></td>
        <td><%- info.rewardDetailEntities[j].amountPayable %></td>
        <td><%- info.rewardDetailEntities[j].subtractReplaceTax %></td>
        <td><%- info.rewardDetailEntities[j].subtractAmountAdvanced %></td>
        <td><%- info.rewardDetailEntities[j].subtractBuyBook %></td>
        <td><%- info.rewardDetailEntities[j].subtractOther %></td>
        <td><%- info.rewardDetailEntities[j].realPay %></td>
      </tr>
      <% } %>
      <tr>
        <td colspan="2" class="text-center">实付报酬合计</td>
        <td class="text-center">人民币大写</td>
        <td colspan="3"><%- info.realCapitalCountPay %></td>
        <td colspan="2" class="text-center">¥</td>
        <td colspan="3"><%- info.realCountPay || '0.00' %></td>
      </tr>
      <% } else { %>
      <tr data-noselect="true">
        <td colspan="10"><p class="empty-tips">没有符合指定条件的数据</p></td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
  <div class="row">
    <table class="table table-hover no-footer" id="tableEditableBottom">
      <thead>
      <tr>
        <th class="text-center">纳税人姓名</th>
        <th>身份证号</th>
        <th>纳税项目</th>
        <th>应付金额</th>
        <th>减除费用</th>
        <th>计税金额</th>
        <th>税率</th>
        <th>代扣代缴税额</th>
      </tr>
      </thead>
      <tbody>
      <% if(info.rewardTaxEntities.length > 0) { %>
      <% for(var j = 0; j < info.rewardTaxEntities.length; j++) { %>
      <tr>
        <td class="text-center"><%- info.rewardTaxEntities[j].hRewardTaxName %></td>
        <td><%- info.rewardTaxEntities[j].hRewardTaxIdCard %></td>
        <td><%- info.rewardTaxEntities[j].hRewardTaxProject %></td>
        <td><%- info.rewardTaxEntities[j].hRewardTaxAmountPayable %></td>
        <td><%- info.rewardTaxEntities[j].hRewardTaxSubtractCost %></td>
        <td><%- info.rewardTaxEntities[j].hRewardTaxMoney %></td>
        <td><%- info.rewardTaxEntities[j].hRewardTaxRate %></td>
        <td><%- info.rewardTaxEntities[j].hRewardTaxTeplaceMoney %></td>
      </tr>
      <% } %>
      <tr>
        <td class="text-center">备注</td>
        <td colspan="3" class="text-center"><%- info.hRewardRemark %></td>
        <td colspan="2" class="text-center">领款人签字</td>
        <td colspan="3" class="text-center"></td>
      </tr>
      <% } else {%>
      <tr data-noselect="true">
        <td colspan="9"><p class="empty-tips">没有符合指定条件的数据</p></td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>