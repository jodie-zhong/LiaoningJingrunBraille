<!--初审-->
<% if(isEdit) { %>
<script type="text/template" id="fascicleTemplate">
	<div data-area="fascicle" class="fascicle">
		<div class="row fascicle-top">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">分册序号<span class="must">*</span></label>
					<div class="col-xs-4">
						<input type="text" class="form-control" value="" name="bookFascicleBookName" placeholder="分册序号" maxlength="10" data-fv-mydiff="true" data-fv-mydiff-message="分册序号不能重复" data-fv-notempty="true" data-fv-notempty-message="请填写分册序号" />
					</div>
					<div class="col-xs-5"></div>
					<div class="col-xs-1">
						<button class="btn btn-xs btn-danger" data-type="page-minus"><i class="fa fa-close box"></i></button>
					</div>
				</div>
			</div>
		</div>
		<div class="row fascicle-between">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">分册字数(千字)<span class="must">*</span></label>
					<div class="col-xs-4">
						<input type="text" class="form-control" value="" name="bookFascicleWords" placeholder="分册字数(千字)" maxlength="8" pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$" data-fv-notempty="true" data-fv-notempty-message="请填写分册字数" data-fv-regexp-message="请输入小于10000的数字,允许三位小数" />
					</div>
				</div>
			</div>
		</div>
		<div class="row fascicle-between">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">盲文封面一</label>
					<div class="col-xs-4">
						<div class="input-group with-clear">
							<input type="text" class="form-control" name="bookFascicleName" value="" data-value="" placeholder="盲文封面一" readonly/>
							<span class="input-group-btn">
                  <button class="btn btn-clear" type="button" data-action="clear"><i
                          class="fa fa-remove box"></i></button>
                  <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*.doc,*.docx"}'><i
                          class="fa fa-file-o"></i></button>
							  </span>
						</div>
						<input type="hidden" name="bookFascicleTypeName" value="盲文封面一" />
						<input type="hidden" name="bookFascicleType" value="3" />
					</div>
					<div class="col-xs-2">
						<button class="btn btn-default" type="button" data-type="autoGeneration-fascicle">自动生成</button>
					</div>
					<div class="col-xs-4">
						<button data-down="down" class="btn btn-default" type="button" disabled>下载</button>
						<button data-down="see" class="btn btn-default" type="button" disabled>预览</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row fascicle-between">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">分册位置</label>
					<div class="col-xs-10">
						<textarea class="form-control" name="bookFascicleLocation" placeholder="分册位置" maxlength="128"></textarea>
						<div><label class="len">0/128</label></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</script>
<div class="form-horizontal" id="formEdit">
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">图书名称<span class="must">*</span></label>
				<div class="col-xs-8">
					<input type="text" class="form-control" name="bookDetailName" value="<%- info.bookDetailName %>" maxlength="32" placeholder="图书名称" data-fv-notempty="true" data-fv-notempty-message="请填写图书名称" />
					<input type="hidden" name="bookId" value="<%- info.bookId %>" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">是否加急</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.bookIsUrgent === '1') { %> 常规
						<% } %>
						<% if(info.bookIsUrgent === '2') { %> 加急
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<%
		var authorArray = info.bookDetailOldAuthor.split(',');
		var workWayArray = info.bookDetailWorkWay.split(',');
		for(var i = 0; i < authorArray.length; i++) {
	%>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">作者</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" name="bookDetailOldAuthor" value="<%- authorArray[i] %>" maxlength="32" placeholder="作者" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">著作方式</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- workWayArray[i] %>" name="bookDetailWorkWay" placeholder="著作方式" maxlength="64" />
				</div>
			</div>
		</div>
	</div>
	<% } %>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">原出版者<span class="must">*</span></label>
				<div class="col-xs-8">
					<input type="text" class="form-control" name="bookDetailOldPublishingHouse" value="<%- info.bookDetailOldPublishingHouse %>" maxlength="128" placeholder="原出版者" data-fv-notempty="true" data-fv-notempty-message="请填写原出版社" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">字数(千字)<span class="must">*</span></label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.bookDetailWordsNum %>" name="bookDetailWordsNum" placeholder="字数（千字）" maxlength="8" pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$" data-fv-regexp-message="请输入小于10000的数字， 允许三位小数" data-fv-notempty="true" data-fv-notempty-message="请填写字数" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group" style="margin: 0;">
				<label class="col-xs-2 control-label" style="top: 0;">原书出版时间<br />及版次</label>
				<div class="col-xs-10" data-type = "publish">
					<% for(var j = 0; j < info.bookDetailOldPublicationDate.length; j++) { %>
					<div class="row" style="margin-bottom: 15px;" data-copy= "publish">	
						<div class="col-xs-4">
							<input type="text" class="form-control date-time" name="bookDetailOldPublicationDate" value="<%- info.bookDetailOldPublicationDate[j] %>" maxlength="128" placeholder="出版时间" value="7" />
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<input type="text" class="form-control" name="bookDetailOldEdition" value="<%- info.bookDetailOldEdition[j] %>" maxlength="8" pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
								<span class="input-group-addon">版</span>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<input type="text" class="form-control" name="bookDetailOldRevision" value="<%- info.bookDetailOldRevision[j] %>" maxlength="8" pattern="^[1-9][0-9]*$" data-fv-regexp-message="请输入大于0的整数" />
								<span class="input-group-addon">次</span>
							</div>
						</div>
						<div class="col-xs-2">
							<button class="btn btn-xs btn-success" data-type="publish-plus"><i class="fa fa-plus box"></i></button>
							<button class="btn btn-xs btn-danger" data-type="publish-minus"><i class="fa fa-close box"></i></button>
						</div>
					</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印数</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" name="bookDetailPrintNum" value="<%- info.bookDetailPrintNum %>" maxlength="9" placeholder="印数" pattern="^[1-9][0-9]*$" data-fv-regexp-message="请填写印数(大于0的整数)" />
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">编排次序</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" value="<%- info.bookDetailLayoutOrder %>" name="bookDetailLayoutOrder" placeholder="编排次序" maxlength="32" />
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">盲文形式</label>
				<div class="col-xs-8">
					<select name="bookDetailBrailleForm" class="form-control" id="bookDetailBrailleForm">
					</select>
				</div>
			</div>
		</div>
		<div class="col-xs-6"></div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group ">
				<label class="col-xs-2 control-label">图书类别</label>
				<div class="col-xs-3">
					<select name="bookDetailOneKind" class="form-control" id="bookTopicOne">
					</select>
				</div>
				<div class="col-xs-3">
					<select name="bookDetailTwoKind" class="form-control" id="bookTopicTwo">
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">作者简介</label>
				<div class="col-xs-10">
					<textarea class="form-control" name="bookDetailAuthorMsg" placeholder="作者简介" maxlength="1024"><%- info.bookDetailAuthorMsg %></textarea>
					<div><label class="len">0/1024</label></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group ">
				<label class="col-xs-2 control-label">是否分册</label>
				<div class="col-xs-10">
					<label class="radio-inline">
            			<% if(!info.bookIsFascicle || info.bookIsFascicle === '1') { %>
            			<input type="radio" name="bookIsFascicle" value="1" checked/>否
            			<% } else { %>
            			<input type="radio" name="bookIsFascicle" value="1"/>否
            			<% } %>
          			</label>
					<label class="radio-inline">
            			<% if(info.bookIsFascicle === '2') { %>
            			<input type="radio" name="bookIsFascicle" value="2" checked/>是
            			<% } else { %>
            			<input type="radio" name="bookIsFascicle" value="2"/>是
            			<% } %>
          			</label>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">图书封面</label>
				<div class="col-xs-10">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="width: 86px;">封面名称</th>
								<th>文件名称</th>
								<th style="width: 95px;">操作</th>
								<th style="width: 80px;">下载</th>
								<th style="width: 80px;">预览</th>
							</tr>
						</thead>
						<tbody>
							<% for(var i = 0; i < info.coverList.length; i++) { %>
							<% if(info.coverList[i].bookFileType <5 ) { %>
							<tr data-area="cover" data-type="<%- info.coverList[i].bookFileType %>">
								<td>
									<%- info.coverList[i].bookFileTypeName %>
									<input type="hidden" name="bookId" value="<%- info.bookId %>" />
								</td>
								<td>
									<div class="input-group with-clear">
										<input type="text" class="form-control" name="bookFileName" value="<%- info.coverList[i].bookFileName %>" data-value="<%- info.coverList[i].bookFileAddress %>" placeholder="<%- info.coverList[i].bookFileTypeName %>" readonly>
										<span class="input-group-btn">
                    	<button class="btn btn-clear" type="button" data-action="clear"><i class="fa fa-remove box"></i></button>
                      <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*.doc,*.docx"}'><i class="fa fa-file-o"></i></button>
                    </span>
									</div>
									<input type="hidden" name="bookFileTypeName" value="<%- info.coverList[i].bookFileTypeName %>">
									<input type="hidden" name="bookFileType" value="<%- info.coverList[i].bookFileType %>">
								</td>
								<td>
									<button class="btn btn-default btn-rounded btn-xs" type="button" data-type="autoGeneration">自动生成</button>
								</td>
								<% if(!info.coverList[i].bookFileAddress) { %>
								<td>
									<button data-down="down" class="btn btn-default btn-rounded btn-xs" disabled>下载</button>
								</td>
								<td>
									<button data-down="see" class="btn btn-default btn-rounded btn-xs" disabled>预览</button>
								</td>	
								<% } else { %>
								<td>
									<button data-down="down" class="btn btn-default btn-rounded btn-xs">下载</button>
								</td>
								<td>
									<button data-down="see" class="btn btn-default btn-rounded btn-xs">预览</button>
								</td>
								<% } %>
							</tr>
							<% } else { %>
							<tr data-area="cover" data-type="<%- info.coverList[i].bookFileType %>">
								<td>
									<%- info.coverList[i].bookFileTypeName %>
								</td>
								<td>
									<div class="input-group with-clear">
										<input type="text" class="form-control" name="bookFileName" value="<%- info.coverList[i].bookFileName %>" data-value="<%- info.coverList[i].bookFileAddress %>" placeholder="<%- info.coverList[i].bookFileTypeName %>" readonly>
										<span class="input-group-btn">
                    <button class="btn btn-clear" type="button" data-action="clear"><i
                            class="fa fa-remove box"></i></button>
                      <button class="btn btn-default" type="button" data-open="public/file/file-upload"
                              data-data='{"type": "*.doc,*.docx"}'><i class="fa fa-file-o"></i></button>
                    </span>
									</div>
									<input type="hidden" name="bookFileTypeName" value="<%- info.coverList[i].bookFileTypeName %>">
									<input type="hidden" name="bookFileType" value="<%- info.coverList[i].bookFileType %>">
								</td>
								<td></td>
								<% if(!info.coverList[i].bookFileAddress) { %>
								<td>
									<button data-down="down" class="btn btn-default btn-rounded btn-xs" disabled>下载</button>
								</td>
								<td>
									<button data-down="see" class="btn btn-default btn-rounded btn-xs" disabled>预览</button>
								</td>	
								<% } else { %>
								<td>
									<button data-down="down" class="btn btn-default btn-rounded btn-xs">下载</button>
								</td>
								<td>
									<button data-down="see" class="btn btn-default btn-rounded btn-xs">预览</button>
								</td>
								<% } %>
							</tr>
							<% } %>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="row fascicle-top" data-area="pageinfo">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label c-primary">分册信息</label>
				<div class="col-xs-9"></div>
				<div class="col-xs-1">
					<button class="btn btn-xs btn-success" data-type="page-plus"><i class="fa fa-plus box"></i></button>
				</div>
			</div>
		</div>
	</div>
	<div id="pageInfo" class="pageInfo" data-type="pageinfo" data-area="pageinfo">
		<% for(var j = 0; j < info.fascicleList.length; j++) { %>
		<div data-area="fascicle" class="fascicle">
			<div class="row fascicle-top">
				<div class="col-xs-12">
					<div class="form-group">
						<label class="col-xs-2 control-label">分册序号<span class="must">*</span></label>
						<div class="col-xs-4">
							<input type="text" class="form-control" value="<%- info.fascicleList[j].bookFascicleBookName %>" name="bookFascicleBookName" placeholder="分册序号" maxlength="10" data-fv-mydiff="true" data-fv-mydiff-message="分册序号不能重复" data-fv-notempty="true" data-fv-notempty-message="请填写分册序号" />
						</div>
						<div class="col-xs-5"></div>
						<div class="col-xs-1">
							<button class="btn btn-xs btn-danger" data-type="page-minus"><i class="fa fa-close box"></i></button>
						</div>
					</div>
				</div>
			</div>
			<div class="row fascicle-between">
				<div class="col-xs-12">
					<div class="form-group">
						<label class="col-xs-2 control-label">分册字数(千字)<span class="must">*</span></label>
						<div class="col-xs-4">
							<input type="text" class="form-control" value="<%- info.fascicleList[j].bookFascicleWords %>" name="bookFascicleWords" placeholder="分册字数(千字)" maxlength="8" pattern="^(([1-9][0-9]{0,3})|([0-9]\.[0-9]{1,3})|([1-9][0-9]{0,3}\.[0-9]{1,3}))$" data-fv-notempty="true" data-fv-notempty-message="请填写分册字数" data-fv-regexp-message="请输入小于10000的数字，允许三位小数" />
						</div>
					</div>
				</div>
			</div>
			<div class="row fascicle-between">
				<div class="col-xs-12">
					<div class="form-group">
						<label class="col-xs-2 control-label">盲文封面一</label>
						<div class="col-xs-4">
							<div class="input-group with-clear">
								<input type="text" class="form-control" name="bookFascicleName" value="<%- info.fascicleList[j].bookFascicleName %>" data-value="<%- info.fascicleList[j].bookFascicleAddress %>" placeholder="盲文封面一" readonly/>
								<span class="input-group-btn">
                  <button class="btn btn-clear" type="button" data-action="clear"><i
                          class="fa fa-remove box"></i></button>
                  <button class="btn btn-default" type="button" data-open="public/file/file-upload" data-data='{"type": "*.doc,*.docx"}'><i
                          class="fa fa-file-o"></i></button>
							  </span>
							</div>
							<input type="hidden" name="bookFascicleTypeName" value="盲文封面一" />
							<input type="hidden" name="bookFascicleType" value="3" />
						</div>
						<div class="col-xs-2">
							<button class="btn btn-default" type="button" data-type="autoGeneration-fascicle">自动生成</button>
						</div>
						<div class="col-xs-4">
							<% if(!info.fascicleList[j].bookFascicleAddress) { %>
							<button data-down="down" class="btn btn-default" type="button" disabled>下载</button>
							<button data-down="see" class="btn btn-default" type="button" disabled>预览</button>
							<% } else { %>
							<button data-down="down" class="btn btn-default" type="button">下载</button>
							<button data-down="see" class="btn btn-default" type="button">预览</button>
							<% } %>
						</div>
					</div>
				</div>
			</div>
			<div class="row fascicle-between">
				<div class="col-xs-12">
					<div class="form-group">
						<label class="col-xs-2 control-label">分册位置</label>
						<div class="col-xs-10">
							<textarea class="form-control" name="bookFascicleLocation" placeholder="分册位置" maxlength="128"><%- info.fascicleList[j].bookFascicleLocation %></textarea>
							<div><label class="len">0/128</label></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<% } %>
	</div>
	<div class="row" style="margin-top: 15px;">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">内容简介</label>
				<div class="col-xs-10">
					<textarea class="form-control" name="bookDetailSketched" placeholder="内容简介(不超过1024个字)" maxlength="1024"><%- info.bookDetailSketched %></textarea>
					<div><label class="len">0/1024</label></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">加工记录</label>
				<div class="col-xs-10" data-type="mach-record">
					<% for(var k = 0; k < info.machiningRecordList.length; k++) { %>
					<div class="row" data-area="machining">
						<div class="col-xs-1" style="padding-top: 10px;">
							<span class="badge badge-primary" data-value="number"></span>
						</div>
						<div class="col-xs-9" style="padding-bottom: 10px;">
							<textarea class="form-control" name="machiningRecord" placeholder="加工记录" maxlength="256"><%- info.machiningRecordList[k].machiningRecord %></textarea>
							<div><label class="len">0/256</label></div>
						</div>
						<div class="col-xs-2">
							<button class="btn btn-xs btn-success" data-type="record-plus"><i class="fa fa-plus box"></i></button>
							<button class="btn btn-xs btn-danger" data-type="record-minus"><i class="fa fa-close box"></i></button>
						</div>
					</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group ">
				<label class="col-xs-2 control-label">初审结果</label>
				<div class="col-xs-10">
					<label class="radio-inline">
            <% if(!info.handleState || info.handleState === '1') { %>
            <input type="radio" name="handleState" value="1" data-fv-notempty="true" data-fv-notempty-message="请选择初审结果" checked/>建议发稿
            <% } else { %>
            <input type="radio" name="handleState" value="1" data-fv-notempty="true" data-fv-notempty-message="请选择初审结果"/>建议发稿
            <% } %>
          </label>
					<label class="radio-inline">
            <% if(info.handleState === '2') { %>
            <input type="radio" name="handleState" value="2" data-fv-notempty="true" data-fv-notempty-message="请选择初审结果" checked/>退稿
            <% } else { %>
            <input type="radio" name="handleState" value="2" data-fv-notempty="true" data-fv-notempty-message="请选择初审结果"/>退稿
            <% } %>
          </label>
				</div>
			</div>
		</div>
	</div>
	<div class="row" data-area="opinion">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">初审意见</label>
				<div class="col-xs-10">
					<textarea class="form-control" name="handleContentOne" placeholder="初审意见" maxlength="128"><%- info.handleContentOne %></textarea>
					<div><label class="len">0/128</label></div>
				</div>
			</div>
		</div>
	</div>
	<% if(info.userTaskEntities) { %>
	<% for(var i = 0; i < info.userTaskEntities.length; i++) { %>
	<div class="row" data-flow="<%- info.userTaskEntities[i].flowId %>" data-area="nextFlow" style="display: none;">
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
              <button class="btn btn-default" type="button" data-open="public/user/select-users" data-data='{"roleIds": "<%- info.userTaskEntities[i].roleIds %>", "deptIds": "<%- info.userTaskEntities[i].deptIds %>"}'>
              	<i class="fa fa-user-o"></i></button>
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
<div class="form-horizontal box-dashed">
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">图书名称</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.bookDetailName %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">是否加急</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.bookIsUrgent === '1') { %> 常规
						<% } %>
						<% if(info.bookIsUrgent === '2') { %> 加急
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<%
	var authorArray = info.bookDetailOldAuthor.split(',');
	var workWayArray = info.bookDetailWorkWay.split(',');
	for(var i = 0; i < authorArray.length; i++) {
	%>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">作者</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- authorArray[i] %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">著作方式</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- workWayArray[i] %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<% } %>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">原出版者</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.bookDetailOldPublishingHouse %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">字数(千字)</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.bookDetailWordsNum %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group" style="margin: 0;">
				<label class="col-xs-2 control-label" style="top: 0;">原书出版时间<br />及版次</label>
				<div class="col-xs-10" data-type = "publish">
					<% for(var j = 0; j < info.bookDetailOldPublicationDate.length; j++) { %>
					<div class="row" style="margin-bottom: 15px;" data-copy= "publish">	
						<div class="col-xs-4">
							<p class="form-control-static"><%- info.bookDetailOldPublicationDate[j] %></p>
						</div>
						<div class="col-xs-4">
							<div class="input-group">
								<p class="form-control-static"><%- info.bookDetailOldEdition[j] %>版</p>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="input-group">
								<p class="form-control-static"><%- info.bookDetailOldRevision[j] %>次</p>
							</div>
						</div>
					</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">印数</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.bookDetailPrintNum %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">编排版次</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.bookDetailLayoutOrder %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6">
			<div class="form-group">
				<label class="col-xs-4 control-label">盲文形式</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.bookDetailBrailleFormName %>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="form-group ">
				<label class="col-xs-4 control-label">图书类别</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<%- info.bookDetailOneKindName %>、
						<%- info.bookDetailTwoKindName %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">作者简介</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.bookDetailAuthorMsg %></pre>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">是否分册</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.bookIsFascicle === '1') { %> 否
						<% } %>
						<% if(info.bookIsFascicle === '2') { %> 是
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!--当有分页信息选择为否时-->
	<% if(info.bookIsFascicle === '1') { %>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">图书封面</label>
				<div class="col-xs-10">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>封面名称</th>
								<th>文件名称</th>
								<th>下载</th>
								<th>预览</th>
							</tr>
						</thead>
						<tbody>
							<% for (var i = 0; i < info.coverList.length; i++) { %>
							<tr>
								<td>
									<%- info.coverList[i].bookFileTypeName %>
								</td>
								<td>
									<%- info.coverList[i].bookFileName %>
								</td>
								<% if(!info.coverList[i].bookFileAddress) { %>
								<td><button class="btn btn-default btn-rounded btn-xs" disabled>下载</button></td>
								<td><button class="btn btn-default btn-rounded btn-xs" disabled>预览</button></td>
								<% } else { %>
								<td><button class="btn btn-default btn-rounded btn-xs" data-address="<%- info.coverList[i].bookFileAddress %>" data-down="download">下载</button></td>
								<td><button class="btn btn-default btn-rounded btn-xs" data-address="<%- info.coverList[i].bookFileAddress %>" data-down="view">预览</button></td>
								<% } %>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<% } else { %>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">图书封面</label>
				<div class="col-xs-10">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>封面名称</th>
								<th>文件名称</th>
								<th>下载</th>
								<th>预览</th>
							</tr>
						</thead>
						<tbody>
							<% for (var i = 0; i < info.coverList.length; i++) { %>
							<% if(info.coverList[i].bookFileType !== '3') { %>
							<tr>
								<td>
									<%- info.coverList[i].bookFileTypeName %>
								</td>
								<td>
									<%- info.coverList[i].bookFileName %>
								</td>
								<% if(!info.coverList[i].bookFileAddress) { %>
								<td><button class="btn btn-default btn-rounded btn-xs" disabled>下载</button></td>
								<td><button class="btn btn-default btn-rounded btn-xs" disabled>预览</button></td>
								<% } else { %>
								<td><button class="btn btn-default btn-rounded btn-xs" data-address="<%- info.coverList[i].bookFileAddress %>" data-down="download">下载</button></td>
								<td><button class="btn btn-default btn-rounded btn-xs" data-address="<%- info.coverList[i].bookFileAddress %>" data-down="view">预览</button></td>
								<% } %>
							</tr>
							<% } %>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="fascicle">
		<% for (var j = 0; j < info.fascicleList.length; j++) { %>
		<div class="row fascicle-top-view">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">分册序号</label>
					<div class="col-xs-4">
						<p class="form-control-static">
							<%- info.fascicleList[j].bookFascicleBookName %>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row fascicle-between-view">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">分册字数(千字)</label>
					<div class="col-xs-4">
						<p class="form-control-static">
							<%- info.fascicleList[j].bookFascicleWords %>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row fascicle-between-view">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">盲文封面一</label>
					<div class="col-xs-7">
						<div class="input-group">
							<p class="form-control-static">
								<%- info.fascicleList[j].bookFascicleName %>
							</p>
						</div>
					</div>
					<div class="col-xs-3">
						<% if(!info.fascicleList[j].bookFascicleAddress) { %>
						<button class="btn btn-default" type="button" disabled>下载</button>
						<button class="btn btn-default" type="button" disabled>预览</button>
						<% } else { %>
						<button class="btn btn-default" type="button" data-address="<%- info.fascicleList[j].bookFascicleAddress %>" data-down="download">下载</button>
						<button class="btn btn-default" type="button" data-address="<%- info.fascicleList[j].bookFascicleAddress %>" data-down="view">预览</button>
						<% } %>
					</div>
				</div>
			</div>
		</div>
		<div class="row fascicle-between-view">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-xs-2 control-label">分册位置</label>
					<div class="col-xs-10">
						<pre class="form-control-static"><%- info.fascicleList[j].bookFascicleLocation %></pre>
					</div>
				</div>
			</div>
		</div>
		<% } %>
	</div>
	<% } %>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">内容简介</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.bookDetailSketched %></pre>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">加工记录</label>
				<div class="col-xs-10">
					<% for(var j = 0; j < info.machiningRecordList.length; j++) { %>
					<div class="col-xs-1" style="padding-top: 10px;">
						<span class="badge badge-primary" data-value="number"><%- j+1 %></span>
					</div>
					<div class="col-xs-11">
						<pre class="form-control-static"><%- info.machiningRecordList[j].machiningRecord %></pre>
					</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">初审结果</label>
				<div class="col-xs-8">
					<p class="form-control-static">
						<% if(info.handleState === '1') { %> 建议发稿
						<% } %>
						<% if(info.handleState === '2') { %> 退稿
						<% } %>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label class="col-xs-2 control-label">初审意见</label>
				<div class="col-xs-10">
					<pre class="form-control-static"><%- info.handleContentOne %></pre>
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