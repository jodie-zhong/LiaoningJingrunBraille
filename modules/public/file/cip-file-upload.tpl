<div class="modal-dialog dialog-container" style="width: 500px;">
	<div class="modal-content">
		<div class="panel file-upload">
			<div class="panel-header border-bottom">
				<h3><i class="fa fa-file-o"></i> 文件上传</h3>
				<div class="control-btn">
					<a class="panel-close btn-close"><i class="fa fa-close"></i></a>
				</div>
			</div>
			<div class="panel-content">
				<div style="margin-bottom: 10px;">
					<img id="uploadPreview" class="image-preview" style="display: none;" />
				</div>
				<div class="form-horizontal" id="formSearchUser">
					<div class="row">
						<div class="col-xs-12">
							<div class="input-group with-clear">
								<input type="text" data-vale = "showFile" class="form-control" placeholder="请选择文件" />
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" style="width: auto;">选择文件</button>
								</span>
							</div>
							<input type="file" class="form-control" name="file" id="inputFileUpload" style="position: absolute; top: -3px; left: 0; opacity: 0; z-index: 99;" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="progress progress-striped active progress-bar-large" id="progressFileUpload" style="display: none;">
								<div class="progress-bar progress-bar-primary" style="width: 0%;"></div>
								<span>0%</span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="dialog-options">
								<button class="btn btn-primary" id="btnFileUpload">确定上传</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>