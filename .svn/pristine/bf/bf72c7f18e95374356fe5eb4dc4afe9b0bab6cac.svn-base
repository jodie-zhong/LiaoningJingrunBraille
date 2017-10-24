<div class="row">
  <% for(var i = 0; i < menu.length; i++) { %>
  <% if(showAll || menu[i].dashboard && (menu[i].auth && auth.indexOf(menu[i].auth) >= 0)) { %>
  <div class="col-md-4 col-xs-4 col-lg-3">
    <div class="panel">
      <div class="panel-header panel-controls custom-panel-header">
        <h3><i class="<%- menu[i].icon %>"></i> <%- menu[i].title %></h3>
      </div>
      <div class="panel-content widget-table">
        <div class="withScroll" data-height="225" style="height: 225px;overflow: auto;">
          <table class="table table-striped">
            <tbody>
            <% for(var j = 0; j < menu[i].items.length; j++) { %>
            <% if(showAll || menu[i].items[j].dashboard && ( menu[i].items[j].auth && auth.indexOf(menu[i].items[j].auth) >= 0)) { %>
            <tr>
              <td><%- menu[i].items[j].title %> <span class="badge badge-warning" data-authId="<%- menu[i].items[j].auth %>" style="display: none;">0</span></td>
              <td style="width: 100px;">
                <% if(menu[i].items[j].href) { %>
                <button class="btn btn-white btn-sm btn-rounded" data-action="openPage" data-href="<%- menu[i].items[j].href %>">任务详情</button>
                <% } %>
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
  <% } %>
  <% } %>
</div>
<div class="row">
	<div class="col-xs-12">
		<div class="panel">
			<div class="panel-header custom-panel-header">
			<div class="dialog-options" style="padding-right: 30px;">
    		<label class="radio-inline">
    			<input type="radio" name="choose" value="1" checked />月
    		</label>
    		<label class="radio-inline">
    			<input type="radio" name="choose"m value="2" />年
    		</label>
  		</div>
  		<div class="row">
  			<div class="col-xs-12">
  				<div id="monthLineChart" data-name = "echarts" style="height: 500px;"></div>
  			</div>
  		</div>
  		</div>
		</div>
	</div>
</div>
