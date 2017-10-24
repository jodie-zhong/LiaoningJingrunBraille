<!--译校通读-任务分配-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header">
        <h3><i class="fa fa-user-o"></i>任务分配</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formDiv">
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">图书名称</label>
                <div class="col-xs-8">
                  <p class="form-control-static"><%- info.bookName %></p>
                </div>
              </div>
            </div>
            <% if(info.userTaskEntities && info.userTaskEntities.length > 0){ %>
            <div class="col-xs-6">
              <div class="form-group">
                <!--只有一条数据不让选择-->
                <% if(info.userTaskEntities && info.userTaskEntities.length === 1) { %>
                <label class="col-xs-4 control-label">任务阶段</label>
                <div class="col-xs-8">
                  <p class="form-control-static"><%- info.userTaskEntities[0].tprFlowName %></p>
                </div>
                <!--多条数据要选择-->
                <% } else if(info.userTaskEntities && info.userTaskEntities.length > 1) { %>
                <label class="col-xs-4 control-label">任务阶段<span class="must">*</span></label>
                <div class="col-xs-8">
                  <select name="flowId" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请选择任务阶段" title="任务阶段">
                    <% for(var i = 0; i < info.userTaskEntities.length; i++){ %>
                    <% if(info.userTaskEntities[i].flowId === info.nextTaskFlowInfoEntity.flowId) { %>
                    <option value="<%- info.userTaskEntities[i].flowId %>" selected><%- info.userTaskEntities[i].tprFlowName %></option>
                    <% } else { %>
                    <option value="<%- info.userTaskEntities[i].flowId %>"><%- info.userTaskEntities[i].tprFlowName %></option>
                    <% } %>
                    <% } %>
                  </select>
                </div>
                <% } %>
              </div>
            </div>
            <% } %>
          </div>
          <!--选择印前质检时显示正常流程里的下一流程和任务人-->
          <div data-area="qcArea" style="display: none;">
            <% if(info.userTaskEntities && info.userTaskEntities.length > 0){ %>
            <% for(var i = 0; i < info.userTaskEntities.length; i++){ %>
            <% if(info.userTaskEntities[i].flowId === 'qualityTestCollect') { %>
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="col-xs-4 control-label">下一流程</label>
                  <div class="col-xs-8">
                    <% if(!info.userTaskEntities[i].deptAndRoles) { %>
                    <p class="form-control-static"><%- info.userTaskEntities[i].tprFlowName %></p>
                    <% } else { %>
                    <p class="form-control-static">
                      <!--<%- info.userTaskEntities[i].tprFlowName %>（-->
                      <!--<%- info.userTaskEntities[i].deptNames %> - -->
                      <!--<%- info.userTaskEntities[i].roleNames %>）-->
                      <%- info.userTaskEntities[i].tprFlowName %>（<%- info.userTaskEntities[i].deptAndRoles %>）
                    </p>
                    <% } %>
                  </div>
                </div>
              </div>
              <div class="col-xs-6">
                <% if(info.userTaskEntities[i].roleIds) { %>
                <div class="form-group">
                  <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
                  <div class="col-xs-8">
                    <div class="input-group with-clear">
                      <input class="form-control" name="taskUsersQc" value="<%- info.nextTaskFlowInfoEntity.nextFlowTaskUserNames %>"
                             data-value="<%- info.nextTaskFlowInfoEntity.nextFlowTaskUserIds %>" placeholder="任务人" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人"
                             title="<%- info.nextTaskFlowInfoEntity.nextFlowTaskUserNames %>" readonly>
                      <span class="input-group-btn">
                        <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                        <button class="btn btn-default" type="button" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'
                                data-open="public/user/select-users">
                          <i class="fa fa-user-o"></i>
                        </button>
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
            <% } %>
          </div>
          <!--选择非印前质检时显示任务分配的界面-->
          <div data-area="taskArea" style="display: none;">
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="col-xs-4 control-label">任务类型</label>
                  <div class="col-xs-8">
                    <% if(info.tprTaskType === '2') { %>
                    <label class="radio-inline"><input type="radio" name="tprTaskType" value="1"/>指定</label>
                    <label class="radio-inline"><input type="radio" name="tprTaskType" value="2" checked/>众包</label>
                    <% } else { %>
                    <label class="radio-inline"><input type="radio" name="tprTaskType" value="1" checked/>指定</label>
                    <label class="radio-inline"><input type="radio" name="tprTaskType" value="2"/>众包</label>
                    <% } %>
                  </div>
                </div>
              </div>
              <div class="col-xs-6">
                <!--众包时显示任务数量-->
                <div class="form-group" data-area="inputCount" style="display: none;">
                  <label class="col-xs-4 control-label">任务数量<span class="must">*</span></label>
                  <div class="col-xs-8">
                    <input class="form-control" name="tprTaskUseCount" value="<%- info.tprTaskUseCount %>" maxlength="5" placeholder="任务数量" pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数"
                           data-fv-notempty="true" data-fv-notempty-message="请选择填写任务数量">
                  </div>
                </div>
                <!--指定时显示任务人-->
                <div class="form-group" data-area="selectUsers" style="display: none;">
                  <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
                  <div class="col-xs-8">
                    <div class="input-group with-clear">
                      <input class="form-control" name="taskUsersTk" value="<%- info.nextTaskFlowInfoEntity.nextFlowTaskUserNames %>"
                             data-value="<%- info.nextTaskFlowInfoEntity.nextFlowTaskUserIds %>" placeholder="任务人" data-data="{searchRoleId: '', searchDepartmentId: ''}" data-fv-notempty="true"
                             data-fv-notempty-message="请选择下一任务人" title="<%- info.nextTaskFlowInfoEntity.nextFlowTaskUserNames %>" readonly>
                      <span class="input-group-btn">
                      <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                      <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data="{}"><i class="fa fa-user-o"></i></button>
                    </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-6">
                <label class="col-xs-4 control-label">版心字数<span class="must">*</span></label>
                <div class="col-xs-3" style="margin-left: 10px;">
                  <div class="form-group">
                    <input class="form-control" value="<%- info.auditCenterWordOne %>" name="auditCenterWordOne" placeholder="版心字数" maxlength="2" data-fv-notempty="true"
                           data-fv-notempty-message="请填写版心字数" pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
                  </div>
                </div>
                <div class="col-xs-1" style="margin-top: 7px;">X</div>
                <div class="col-xs-3">
                  <div class="form-group">
                    <input class="form-control" value="<%- info.auditCenterWordTwo %>" name="auditCenterWordTwo" placeholder="版心字数" maxlength="2" data-fv-notempty="true"
                           data-fv-notempty-message="请填写版心字数" pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数"/>
                  </div>
                </div>
              </div>
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="col-xs-4 control-label">种别</label>
                  <div class="col-xs-8">
                    <select name="auditType" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请选择种别" title="种别">
                      <% if(info.auditType === '1') { %>
                      <option value='1' selected>甲</option>
                      <% } else { %>
                      <option value='1'>甲</option>
                      <% } %>
                      <% if(info.auditType === '2') { %>
                      <option value='2' selected>乙</option>
                      <% } else { %>
                      <option value='2'>乙</option>
                      <% } %>
                      <% if(info.auditType === '3') { %>
                      <option value='3' selected>丙</option>
                      <% } else { %>
                      <option value='3'>丙</option>
                      <% } %>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="col-xs-4 control-label">工种</label>
                  <div class="col-xs-8">
                    <select name="auditWorkway" class="form-control" data-fv-notempty="true" data-fv-notempty-message="请选择工种" title="工种">
                      <% if(info.auditWorkway === '1') { %>
                      <option value='1' selected>录入</option>
                      <% } else { %>
                      <option value='1'>录入</option>
                      <% } %>
                      <% if(info.auditWorkway === '2') { %>
                      <option value='2' selected>转换</option>
                      <% } else { %>
                      <option value='2'>转换</option>
                      <% } %>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="form-group">
                  <label class="col-xs-2 control-label">任务简介</label>
                  <div class="col-xs-10">
                    <textarea class="form-control" name="tprTaskContent" placeholder="任务简介（最大256字）" maxlength="256"><%- info.handleContentOne %></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-default" id="btnSave">保存</button>
            <button class="btn btn-primary" id="btnSubmit">提交</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>