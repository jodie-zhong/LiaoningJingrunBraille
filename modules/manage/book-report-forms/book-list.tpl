<!--汉文-图书季报--书列表-->
<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].bookId %>" data-bookName="<%- list[i].bookName %>">
  <td><%- (i + 1) %></td>
  <td data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td title="<%- {1:'否', 2:'是'}[list[i].isBookIsbn] %>"><%- {1:'否', 2:'是'}[list[i].isBookIsbn] %></td>
  <td title="<%- list[i].bookClassNum %>"><%- list[i].bookClassNum %></td>
  <td title="<%- list[i].bookIsbn %>"><%- list[i].bookIsbn %></td>
  <td title="<%- {1:'新出', 2:'重印', 3:'租型'}[list[i].printState] %>"> <%- {1:'新出', 2:'重印', 3:'租型'}[list[i].printState] %></td>
  <td title="<%- list[i].bookWordsNum %>"><%- list[i].bookWordsNum %></td>
  <td title="<%- {1:'否', 2:'是'}[list[i].bookIsFascicle] %>"><%- {1:'否', 2:'是'}[list[i].bookIsFascicle] %></td>
  <td title="<%- list[i].bookFasciclePrintNum %>"><%- list[i].bookFasciclePrintNum %></td>
  <td title="<%- list[i].bookFasciclePricing %>"><%- list[i].bookFasciclePricing %></td>
  <td title="<%- list[i].bookFasciclePrintSheet %>"><%- list[i].bookFasciclePrintSheet %></td>
  <td title="<%- list[i].bookFascicleNum %>"><%- list[i].bookFascicleNum %></td>
  <td title="<%- list[i].bookPrintNum %>"><%- list[i].bookPrintNum %></td>
  <td title="<%- list[i].bookPricing %>"><%- list[i].bookPricing %></td>
  <td title="<%- list[i].bookPrintSheet %>"><%- list[i].bookPrintSheet %></td>
  <td title="<%- list[i].totalPricing %>"><%- list[i].totalPricing %></td>
  <td title="<%- list[i].commonSpecifications %>"><%- list[i].commonSpecifications %></td>
  <td title="<%- list[i].custom %>"><%- list[i].custom %></td>
  <td title="<%- list[i].totalPrintSheet %>"><%- list[i].totalPrintSheet %></td>
  <td title="<%- {1:'否', 2:'是'}[list[i].isTextbook] %>"><%- {1:'否', 2:'是'}[list[i].isTextbook] %></td>
  <td title="<%- {1:'否', 2:'是'}[list[i].isSupplementaryReading] %>"><%- {1:'否', 2:'是'}[list[i].isSupplementaryReading]
    %></td>
  <td title="<%- {1:'否', 2:'是'}[list[i].isChildrenReading] %>"><%- {1:'否', 2:'是'}[list[i].isChildrenReading] %></td>
  <td title="<%- {1:'否', 2:'是'}[list[i].isAncientReading] %>"><%- {1:'否', 2:'是'}[list[i].isAncientReading] %></td>
  <td title="<%- {1:'否', 2:'是'}[list[i].isTranslationReading] %>"><%- {1:'否', 2:'是'}[list[i].isTranslationReading]
    %></td>
  <td title="<%- list[i].format %>"><%- list[i].format %></td>
  <td title="<%- {1:'盲文读物', 2:'大字本读物', 3:'普通读物', 4:'有声读物'}[list[i].bookType] %>"> <%- {1:'盲文读物', 2:'大字本读物', 3:'普通读物', 4:'有声读物'}[list[i].bookType] %></td>
  <td title="<%- list[i].pageNum %>"><%- list[i].pageNum %></td>
  <td title="<%- list[i].bookAuthor %>"><%- list[i].bookAuthor %></td>
  <td title="<%- list[i].remarks %>"><%- list[i].remarks %></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td colspan="30"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>