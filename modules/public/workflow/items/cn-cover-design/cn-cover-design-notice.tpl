<!--通知单-->
<% if(isEdit) { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHBookCoverEntity.bookDetailDutyEditor %>"
                 name="bookDetailDutyEditor"
                 placeholder="责任编辑" readonly/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">编室</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="editRoom" value="<%- info.mwHBookCoverEntity.editRoom %>"
                 placeholder="编室" readonly/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">主书名</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHBookCoverEntity.bookName %>" name="bookName"
                 placeholder="主书名" readonly/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">丛书名/副书名</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="subTitle"
                 value="<%- info.mwHBookCoverEntity.subTitle %>"
                 placeholder="丛书名/副书名" maxlength="64"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">成书尺寸</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHBookCoverEntity.bookSize %>" name="bookSize"
                 placeholder="成书尺寸" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书脊厚度</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHBookCoverEntity.bookThickness %>"
                 name="bookThickness"
                 placeholder="书脊厚度" maxlength="32"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口尺寸</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="mouthSize" value="<%- info.mwHBookCoverEntity.mouthSize %>"
                 placeholder="勒口尺寸" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书类别</label>
        <div class="col-xs-8">
          <% if(info.mwHBookCoverEntity.bookType === '1'){ %>
          <input type="text" class="form-control" value="盲文读物" data-value="1" name="bookType" readonly/>
          <% }else if(info.mwHBookCoverEntity.bookType === '2'){ %>
          <input type="text" class="form-control" value="大字本读物" data-value="2" name="bookType" readonly/>
          <% }else if(info.mwHBookCoverEntity.bookType === '3') { %>
          <input type="text" class="form-control" value="普通读物" data-value="3" name="bookType" readonly/>
          <% } else { %>
          <input type="text" class="form-control" value="有声读物" data-value="4" name="bookType" readonly/>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版时间</label>
        <div class="col-xs-8">
          <input type="text" class="form-control date-time" name="publicationTime"
                 value="<%- info.mwHBookCoverEntity.publicationTime%>" placeholder="出版时间"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">目标读者</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHBookCoverEntity.targetReader %>"
                 name="targetReader"
                 placeholder="目标读者" maxlength="64"/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版社名</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="publishingHouseName"
                 value="<%- info.mwHBookCoverEntity.publishingHouseName%>"
                 maxlength="64" placeholder="出版社名"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书定价</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" value="<%- info.mwHBookCoverEntity.bookDetailPricing %>"
                 name="bookDetailPricing"
                 placeholder="图书定价" readonly/>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者署名</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="authorName" value="<%- info.mwHBookCoverEntity.authorName %>"
                 placeholder="作者署名" maxlength="32"/>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交方案数</label>
        <div class="col-xs-8">
          <input type="text" class="form-control" name="schemeNum" value="<%- info.mwHBookCoverEntity.schemeNum %>"
                 placeholder="提交方案数" pattern="^[0-9]*$" maxlength="8" data-fv-regexp-message="请输入大于等于0的整数" />
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">选题背景</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" name="topicDetailBackground" placeholder="选题背景（不超过1024字）"><%-
            info.mwHBookCoverEntity.topicDetailBackground %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">图书卖点</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" name="topicDetailSellingPoints" placeholder="图书卖点（不超过1024字）"><%-
            info.mwHBookCoverEntity.topicDetailSellingPoints%></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">封面宣传语</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" name="coverLanguage" placeholder="封面宣传语（不超过1024字）"><%-
            info.mwHBookCoverEntity.coverLanguage %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">作者简介</label>
        <div class="col-xs-10">
          <textarea class="form-control" maxlength="1024" name="bookDetailAuthorMsg" placeholder="作者简介（不超过1024字）"><%-
            info.mwHBookCoverEntity.bookDetailAuthorMsg %></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">图书基本信息（内容简介、前后勒口、封底、请附电子稿）</label>
        <div class="col-xs-10">
          <textarea class="form-control" style="min-height: 100px" maxlength="1024" name="bookDetailSketched"
                    placeholder="图书基本信息（不超过1024字）"
          ><%-
            info.mwHBookCoverEntity.bookDetailSketched%></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">风格定位</label>
        <div class="col-xs-10">
          <div class="form-control no-border" id="styleList">
            <% for(var i=0;i< info.styleList.length;i++ ) {%>
            <label class="control-label" style="width: 16%;text-align: left"><input data-id="<%-
              info.styleList[i].codeId %>" style="float: left;margin-top:
            2px;margin-right: 8px" type="checkbox"/><%-
              info.styleList[i].value%></label>
            <% } %>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">其他相关设计</label>
        <div class="col-xs-10">
          <div class="form-control no-border" id="otherList">
            <% for(var i=0;i< info.otherList.length;i++ ) {%>
            <label class="control-label" style="width: 16%;text-align: left"><input data-id="<%-
              info.otherList[i].codeId %>" style="float: left;margin-top:
            2px;margin-right: 8px" type="checkbox"/><%-
              info.otherList[i].value%></label>
            <% } %>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">是否考虑特种工艺</label>
        <div class="col-xs-8 m-t-10">
          <select class="form-control" name="isSpecialCrafts">
            <% if(info.mwHBookCoverEntity.isSpecialCrafts ==='1') { %>
            <option value="1" selected>是</option>
            <% } else{ %>
            <option value="1">是</option>
            <% } %>
            <% if(info.mwHBookCoverEntity.isSpecialCrafts ==='2') { %>
            <option value="2" selected>否</option>
            <% } else{ %>
            <option value="2" >否</option>
            <% } %>
          </select>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group m-t-10">
        <label class="col-xs-4 control-label" style="margin-top: -4px">是否考虑特种纸</label>
        <div class="col-xs-8">
          <select class="form-control" name="isSpecialPaper">
            <% if(info.mwHBookCoverEntity.isSpecialPaper ==='1') { %>
            <option value="1" selected>是</option>
            <% } else{ %>
            <option value="1">是</option>
            <% } %>
            <% if(info.mwHBookCoverEntity.isSpecialPaper ==='2') { %>
            <option value="2" selected>否</option>
            <% } else{ %>
            <option value="2" >否</option>
            <% } %>
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">设计要求与建议</label>
        <div class="col-xs-10">
                    <textarea type="text" class="form-control" name="requireProposal"
                              maxlength="1024" placeholder="设计要求与建议（不超过1024字）"><%- info.mwHBookCoverEntity.requireProposal%></textarea>
          <div><label class="len"></label></div>
        </div>
      </div>
    </div>
  </div>
  <% if(info.userTaskEntities) { %>
  <% for(var i = 0 ; i < info.userTaskEntities.length; i++) { %>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">下一流程</label>
        <div class="col-xs-8">
          <% if(!info.userTaskEntities[i].deptAndRoles) { %>
          <p class="form-control-static"><%- info.userTaskEntities[i].flowName %></p>
          <% } else { %>
          <p class="form-control-static">
            <%- info.userTaskEntities[i].flowName %>（<%- info.userTaskEntities[i].deptAndRoles %>）
          </p>
          <% } %>
          <input type="hidden" name="flowId" value="<%- info.userTaskEntities[i].flowId %>">
          <input type="hidden" name="flowName" value="<%- info.userTaskEntities[i].flowName %>">
          <input type="hidden" name="nextCategory" value="<%- info.userTaskEntities[i].category %>">
          <input type="hidden" name="deptIds" value="<%- info.userTaskEntities[i].deptIds %>">
          <input type="hidden" name="roleIds" value="<%- info.userTaskEntities[i].roleIds %>">
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <% if(info.userTaskEntities[i].roleIds) { %>
      <div class="form-group">
        <label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
        <div class="col-xs-8">
          <div class="input-group with-clear">
            <input type="text" class="form-control" name="taskUsers"
                   title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>"
                   data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly
                   data-data="{roleIds: '<%- info.userTaskEntities[i].roleIds %>', searchDepartmentId: '<%- info.userTaskEntities[i].deptIds %>'}"
                   data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
            <span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users"
                      data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i
                      class="fa fa-user-o"></i>
              </button>
            </span>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <% } %>
  <% } %>
</div>
<% } else { %>
<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">责任编辑</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.bookDetailDutyEditor %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">编室</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.editRoom %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">主书名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.bookName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">丛书名/副书名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.subTitle %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">成书尺寸</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.bookSize %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">书脊厚度</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.bookThickness %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">勒口尺寸</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.mouthSize %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书类别</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.mwHBookCoverEntity.bookType === '1'){ %>
            盲文读物
            <% }else if(info.mwHBookCoverEntity.bookType === '2'){ %>
            大字本读物
            <% }else if(info.mwHBookCoverEntity.bookType === '3') { %>
            普通读物
            <% } else { %>
            有声读物
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版时间</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.publicationTime %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">目标读者</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.targetReader %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">出版社名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.publishingHouseName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">图书定价</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.bookDetailPricing %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">作者署名</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.authorName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交方案数</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.mwHBookCoverEntity.schemeNum %></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">选题背景</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.mwHBookCoverEntity.topicDetailBackground %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">图书卖点</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.mwHBookCoverEntity.topicDetailSellingPoints %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">封面宣传语</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.mwHBookCoverEntity.coverLanguage %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">作者简介</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.mwHBookCoverEntity.bookDetailAuthorMsg %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">图书基本信息（内容简介、前后勒口、封底、请附电子稿）</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.mwHBookCoverEntity.bookDetailSketched %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">风格定位</label>
        <div class="col-xs-10">
          <div class="form-control no-border" id="styleListBot">
            <% for(var i=0;i< info.styleList.length;i++ ) {%>
            <label class="control-label" style="width: 16%;text-align: left"><input data-id="<%-
          info.styleList[i].codeId %>" style="float: left;margin-top:
        2px;margin-right: 8px" type="checkbox" disabled/><%-
              info.styleList[i].value%></label>
            <% } %>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">其他相关设计</label>
        <div class="col-xs-10">
          <div class="form-control no-border" id="otherListBot">
            <% for(var i=0;i< info.otherList.length;i++ ) {%>
            <label class="control-label" style="width: 16%;text-align: left"><input data-id="<%-
              info.otherList[i].codeId %>" style="float: left;margin-top:
            2px;margin-right: 8px" type="checkbox" disabled/><%-
              info.otherList[i].value%></label>
            <% } %>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">是否考虑特种工艺</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.mwHBookCoverEntity.isSpecialCrafts ==='1') { %>
            是
            <% } else{ %>
            否
            <% } %>
          </p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group m-t-10">
        <label class="col-xs-4 control-label" style="margin-top: -4px">是否考虑特种纸</label>
        <div class="col-xs-8">
          <p class="form-control-static">
            <% if(info.mwHBookCoverEntity.isSpecialPaper ==='1') { %>
            是
            <% } else{ %>
            否
            <% } %>
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <label class="col-xs-2 control-label">设计要求与建议</label>
        <div class="col-xs-10">
          <pre class="form-control-static"><%- info.mwHBookCoverEntity.requireProposal %></pre>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交人</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.submitUserName %></p>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
      <div class="form-group">
        <label class="col-xs-4 control-label">提交时间</label>
        <div class="col-xs-8">
          <p class="form-control-static"><%- info.submitDatetime %></p>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>
