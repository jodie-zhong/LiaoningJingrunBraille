<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
      <div class="panel-header border-bottom" style="font-size: 0">
        <h3 style="display:inline-block;width: 7%">
          <strong id="bookFile">成品文件</strong>
        </h3>
        <div class="dis-inline-b text-center" style="width: 93%">
        <span class="f-14 dis-inline-b m-r-30 titleBookName">图书名称：暂无</span>
        <span class="f-14 dis-inline-b titleDutyEditor">责任编辑：暂无</span>
        </div>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal">
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group">
                <div class="col-xs-12">
                  <table class="table table-striped table-nowrap table-top">
                    <thead>
                    <tr>
                      <th style="width: 50px">序号</th>
                      <th style="width:200px">分册书名</th>
                      <th style="width: 150px">类型</th>
                      <th style="width: 200px">附件名称</th>
                      <th style="width: 150px" class="text-center">操作</th>
                    </tr>
                    </thead>
                  </table>
                  <div class="tbody-10-static">
                    <table class="table table-striped table-nowrap">
                      <tbody>
                      <% if(info.bookLibraryFileEntities.length) { %>
                      <% for(var i = 0; i < info.bookLibraryFileEntities.length; i++) { %>
                      <tr>
                        <td style="width: 50px"><%- (i+1) %></td>
                        <td style="width:200px" title="<%- info.bookLibraryFileEntities[i].bookFascicleBookName %>"><%-
                          info.bookLibraryFileEntities[i].bookFascicleBookName %>
                        </td>
                        <td style="width: 150px" title="<%- info.bookLibraryFileEntities[i].bookFileTypeName %>"><%-
                          info.bookLibraryFileEntities[i].bookFileTypeName %>
                        </td>
                        <td class="bookFileName" style="width: 200px" title="<%- info.bookLibraryFileEntities[i].bookFileName %>"><%-
                          info.bookLibraryFileEntities[i].bookFileName %>
                        </td>
                        <td style="width: 150px" class="text-center">
                          <% if(!info.bookLibraryFileEntities[i].bookFileAddress ||
                          info.bookLibraryFileEntities[i].bookFileAddress === '') { %>
                          <button class="btn btn-default btn-sm m-t-5 btn-rounded btn-download"
                                  data-download="<%- info.bookLibraryFileEntities[i].bookFileAddress %>" disabled>下载
                          </button>
                          <% if((info.bookType==='1' && (info.bookLibraryFileEntities[i].bookFileType === '3'
                          || info.bookLibraryFileEntities[i].bookFileType === '4'||
                          info.bookLibraryFileEntities[i].bookFileType
                          === '5'|| info.bookLibraryFileEntities[i].bookFileType ===
                          '6'|| info.bookLibraryFileEntities[i].bookFileType === '7' ))||((info.bookType==='2' ||
                          info.bookType==='3' ) &&
                          info.bookLibraryFileEntities[i].bookFileType === '5')) { %>
                          <button class="btn btn-default btn-sm m-t-5 btn-rounded btn-preview"
                                  data-preview="<%- info.bookLibraryFileEntities[i].bookFileAddress %>" disabled>预览
                          </button>
                          <% } %>
                          <% } else { %>
                          <button class="btn btn-default btn-sm m-t-5 btn-rounded btn-download"
                                  data-download="<%- info.bookLibraryFileEntities[i].bookFileAddress %>">下载
                          </button>
                          <% if((info.bookType==='1' && (info.bookLibraryFileEntities[i].bookFileType === '3'
                          || info.bookLibraryFileEntities[i].bookFileType === '4'||
                          info.bookLibraryFileEntities[i].bookFileType
                          === '5'|| info.bookLibraryFileEntities[i].bookFileType ===
                          '6'|| info.bookLibraryFileEntities[i].bookFileType === '7' ))||((info.bookType==='2' ||
                          info.bookType==='3' ) &&
                          info.bookLibraryFileEntities[i].bookFileType === '5')) { %>
                          <button class="btn btn-default btn-sm m-t-5 btn-rounded btn-preview"
                                  data-preview="<%- info.bookLibraryFileEntities[i].bookFileAddress %>">预览
                          </button>
                          <% } %>
                          <% } %>
                        </td>
                      </tr>
                      <% } %>
                      <% } else { %>
                      <tr>
                        <td colspan="5">
                          <p class="empty-tips">没有符合指定条件的数据</p>
                        </td>
                      </tr>
                      <% } %>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>