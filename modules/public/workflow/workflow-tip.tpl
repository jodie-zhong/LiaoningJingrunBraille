<div class="process-helper">
  <% if(lastFlowId) { %>
  <div class="process-item border-bottom bg-primary">
    上一阶段：<%- lastFlowName %>
  </div>
  <% } %>
  <div class="process-item border-bottom bg-primary">
    当前阶段：<%- currentFlowName %>
  </div>
  <% for(var i = 0; i < flowStateEntities.length; i++) { %>
  <% if(flowStateEntities[i].flowId === highlightFlowId) { %>
  <div class="process-item c-primary">
    <i class="fa fa-chevron-right"></i> <%- flowStateEntities[i].flowName %>
  </div>
  <% } else { %>
  <div class="process-item">
    <i class="fa fa-circle-o"></i> <%- flowStateEntities[i].flowName %>
  </div>
  <% } %>
  <% } %>
  <% if(nextFlowId) { %>
  <div class="process-item border-top bg-primary">
    下一阶段：<%- nextFlowName %>
  </div>
  <% } %>
</div>