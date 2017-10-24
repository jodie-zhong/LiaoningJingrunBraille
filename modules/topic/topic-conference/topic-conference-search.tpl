<!--查看会议-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3><i class="fa fa-user-o"></i>查看会议</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formConferenceCreateEdit">
          <div class="row">
            <div class="form-group">
              <label class="col-xs-2 control-label">会议名称：</label>
              <div class="col-xs-10">
                <p class="form-control-static"><%- info.topicMeetingName %></p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-xs-2 control-label">会议地点：</label>
              <div class="col-xs-10">
                <p class="form-control-static"><%- info.topicMeetingAddress %></p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-xs-2 control-label">会议时间：</label>
              <div class="col-xs-10">
                <p class="form-control-static"><%- info.topicMeetingDatetime %></p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-xs-2 control-label">参会人员：</label>
              <div class="col-xs-10">
                <p class="form-control-static"><%- info.topicMeetingUserNames %></p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-xs-2 control-label">会议纪要：</label>
              <div class="col-xs-10">
                <p class="form-control-static"><%- info.topicMeetingContent %></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>