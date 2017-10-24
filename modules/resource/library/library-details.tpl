<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom" style="font-size: 0">
        <h3 style="display:inline-block;width: 7%">
          <strong>流程详情</strong>
        </h3>
        <!--<div class="dis-inline-b text-center" style="width: 93%">-->
        <!--<span class="f-14 dis-inline-b m-r-30 titleBookName">图书名称：暂无</span>-->
        <!--<span class="f-14 dis-inline-b titleDutyEditor">责任编辑：暂无</span>-->
        <!--</div>-->
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content" id="panelWorkflowContent">
        <div class="dialog-resize" id="panelWorkflow" style="position: relative;">
          <div class="row">
            <% for(var i = 0; i < info.length; i++) { %>
            <% if( info[i].bookLibraryFlowEntities.length > 0 ) { %>
            <div class="col-xs-3">
              <div class="panel">
                <div class="panel-header panel-controls custom-panel-header">
                  <h3><%- info[i].bookDeploymentKeyName %></h3>
                </div>
                <div class="panel-content widget-table">
                  <div class="withScroll" data-height="225" style="height: 225px;overflow: auto;">
                    <table class="table table-striped">
                      <tbody>
                      <% for(var j = 0; j < info[i].bookLibraryFlowEntities.length; j++) { %>
                      <tr>
                        <td>
                          <button class="btn btn-white btn-sm btn-rounded" data-bookId="<%-
                            info[i].bookLibraryFlowEntities[j].bookId %>" data-topicId="<%-
                            info[i].topicId %>" data-taskId="<%-
                            info[i].bookLibraryFlowEntities[j].taskId %>" data-deployId="<%-
                            info[i].bookDeploymentKey %>" data-index="<%- j %>"><%-
                            info[i].bookLibraryFlowEntities[j].flowName %>
                          </button>
                        </td>
                      </tr>
                      <% } %>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <% } %>
            <% } %>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>