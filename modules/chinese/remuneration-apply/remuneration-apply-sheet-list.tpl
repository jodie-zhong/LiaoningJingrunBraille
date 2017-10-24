<% if(info.onOff !=='2') { %>
<script type="text/template" id="rewardTemplateTop">
  <tr>
    <td data-value="number"></td>
    <td class="form-group"><input type="text" maxlength="32" name="authorName" class="form-control small"/></td>
    <td class="form-group"><input type="text" maxlength="32" name="openingBank" class="form-control small"/></td>
    <td class="form-group"><input type="text" pattern="^[0-9]*$" data-fv-regexp-message="请输入整数" maxlength="32" name="bankAccount"
                                  class="form-control small"/></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="prepayment"
                                  class="form-control small save-two"
                                  value="0.00"/></td>
    <td>
      <button class="btn btn-xs btn-success" data-addE="#rewardTemplateTop" data-type="plus"><i
              class="fa fa-plus box"></i></button>
      <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
    </td>
  </tr>
</script>
<script type="text/template" id="rewardTemplateMiddle">
  <tr class="rewardMiddle">
    <td class="form-group"><input type="text" maxlength="32" name="payProject" class="form-control small" value=""></td>
    <td class="form-group"><input type="text" maxlength="32" name="hourlyStandard" class="form-control small" value="">
    </td>
    <td class="form-group"><input type="text" name="wordsNum"
                                  pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$"
                                  data-fv-regexp-message="请输入小于10000的数字,允许三位小数" class="form-control small"
                                  value=""></td>
    <td class="form-group"><input type="text" maxlength="9" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数"
                                  name="printNum" class="form-control small" value=""></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="amountPayable"
                                  class="form-control small save-two lose-focus"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractReplaceTax"
                                  class="form-control small save-two lose-focus"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractAmountAdvanced"
                                  class="form-control small save-two lose-focus"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractBuyBook"
                                  class="form-control small save-two lose-focus"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractOther"
                                  class="form-control small save-two lose-focus"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="realPay"
                                  class="form-control small save-two lose-count" value="0.00"></td>
    <td>
      <button class="btn btn-xs btn-success" data-addE="#rewardTemplateMiddle" data-type="plus"><i
              class="fa fa-plus box"></i></button>
      <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
    </td>
  </tr>
</script>
<script type="text/template" id="rewardTemplateBottom">
  <tr class="rewardMiddle">
    <td class="form-group"><input type="text" maxlength="32" name="hRewardTaxName" class="form-control small" value="">
    </td>
    <td class="form-group"><input type="text" maxlength="18" name="hRewardTaxIdCard" class="form-control small"
                                  value=""></td>
    <td class="form-group"><input type="text" maxlength="32" name="hRewardTaxProject" class="form-control small"
                                  value=""></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxAmountPayable"
                                  class="form-control small save-two lose-inp"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxSubtractCost"
                                  class="form-control small save-two lose-inp"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxMoney"
                                  class="form-control small save-two count-inp-one"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxRate"
                                  class="form-control small save-two rate-inp"
                                  value="0.00"></td>
    <td class="form-group"><input type="text"
                                  pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                  data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxTeplaceMoney"
                                  class="form-control small save-two count-inp-two" value="0.00"></td>
    <td>
      <button class="btn btn-xs btn-success" data-addE="#rewardTemplateBottom" data-type="plus"><i
              class="fa fa-plus box"></i></button>
      <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
    </td>
  </tr>
</script>
<div class="row">
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">出版物名称</label>
      <div class="col-xs-8">
        <input type="text" class="form-control" value="<%- info.bookName %>" name="bookName"
               placeholder="出版物名称" readonly/>
        <input type="hidden" name="bookId" value="<%- info.bookId %>">
        <input type="hidden" name="hRewardId" value="<%- info.hRewardId %>">
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">选题号/ISBN</label>
      <div class="col-xs-8">
        <input type="text" class="form-control" value="<%- info.bookIsbn %>" name="bookIsbn"
               placeholder="选题号/ISBN" readonly/>
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
               placeholder="责任编辑" readonly/>
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">定价</label>
      <div class="col-xs-8">
        <input type="text" pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
               data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" class="form-control save-two"
               value="<%- info.hRewardPricing %>"
               name="hRewardPricing"
               placeholder="定价"/>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">本次印数</label>
      <div class="col-xs-8">
        <input type="text" class="form-control" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数"
               maxlength="9" value="<%- info.hRewardThisPrint %>"
               name="hRewardThisPrint"
               placeholder="本次印数"/>
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="form-group">
      <label class="col-xs-4 control-label">累计印数</label>
      <div class="col-xs-8">
        <input type="text" class="form-control" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" maxlength="9"
               value="<%- info.hRewardAddPrint %>"
               name="hRewardAddPrint"
               placeholder="累计印数"/>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <table class="table table-hover dataTable no-footer" id="tableEditableTop" role="grid"
         aria-describedby="table-editable_info">
    <thead>
    <tr>
      <th class="w-table">序号</th>
      <th style="width: 20%">作者</th>
      <th style="width: 20%">开户行</th>
      <th style="width: 20%">银行账号</th>
      <th style="width: 15%">预付金额</th>
      <th class="w-100"></th>
    </tr>
    </thead>
    <tbody>
    <% if(info.rewardAuthorEntities.length > 0) { %>
    <% for(var i = 0; i < info.rewardAuthorEntities.length; i++) { %>
    <tr>
      <td data-value="number"><%- (i + 1) %></td>
      <td class="form-group"><input type="text" maxlength="32" name="authorName" class="form-control small"
                                    value="<%- info.rewardAuthorEntities[i].authorName %>"></td>
      <td class="form-group">
        <input type="text"
               maxlength="32" name="openingBank" class="form-control small"
               value="<%- info.rewardAuthorEntities[i].openingBank %>">
      </td>
      <td class="form-group"><input type="text" maxlength="32" pattern="^[0-9]*$" data-fv-regexp-message="请输入整数" name="bankAccount"
                                    class="form-control small"
                                    value="<%- info.rewardAuthorEntities[i].bankAccount %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="prepayment"
                                    class="form-control small save-two"
                                    value="<%- info.rewardAuthorEntities[i].prepayment %>"></td>
      <td>
        <button class="btn btn-xs btn-success" data-addE="#rewardTemplateTop" data-type="plus"><i
                class="fa fa-plus box"></i></button>
        <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
      </td>
    </tr>
    <% } %>
    <% } else {%>
    <tr>
      <td data-value="number"> 1</td>
      <td class="form-group"><input type="text" maxlength="32"
                                    name="authorName" class="form-control small"/></td>
      <td class="form-group"><input type="text" maxlength="32" name="openingBank" class="form-control small"/></td>
      <td class="form-group"><input type="text" maxlength="32" pattern="^[0-9]*$" data-fv-regexp-message="请输入整数" name="bankAccount"
                                    class="form-control small"/></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="prepayment"
                                    class="form-control small save-two" value="0.00"/></td>
      <td>
        <button class="btn btn-xs btn-success" data-addE="#rewardTemplateTop" data-type="plus"><i
                class="fa fa-plus box"></i></button>
        <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
<div class="row">
  <table class="table table-hover dataTable no-footer" id="tableEditableMiddle" role="grid"
         aria-describedby="table-editable_info">
    <thead>
    <tr>
      <th>付筹项目</th>
      <th>计酬标准</th>
      <th>字数(千字)</th>
      <th>印数</th>
      <th>应付金额</th>
      <th>减代扣代缴税额</th>
      <th>减预付金额</th>
      <th>减购书款</th>
      <th>减其他</th>
      <th>实付金额</th>
      <th style="width: 100px"></th>
    </tr>
    </thead>
    <tbody>
    <% if(info.rewardDetailEntities.length > 0) { %>
    <% for(var j = 0; j < info.rewardDetailEntities.length; j++) { %>
    <tr class="rewardMiddle">
      <td class="form-group"><input type="text" maxlength="32" name="payProject" class="form-control small"
                                    value="<%- info.rewardDetailEntities[j].payProject %>"></td>
      <td class="form-group"><input type="text" maxlength="32" name="hourlyStandard"
                                    class="form-control small"
                                    value="<%- info.rewardDetailEntities[j].hourlyStandard %>"></td>
      <td class="form-group"><input type="text" name="wordsNum"
                                    pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$"
                                    data-fv-regexp-message="请输入小于10000的数字,允许三位小数" class="form-control small"
                                    value="<%- info.rewardDetailEntities[j].wordsNum %>"></td>
      <td class="form-group"><input type="text" maxlength="9" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数"
                                    name="printNum" class="form-control small"
                                    value="<%- info.rewardDetailEntities[j].printNum %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="amountPayable"
                                    class="form-control small save-two lose-focus"
                                    value="<%- info.rewardDetailEntities[j].amountPayable %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractReplaceTax"
                                    class="form-control small save-two lose-focus"
                                    value="<%- info.rewardDetailEntities[j].subtractReplaceTax %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractAmountAdvanced"
                                    class="form-control small save-two lose-focus"
                                    value="<%- info.rewardDetailEntities[j].subtractAmountAdvanced %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractBuyBook"
                                    class="form-control small save-two lose-focus"
                                    value="<%- info.rewardDetailEntities[j].subtractBuyBook %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractOther"
                                    class="form-control small save-two lose-focus"
                                    value="<%- info.rewardDetailEntities[j].subtractOther %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="realPay"
                                    class="form-control small save-two lose-count"
                                    value="<%- info.rewardDetailEntities[j].realPay %>"></td>
      <td>
        <button class="btn btn-xs btn-success" data-addE="#rewardTemplateMiddle" data-type="plus"><i
                class="fa fa-plus box"></i></button>
        <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
      </td>
    </tr>
    <% } %>
    <tr>
      <td colspan="2" class="text-center">实付报酬合计</td>
      <td colspan="2" class="text-center">人民币大写</td>
      <td colspan="2" class="form-group"><input type="text" maxlength="64" name="realCapitalCountPay"
                                                class="form-control small"
                                                value="<%- info.realCapitalCountPay %>" readonly></td>
      <td colspan="2" class="text-center">¥</td>
      <td colspan="3" class="form-group"><input type="text" maxlength="64" name="realCountPay"
                                                class="form-control small save-two"
                                                value="<%- info.realCountPay || '0.00' %>" readonly></td>
    </tr>
    <% } else { %>
    <tr class="rewardMiddle">
      <td class="form-group"><input type="text" maxlength="32" name="payProject" class="form-control small" value="">
      </td>
      <td class="form-group"><input type="text" maxlength="32" name="hourlyStandard"
                                    class="form-control small" value=""></td>
      <td
              class="form-group"><input type="text" name="wordsNum"
                                        pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$"
                                        data-fv-regexp-message="请输入小于10000的数字,允许三位小数" class="form-control small"
                                        value=""></td>
      <td
              class="form-group"><input type="text" maxlength="9" pattern="^[0-9]*$"
                                        data-fv-regexp-message="请输入大于0的整数" name="printNum" class="form-control small"
                                        value=""></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="amountPayable"
                                    class="form-control small save-two lose-focus lose-focus"
                                    value="0.00"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractReplaceTax"
                                    class="form-control small save-two lose-focus"
                                    value="0.00"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractAmountAdvanced"
                                    class="form-control small save-two lose-focus"
                                    value="0.00"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractBuyBook"
                                    class="form-control small save-two lose-focus"
                                    value="0.00"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="subtractOther"
                                    class="form-control small save-two lose-focus"
                                    value="0.00"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="realPay"
                                    class="form-control small save-two lose-count" value="0.00">
      </td>
      <td>
        <button class="btn btn-xs btn-success" data-type="plus"
                data-addE="#rewardTemplateMiddle"><i class="fa fa-plus box"></i></button>
        <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">实付报酬合计</td>
      <td colspan="2" class="text-center">人民币大写</td>
      <td colspan="2" class="form-group"><input type="text" maxlength="64" name="realCapitalCountPay"
                                                class="form-control small" value="零点零零" readonly></td>
      <td colspan="2" class="text-center">¥</td>
      <td colspan="3" class="form-group"><input type="text" maxlength="64" name="realCountPay"
                                                class="form-control small save-two" value="0.00"
                                                readonly></td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
<div class="row">
  <table class="table table-hover dataTable no-footer" id="tableEditableBottom" role="grid"
         aria-describedby="table-editable_info">
    <thead>
    <tr>
      <th>纳税人姓名</th>
      <th>身份证号</th>
      <th>纳税项目</th>
      <th>应付金额</th>
      <th>减除费用</th>
      <th>计税金额</th>
      <th>税率</th>
      <th>代扣代缴税额</th>
      <th style="width: 100px"></th>
    </tr>
    </thead>
    <tbody>
    <% if(info.rewardTaxEntities.length > 0) { %>
    <% for(var j = 0; j < info.rewardTaxEntities.length; j++) { %>
    <tr class="rewardMiddle">
      <td class="form-group"><input type="text" maxlength="32" name="hRewardTaxName" class="form-control small"
                                    value="<%- info.rewardTaxEntities[j].hRewardTaxName %>"></td>
      <td class="form-group"><input type="text" maxlength="18" name="hRewardTaxIdCard" class="form-control small"
                                    value="<%- info.rewardTaxEntities[j].hRewardTaxIdCard %>"></td>
      <td class="form-group"><input type="text" maxlength="32" name="hRewardTaxProject" class="form-control small"
                                    value="<%- info.rewardTaxEntities[j].hRewardTaxProject %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxAmountPayable"
                                    class="form-control small save-two lose-inp"
                                    value="<%- info.rewardTaxEntities[j].hRewardTaxAmountPayable %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxSubtractCost"
                                    class="form-control small save-two lose-inp"
                                    value="<%- info.rewardTaxEntities[j].hRewardTaxSubtractCost %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxMoney"
                                    class="form-control small save-two count-inp-one"
                                    value="<%- info.rewardTaxEntities[j].hRewardTaxMoney || '0.00' %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxRate"
                                    class="form-control small save-two"
                                    value="<%- info.rewardTaxEntities[j].hRewardTaxRate %>"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxTeplaceMoney"
                                    class="form-control small save-two count-inp-two"
                                    value="<%- info.rewardTaxEntities[j].hRewardTaxTeplaceMoney || '0.00'%>"
                                    ></td>
      <td>
        <button class="btn btn-xs btn-success" data-addE="#rewardTemplateBottom" data-type="plus"><i
                class="fa fa-plus box"></i></button>
        <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
      </td>
    </tr>
    <% } %>
    <tr>
      <td>备注</td>
      <td colspan="5" class="form-group"><input maxlength="1024" type="text" name="hRewardRemark" class="form-control small"
                                                value="<%- info.hRewardRemark  %>">
      </td>
      <td colspan="2" class="text-center">领款人签字</td>
      <td class="form-group"><input type="text" class="form-control small" value="" readonly></td>
    </tr>
    <% } else {%>
    <tr class="rewardMiddle">
      <td class="form-group"><input type="text" maxlength="32" name="hRewardTaxName" class="form-control small"
                                    value=""></td>
      <td class="form-group"><input type="text" maxlength="18" name="hRewardTaxIdCard" class="form-control small"
                                    value=""></td>
      <td class="form-group"><input type="text" maxlength="32" name="hRewardTaxProject" class="form-control small"
                                    value=""></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxAmountPayable"
                                    class="form-control small save-two lose-inp"
                                    value=""></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxSubtractCost"
                                    class="form-control small save-two lose-inp"
                                    value=""></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxMoney"
                                    class="form-control small save-two count-inp-one" value="0.00"></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxRate"
                                    class="form-control small save-two rate-inp"
                                    value=""></td>
      <td class="form-group"><input type="text"
                                    pattern="^(([1-9][0-9]{0,7})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,7}\.[0-9]{1,2}))$"
                                    data-fv-regexp-message="输入整数不超过8位且大于0的数(允许两位小数)" name="hRewardTaxTeplaceMoney"
                                    class="form-control small save-two count-inp-two"
                                    value="" ></td>
      <td>
        <button class="btn btn-xs btn-success" data-addE="#rewardTemplateBottom" data-type="plus"><i
                class="fa fa-plus box"></i></button>
        <button class="btn btn-xs btn-danger" data-type="minus"><i class="fa fa-close box"></i></button>
      </td>
    </tr>
    <tr>
      <td>备注</td>
      <td colspan="5" class="form-group"
      ><input maxlength="1024" type="text" class="form-control small" name="hRewardRemark" value="<%- info.hRewardRemark %>"></td>
      <td colspan="2" class="text-center">领款人签字</td>
      <td class="form-group text-center"><input type="text" class="form-control small" value="" readonly></td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
<div class="dialog-options">
  <button class="btn btn-default" id="btnSave">保存</button>
  <button class="btn btn-primary" id="btnSubmit">提交</button>
  <button class="btn btn-default" id="btnPrint">打印</button>
</div>
<% } else { %>
<div class="form-horizontal">
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
    <table class="table table-hover no-footer">
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
    <table class="table table-hover no-footer">
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
    <table class="table table-hover no-footer">
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
<div class="dialog-options">
  <button class="btn btn-default btnPrint">打印</button>
</div>
<% } %>