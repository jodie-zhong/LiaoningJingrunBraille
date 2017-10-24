<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header">
        <h3><i class="fa fa-user-o"></i> 出版计划批量修改</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formPublishEdit">
          <div class="row">
          	<div class="col-xs-6">
          		<div class="form-group">
          			<label class="col-xs-4 control-label">重点选题种类</label>
          			<div class="col-xs-8">
          				<select class="form-control" name="pointTopicType" id="pointTopicType"></select>
          			</div>
          		</div>
          	</div>
          	<div class="col-xs-6">
          		<div class="form-group">
          			<label class="col-xs-4 control-label">出版方式</label>
          			<div class="col-xs-8">
          				<select class="form-control" name="publishWayType" id="publishWayType"></select>
          			</div>
          		</div>
          	</div>
          </div>
          <div class="row">
          	<div class="col-xs-6">
          		<div class="form-group">
          			<label class="col-xs-4 control-label">主要文种类型</label>
          			<div class="col-xs-8">
          				<select class="form-control" name="mainRecordOneKind" id="mainRecordOneKind"></select>
          			</div>
          		</div>
          	</div>
          	<div class="col-xs-6">
          		<div class="form-group">
          			<label class="col-xs-4 control-label">主要文种</label>
          			<div class="col-xs-8">
          				<select class="form-control" name="mainRecordTwoKind" id="mainRecordTwoKind"></select>
          			</div>
          		</div>
          	</div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">图幅数</label>
                <div class=" col-xs-8">
                  <input type="text" maxlength="32" value="<%- info.imageNum %>" name="imageNum" class="form-control">
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class=" col-xs-4 control-label">是否出版<br />电子出版物</label>
                <div class=" col-xs-8">
                  <label class="radio-inline">
                    <% if(!info.isPublishEJournal || info.isPublishEJournal === '1') { %>
                    <input type="radio" name="isPublishEJournal" value="1" checked> 是
                    <% } else { %>
                    <input type="radio" name="isPublishEJournal" value="1"> 是
                    <% } %>
                  </label>
                  <label class="radio-inline">
                    <% if(info.isPublishEJournal === '2') { %>
                    <input type="radio" name="isPublishEJournal" value="2" checked> 否
                    <% } else { %>
                    <input type="radio" name="isPublishEJournal" value="2"> 否
                    <% } %>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">选题类型</label>
                <div class=" col-xs-8">
                	<select class="form-control" name="topicType" id="topicType"></select>
                </div>
              </div>
            </div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-primary" id="btnPublishSave">保存</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>