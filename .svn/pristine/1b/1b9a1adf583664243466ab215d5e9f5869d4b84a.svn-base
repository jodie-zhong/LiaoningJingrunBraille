<!--选题申报-->
<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom">
        <h3><i class="fa fa-user-o"></i>选题详情</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal">
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">选题名称</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailName %>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">丛书名称</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailSeriesName %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">选题类型</label>
                <div class="col-xs-10">
                  <p class="form-control-static">
                    <% if(info.topicDetailType && info.topicDetailType.indexOf('1') >= 0) { %> 盲文读物
                    <% } %>
                    <% if(info.topicDetailType && info.topicDetailType.indexOf('2') >= 0) { %> 大字本读物
                    <% } %>
                    <% if(info.topicDetailType && info.topicDetailType.indexOf('3') >= 0) { %> 普通读物
                    <% } %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group ">
                <label class="col-xs-2 control-label">推荐类型</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <% if(!info.topicDetailRecommendType || info.topicDetailRecommendType === '1') { %> 非社推荐选题
                    <% } %>
                    <% if(info.topicDetailRecommendType && info.topicDetailRecommendType === '2') { %> 社推荐选题
                    <% } %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group ">
                <label class="col-xs-2 control-label">图书类别</label>
                <div class="col-xs-3">
                  <p class="form-control-static">
                    <%- info.topicDetailOneKindName %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">作者</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailOldAuthor %>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">著作方式</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailWorkWay %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">学历</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailAuthorEducation %>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group ">
                <label class="col-xs-4 control-label">预计字数</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailWords %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">职称</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailAuthorTitles %>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group ">
                <label class="col-xs-4 control-label">交稿时间</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailSubmitDatetime %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group ">
                <label class="col-xs-2 control-label">专长</label>
                <div class="col-xs-10">
                  <p class="form-control-static">
                    <%- info.topicDetailAuthorSpeciality %>
                  </p>
                </div>
              </div>
            </div>

          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">著作及科研成果</label>
                <div class="col-xs-10">
                  <pre class="form-control-static"><%- info.topicDetailAuthorResult %></pre>
                </div>
              </div>
            </div>

          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">工作单位及<br>联系方式</label>
                <div class="col-xs-10">
                  <pre class="form-control-static"><%- info.topicDetailAuthorContactWay %></pre>
                </div>
              </div>
            </div>

          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">原书名称</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailOldName %>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">原书版次</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailOldEdition %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">原出版社</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailOldPublishingHouse %>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="col-xs-4 control-label">原书出版时间</label>
                <div class="col-xs-8">
                  <p class="form-control-static">
                    <%- info.topicDetailOldPublicationDate %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">选题背景</label>
                <div class="col-xs-10">
                  <pre class="form-control-static"><%- info.topicDetailBackground %></pre>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">图书卖点</label>
                <div class="col-xs-10">
                  <pre class="form-control-static"><%- info.topicDetailSellingPoints %></pre>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <label class="col-xs-2 control-label">同类书情况</label>
                <div class="col-xs-10">
                  <pre class="form-control-static"><%- info.topicDetailSameBook %></pre>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>