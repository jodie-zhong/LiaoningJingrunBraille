<div style="min-height: 240px;" class="form-horizontal">
    <div class="row">
        <div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">
            <div class="form-group">
                <img class="userhead"  onerror="this.setAttribute('src', 'img/head.jpg')" src="<%- info.userHead %>" style="height: 100px; width: 100px;display: block;margin: 0 auto;" />
                <p class="form-control-static t-ellipsis t-center" title="<%- info.userName %>"><%- info.userName %></p>
                <p class="form-control-static t-ellipsis t-center" title="<%- info.departmentName %>"><%- info.departmentName
                    %></p>
            </div>
        </div>
        <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">用户姓名:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.userName %></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">年龄:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.age %></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">性别:</label>
                <div class="col-sm-8 col-xs-8">
                    <% if(info.userSex === '1') { %>
                    <p class="form-control-static">男</p>
                    <% } else { %>
                    <p class="form-control-static">女</p>
                    <% } %>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">邮箱:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.userEmail %></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">用户手机:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.userPhone %></p>
                </div>
            </div>
        </div>
        <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">用户账号:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.userLoginName %></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">身份证号:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.userIdCard %></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">职称:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.userTitle %></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">专业:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.userSpecialty %></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 col-xs-4 control-label">培训积分:</label>
                <div class="col-sm-8 col-xs-8">
                    <p class="form-control-static"><%- info.trainingPoints %></p>
                </div>
            </div>
        </div>
    </div>
</div>
