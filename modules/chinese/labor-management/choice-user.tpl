<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header">
        <h3><i class="fa fa-user-o"></i> 劳务人员选择</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content border-bottom">
        <div class="form-horizontal" id="formSearchUser">
          <div class="row">
            <div class="col-xs-5">
              <div class="form-group">
                <label class="col-xs-4 control-label">姓名</label>
                <div class="col-sm-8">
                  <input class="form-control" data-search="searchUserName">
                </div>
              </div>
            </div>
            <div class="col-xs-5">
              <div class="form-group">
                <label class="col-xs-4 control-label">身份证号</label>
                <div class="col-sm-8">
                  <input class="form-control" data-search="searchUserIdCard">
                </div>
              </div>
            </div>
            <div class="col-xs-2">
              <button class="btn btn-primary" id="btnSearchUser">搜索</button>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-content">
        <div class="table-10">
          <table class="table table-striped table-hover">
            <thead>
            <tr>
              <th>序号</th>
              <th>姓名</th>
              <th>身份证号</th>
              <th>操作</th>
            </tr>
            </thead>
            <tbody id="selectUserTable">

            </tbody>
          </table>
        </div>
        <div id="personListPaging" class="clearfix"></div>
      </div>
    </div>
  </div>
</div>