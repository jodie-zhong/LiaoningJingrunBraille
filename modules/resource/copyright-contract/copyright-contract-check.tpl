<!-- 版权合同库 -->
<div class="modal-dialog dialog-container">
	<div class="modal-content">
		<div class="panel">
			<div class="panel-header">
        <h3><i class="fa fa-user-o"></i> 合同附件</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
      	<div class="form-horizontal">
      		<div class="row">
      			<div class="col-xs-12">
      				<div class="form-group">
      					<table class="table table-striped table-hover table-nowrap table-top">
      						<thead>
      							<tr>
      								<th width="50px">序号</th>
      								<th>附件</th>
      								<th width="80px">下载</th>
      								<th width="80px">预览</th>
      							</tr>
      						</thead>
      					</table>
      					<div class="table-10-static">
      						<table class="table table-striped table-nowrap">
      							<tbody>
      								<% for(var i = 0; i < info.length; i++) { %>
      								<tr>
      									<td width="50px"><%- i+1 %></td>
      									<td><%- info[i].contractFileName %></td>
      									<td width="80px"><button class="btn btn-default btn-rounded btn-xs" data-address="<%- info[i].contractFilePath %>" data-type = "down">下载</button></td>
      									<td width="80px"><button class="btn btn-default btn-rounded btn-xs" data-address="<%- info[i].contractFilePath %>" data-type = "review">预览</button></td>
      								</tr>
      								<% } %>
      							</tbody>
      						</table>
      					</div>
      					
      					<p></p>	
      					
      				</div>
      			</div>
      		</div>
      	</div>
      </div>
		</div>
	</div>
</div>