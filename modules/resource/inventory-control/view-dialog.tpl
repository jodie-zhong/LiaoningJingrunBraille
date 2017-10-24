<!--资源库-库存管理-入库-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header">
        <h3><i class="fa fa-user-o"></i>出入库查看</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal">
          <div class="row">
            <div class="col-xs-12">
              <div class="col-xs-10">
                <label class="radio-inline"><input type="radio" name="handleState" value="1" checked/>入库</label>
                <label class="radio-inline"><input type="radio" name="handleState" value="2"/>出库</label>
                <% } %>
              </div>
            </div>
          </div>
          <div class="row">
            <table class="table table-striped table-nowrap table-hover" id="dataTable">
              <thead>
              <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 100px;">数量</th>
                <th>备注</th>
              </tr>
              </thead>
              <tbody id="dataTBody">

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>