<div class="modal-dialog dialog-container">
	<div class="modal-content">
		<div class="panel">
			<div class="panel-header">
				<h3><i class="fa fa-television"></i> 培训查看</h3>
				<div class="control-btn">
					<a class="panel-close btn-close"><i class="fa fa-close"></i></a>
				</div>
			</div>
			<div class="panel-content">
				<div class="form-horizontal" id="formTrainEdit">
					<div class="row">
						<div class="col-xs-6">
							<div class="form-group">
								<label class="col-xs-4 control-label">培训名称</label>
								<div class="col-xs-8">
									<p class="form-control-static">
										<%- info.trainName %>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="form-group">
								<label class="col-xs-4 control-label">培训编号</label>
								<div class="col-xs-8">
									<p class="form-control-static">
										<%- info.trainNum %>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group">
								<label class="col-xs-2 control-label">培训单位</label>
								<div class="col-xs-10">
									<div class="input-group with-clear">
										<pre class="form-control-static"><%- info.trainUnitName %></pre>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group">
								<label class="col-xs-2 control-label">培训人员</label>
								<div class="col-xs-10">
									<div class="input-group with-clear">
										<pre class="form-control-static"><%- info.trainUserNames %></pre>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<div class="form-group">
								<label class="col-xs-4 control-label">培训时间</label>
								<div class="col-xs-8">
									<p class="form-control-static">
										<%- info.trainDatetime %>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="form-group">
								<label class=" col-xs-4 control-label">培训形式</label>
								<div class=" col-xs-8">
									<p class="form-control-static">
										<%- info.trainFormName %>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<div class="form-group">
								<label class="col-xs-4 control-label">培训课时</label>
								<div class=" col-xs-8">
									<p class="form-control-static">
										<%- info.trainHour %>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="form-group">
								<label class=" col-xs-4 control-label">培训积分</label>
								<div class=" col-xs-8">
									<p class="form-control-static">
										<%- info.trainIntegral %>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group">
								<label class="col-xs-2 control-label">培训内容</label>
								<div class="col-xs-10">
									<pre class="form-control-static"><%- info.trainContent %></pre>
								</div>
							</div>
						</div>
					</div>
					<div class="dialog-options">
						<button class="btn btn-primary" id="btnTrainClose">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>