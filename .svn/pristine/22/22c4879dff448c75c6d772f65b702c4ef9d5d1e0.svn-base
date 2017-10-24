<!--成本预算-编校印制成本核算-->
<!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">组稿种类</label>
        <div class="col-xs-8">
          <select name="hPrintCostType" class="form-control" title="组稿种类">
            <% for(var k = 0, array = ['社组选', '市场书', '大字书']; k < array.length; k++) { %>
            <% if(k == info.cnPrintCostEntity.hPrintCostType){ %>
            <option value='<%- k %>' selected><%- array[k] %></option>
            <% }else{ %>
            <option value='<%- k %>'><%- array[k] %></option>
            <% } %>
            <% } %>
          </select>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">组稿数量</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.hPrintCostNum %>" name="hPrintCostNum" placeholder="组稿数量" pattern="^[1-9]\d{0,3}$" data-fv-regexp-message="请输入大于0的整数，最大4位"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4" style="width: 19%;">
      <div class="form-group">
        <label class="col-xs-7 control-label">一审 种类</label>
        <div class="col-xs-5" style="padding: 0;">
          <select name="firstType" class="form-control" title="一审种类">
            <% for(var k = 0, array = ['甲', '乙', '丙']; k < array.length; k++) { %>
            <% if(k == info.cnPrintCostEntity.firstType){ %>
            <option value='<%- k %>' selected><%- array[k] %></option>
            <% }else{ %>
            <option value='<%- k %>'><%- array[k] %></option>
            <% } %>
            <% } %>
          </select>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">A档工作量（千字）</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.firstAWorkload %>" name="firstAWorkload" placeholder="A档工作量（千字）" pattern="^(2000|(1?\d{0,3}(\.\d{1,3})?))$"
                 data-fv-regexp-message="请输入小于2000的数字,最大3位小数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">B档工作量（千字）</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.firstBWorkload %>" name="firstBWorkload" placeholder="B档工作量（千字）" pattern="^\d{0,4}(\.\d{1,3})?$"
                 data-fv-regexp-message="请输入0~9999的数字,最大3位小数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4" style="width: 19%;">
      <div class="form-group">
        <label class="col-xs-7 control-label">二审 种类</label>
        <div class="col-xs-5" style="padding: 0;">
          <select name="secondType" class="form-control" title="二审种类">
            <% for(var k = 0, array = ['甲', '乙', '丙']; k < array.length; k++) { %>
            <% if(k == info.cnPrintCostEntity.secondType){ %>
            <option value='<%- k %>' selected><%- array[k] %></option>
            <% }else{ %>
            <option value='<%- k %>'><%- array[k] %></option>
            <% } %>
            <% } %>
          </select>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">A档工作量（千字）</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.secondAWorkload %>" name="secondAWorkload" placeholder="A档工作量（千字）" pattern="^(2000|(1?\d{0,3}(\.\d{1,3})?))$"
                 data-fv-regexp-message="请输入小于2000的数字,最大3位小数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">B档工作量（千字）</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.secondBWorkload %>" name="secondBWorkload" placeholder="B档工作量（千字）" pattern="^\d{0,4}(\.\d{1,3})?$"
                 data-fv-regexp-message="请输入0~9999的数字,最大3位小数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4" style="width: 19%;">
      <div class="form-group">
        <label class="col-xs-7 control-label">三审</label>
        <div class="col-xs-5"></div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">A档工作量（千字）</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.thirdAWorkload %>" name="thirdAWorkload" placeholder="A档工作量（千字）" pattern="^(2000|(1?\d{0,3}(\.\d{1,3})?))$"
                 data-fv-regexp-message="请输入小于2000的数字,最大3位小数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">B档工作量（千字）</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.thirdBWorkload %>" name="thirdBWorkload" placeholder="B档工作量（千字）" pattern="^\d{0,4}(\.\d{1,3})?$"
                 data-fv-regexp-message="请输入0~9999的数字,最大3位小数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4" style="width: 19%;">
      <div class="form-group">
        <label class="col-xs-7 control-label">封面设计工作量</label>
        <div class="col-xs-5"></div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">A档工作量（元/种）</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.aCoverWorkload %>" name="aCoverWorkload" placeholder="A档工作量（元/种）" pattern="^\d{0,5}(\.\d{1,2})?$"
                 data-fv-regexp-message="请输入0~99999的数字,最大2三位小数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">B档工作量（元/种）</label>
        <div class="col-xs-8">
          <input class="form-control" value="<%- info.cnPrintCostEntity.bCoverWorkload %>" name="bCoverWorkload" placeholder="B档工作量（元/种）" pattern="^\d{0,5}(\.\d{1,2})?$"
                 data-fv-regexp-message="请输入0~99999的数字,最大2三位小数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-5 control-label">质检工作量（千字）</label>
        <div class="col-xs-7">
          <input class="form-control" value="<%- info.cnPrintCostEntity.checkWorkload %>" name="checkWorkload" placeholder="质检工作量（千字）" pattern="^\d{0,4}(\.\d{1,3})?$"
                 data-fv-regexp-message="请输入0~9999的数字,最大3位小数"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-5 control-label">编务费数量</label>
        <div class="col-xs-7">
          <input class="form-control" value="<%- info.cnPrintCostEntity.editingAffairsNum %>" name="editingAffairsNum" placeholder="编务费数量" pattern="^\d{0,5}(\.\d{1,2})?$"
                 data-fv-regexp-message="请输入0~99999的数字,最大2位小数"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-2 control-label">印制成本</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.cnPrintCostEntity.printCost %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-2 control-label">版税率</label>
        <div class="col-xs-10">
          <input class="form-control" value="<%- info.cnPrintCostEntity.royaltyRate %>" name="royaltyRate" placeholder="版税率" pattern="^0(\.([0-9]|[0-1][0-9]|2[0-4]))?$"
                 data-fv-regexp-message="请输入小于0.25的数字（最多2位小数）"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-2 control-label">定价</label>
        <div class="col-xs-10">
          <input class="form-control" value="<%- info.cnPrintCostEntity.price %>" name="price" title="定价" readonly/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-2 control-label">作者稿酬</label>
        <div class="col-xs-10">
          <input class="form-control" value="<%- info.cnPrintCostEntity.authorPayment %>" name="authorPayment" title="作者稿酬" readonly/>
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
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">组稿种类</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% for(var k = 0, array = ['社组选', '市场书', '大字书']; k < array.length; k++) { %>
            <% if(k == info.cnPrintCostEntity.hPrintCostType){ %>
            <%- array[k] %>
            <% } %>
            <% } %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="form-group">
        <label class="col-xs-4 control-label">组稿数量</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.hPrintCostNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4" style="width: 19%;">
      <div class="form-group">
        <label class="col-xs-7 control-label">一审 种类</label>
        <div class="col-xs-5" style="padding: 0;">
          <p class="form-control-static">
            <% for(var k = 0, array = ['甲', '乙', '丙']; k < array.length; k++) { %>
            <% if(k == info.cnPrintCostEntity.firstType){ %>
            <%- array[k] %>
            <% } %>
            <% } %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">A档工作量（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.firstAWorkload %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">B档工作量（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.firstBWorkload %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4" style="width: 19%;">
      <div class="form-group">
        <label class="col-xs-7 control-label">二审 种类</label>
        <div class="col-xs-5" style="padding: 0;">
          <p class="form-control-static">
            <% for(var k = 0, array = ['甲', '乙', '丙']; k < array.length; k++) { %>
            <% if(k == info.cnPrintCostEntity.secondType){ %>
            <%- array[k] %>
            <% } %>
            <% } %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">A档工作量（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.secondAWorkload %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">B档工作量（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.secondBWorkload %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4" style="width: 19%;">
      <div class="form-group">
        <label class="col-xs-7 control-label">三审</label>
        <div class="col-xs-5"></div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">A档工作量（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.thirdAWorkload %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">B档工作量（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.thirdBWorkload %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-4" style="width: 19%;">
      <div class="form-group">
        <label class="col-xs-7 control-label">封面设计工作量</label>
        <div class="col-xs-5"></div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">A档工作量（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.aCoverWorkload %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-4" style="width: 40.5%;">
      <div class="form-group">
        <label class="col-xs-4 control-label">B档工作量（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.bCoverWorkload %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-5 control-label">质检工作量（千字）</label>
        <div class="col-xs-7">
          <p class="form-control-static"><%- info.cnPrintCostEntity.checkWorkload %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-5 control-label">编务费数量</label>
        <div class="col-xs-7">
          <p class="form-control-static"><%- info.cnPrintCostEntity.editingAffairsNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-2 control-label">印制成本</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.cnPrintCostEntity.printCost %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-2 control-label">版税率</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.cnPrintCostEntity.royaltyRate %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-2 control-label">定价</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.cnPrintCostEntity.price %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-8">
      <div class="form-group">
        <label class="col-xs-2 control-label">作者稿酬</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.cnPrintCostEntity.authorPayment %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.submitUserName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交时间</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.cnPrintCostEntity.submitDatetime %></p>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>