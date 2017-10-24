<!--印前质检-质检-->
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
          <p class="form-control-static"><%- info.bookDetailDutyEditorName %></p>
        </div>
      </div>
    </div>
  </div>
  <!---------------------------------------------------------------------------------------------编辑状态--------------------------------------------------------------------------------------------->
  <% if(isEdit) { %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">任务操作</label>
        <div class="col-xs-10">
          <% if(info.handleState === '2') { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1"/>接受任务</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2" checked/>拒绝任务</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="3"/>待定</label>
          <% } else if(info.handleState === '3') { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1"/>接受任务</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>拒绝任务</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="3" checked/>待定</label>
          <% } else { %>
          <label class="radio-inline"><input type="radio" name="handleState" value="1" checked/>接受任务</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="2"/>拒绝任务</label>
          <label class="radio-inline"><input type="radio" name="handleState" value="3"/>待定</label>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div name="editArea">
    <div class="row">
      <div class="col-xs-12">
        <div class="form-group">
          <label class="col-xs-2 control-label">正误表</label>
          <div class="col-xs-10 form-compact">
            <table class="table table-striped table-hover table-nowrap">
              <thead>
              <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 90px;">页码<span class="must-td">*</span></th>
                <th style="width: 90px;">行<span class="must-td">*</span></th>
                <th>误<span class="must-td">*</span></th>
                <th>正<span class="must-td">*</span></th>
                <th>备注</th>
                <!--<th>扣分</th>-->
                <th style="width: 50px;">
                  <button class="addTableRow btn btn-xs btn-default"><i class="fa fa-plus box"></i></button>
                </th>
              </tr>
              </thead>
              <tbody id="dataTBody">

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-6">
        <div class="form-group">
          <label class="col-xs-4 control-label">全书字数（千字）<span class="must">*</span></label>
          <div class="col-xs-8">
            <input class="form-control" value="<%- info.bookWordsNum %>" name="bookWordsNum" placeholder="全书字数（千字）" data-fv-notempty="true" data-fv-notempty-message="请填写全书字数（千字）"
                   pattern="^\d{0,4}(\.\d{1,3})?$" data-fv-regexp-message="请输入0~9999的数字,最大3位小数"/>
          </div>
        </div>
      </div>
      <div class="col-xs-6">
        <div class="form-group">
          <label class="col-xs-4 control-label">质检字数（千字）<span class="must">*</span></label>
          <div class="col-xs-8">
            <input class="form-control" value="<%- info.hAcWordsNum %>" name="hAcWordsNum" placeholder="质检字数（千字）" data-fv-notempty="true" data-fv-notempty-message="请填写质检字数（千字）"
                   pattern="^\d{0,4}(\.\d{1,3})?$" data-fv-regexp-message="请输入0~9999的数字,最大3位小数"/>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-6">
        <div class="form-group">
          <label class="col-xs-4 control-label">质检页码<span class="must">*</span></label>
          <div class="col-xs-8">
            <input class="form-control" value="<%- info.hAcPageNum %>" name="hAcPageNum" placeholder="质检页码" pattern="^[1-9]\d{0,3}$" data-fv-regexp-message="请输入大于0的整数，最大4位"
                   data-fv-notempty="true" data-fv-notempty-message="请填写质检页码"/>
          </div>
        </div>
      </div>
      <div class="col-xs-6">
        <div class="form-group">
          <label class="col-xs-4 control-label">差错数</label>
          <div class="col-xs-8">
            <input class="form-control" value="<%- info.hAcErrorNumber %>" name="hAcErrorNumber" title="<%- info.hAcErrorNumber %>" readonly/>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-6">
        <div class="form-group">
          <label class="col-xs-4 control-label">差错率</label>
          <div class="col-xs-8">
            <input class="form-control" value="<%- info.hAcErrorRate %>" name="hAcErrorRate" title="<%- info.hAcErrorRate %>" readonly/>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <div class="form-group">
          <label class="col-xs-2 control-label">质检结果</label>
          <div class="col-xs-10">
            <% if(info.isQualified === '2') { %>
            <label class="radio-inline"><input type="radio" name="isQualified" value="1"/>合格</label>
            <label class="radio-inline"><input type="radio" name="isQualified" value="2" checked/>不合格</label>
            <% } else { %>
            <label class="radio-inline"><input type="radio" name="isQualified" value="1" checked/>合格</label>
            <label class="radio-inline"><input type="radio" name="isQualified" value="2"/>不合格</label>
            <% } %>
          </div>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
  <div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-index="<%- i %>" data-area="nextFlow" style="display: none;">
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
      <!--拒绝不选人-->
      <% if(i === 2) { %>
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人</label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <p class="form-control-static"><%- info.cnNoPassEntity.userName %></p>
            <input type="hidden" name="taskUsers" value="<%- info.cnNoPassEntity.userName %>" data-value="<%- info.cnNoPassEntity.userId %>" title="">
          </div>
        </div>
      </div>
      <% } else { %>
      <!--其他正常选人-->
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
      <% } %>
    </div>
  </div>
  <% } %>
  <% } %>
  <!---------------------------------------------------------------------------------------------查看状态--------------------------------------------------------------------------------------------->
  <% } else { %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">任务操作</label>
        <div class="col-xs-10">
          <p class="form-control-static">
            <% if(info.handleState === '1') { %>
            接受任务
            <% } else if(info.handleState === '2') { %>
            拒绝任务
            <% } else if(info.handleState === '3') { %>
            待定
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <% if(info.handleState === '1') { %>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">勘误表</label>
        <div class="col-xs-10">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 80px;">页码</th>
              <th style="width: 80px;">行</th>
              <th>误</th>
              <th>正</th>
              <th>备注</th>
              <!--<th>扣分</th>-->
            </tr>
            </thead>
            <tbody>
            <% if(info.rightWrongList) { %>
            <% for(var i = 0; i < info.rightWrongList.length; i++) { %>
            <tr data-fascicule-id="<%- info.rightWrongList[i].bookFascicleId %>">
              <td><%- (i + 1) %></td>
              <td><%- info.rightWrongList[i].page %></td>
              <td><%- info.rightWrongList[i].line %></td>
              <td title="<%- info.rightWrongList[i].wrongInformation %>"><%- info.rightWrongList[i].wrongInformation %></td>
              <td title="<%- info.rightWrongList[i].rigthInformation %>"><%- info.rightWrongList[i].rigthInformation %></td>
              <td title="<%- info.rightWrongList[i].remarks %>"><%- info.rightWrongList[i].remarks %></td>
              <!--<td title="<%- info.rightWrongList[i].deductMarks %>"><%- info.rightWrongList[i].deductMarks %></td>-->
            </tr>
            <% } %>
            <% } %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">全书字数（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookWordsNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">质检字数（千字）</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.hAcWordsNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">质检页码</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.hAcPageNum %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">差错数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.hAcErrorNumber %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">差错率</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.hAcErrorRate %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">质检结果</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.isQualified === '1' ? '合格' : (info.isQualified === '2' ? '不合格' : '') %></p>
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
  <% } %>
  <% } %>
</div>