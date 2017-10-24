<!-- 图书印制通知单 -->
<% if(isEdit) { %>
<div class="form-horizontal">
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">书名</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.bookName %>" name="bookName" readonly />
					<input type="hidden" name="isUse" value="1" />
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
					<input type="text" class="form-control" value="<%- info.pageNum %>" name="pageNum" readonly />
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
					<input type="text" class="form-control" value="<%- info.finishedSize%>" name="finishedSize" placeholder="成品尺寸(mm)" maxlength="16" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">开本</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.format %>" name="format" placeholder="开本" readonly />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">定价</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.pricing %>" name="pricing" placeholder="定价" readonly />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">作者样书数量</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.authorStylebookNum %>" name="authorStylebookNum" placeholder="作者样书数量" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">版次</label>
				<div class="col-xs-2">
					<input type="text" class="form-control date-time" value="<%- info.editionDate %>" name="editionDate" maxlength="7" />
				</div>
				<div class="col-xs-3">
					<div class="input-group">
						<span class="input-group-addon">第</span>
						<input type="text" class="form-control" value="<%- info.editionNum %>" name="editionNum" maxlength="8" pattern="^[0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
						<span class="input-group-addon">版</span>
					</div>
				</div>
				<div class="col-xs-2">
					<input type="text" class="form-control date-time" value="<%- info.editionPrintDate %>" name="editionPrintDate" maxlength="7" />
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
						<input type="text" class="form-control" value="<%- info.coverGram %>" name="coverGram" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数"/>
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
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">环衬</label>
				<div class="col-xs-4">
					<label class="radio-inline">
            <% if(!info.endPaper || info.endPaper === '1') { %>
            <input type="radio" name="endPaper" value="1" checked/>前
            <% } else { %>
            <input type="radio" name="endPaper" value="1"/>前
            <% } %>
          </label>
					<label class="radio-inline">
            <% if(info.endPaper === '2') { %>
            <input type="radio" name="endPaper" value="2" checked/>后
            <% } else { %>
            <input type="radio" name="endPaper" value="2"/>后
            <% } %>
          </label>
				</div>
				<div class="col-xs-3">
					<div class="input-group">
						<input type="text" class="form-control" value="<%- info.endPaperGram %>" name="endPaperGram" maxlength="7" pattern="^(([1-9][0-9]{0,2})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,2}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入大于0的数字，允许三位小数" />
						<span class="input-group-addon">克</span>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="input-group">
						<input type="text" class="form-control" value="<%- info.endPaperNum %>" name="endPaperNum" maxlength="10" />
						<span class="input-group-addon">纸</span>
					</div>
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
					<input type="text" class="form-control" value="<%- info.flapSize %>" name="flapSize" maxlength="10" />
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
				<label class="col-xs-4 control-label">任务人<span class="c-red">*</span></label>
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
					<p class="form-control-static"><%- info.bookDetailDutyEditor %></p>
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
				<label class="col-xs-4 control-label">成品尺寸(mm)</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.finishedSize%></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">开本</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.format %></p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">定价</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.pricing %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
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
					<p class="form-control-static"><%- info.printingEnterprise %></p>
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
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">环衬</label>
				<div class="col-xs-4">
					<p class="form-control-static">
						<% if(info.endPaper === '1') { %>
            前
            <% } else { %>
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
            <% if(!info.flap || info.flap === '1') { %>
            有
            <% } else { %>
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
				<label class="col-xs-4 control-label">正文用纸</label>
				<div class="col-xs-8">
					<p class="form-control-static"><%- info.textPaperGram %>克<%- info.textPaperNum %>纸</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印刷色数</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.textPaperPrintColor === '1') { %>
						单色
						<% } else if(info.textPaperPrintColor === '2') { %>
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
				<label class="col-xs-4 control-label">彩插</label>
				<div class="col-xs-8">
					<p class="form-control-static">
            <% if(info.colorInsert === '1') { %>
            有
            <% } else { %>
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