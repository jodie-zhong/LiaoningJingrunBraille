<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3><i class="fa fa-object-group"></i> 盲文图形设计</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content dialog-resize">
        <div style="padding: 0 20px;">
          <div class="form-horizontal form-compact">
            <!-- 基本属性设置 -->
            <div class="row">
              <div class="col-xs-2">
                <div class="form-group">
                  <label class="col-xs-12 control-label">基本设置：</label>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group">
                  <label class="col-xs-6 control-label" for="inputSharpWidth" style="font-weight: normal">画布宽度</label>
                  <div class="col-xs-6">
                    <input type="number" id="inputSharpWidth" class="form-control" value="620" min="100" max="620">
                  </div>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group">
                  <label class="col-xs-6 control-label" for="inputSharpHeight" style="font-weight: normal">画布高度</label>
                  <div class="col-xs-6">
                    <input type="number" id="inputSharpHeight" class="form-control" value="300" min="100" max="620">
                  </div>
                </div>
              </div>
              <div class="col-xs-2">
              </div>
              <div class="col-xs-2">
                <div class="">
                  <button class="btn btn-default btn-block">文件导入</button>
                  <input type="file" id="sharpFile"
                         style="position: absolute; top:0; left:0;width: 100%; height:100%;opacity: 0;cursor: pointer">
                </div>
              </div>
            </div>
            <!-- 绘图选项 -->
            <div class="row" style="padding-top: 10px;">
              <div class="col-xs-2">
                <div class="form-group">
                  <label class="col-xs-12 control-label">绘图选项：</label>
                </div>
              </div>
              <div class="col-xs-8">
                <div class="btn-group" role="group">
                  <button type="button" class="btn btn-default" id="btnUndo"><i class="fa fa-undo"></i></button>
                  <button type="button" class="btn btn-default" id="btnRepeat"
                          style="border-left: 1px solid rgba(12, 12, 12, 0.1)"><i class="fa fa-repeat"></i></button>
                </div>
                <div class="btn-group" data-toggle="buttons" id="canvasToolbar">
                  <button class="btn btn-default">
                    <input type="radio" name="options" id="radioStylePen" autocomplete="off"> <i
                          class="fa fa-pencil"></i>
                  </button>
                  <button class="btn btn-default">
                    <input type="radio" name="options" id="radioStyleLine" autocomplete="off"> <i
                          class="fa fa-minus"></i>
                  </button>
                  <button class="btn btn-default">
                    <input type="radio" name="options" id="radioStyleSquare" autocomplete="off"> <i
                          class="fa fa-square-o"></i>
                  </button>
                  <button class="btn btn-default">
                    <input type="radio" name="options" id="radioStyleCircle" autocomplete="off"> <i
                          class="fa fa-circle-o"></i>
                  </button>
                  <button class="btn btn-default" style="border-left: 1px solid rgba(12, 12, 12, 0.1)">
                    <input type="radio" name="options" id="radioStyleEraser" autocomplete="off"> <i
                          class="fa fa-eraser"></i>
                  </button>
                </div>
              </div>
              <div class="col-xs-2">
                <button class="btn btn-danger btn-block" id="btnClearCanvas">清空画布</button>
              </div>
            </div>
            <!-- 点图设置 -->
            <div class="row" style="padding-top: 10px;">
              <div class="col-xs-2">
                <div class="form-group">
                  <label class="col-xs-12 control-label">绘图选项：</label>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group">
                  <label class="col-xs-6 control-label" for="inputPointStep" style="font-weight: normal">扫描间距</label>
                  <div class="col-xs-6">
                    <input type="number" id="inputPointStep" class="form-control" value="10" min="5" max="30">
                  </div>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group">
                  <label class="col-xs-6 control-label" for="inputPointRadius" style="font-weight: normal">点半径</label>
                  <div class="col-xs-6">
                    <input type="number" id="inputPointRadius" class="form-control" value="2" min="1" max="10">
                  </div>
                </div>
              </div>
              <div class="col-xs-2">
              </div>
              <div class="col-xs-2">
                <button class="btn btn-success btn-block" id="btnInsertText">插入文本</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 画布容器 -->
        <div id="sharpCanvasContainer" class="sharp-canvas-container" style="width: 620px; height: 300px;">
          <canvas id="sharpCanvas" width="620" height="300" class="sharp-canvas"></canvas>
          <canvas id="sharpCanvasBak" width="620" height="300" class="sharp-canvas-bak"></canvas>
          <!-- 插入文本操作框 -->
          <div id="insertTextContainer" class="insert-text-container" style="display: none;">
            <div style="position: relative">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="请输入盲文或汉字" id="textInput">
                <span class="input-group-btn">
                <button class="btn btn-default" type="button" id="btnImplantText"><i class="fa fa-check"></i></button>
              </span>
              </div>
              <i class="fa fa-arrows"></i>
            </div>
          </div>
        </div>
      </div>

      <!-- 底部操作按钮 -->
      <div class="dialog-options">
        <button class="btn btn-success" id="btnCreatePreview">生成点图</button>
        <button class="btn btn-primary" id="btnInsertSharp">插入图形</button>
      </div>
    </div>
  </div>
</div>
