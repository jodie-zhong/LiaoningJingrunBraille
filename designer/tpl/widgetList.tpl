<% for (var i = 0; i < list.length; i++) { %>
<!--<h3><%- list[i].groupName %></h3>-->
<!--<div>-->
    <% var widgets = list[i].list; %>
    <ul>
        <% for ( var j = 0; j < widgets.length; j++) { %>
        <li class="clearfix">
            <div class="widget-item" data-name="<%- widgets[j].name %>" data-type="<%- widgets[j].type %>">
                <img class="widget-icon" src="widget/<%- widgets[j].name %>/icon.png"/>
                <p class="widget-title"><%- widgets[j].label %></p>
            </div>
        </li>
        <% } %>
    </ul>
<!--</div>-->
<% } %>