<!--书号和CIP申请信息-->
<div class="form-horizontal">
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
            <div class="form-group">
                <table class="table table-striped table-hover table-nowrap table-bordered">
                <thead>
                <tr>
                    <th class="text-center" style="width: 20%">图书名称</th>
                    <th class="text-center" style="width: 20%">是否通过</th>
                    <th class="text-center" style="width: 20%">未通过原因</th>
                    <th class="text-center" style="width: 20%">书号</th>
                    <th class="text-center" style="width: 20%">分类号</th>
                    <th class="text-center w-100">条形码</th>
                    <th class="text-center w-100">CIP信息</th>
                </tr>
                </thead>
                <tbody id="selectTopicTable">
                <tr>
                    <td class="text-center" title="<%- info.bookName %>"><%- info.bookName %></td>
                    <% if(info.isPass==='1'){ %>
                    <td class="text-center">通过</td>
                    <td></td>
                    <td class="text-center" title="<%- info.bookIsbn %>"><%- info.bookIsbn %></td>
                    <td class="text-center" title="<%- info.bookDetailClassNum %>"><%- info.bookDetailClassNum %></td>
                    <td>
                        <% if(!info.bookFileAddress || info.bookFileAddress === '') { %>
                        <button data-address="<%- info.bookFileAddress %>"
                                class="btn btn-default btn-sm btn-rounded address" disabled>下载</button>
                        <% } else { %>
                        <button data-address="<%- info.bookFileAddress %>"
                                class="btn btn-default btn-sm btn-rounded address">下载</button>
                        <% } %>
                    </td>
                    <td>
                        <button data-id="<%- info.bookId %>"
                                class="btn btn-default btn-sm btn-rounded cip-address">下载</button>

                    </td>
                    <% }else{ %>
                    <td class="text-center">未通过</td>
                    <td class="text-center" title="<%- info.notPassCause %>"><%- info.notPassCause %></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <% } %>
                </tr>
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>