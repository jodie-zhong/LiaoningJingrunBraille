<!--新增会议-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3><i class="fa fa-user-o"></i>新增会议</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formConferenceCreateEdit">
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">会议名称<span class="must">*</span></label>
                <div class="col-xs-4">
                  <input type="text" value="<%-info.topicMeetingName %>" name="topicMeetingName" class="form-control"
                         placeholder="会议名称(最多64个字)" data-fv-notempty="true" data-fv-notempty-message="请填写会议名称"
                         maxlength="64"/>
                  <div class="help-block with-errors"></div>
                </div>
              </div>
            </div>
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">会议地点<span class="must">*</span></label>
                <div class="col-xs-4">
                  <input type="text" value="<%-info.topicMeetingAddress %>" name="topicMeetingAddress"
                         class="form-control" placeholder="会议地点(最多64个字)"
                         data-fv-notempty="true" data-fv-notempty-message="请填写会议地点" maxlength="64"/>
                  <div class="help-block with-errors"></div>
                </div>
              </div>
            </div>
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">会议时间<span class="must">*</span></label>
                <div class="col-xs-4">
                  <input type="text" data-timeValue="<%-info.topicMeetingDatetime %>" value="<%-info.topicMeetingDatetime %>" name="topicMeetingDatetime"
                         class="form-control date-time"
                         data-fv-notempty="true" data-fv-notempty-message="请填写会议时间"/>
                  <div class="help-block with-errors"></div>
                </div>
              </div>
            </div>
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">参会人员<span class="must">*</span></label>
                <div class="col-xs-4">
                  <div class="input-group with-clear">
                    <input type="text" class="form-control" name="topicMeetingUsers"
                           value="<%- info.topicMeetingUserNames %>"
                           data-value="<%- info.topicMeetingUsers %>" readonly data-fv-notempty="true"
                           data-fv-notempty-message="请填写参会人员"/>
                    <span class="input-group-btn">
                    <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                    <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data="{}"><i
                        class="fa fa-user-o"></i></button>
                  </span>
                  </div>
                  <div class="help-block with-errors"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-primary" id="btnConferenceSave">保存</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>