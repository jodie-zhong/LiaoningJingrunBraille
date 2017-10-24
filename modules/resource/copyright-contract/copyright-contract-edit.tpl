<div class="modal-dialog dialog-container">
  <div class="modal-content">
    <div class="panel">
    	<div class="panel-header">
        <h3><i class="fa fa-user-o"></i> 续约合同</h3>
        <div class="control-btn">
          <a class="panel-close btn-close"><i class="fa fa-close"></i></a>
        </div>
      </div>
      <div class="panel-content">
        <div class="form-horizontal" id="formContractEdit">
        	<input type="hidden" type="text" name="contractId" value="<%- info.contractId %>" />
        	<input type="hidden" type="text" name="contractSignId" value="<%- info.contractSignId %>" />
          <div class="row">
          	<div class="col-xs-12">
          		<div class="form-group">
          			<label class="col-xs-2 control-label">续约到期日期<span class="must">*</span></label>
          			<div class="col-xs-4">
          				<input type="text" class="form-control date-time" data-fv-notempty="true" data-fv-notempty-message="请选择续约到期日期" name="contractSignEndDate"
												 value="<%- info.contractSignEndDate %>" />
          			</div>
          		</div>
          	</div>
          </div>
          <div class="row">
          	<div class="col-xs-12">
          		<div class="form-group">
          			<label class="col-xs-2 control-label">合同附件</label>
          			<div class="col-xs-10">
          				<table class="table table-striped">
          					<thead>
          						<tr>
          							<th style="width: 50px;">序号</th>
          							<th>合同附件</th>
          							<th style="width: 110px;">操作</th>
          						</tr>
          					</thead>
          					<tbody data-type = "edit">
          						<% if(!info.contractFileEntities) { %>
          						<tr data-area = "contract">
          							<td data-value="number"></td>
          							<td>
          								<div class="input-group with-clear">
														<input type="text" class="form-control" name="contractFileName" value="" data-value="" placeholder="合同附件" readonly>
														<span class="input-group-btn">
                    					<button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                      				<button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*doc,*.docx,*.pdf,*.jpg,*.jpeg,*.png"}'><i class="fa fa-file-o"></i></button>
                    				</span>
													</div>
          							</td>
          							<td>
          								<button class="btn btn-xs btn-success" data-type="contract-plus"><i class="fa fa-plus box"></i></button>
          								<button class="btn btn-xs btn-danger" data-type="contract-minus"><i class="fa fa-close box"></i></button>
          							</td>
          						</tr>
          						<% } else { %>
          						<% for(var i = 0; i < info.contractFileEntities.length; i++) { %>
          						<tr data-area = "contract">
          							<td data-value="number"><%- i+1 %></td>
          							<td>
          								<div class="input-group with-clear">
														<input type="text" class="form-control" name="contractFileName" value="<%- info.contractFileEntities[i].contractFileName %>" data-value="<%- info.contractFileEntities[i].contractFilePath %>" placeholder="合同附件" readonly>
														<span class="input-group-btn">
                    					<button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                      				<button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*doc,*.docx,*.pdf,*.jpg,*.jpeg,*.png"}'><i class="fa fa-file-o"></i></button>
                    				</span>
													</div>
          							</td>
          							<td>
          								<button class="btn btn-xs btn-success" data-type="contract-plus"><i class="fa fa-plus box"></i></button>
          								<button class="btn btn-xs btn-danger" data-type="contract-minus"><i class="fa fa-close box"></i></button>
          							</td>
          						</tr>
          						<% } %>
          						<% } %>
          					</tbody>
          				</table>
                </div>
          		</div>
          	</div>
          </div>
          <div class="row">
          	<div class="col-xs-12">
          		<div class="form-group">
          			<label class="col-xs-2 control-label">备注</label>
          			<div class="col-xs-10">
          				<textarea class="form-control" name="remark" placeholder="备注" maxlength="1024"><%- info.remark %></textarea>
									<div><label class="len">0/1024</label></div>
          			</div>
          		</div>
          	</div>
          </div>
          <div class="dialog-options">
            <button class="btn btn-primary" id="btnContractSave">保存</button>
            <button class="btn btn-primary" id="btnContractSubmit">提交</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>