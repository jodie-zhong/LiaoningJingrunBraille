<!-- 部门管理 -->
<div class="row">
  <div class="col-xs-8">
    <!-- 左侧列表 -->
    <div class="panel">
      <div class="panel-header custom-panel-header">
        <h3><i class="fa fa-cogs"></i> 系统管理 - 部门管理</h3>
        <div class="control-btn">
					<!--<button class="btn btn-xs btn-success" id="btnAddDepartment" data-auth="0141">新增</button>-->
        </div>
      </div>
      <div class="panel-content">
        <div class="table-10">
        <table class="table table-striped table-hover table-nowrap">
          <thead>
          <tr>
            <th width="50px">序号</th>
            <th>部门名称</th>
            <th width="80px">部门人数</th>
            <th width="120px">部门电话</th>
            <th>负责人</th>
            <th>直属领导</th>
          </tr>
          </thead>
          <tbody id="departmentListTable"></tbody>
        </table>
        </div>
        <div id="deptManagePaging" class="clearfix"></div>
      </div>
    </div>
  </div>
  <!-- 部门详情 -->
  <div class="col-xs-4">
    <div class="panel">
      <div class="panel-header custom-panel-header">
        <h3 class="depart">部门信息</h3>
        <div class="control-btn">
          <button class="btn btn-xs btn-primary" id="btnDeptSave" data-auth="0142" disabled>保存</button>
        </div>
      </div>
      <div class="panel-content" id="departmentEditPanel" style="min-height: 328px;">
        <h3 class="c-gray">（请选择一个部门进行编辑部门）</h3>
      </div>
    </div>
  </div>
</div>