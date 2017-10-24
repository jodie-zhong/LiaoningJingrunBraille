<% if(list.length > 0) { %>
<% for(var i = 0; i < list.length; i++) { %>
<tr data-bookId="<%- list[i].editIdAndStateEntity.bookEditTprStatisticsId %>" data-name="<%- list[i].bookName %>"
    data-bookIdOnly="<%- list[i].bookId %>"
    data-taskState="<%- list[i].taskState %>"
    data-deploy="<%- list[i].bookDeploymentKey %>" data-taskId="<%- list[i].taskId %>"
    data-taskUsers="<%- list[i].taskUsers %>" data-users="<%- list[i].taskUsers %>"
    data-state="<%- list[i].editIdAndStateEntity.bookEditTprStatisticsState %>">
  <td class="w-table"><%- (i + 1) %></td>
  <td class="w-table" data-check="true"><i class="fa fa-square-o" data-action="check"></i></td>
  <td class="text-center" style="width: 250px" title="<%- list[i].bookOneKind %>"><%- list[i].bookOneKind %></td>
  <td class="text-center" style="width: 200px" title="<%- list[i].bookName %>"><%- list[i].bookName %></td>
  <td class="text-center" style="width: 80px" title="<%- list[i].bookIsbn %>"><%- list[i].bookIsbn %></td>
  <td class="text-center" style="width: 150px" title="<%- list[i].bookAuthor %>"><%- list[i].bookAuthor %></td>
  <td class="text-center" style="width: 100px" title="<%- list[i].bookSketched %>"><%- list[i].bookSketched %></td>
  <td class="text-center" style="width: 100px" title="<%- list[i].bookOldPublishingHouse %>"><%- list[i].bookOldPublishingHouse %></td>
  <!--原书出版时间版次-->
  <td class="text-center bookDate" style="width: 150px" title="<%- list[i].braileStatisticalNewPublicTime %>"><%-
    list[i].braileStatisticalNewPublicTime %></td>

  <td class="text-center" style="width: 100px" title="<%- list[i].bookEditionTime %>"><%- list[i].bookEditionTime %></td>
  <td class="text-center" style="width: 150px" title="<%- list[i].bookTwoKind %>"><%- list[i].bookTwoKind %></td>
  <td class="text-center" style="width: 150px" title="<%- list[i].bookSubjectHeadings %>"><%- list[i].bookSubjectHeadings %></td>
  <td class="text-center" style="width: 100px" title="<%- list[i].bookClassNum %>"><%- list[i].bookClassNum %></td>
  <td class="text-center" style="width: 150px" title="<%- list[i].bookBrailleType %>"><%- list[i].bookBrailleType %></td>
  <!--一审-->
  <td class="text-center border-left" style="width: 120px" title="<%- list[i].oneExamineDutyEditor %>"><%- list[i].oneExamineDutyEditor %></td>
  <td class="text-center" style="width: 120px" title="<%- list[i].oneExamineWordNum %>"><%- list[i].oneExamineWordNum %></td>
  <td class="text-center" style="width: 120px" title="<%- list[i].oneExaminePressTime %>"><%- list[i].oneExaminePressTime %></td>
  <td class="text-center" style="width: 120px" title=""></td>
  <td class="text-center border-right" style="width: 120px" title=""></td>
  <!--二审-->
  <td class="text-center border-right" style="width: 150px" title="<%- list[i].twoExamineHandleName %>"><%- list[i].twoExamineHandleName
    %></td>
  <!--三审-->
  <td class="text-center border-right" style="width: 150px" title="<%- list[i].threeExamineHandleName %>"><%- list[i].threeExamineHandleName
    %></td>
  <!--录入-->
  <!--录入-->
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].inputHandleName %>"><%- list[i].statisticsFascicleEntities[j].inputHandleName %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].inputEditionNum %>"><%- list[i].statisticsFascicleEntities[j].inputEditionNum %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].inputWrongRate %>"><%- list[i].statisticsFascicleEntities[j].inputWrongRate %></div>
    <% } %>
  </td>
  <td class="text-center border-right" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].inputWrongSettlement %>"><%- list[i].statisticsFascicleEntities[j].inputWrongSettlement %></div>
    <% } %>
  </td>
  <!--一校-->
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].oneProofreadHandleName %>"><%- list[i].statisticsFascicleEntities[j].oneProofreadHandleName %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].oneProofreadEditionNum %>"><%- list[i].statisticsFascicleEntities[j].oneProofreadEditionNum %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].oneProofreadWrongRate %>"><%- list[i].statisticsFascicleEntities[j].oneProofreadWrongRate %></div>
    <% } %>
  </td>
  <td class="text-center border-right" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].oneProofreadWrongSettlement %>"><%- list[i].statisticsFascicleEntities[j].oneProofreadWrongSettlement %></div>
    <% } %>
  </td>
  <!--二校-->
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].twoProofreadHandleName %>"><%- list[i].statisticsFascicleEntities[j].twoProofreadHandleName %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].twoProofreadEditionNum %>"><%- list[i].statisticsFascicleEntities[j].twoProofreadEditionNum %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].twoProofreadWrongRate %>"><%- list[i].statisticsFascicleEntities[j].twoProofreadWrongRate %></div>
    <% } %>
  </td>
  <td class="text-center border-right" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].twoProofreadWrongSettlement %>"><%- list[i].statisticsFascicleEntities[j].twoProofreadWrongSettlement %></div>
    <% } %>
  </td>
  <!--末校一次-->
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].threeProofreadHandleName %>"><%- list[i].statisticsFascicleEntities[j].threeProofreadHandleName %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].threeProofreadEditionNum %>"><%- list[i].statisticsFascicleEntities[j].threeProofreadEditionNum %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].threeProofreadWrongRate %>"><%- list[i].statisticsFascicleEntities[j].threeProofreadWrongRate %></div>
    <% } %>
  </td>
  <td class="text-center border-right" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].threeProofreadWrongSettlement %>"><%- list[i].statisticsFascicleEntities[j].threeProofreadWrongSettlement %></div>
    <% } %>
  </td>
  <!--末校二次-->
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].otherProofreadHandleName %>"><%- list[i].statisticsFascicleEntities[j].otherProofreadHandleName %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].otherProofreadEditionNum %>"><%- list[i].statisticsFascicleEntities[j].otherProofreadEditionNum %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].otherProofreadWrongRate %>"><%-
      list[i].statisticsFascicleEntities[j].otherProofreadWrongRate %></div>
    <% } %>
  </td>
  <td class="text-center border-right" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].otherProofreadWrongSettlement %>"><%-
      list[i].statisticsFascicleEntities[j].otherProofreadWrongSettlement %></div>
    <% } %>
  </td>
  <!--通读-->
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].readHandleName %>"><%-
      list[i].statisticsFascicleEntities[j].readHandleName %></div>
    <% } %>
  </td>
  <td class="text-center border-right" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].readEditionNum %>"><%- list[i].statisticsFascicleEntities[j].readEditionNum %></div>
    <% } %>
  </td>
  <!--印前质检-->
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].qualityHandleName %>"><%-
      list[i].statisticsFascicleEntities[j].qualityHandleName %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].qualityEditionNum %>"><%- list[i].statisticsFascicleEntities[j].qualityEditionNum %></div>
    <% } %>
  </td>
  <td class="text-center" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].qualityCheckPage %>"><%- list[i].statisticsFascicleEntities[j].qualityCheckPage %></div>
    <% } %>
  </td>
  <td class="text-center border-right" style="width: 120px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].qualityWrongRate %>"><%- list[i].statisticsFascicleEntities[j].qualityWrongRate %></div>
    <% } %>
  </td>

  <!--最终盲文版数之后内容-->
  <td class="text-center" style="width: 150px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="text-center" title="<%- list[i].statisticsFascicleEntities[j].finalEditionNum %>"><%- list[i].statisticsFascicleEntities[j].finalEditionNum %></div>
    <% } %>
  </td>
  <td class="search" style="width: 100px">
    <% for(var j = 0; j < list[i].statisticsFascicleEntities.length; j++) { %>
    <div class="m-b-5">
      <button data-bookFascicleId="<%- list[i].statisticsFascicleEntities[j].bookFascicleId %>"
              class="btn btn-default btn-rounded btn-sm btn-search">查看详情</button>
    </div>
    <% } %>
  </td>

  <td class="text-center" style="width: 100px" title="<%- list[i].bookPricing %>"><%- list[i].bookPricing %></td>
  <td class="text-center" style="width: 200px" title="<%- list[i].libraryNeedNum %>"><%- list[i].libraryNeedNum %></td>
  <td class="text-center" style="width: 200px" title="<%- list[i].readersServiceneedNum %>"><%- list[i].readersServiceneedNum %></td>
  <td class="text-center" style="width: 150px" title="<%- list[i].totalPrintNum %>"><%- list[i].totalPrintNum %></td>
  <td class="text-center" style="width: 100px" title="<%- list[i].totalPrintPaperNum %>"><%- list[i].totalPrintPaperNum %></td>
  <td class="text-center" style="width: 80px" title="<%- list[i].format %>"><%- list[i].format %></td>
  <td class="text-center" style="width: 80px" title="<%- list[i].usePaper %>"><%- list[i].usePaper %></td>
  <td class="text-center" style="width: 150px" title="<%- list[i].pubDate %>"><%- list[i].pubDate %></td>
  <td class="text-center" style="width: 150px" title="<%- list[i].printingOverTime %>"><%- list[i].printingOverTime %></td>
  <td class="text-center" style="width: 150px" title=""></td>
</tr>
<% } %>
<% } else { %>
<tr data-noselect="true">
  <td  colspan="59"><p class="empty-tips">没有符合指定条件的数据</p></td>
</tr>
<% } %>
