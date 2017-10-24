<!-- 生产通知单填写 -->
<% if(isEdit) { %>
<div class="form-horizontal" id="formEdit">
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">书名</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.bookName %>" name="bookName" readonly />
					<input type="hidden" name="hBookPrintId" value="<%- info.hBookPrintId %>" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">印制状态</label>
				<div class="col-xs-8">
					<% if(info.printState === '1') { %>
					<input type="text" class="form-control" value="新书" readonly />
					<% } else { %>	
					<input type="text" class="form-control" value="重印" readonly />
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">责任编辑</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.bookDetailDutyEditor %>" name="bookDetailDutyEditor" readonly />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">编室</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.editRoom %>" name="editRoom" readonly />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">印数</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.printNum %>" name="printNum" placeholder="印数" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">页数</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.pageNum %>" name="pageNum" placeholder="页数" maxlength="7" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印张</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.printSheet %>" name="printSheet" placeholder="印张" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">成品尺寸(mm)</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.finishedSize%>" name="finishedSize" placeholder="成品尺寸(mm)" maxlength="16"/>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">开本</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.format %>" name="format" placeholder="开本" maxlength="10" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">定价<span class="must">*</span></label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.pricing %>" name="pricing" placeholder="定价" maxlength="10" pattern="^(([1-9][0-9]{0,6})|([0-9]\.[0-9]{1,2})|([1-9][0-9]{0,6}\.[0-9]{1,2}))$" data-fv-regexp-message="请输入大于0小于10000000的数字（允许两位小数）" data-fv-notempty="true" data-fv-notempty-message="请填写定价" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">		
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">样书数量<span class="must">*</span></label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.authorStylebookNum %>" name="authorStylebookNum" placeholder="样书数量" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" data-fv-notempty="true" data-fv-notempty-message="请填写样书数量" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">版次</label>
				<div class="col-xs-2">
					<input type="text" class="form-control" value="<%- info.editionDate %>" name="editionDate" maxlength="7" />
				</div>
				<div class="col-xs-3">
					<div class="input-group">
						<span class="input-group-addon">第</span>
						<input type="text" class="form-control" value="<%- info.editionNum %>" name="editionNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
						<span class="input-group-addon">版</span>
					</div>
				</div>
				<div class="col-xs-2">
					<input type="text" class="form-control" value="<%- info.editionPrintDate %>" name="editionPrintDate" maxlength="7" />
				</div>
				<div class="col-xs-3">
					<div class="input-group">
						<span class="input-group-addon">第</span>
						<input type="text" class="form-control" value="<%- info.editionPrintNum %>" name="editionPrintNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
						<span class="input-group-addon">次印刷</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">出版单位</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.publisher %>" name="publisher" placeholder="出版单位" maxlength="10" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印刷企业</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.printingEnterprise %>" name="printingEnterprise" placeholder="印刷企业" maxlength="10" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">封面用纸</label>
				<div class="col-xs-4">
					<div class="input-group">
						<input type="text" class="form-control" value="<%- info.coverGram %>" name="coverGram" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数" />
						<span class="input-group-addon">克</span>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="input-group">
						<input type="text" class="form-control" value="<%- info.coverPaper %>" name="coverPaper" maxlength="10" />
						<span class="input-group-addon">纸</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印刷色数</label>
				<div class="col-xs-8">
					<select name="coverColor" class="form-control">
						<% if(!info.coverColor || info.coverColor === '1') { %>
						<option value="1" selected>单色</option>
						<option value="2">两色</option>
						<option value="3">四色</option>
						<% } else if(info.coverColor === '2') { %>
						<option value="1">单色</option>
						<option value="2" selected>两色</option>
						<option value="3">四色</option>
						<% } else { %>
						<option value="1">单色</option>
						<option value="2">两色</option>
						<option value="3" selected>四色</option>
						<% } %>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">勒口</label>
				<div class="col-xs-8">
					<label class="radio-inline">
            <% if(!info.flap || info.flap === '1') { %>
            <input type="radio" name="flap" value="1" checked/>有
            <% } else { %>
            <input type="radio" name="flap" value="1"/>有
            <% } %>
          </label>
					<label class="radio-inline">
            <% if(info.flap === '2') { %>
            <input type="radio" name="flap" value="2" checked/>无
            <% } else { %>
            <input type="radio" name="flap" value="2"/>无
            <% } %>
          </label>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">尺寸</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.flapSize %>" name="flapSize" placeholder="尺寸" maxlength="10" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">封面用纸总量(令)</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.coverPaperTotalNum %>" name="coverPaperTotalNum" placeholder="封面用纸总量(令)" maxlength="10" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">用纸规格</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.coverPaperSpecification %>" name="coverPaperSpecification" placeholder="用纸规格" maxlength="10" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">用纸供应</label>
				<div class="col-xs-4">
					<select name="coverPaperSupply" class="form-control">
						<% if(!info.coverPaperSupply || info.coverPaperSupply === '1') { %>
						<option value="1" selected>厂供</option>
						<option value="2">社供</option>
						<% } else { %>
						<option value="1">厂供</option>
						<option value="2" selected>社供</option>
						<% } %>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">正文用纸</label>
				<div class="col-xs-4">
					<div class="input-group">
						<input type="text" class="form-control" value="<%- info.textPaperGram %>" name="textPaperGram" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数" />
						<span class="input-group-addon">克</span>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="input-group">
						<input type="text" class="form-control" value="<%- info.textPaperNum %>" name="textPaperNum" maxlength="10" />
						<span class="input-group-addon">纸</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印刷色数</label>
				<div class="col-xs-8">
					<select name="textPaperPrintColor" class="form-control">
						<% if(!info.textPaperPrintColor || info.textPaperPrintColor === '1') { %>
						<option value="1" selected>单色</option>
						<option value="2">两色</option>
						<option value="3">四色</option>
						<% } else if(info.textPaperPrintColor === '2') { %>
						<option value="1">单色</option>
						<option value="2" selected>两色</option>
						<option value="3">四色</option>
						<% } else { %>
						<option value="1">单色</option>
						<option value="2">两色</option>
						<option value="3" selected>四色</option>
						<% } %>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">正文用纸总量(令)</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.textPaperTotalNum %>" name="textPaperTotalNum" placeholder="正文用纸总量(令)" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">用纸规格</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.textPaperSpecification %>" name="textPaperSpecification" placeholder="用纸规格" maxlength="10" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">用纸供应</label>
				<div class="col-xs-4">
					<select name="textPaperSupply" class="form-control">
						<% if(!info.textPaperSupply || info.textPaperSupply === '1') { %>
						<option value="1" selected>厂供</option>
						<option value="2">社供</option>
						<% } else { %>
						<option value="1">厂供</option>
						<option value="2" selected>社供</option>
						<% } %>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">彩插</label>
				<div class="col-xs-8">
					<label class="radio-inline">
            <% if(!info.colorInsert || info.colorInsert === '1') { %>
            <input type="radio" name="colorInsert" value="1" checked/>有
            <% } else { %>
            <input type="radio" name="colorInsert" value="1"/>有
            <% } %>
          </label>
					<label class="radio-inline">
            <% if(info.colorInsert === '2') { %>
            <input type="radio" name="colorInsert" value="2" checked/>无
            <% } else { %>
            <input type="radio" name="colorInsert" value="2"/>无
            <% } %>
          </label>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">页数</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" name="colorInsertNum" value="<%- info.colorInsertNum %>" placeholder="页数" maxlength="7" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">彩插用纸</label>
				<div class="col-xs-4">
					<div class="input-group">
						<input type="text" class="form-control" value="<%- info.colorInsertGram %>" name="colorInsertGram" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数" />
						<span class="input-group-addon">克</span>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="input-group">
						<input type="text" class="form-control" value="<%- info.colorInsertPaper %>" name="colorInsertPaper" maxlength="10" />
						<span class="input-group-addon">纸</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印刷色数</label>
				<div class="col-xs-8">
					<select name="colorInsertPringNum" class="form-control">
						<% if(!info.colorInsertPringNum || info.colorInsertPringNum === '1') { %>
						<option value="1" selected>单色</option>
						<option value="2">两色</option>
						<option value="3">四色</option>
						<% } else if(info.colorInsertPringNum === '2') { %>
						<option value="1">单色</option>
						<option value="2" selected>两色</option>
						<option value="3">四色</option>
						<% } else { %>
						<option value="1">单色</option>
						<option value="2">两色</option>
						<option value="3" selected>四色</option>
						<% } %>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">装订方式</label>
				<div class="col-xs-8">
					<select name="bindingStyle" class="form-control" id="bindingStyle"></select>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">封面装订处理</label>
				<div class="col-xs-8">
					<select name="usePaperBinding" class="form-control" id="usePaperBinding"></select>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">晒上版</label>
				<div class="col-xs-5">
					<div class="input-group">
						<span class="input-group-addon">封面</span>
						<select name="editionCover" class="form-control">
							<% if(!info.editionCover || info.editionCover === '1') { %>
							<option value="1" selected>胶片</option>
							<option value="2">打样</option>
							<option value="3">工艺</option>
							<% } else if(info.editionCover === '2') { %>
							<option value="1">胶片</option>
							<option value="2" selected>打样</option>
							<option value="3">工艺</option>
							<% } else { %>
							<option value="1">胶片</option>
							<option value="2">打样</option>
							<option value="3" selected>工艺</option>
							<% } %>
						</select>
					</div>
				</div>
				<div class="col-xs-5">
					<div class="input-group">
						<span class="input-group-addon">正文</span>
						<select name="editionText" class="form-control">
							<% if(!info.editionText || info.editionText === '1') { %>
							<option value="1" selected>胶片</option>
							<option value="2">打样</option>
							<option value="3">清样</option>
							<% } else if(info.editionText === '2') { %>
							<option value="1">胶片</option>
							<option value="2" selected>打样</option>
							<option value="3">清样</option>
							<% } else { %>
							<option value="1">胶片</option>
							<option value="2">打样</option>
							<option value="3" selected>清样</option>
							<% } %>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label"></label>
				<div class="col-xs-5">
					<div class="input-group">
						<span class="input-group-addon">环衬</span>
						<select name="editionPastedown" class="form-control">
							<% if(!info.editionPastedown || info.editionPastedown === '1') { %>
							<option value="1" selected>胶片</option>
							<option value="2">打样</option>
							<% } else { %>
							<option value="1">胶片</option>
							<option value="2" selected>打样</option>
							<% } %>
						</select>
					</div>
				</div>
				<div class="col-xs-5">
					<div class="input-group">
						<span class="input-group-addon">彩插</span>
						<select name="editionColorInsert" class="form-control">
							<% if(!info.editionColorInsert || info.editionColorInsert === '1') { %>
							<option value="1" selected>胶片</option>
							<option value="2">打样</option>
							<option value="3">清样</option>
							<% } else if(info.editionColorInsert === '2') { %>
							<option value="1">胶片</option>
							<option value="2" selected>打样</option>
							<option value="3">清样</option>
							<% } else { %>
							<option value="1">胶片</option>
							<option value="2">打样</option>
							<option value="3" selected>清样</option>
							<% } %>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">装订顺序</label>
				<div class="col-xs-10">
					<textarea class="form-control" name="bindingOrder" placeholder="装订顺序（不超过1024字）" maxlength="1024"><%- info.bindingOrder %></textarea>
					<div><label class="len">0/1024</label></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">交货日期</label>
				<div class="col-xs-4">
					<input type="text" class="form-control date-time-all" value="<%- info.deliveryDate %>" name="deliveryDate" maxlength="10" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">验收入库</label>
				<div class="col-xs-10">
  				<table class="table table-striped">
  					<thead>
  						<tr>
  							<th style="width: 50px;">序号</th>
  							<th width="130px">日期<span class="must-td">*</span></th>
  							<th>内容<span class="must-td">*</span></th>
  							<th style="width: 100px;">操作</th>
  						</tr>
  					</thead>
  					<tbody data-wrap = "contrat">
  						<% if(!info.checkList.length) { %>
  						<tr data-area = "contrat">
  							<td data-type = "number"></td>
  							<td class="form-group">
  								<input type="text" class="form-control date-time-all" name="hInStorageDate" value="" placeholder="日期" maxlength="10" data-fv-notempty="true" data-fv-notempty-message="请选择日期" >
  							</td>
  							<td class="form-group">
  								<input type="text" class="form-control" name="hInStorageContent" value="" placeholder="内容" maxlength="1024" data-fv-notempty="true" data-fv-notempty-message="请输入内容" />
  							</td>	
  							<td>
  								<button class="btn btn-xs btn-success" data-type="contract-plus"><i class="fa fa-plus box"></i></button>
  								<button class="btn btn-xs btn-danger" data-type="contract-minus"><i class="fa fa-close box"></i></button>
  							</td>
  						</tr>
  						<% } else { %>
  						<% for(var i =0; i < info.checkList.length; i++) { %>
  						<tr data-area = "contrat">
  							<td data-type = "number"></td>
  							<td class="form-group">
  								<input type="text" class="form-control date-time-all" name="hInStorageDate" value="<%- info.checkList[i].hInStorageDate %>" placeholder="日期" maxlength="10" data-fv-notempty="true" data-fv-notempty-message="请选择日期" >
  							</td>
  							<td class="form-group">
  								<input type="text" class="form-control" name="hInStorageContent" value="<%- info.checkList[i].hInStorageContent %>" placeholder="内容" maxlength="1024" data-fv-notempty="true" data-fv-notempty-message="请输入内容" />
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
				<label class="col-xs-2 control-label">验收入库备注</label>
				<div class="col-xs-4">
					<select name="inWarehouseRemark" class="form-control">
						<% if(!info.inWarehouseRemark || info.inWarehouseRemark === '1') { %>
						<option value="1" selected>提供样书</option>
						<option value="2">测试册数照上次</option>
						<option value="3">一般按自然包</option>
						<option value="4">特殊情况另议</option>
						<% } else if(info.inWarehouseRemark === '2') { %>
						<option value="1">提供样书</option>
						<option value="2" selected>测试册数照上次</option>
						<option value="3">一般按自然包</option>
						<option value="4">特殊情况另议</option>
						<% } else if(info.inWarehouseRemark === '3') { %>
						<option value="1">提供样书</option>
						<option value="2">测试册数照上次</option>
						<option value="3" selected>一般按自然包</option>
						<option value="4">特殊情况另议</option>
						<% } else { %>
						<option value="1">提供样书</option>
						<option value="2">测试册数照上次</option>
						<option value="3">一般按自然包</option>
						<option value="4" selected>特殊情况另议</option>
						<% } %>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">备注</label>
				<div class="col-xs-10">
					<textarea class="form-control" name="remark" placeholder="备注（不超过1024字）" maxlength="1024"><%- info.remark %></textarea>
					<div><label class="len">0/1024</label></div>
				</div>
			</div>
		</div>
	</div>
	<% if(info.userTaskEntities) { %>
	<% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">下一流程</label>
				<div class="col-xs-8">
					<% if(!info.userTaskEntities[i].deptAndRoles) { %>
					<p class="form-control-static">
						<%- info.userTaskEntities[i].flowName %>
					</p>
					<% } else { %>
					<p class="form-control-static">
						<%- info.userTaskEntities[i].flowName %>（
						<%- info.userTaskEntities[i].deptAndRoles %>）
					</p>
					<% } %>
					<input type="hidden" name="flowId" value="<%- info.userTaskEntities[i].flowId %>">
					<input type="hidden" name="flowName" value="<%- info.userTaskEntities[i].flowName %>">
					<input type="hidden" name="nextCategory" value="<%- info.userTaskEntities[i].category %>">
					<input type="hidden" name="deptIds" value="<%- info.userTaskEntities[i].deptIds %>">
					<input type="hidden" name="roleIds" value="<%- info.userTaskEntities[i].roleIds %>">
					<input type="hidden" name="taskId" value="<%- info.taskId %>">
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<% if(info.userTaskEntities[i].roleIds) { %>
			<div class="form-group">
				<label class="col-xs-4 control-label">任务人<span class="must">*</span></label>
				<div class="col-xs-8">
					<div class="input-group with-clear">
						<input type="text" class="form-control" name="taskUsers" title="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" value="<%- info.userTaskEntities[i].nextFlowTaskUserNames %>" data-value="<%- info.userTaskEntities[i].nextFlowTaskUserIds %>" placeholder="任务人" readonly data-data="{searchRoleId: '', searchDepartmentId: ''}" data-fv-notempty="true" data-fv-notempty-message="请选择下一任务人">
						<span class="input-group-btn">
              <button class="btn btn-clear" type="button" data-action="clear" ><i class="fa fa-remove box"></i></button>
              <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'><i
                      class="fa fa-user-o"></i></button>
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
			<div class="form-group ">
				<label class="col-xs-4 control-label">书名</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.bookName%></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">印制状态</label>
				<div class="col-xs-8">
					<p class="form-control-static">
					<% if(info.printState === '1') { %>
					新书
					<% } else { %>	
					重印
					<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">责任编辑</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.dutyEditor %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">编室</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.editRoom %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">印数</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.printNum %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">页数</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.pageNum %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印张</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.printSheet %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">图书种类</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.printType === '1') { %>
						大字版
						<% } else if(info.printType === '2') { %>
						教材
						<% } else if(info.printType === '3') { %>
						普通
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">成品尺寸(mm)</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.finishedSize %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">开本</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.format %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">定价</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.pricing %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">作者样书数量</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.authorStylebookNum %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">版次</label>
				<div class="col-xs-5">
					<p class="form-control-static"><%- info.editionDate %>第<%- info.editionNum %>版</p>
				</div>
				<div class="col-xs-5">
					<p class="form-control-static"><%- info.editionPrintDate %>第<%- info.editionPrintNum %>次印刷</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">出版单位</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.publisher %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印刷企业</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.printingEnterprise === '1') { %>
						社内
						<% } else { %>
						其他
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">封面用纸</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.coverGram %>克<%- info.coverPaper %>纸</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印刷色数</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.coverColor === '1') { %>
						单色
						<% } else if(info.coverColor === '2') { %>
						两色
						<% } else { %>
						四色
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">封面用纸总量(令)</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.coverPaperTotalNum %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">用纸规格</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.coverPaperSpecification %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">用纸供应</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<% if(info.coverPaperSupply === '1') { %>
						厂供
						<% } else { %>
						社供
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">环衬</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<% if(info.endPaper === '1') { %>
            前
            <% } else if(info.endPaper === '2') { %>
            后
            <% } %>
					</p>
				</div>
				<div class="col-xs-6">
					<p class="form-control-static"><%- info.endPaperGram %>克<%- info.endPaperNum %>纸</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">勒口</label>
				<div class="col-xs-8">
					<p class="form-control-static">
            <% if(info.flap === '1') { %>
            有
            <% } else if(info.flap === '2') { %>
            无
            <% } %>
          </p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">尺寸</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.flapSize %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">正文用纸总量(令)</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.textPaperTotalNum %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">用纸规格</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.textPaperSpecification %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">用纸供应</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<% if(info.textPaperSupply === '1') { %>
						厂供
						<% } else if(info.textPaperSupply === '2') { %>
						社供
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">彩插</label>
				<div class="col-xs-8">
					<p class="form-control-static">
            <% if(info.colorInsert === '1') { %>
            有
            <% } else if(info.colorInsert === '2') { %>
            无
            <% } %>
          </p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">页数</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.colorInsertNum %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">彩插用纸</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.colorInsertGram %>克<%- info.colorInsertPaper %>纸</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印刷色数</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.colorInsertPringNum === '1') { %>
						单色
						<% } else if(info.colorInsertPringNum === '2') { %>
						两色
						<% } else { %>
						四色
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">装订方式</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.bindingStyle === '1') { %>
						精装
						<% } else if(info.bindingStyle === '2') { %>
						索线
						<% } else if(info.bindingStyle === '3') { %>
						骑马钉
						<% } else if(info.bindingStyle === '4') { %>
						胶钉
						<% } else if(info.bindingStyle === '5') { %>
						折页
						<% } else { %>
						其他
						<% } %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">封面装订处理</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.usePaperBinding === '1') { %>
						光亮膜
						<% } else if(info.usePaperBinding === '2') { %>
						亚光膜
						<% } else if(info.usePaperBinding === '3') { %>
						UV
						<% } else if(info.usePaperBinding === '4') { %>
						烫金
						<% } else if(info.usePaperBinding === '5') { %>
						磨砂
						<% } else if(info.usePaperBinding === '6') { %>
						烫黑
						<% } else if(info.usePaperBinding === '7') { %>
						烫银
						<% } else if(info.usePaperBinding === '8') { %>
						压凹
						<% } else { %>
						起鼓
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">晒上版</label>
				<div class="col-xs-5">
					<div class="input-group">
						<p class="form-control-static">
							封面:
							<% if(info.editionCover === '1') { %>
							胶片
							<% } else if(info.editionCover === '2') { %>
							打样
							<% } else { %>
							工艺
							<% } %>
						</p>
					</div>
				</div>
				<div class="col-xs-5">
					<div class="input-group">
						<p class="form-control-static">
							正文:
							<% if(info.editionText === '1') { %>
							胶片
							<% } else if(info.editionText === '2') { %>
							打样
							<% } else { %>
							清样
							<% } %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label"></label>
				<div class="col-xs-5">
					<div class="input-group">
						<p class="form-control-static">
							环衬:
							<% if(info.editionPastedown === '1') { %>
							胶片
							<% } else { %>
							打样
							<% } %>
						</p>
					</div>
				</div>
				<div class="col-xs-5">
					<div class="input-group">
						<p class="form-control-static">
							彩插:
							<% if(info.editionColorInsert === '1') { %>
							胶片
							<% } else if(info.editionColorInsert === '2') { %>
							打样
							<% } else { %>
							清样
							<% } %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">装订顺序</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.bindingOrder %></pre>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">交货日期</label>
				<div class="col-xs-4">
					<p class="form-control-static"><%- info.deliveryDate %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">验收入库</label>
				<div class="col-xs-10">
  				<table class="table table-striped">
  					<thead>
  						<tr>
  							<th style="width: 50px;">序号</th>
  							<th>日期</th>
  							<th>内容</th>
  						</tr>
  					</thead>
  					<tbody>
  						<% for(var i =0; i < info.checkList.length; i++) { %>
  						<tr>
  							<td><% i+1 %></td>
  							<td>
  								<p class="form-control-static"><%- info.checkList[i].hInStorageDate %></p>
  							</td>
  							<td>
  								<p class="form-control-static"><%- info.checkList[i].hInStorageContent %></p>
  							</td>	
  						</tr>	
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
				<label class="col-xs-2 control-label">验收入库备注</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<% if(info.inWarehouseRemark === '1') { %>
						提供样书
						<% } else if(info.inWarehouseRemark === '2') { %>
						测试册数照上次
						<% } else if(info.inWarehouseRemark === '3') { %>
						一般按自然包
						<% } else if(info.inWarehouseRemark === '4') { %>
						特殊情况另议
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">备注</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.remark %></pre>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">提交人</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.submitUserName %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">提交时间</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.submitDatetime %>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<% } %>