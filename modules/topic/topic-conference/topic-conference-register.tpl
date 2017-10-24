<!--登记会议-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3><i class="fa fa-user-o"></i>登记会议</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content dialog-resize">
        <div class="form-horizontal" id="formMeetingCreateEdit">
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">会议名称：</label>
                <div class="col-xs-8">
                  <p class="form-control-static"><%- info.topicMeetingName %></p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">会议地点：</label>
                <div class="col-xs-8">
                  <p class="form-control-static"><%- info.topicMeetingAddress %></p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">会议时间：</label>
                <div class="col-xs-8">
                  <p class="form-control-static"><%- info.topicMeetingDatetime %></p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">参会人员：</label>
                <div class="col-xs-8">
                  <p class="form-control-static"><%- info.topicMeetingUserNames %></p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <table class="table table-striped table-hover">
                <thead>
                <tr>
                  <th class="w-table">序号</th>
                  <th>上报名称</th>
                  <th>上报部门</th>
                  <th>上报选题数量</th>
                  <th>上报时间</th>
                  <th>状态</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody id="conRegListTable">
                <% if(info.reportMeetingList.length > 0) { %>
                <% for(var i = 0; i < info.reportMeetingList.length; i++) { %>
                <tr data-id="<%- info.reportMeetingList[i].topicReportId %>">
                  <td><%- (i + 1) %></td>
                  <td><%- info.reportMeetingList[i].topicReportName %></td>
                  <td><%- info.reportMeetingList[i].topicReportDepartmentName %></td>
                  <td><%- info.reportMeetingList[i].topicReportNum %></td>
                  <td><%- info.reportMeetingList[i].topicReportDatetime %></td>
                  <td class="no-enter">已录入</td>
                  <td>
                    <button class="btn btn-default btn-rounded btn-sm enteringMeeting" data-onoff="false" data-index="<%- i %>">录入</button>
                  </td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                  <td colspan="7"><p class="empty-tips">没有符合指定条件的数据</p></td>
                </tr>
                <% } %>
                </tbody>
              </table>
            </div>
          </div>
          <!--这里是动态更改的-->
          <div class="form-horizontal" id="enteringInfo" style="display: none">
            <div id="enteringInfoList">

            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">会议纪要：</label>
                <textarea id="topicMeetingContent" class="col-xs-10" maxlength="2000" placeholder="会议纪要（最大2000字）"><%- info.topicMeetingContent %></textarea>
              </div>
            </div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-blue" id="btnTemporarySave">临时保存</button>
            <button class="btn btn-default" id="btnConRegSave">保存</button>
            <button class="btn btn-primary" id="btnConRegSubmit">提交</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>