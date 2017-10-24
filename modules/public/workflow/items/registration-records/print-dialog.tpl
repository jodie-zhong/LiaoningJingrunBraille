<div class="form-horizontal" style="background: url('../../../img/watermark.png') repeat">
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
        <label class="col-xs-4 control-label">类别</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookTwoKind %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者及著作方式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailAuthor %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">字数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailWordsNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">原出版社</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailPublishingHouse %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">原版次</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailEdition %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">原出版时间</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailPublicationDate %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">印数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookPrintNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">盲文形式</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailBrailleForm %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">是否加急</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookTopicIsUrgent === '2' ? '是' : '否' %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">排版次序</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.bookDetailLayoutOrder %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">一审意见</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.opinionOne %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">作者简介</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.bookdetailauthormsg %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">内容简介</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.bookDetailSketched %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">加工记录</label>
        <div class="col-xs-10">
          <% if(info.list && info.list.length>0){%>
          <% for(var i = 0; i < info.list.length; i++){%>
          <% if(info.list[i]){%>
          <p class="form-control-static"><%- info.list[i].machiningRecord %></p>
          <% } %>
          <% } %>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.bookDetailDutyEditorName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">填报时间</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.overTime %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">二审意见</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.opinionTwo %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">三审意见</label>
        <div class="col-xs-10">
          <p class="form-control-static"><%- info.opinionThree %></p>
        </div>
      </div>
    </div>
  </div>
</div>