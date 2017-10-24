<% for(var i = 0; i < menu.length; i++) { %>
<% if(showAll || (menu[i].auth && auth.indexOf(menu[i].auth) >= 0)) { %>
<li class="nav-parent">
  <a role="menuitem" href="#" tabindex="0" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" data-delay="30">
    <i class="<%- menu[i].icon %>"></i><span class="top-menu-item"> <%- menu[i].title %> <i class="icons-arrows-06"></i></span>
  </a>
  <ul class="dropdown-menu" role="menu">
    <% for(var j = 0; j < menu[i].items.length; j++) { %>
    <% if(showAll || (menu[i].items[j].auth && auth.indexOf(menu[i].items[j].auth) >= 0)) { %>
    <% if(menu[i].items[j].href) { %>
    <li><a role="menuitem"a tabindex="0" data-href="<%- menu[i].items[j].href %>"><%- menu[i].items[j].title %></a></li>
    <% } else { %>
    <li class="disabled"><a role="menuitem" tabindex="0" data-href="<%- menu[i].items[j].href %>"><%- menu[i].items[j].title %></a></li>
    <% } %>
    <% } %>
    <% } %>
  </ul>
</li>
<% } %>
<% } %>