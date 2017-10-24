<!--译校通读-任务接受-->
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书名称</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">任务阶段</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.flowName %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">任务简介</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.tprTaskContent %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">是否接受</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.handleState === '1' ? '接受' : (info.handleState === '2' ? '拒绝' : '') %></p>
        </div>
      </div>
    </div>
  </div>
</div>