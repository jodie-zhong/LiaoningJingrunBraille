<!--查看上报-->
<div class="modal-dialog dialog-container">
	<div class="modal-content">
		<div class="panel">
			<div class="panel-header">
				<h3><i class="fa fa-user-o"></i> 查看列表</h3>
				<div class="control-btn">
					<a class="panel-close btn-close"><i class="fa fa-close"></i></a>
				</div>
			</div>
			<div class="panel-content">
				<div class="table-10-static">
					<table class="table table-striped table-nowrap table-hover" id="selectTopicContentTable">
						<thead>
							<tr>
								<th class="w-table">序号</th>
								<th class="w-100">选题名称</th>
								<th class="w-100">作者</th>
								<th class="w-table">字数</th>
								<th class="w-100">类别</th>
								<th class="w-100">讨论结果</th>
								<th class="w-100">任务人</th>
								<th class="w-100">备注</th>
								<th class="w-100">选题编辑</th>
							</tr>
						</thead>
						<tbody id="selectTopicTable">
								<% if(list.length > 0) { %>
								<% for(var i = 0; i < list.length; i++) { %>
								<tr data-id="<%- list[i].topicId %>" data-name="<%- list[i].topicDetailName %>">
									<td ><%- (i + 1) %></td>
									<td title="<%- list[i].topicDetailName %>"><%- list[i].topicDetailName %></td>
									<td title="<%- list[i].topicDetailOldAuthor %>"><%- list[i].topicDetailOldAuthor %></td>
									<td title="<%- list[i].topicDetailWords %>"><%- list[i].topicDetailWords %></td>
									<td title="<%- list[i].topicDetailOneKindName %>"><%- list[i].topicDetailOneKindName %></td>
									<td>
										<% if(list[i].result==='1') {%>
										通过
										<% }else if(list[i].result==='2') {%>
										不通过
										<% }else if(list[i].result==='3') {%>
										待定
										<% }else {%>
										暂无结果
										<% }%>
									</td>
									<td title="<%- list[i].taskUserNames %>"><%- list[i].taskUserNames || '无' %></td>
									<td title="<%- list[i].remark %>"><%- list[i].remark %></td>
									<td title="<%- list[i].createUserName %>"><%- list[i].createUserName %></td>
								</tr>
								<% } %>
								<% } else { %>
								<tr>
									<td colspan="9"><p class="empty-tips">没有符合指定条件的数据</p></td>
								</tr>
								<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>