<!--资源库-合同模板库-->
<div class="row">
  <div class="col-xs-12">
    <div class="panel">
      <div class="panel-header custom-panel-header">
        <h3><i class="fa fa-braille"></i>模板列表</h3>
        <div class="control-btn">
          <button class="btn btn-xs btn-blue" id="btnAdd" data-auth="0631">新增</button>
          <button class="btn btn-xs btn-blue" id="btnModify" data-auth="0632" disabled>修改</button>
          <button class="btn btn-xs btn-default" id="btnView" data-auth="0633" disabled>查看</button>
          <button class="btn btn-xs btn-default" id="btnDelete" data-auth="0634" disabled>删除</button>
        </div>
      </div>
      <div class="panel-content border-bottom">
        <div class="form-horizontal">
          <div class="row">
            <div class="col-xs-4">
              <div class="form-group">
                <label class="col-xs-4 control-label">模板名称</label>
                <div class="col-xs-8">
                  <input type="text" maxlength="32" class="form-control" id="searchTemplateName" title="模板名称"/>
                </div>
              </div>
            </div>
            <div class="col-xs-4">
              <div class="form-group">
                <label class="col-xs-4 control-label">模板类型</label>
                <div class="col-xs-8">
                  <select id="searchTemplateType" class="form-control" title="模板类型">
                    <option value='0'>全部</option>
                    <option value='1'>版权合同</option>
                    <option value='2'>采购合同</option>
                    <option value='3'>销售合同</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-xs-4">
              <button class="btn btn-primary" id="btnSearch">查询</button>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-content">
        <div class="table-10">
          <table class="table table-striped table-nowrap table-hover" id="dataTable" data-multi="true">
            <thead>
            <tr>
              <th style="width: 50px;">序号</th>
              <th style="width: 40px;"><i class="fa fa-square-o" data-action="check"></i></th>
              <th>模板名称</th>
              <th>模板类型</th>
              <th style="width: 80px;">下载次数</th>
              <th>上传人</th>
              <th>上传时间</th>
              <th>修改人</th>
              <th>修改时间</th>
              <th>备注</th>
            </tr>
            </thead>
            <tbody id="dataTBody"></tbody>
          </table>
        </div>
        <div class="clearfix" id="listPaging"></div>
      </div>
    </div>
  </div>
</div>