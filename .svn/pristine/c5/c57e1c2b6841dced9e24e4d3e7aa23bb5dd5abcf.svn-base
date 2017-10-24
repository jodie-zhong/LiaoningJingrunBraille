<!--正误表-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
        <div class="panel-header border-bottom">
          <h3><i class="fa fa-user-o"></i>正误表</h3>
          <div class="control-btn">
            <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
          </div>
        </div>
        <div class="panel-content">
          <div class="form-horizontal">
            <div class="row">
              <div class="col-xs-12">
                <div class="form-group">
                  <label class="col-xs-2 control-label">一校正误表:</label>
                  <div class="col-xs-10">
                    <% for(var i=0; i< info.firstRevisalErrataList.length; i++){ %>
                    <p class="form-control-static">
                      <%- info.firstRevisalErrataList[i].page %>页&nbsp;&nbsp; <%- info.firstRevisalErrataList[i].line
                      %>行&nbsp;&nbsp; 内容：<%- info.firstRevisalErrataList[i].content %>
                    </p>
                    <% } %>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="form-group">
                  <label class="col-xs-2 control-label">二校正误表:</label>
                  <div class="col-xs-10">
                    <% for(var i=0; i< info.secondRevisalErrataList.length; i++){ %>
                    <p class="form-control-static">
                      <%- info.secondRevisalErrataList[i].page %>页&nbsp;&nbsp; <%- info.secondRevisalErrataList[i].line %>行&nbsp;&nbsp;内容： <%- info.secondRevisalErrataList[i].content %>
                    </p>
                    <% } %>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="form-group">
                  <label class="col-xs-2 control-label">末校一次正误表:</label>
                  <div class="col-xs-8">
                  <% for(var i=0; i< info.lastRevisalOneErrataList.length; i++){ %>
                    <p class="form-control-static">
                      <%- info.lastRevisalOneErrataList[i].page %>页&nbsp;&nbsp; <%- info.lastRevisalOneErrataList[i].line %>行&nbsp;&nbsp; 内容：<%- info.lastRevisalOneErrataList[i].content %>
                    </p>
                  <% } %>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="form-group">
                  <label class="col-xs-2 control-label">末校二次正误表:</label>
                  <div class="col-xs-10">
                  <% for(var i=0; i< info.lastRevisalTwoErrataList.length; i++){ %>
                    <p class="form-control-static">
                      <%- info.lastRevisalTwoErrataList[i].page %>页&nbsp;&nbsp; <%- info.lastRevisalTwoErrataList[i].line %>行&nbsp;&nbsp; 内容：<%- info.lastRevisalTwoErrataList[i].content %>
                    </p>
                  <% } %>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="form-group">
                  <label class="col-xs-2 control-label">通读正误表:</label>
                   <div class="col-xs-10">
                    <% for(var i=0; i< info.readRevisalErrataList.length; i++){ %>
                      <p class="form-control-static">
                        <%- info.readRevisalErrataList[i].page %>页&nbsp;&nbsp; <%- info.readRevisalErrataList[i].line %>行&nbsp;&nbsp; 内容：<%- info.readRevisalErrataList[i].content %>
                      </p>
                    <% } %>
                  </div>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>