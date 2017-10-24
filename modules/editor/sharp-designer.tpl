<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3><i class="fa fa-object-group"></i> 盲文图形设计</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div style="height: 500px;">
          <div class="form-horizontal form-compact">
            <div class="row">
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-6 control-label">图形宽度</label>
                  <div class="col-xs-6">
                    <input type="number" id="inputSharpWidth" class="form-control" value="500" min="100" max="1000">
                  </div>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-6 control-label">图形高度</label>
                  <div class="col-xs-6">
                    <input type="number" id="inputSharpHeight" class="form-control" value="500" min="100" max="1000">
                  </div>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <div class="col-xs-6">
                    <button class="btn btn-default btn-block">从文件选择</button>
                    <input type="file" id="sharpFile"
                           style="position: absolute; top:0; left:0;width: 100%; height:100%;opacity: 0;cursor: pointer">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-6 control-label">扫描间距</label>
                  <div class="col-xs-6">
                    <input type="number" id="inputPointStep" class="form-control" value="10" min="5" max="50">
                  </div>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <label class="col-xs-6 control-label">点半径</label>
                  <div class="col-xs-6">
                    <input type="number" id="inputPointRadius" class="form-control" value="2" min="1" max="10">
                  </div>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <div class="col-xs-6">
                    <button class="btn btn-success btn-block" id="btnCreatePreview">生成点图</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

        <div id="sharpCanvasContainer" style="height: 390px; padding: 10px;">
          <canvas id="sharpCanvas" width="1000" height="500"
                  style="max-width: 100%; max-height: 100%; border: 1px solid #EEE; display: block; margin: auto;box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);"></canvas>
        </div>
        </div>
        <div class="dialog-options">
          <button class="btn btn-danger" id="btnClearCanvas">清空画布</button>
          <button class="btn btn-primary" id="btnInsertSharp">插入图形</button>
        </div>
      </div>
    </div>
  </div>
</div>