<!--流程状态-->
<div class="form-horizontal">
    <div class="row">
        <div class="col-xs-12">
            <div class="form-group">
                <label class="col-xs-2 control-label">印制方式</label>
                <div class="col-xs-10">
                    <p class="form-control-static">
                        <% if(info.handleState === '1') { %>
                        发印
                        <% } %>
                        <% if(info.handleState === '2') { %>
                        快印
                        <% } %>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6">
            <div class="form-group">
                <label class="col-xs-4 control-label">所在流程</label>
                <div class="col-xs-8">
                    <p class="form-control-static"><%- info.flowName %></p>
                </div>
            </div>
        </div>
        <div class="col-xs-6">
            <div class="form-group">
                <label class="col-xs-4 control-label">任务人</label>
                <div class="col-xs-8">
                    <p class="form-control-static"><%- info.taskUserNames %></p>
                </div>
            </div>
        </div>
    </div>
</div>
