<div class="form-horizontal">
  <div class="row">
    <div class="col-xs-12">
      <div class="form-group">
        <div class="col-xs-12">
          <table class="table table-striped table-hover table-nowrap">
            <thead>
            <tr>
              <th style="width: 50px">序号</th>
              <th style="width:200px">分册书名</th>
              <th style="width: 150px">类型</th>
              <th style="width: 200px">附件名称</th>
              <th style="width: 150px" class="text-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <% if(info.bookLibraryFileEntities.length > 0 ) { %>
            <% for(var i = 0; i < info.bookLibraryFileEntities.length; i++) { %>
            <tr>
              <td><%- (i+1) %></td>
              <td title="<%- info.bookLibraryFileEntities[i].bookFascicleBookName %>"><%-
                info.bookLibraryFileEntities[i].bookFascicleBookName %>
              </td>
              <td title="<%- info.bookLibraryFileEntities[i].bookFileTypeName %>"><%-
                info.bookLibraryFileEntities[i].bookFileTypeName %>
              </td>
              <td class="bookFileName" title="<%- info.bookLibraryFileEntities[i].bookFileName %>"><%-
                info.bookLibraryFileEntities[i].bookFileName %>
              </td>
              <td class="text-center">
                <% if(!info.bookLibraryFileEntities[i].bookFileAddress ||
                info.bookLibraryFileEntities[i].bookFileAddress === '') { %>
                <button class="btn btn-default btn-sm m-t-5 btn-rounded btn-download"
                        data-download="<%- info.bookLibraryFileEntities[i].bookFileAddress %>" disabled>下载
                </button>
                <% if((info.bookType==='1' && (info.bookLibraryFileEntities[i].bookFileType === '3'
                || info.bookLibraryFileEntities[i].bookFileType === '4'|| info.bookLibraryFileEntities[i].bookFileType
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
                || info.bookLibraryFileEntities[i].bookFileType === '4'|| info.bookLibraryFileEntities[i].bookFileType
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
            <% } else {%>
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