<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header">
        <h3><i class="fa fa-user-o"></i> 角色选择</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content border-bottom">
        <div class="form-horizontal" id="formSearchRole">
          <div class="row">
            <div class="col-xs-5">
              <div class="form-group">
                <label class="col-xs-4 control-label">角色名称</label>
                <div class="col-sm-8">
                  <input class="form-control" data-search="searchRoleName">
                </div>
              </div>
            </div>
            <div class="col-xs-5">

            </div>
            <div class="col-xs-2">
              <button class="btn btn-primary" id="btnSearchRole">搜索</button>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-content">
        <div class="table-10-static">
          <table class="table table-striped table-hover">
            <thead>
            <tr>
              <th>序号</th>
              <th>角色名称</th>
              <th>角色描述</th>
              <th></th>
            </tr>
            </thead>
            <tbody id="selectRoleTable">

            </tbody>
          </table>
        </div>
        <div class="clearfix" id="roleManagePaging"></div>
      </div>
    </div>
  </div>
</div>