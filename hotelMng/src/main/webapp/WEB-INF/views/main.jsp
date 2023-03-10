<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
      <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
            body {
                margin-left:auto;
                margin-right: auto;
                padding:0px;
                background-color: #fbfcf5;
                font-family:ëëęł ë;
                overflow-x: hidden;
            }
            ::-webkit-scrollbar {
                display: none;
            }
            a {
                color:#111111;
                text-decoration:none
            }
            .banner_main{
                background-image: url(/resources/image/outdoor.jpg);
                background-size: 1920px 850px;
                margin-top: auto;
                min-width: 700px;
                height: 770px;
                padding: 8px;
            }
            .contain{
                width: 100%;
            	margin-top:30px;
                min-height: 700px;
                background-color: #fbfcf5;
                font-size: 18px;
                color: #333333
            }
            .index_contents {
                margin-left: 45px;
            }
            .intro{
               margin-top: 10px;
               border-top:1px solid #D4C1A1;
               width:100%;
               text-align:center;
               border-bottom: none;
               border-right: none;
               margin-left:-50px;
               display: inline-block;    
            }
            .intro_facility{
               font-size: 20px;
            }
            .intro_facility a{
             position: relative;
             display: inline-block;
             margin-right: 20px;
             margin-left: 10px;
             padding: 10px;
         }
         .intro_facility a:first-child::before{
             content: '';
         }
         .intro_facility a::before {
             position: absolute;
             top: 2px;
             left: -15px;
             content: '|';
             display: inline-block;
             width: 1px;
             height: 10px;
         }
         .floor_guide {
             width: 100%;
             border-collapse: separate;
             border-spacing: 1px;
             text-align: center;
             line-height: 1.5;
             border-top: 1px solid #D4C1A1;
             margin : 20px 5px;
             margin-left: -5px;
             margin-bottom: 100px;
         }
         .floor_guide th {
             width: 150px;
             padding: 20px;
             font-weight: bold;
             vertical-align: middle;
             border-bottom: 1px solid #D4C1A1;
             color: #dbb790;
         }
         .floor_guide td {
            width: 100px;
            padding: 10px;
            border-bottom: 1px solid #D4C1A1;
            border-right: 1px solid #D4C1A1;
         }
         .floor_guide td.right {
             width: 350px;
             padding: 10px;
             text-align: center;
             vertical-align: middle;
             border-bottom: 1px solid #D4C1A1;
             border-right: none;
         }
        </style>
        <style>
          button{
            cursor: pointer;
          }
          table{
            border-collapse: collapse;
          }
          .res_romm b{
            font-size: 22px;
          }
          .res_search{
            margin-top: 50px;
            border-top:6pt solid #f1f1f1;
            width:90%;
            align:center;
            border-radius:10px;
            border-bottom:6pt solid #f1f1f1;
            margin:0 auto;
            padding-left:35%;
          }
          .res_res{
            display: inline-block;
            text-align:center;
          }
          .res_table td{
            text-align:center;
          }
          #count{
            border-style:none;
            padding-left: 9px;
            width:20px;
          }
          #minus{
            margin-left:50px;
            margin-right:7px;
            border-style:none;
            border-radius:3px;
            width:20px;
            height:20px;
            background-color: #D4C1A1;
          }
          #pl_m{
            margin-left:7px;
            margin-right:7px;
            border-style:none;
            border-radius:3px;
            width:20px;
            height:20px;
            background-color: #D4C1A1;
          }
          #test{
            background-color: #D4C1A1;
          }
          #reservationCheckIn{
            margin-left:30px;
            border-style:none;
            width:80px;
          }
          #res_checkout{
            margin-left:40px;
            border-style:none;
            width:80px;
          }
          #res_tit{
            font-size:30px;
            margin-top: 200px;
            margin-bottom:70px;
            font-weight: 10;
            text-align: center;
          }
          #res_btn{
            margin-left:70px;
            border-style:none;
            height:55px;
            width:70px;
            border-radius:5px;
            background-color: #D4C1A1;
          }
          #res_btn:hover {
           background-color:#dbb790;
          }
        #res_btn:active {
          position:relative;
         top:1px;
          }
        </style>
        <script type="text/javascript">
         function dateAdd(sDate, nNum) {
           var yyyy = parseInt(sDate.substr(0, 4), 10);
           var mm = parseInt(sDate.substr(4, 2), 10) - 1;
           var dd = parseInt(sDate.substr(6, 2), 10);
           nNum *= 1;
           nNum = nNum -1;
           var newDt = new Date(yyyy,mm,dd);
           newDt.setDate( newDt.getDate() + nNum );
             var year = newDt.getFullYear();
             var month = newDt.getMonth()+1;
             var day = newDt.getDate();
             if(month < 10){
                 month = "0"+month;
             }
             if(day < 10){
                 day = "0"+day;
             }
             var today = year+""+month+""+day;
           return today;
         }
         function searchRoom(room) {
           var SearchRoom = room;
           var SearchFrom = $('#reservationCheckIn').val();
           var SearchTo = $('#res_checkout').val();
           if(SearchFrom >= SearchTo){
             alert("ě˛´íŹěěě íě¸íě¸ě.");
             return;
           }
            SearchFrom = SearchFrom.substr(0,4) + SearchFrom.substr(5,2) + SearchFrom.substr(8,2);
            SearchTo = SearchTo.substr(0,4) + SearchTo.substr(5,2) + SearchTo.substr(8,2);
            SearchTo = dateAdd(SearchTo, 0);
            location.href="/searchRoomAction.do?searchFrom="+SearchFrom+"&searchTo="+SearchTo+"&searchRoom="+SearchRoom;
          }
        $(function() {
            //ëŞ¨ë  datepickerě ëí ęłľíľ ěľě ě¤ě 
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format ëłę˛˝
                ,showOtherMonths: true //ëš ęłľę°ě íěŹěě ěë¤ěě ë ě§ëĽź íě
                ,showMonthAfterYear:true //ëë ë¨źě  ëě¤ęł , ë¤ě ě íě
                ,changeYear: true //ě˝¤ëł´ë°ě¤ěě ë ě í ę°ëĽ
                ,changeMonth: true //ě˝¤ëł´ë°ě¤ěě ě ě í ę°ëĽ
                ,showOn: "both" //button:ë˛íźě íěíęł ,ë˛íźě ëëŹěźë§ ëŹë Ľ íě ^ both:ë˛íźě íěíęł ,ë˛íźě ëëĽ´ęą°ë inputě í´ëŚ­íëŠ´ ëŹë Ľ íě
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //ë˛íź ě´ëŻ¸ě§ ę˛˝ëĄ
                ,buttonImageOnly: true //ę¸°ëł¸ ë˛íźě íě ëśëśě ěě ęł , ě´ëŻ¸ě§ë§ ëł´ě´ę˛ í¨
                ,buttonText: "ě í" //ë˛íźě ë§ě°ě¤ ę°ë¤ ëě ë íěëë íě¤í¸
                ,yearSuffix: "ë" //ëŹë Ľě ëë ëśëś ë¤ě ëśë íě¤í¸
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //ëŹë Ľě ě ëśëś íě¤í¸
                ,monthNames: ['1ě','2ě','3ě','4ě','5ě','6ě','7ě','8ě','9ě','10ě','11ě','12ě'] //ëŹë Ľě ě ëśëś Tooltip íě¤í¸
                ,dayNamesMin: ['ěź','ě','í','ě','ëŞŠ','ę¸','í '] //ëŹë Ľě ěěź ëśëś íě¤í¸
                ,dayNames: ['ěźěěź','ěěěź','íěěź','ěěěź','ëŞŠěěź','ę¸ěěź','í ěěź'] //ëŹë Ľě ěěź ëśëś Tooltip íě¤í¸
                ,minDate: "-1M" //ěľě ě íěźě(-1D:íëŁ¨ě , -1M:íëŹě , -1Y:ěźëě )
                ,maxDate: "+1Y" //ěľë ě íěźě(+1D:íëŁ¨í, -1M:íëŹí, -1Y:ěźëí)
            });
            //inputě datepickerëĄ ě ě¸
            $("#reservationCheckIn").datepicker();
            $("#res_checkout").datepicker();
            var checkIn = '${searchFrom}';
            var checkOut = dateAdd('${searchTo}',2);
            if(checkIn == null || checkIn == 'null' || checkIn == ""){
                //Fromě ě´ę¸°ę°ě ě¤ë ë ě§ëĄ ě¤ě 
                $('#reservationCheckIn').datepicker('setDate', 'today'); //(-1D:íëŁ¨ě , -1M:íëŹě , -1Y:ěźëě ), (+1D:íëŁ¨í, -1M:íëŹí, -1Y:ěźëí)
                //Toě ě´ę¸°ę°ě ë´ěźëĄ ě¤ě 
                $('#res_checkout').datepicker('setDate', '+1D'); //(-1D:íëŁ¨ě , -1M:íëŹě , -1Y:ěźëě ), (+1D:íëŁ¨í, -1M:íëŹí, -1Y:ěźëí)
            } else {
                checkIn = checkIn.substr(0,4) + "-" + checkIn.substr(4,2) + "-" + checkIn.substr(6,2);
                checkOut = checkOut.substr(0,4) + "-" + checkOut.substr(4,2) + "-" + checkOut.substr(6,2);
              $('#reservationCheckIn').datepicker('setDate', checkIn);
              $('#res_checkout').datepicker('setDate', checkOut);
            }
        });
        </script>
        <script type="text/javascript">
          var err = document.getElementById("error");
          function plus(){
            cnt = count.value;
            if (cnt<4){
              cnt++;
              count.value = cnt;
            }
            else{
              err.style.display = "block";
            }
          }
          function minus(){
            cnt = count.value;
            if (cnt > 1) {
              cnt--;
              count.value = cnt;
            }
          }
          function datediff(input, output) {
           var diff = output - input;
           var currDay = 24 * 60 * 60 * 1000;
           return parseInt(diff/currDay);
          }
    </script>
        <title>Welcome Hotel Lucid!</title>

    </head>
    <body>
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>
        <div class=banner_main></div>
        <div class=res_search>
           <div class=res_res>
                <form name="srchRoomFrm" id="res_form" method="post">
                  
                  <table class="res_table">
                    <tr>
                      <td><b>ę°ě¤</b></td>
                      <td><b>&emsp;ě˛´íŹě¸</b></td>
                      <td><b>&emsp;&emsp;&emsp;ěë°ěź ě</b></td>
                      <td><b>&emsp;&emsp;ě˛´íŹěě</b></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>
                          <select name="room_name" style="cursor:pointer;" id="selectRoom">
                          <c:choose>
                          <c:when test="${param.searchRoom eq 'all' || param.searchRoom eq null}">
                                 <option value="all">ëŞ¨ë  ę°ě¤</option>
                                 <option value="standard">Standard Room</option>
                              <option value="deluxe">Deluxe Room</option>
                              <option value="executive">Executive Room</option>
                               <option value="suite">Suite Room</option>
                           </c:when>
                          <c:when test="${param.searchRoom eq 'standard'}">
                                 <option value="all">ëŞ¨ë  ę°ě¤</option>
                                 <option value="standard" selected>Standard Room</option>
                              <option value="deluxe">Deluxe Room</option>
                              <option value="executive">Executive Room</option>
                               <option value="suite">Suite Room</option>
                           </c:when>
                           <c:when test="${param.searchRoom eq 'deluxe'}">
                                 <option value="all">ëŞ¨ë  ę°ě¤</option>
                                 <option value="standard">Standard Room</option>
                              <option value="deluxe" selected>Deluxe Room</option>
                              <option value="executive">Executive Room</option>
                               <option value="suite">Suite Room</option>
                           </c:when>
                           <c:when test="${param.searchRoom eq 'executive'}">
                                 <option value="all">ëŞ¨ë  ę°ě¤</option>
                                 <option value="standard">Standard Room</option>
                              <option value="deluxe">Deluxe Room</option>
                              <option value="executive" selected>Executive Room</option>
                               <option value="suite">Suite Room</option>
                           </c:when>
                           <c:when test="${param.searchRoom eq 'suite'}">
                                 <option value="all">ëŞ¨ë  ę°ě¤</option>
                                 <option value="standard">Standard Room</option>
                              <option value="deluxe">Deluxe Room</option>
                              <option value="executive">Executive Room</option>
                               <option value="suite" selected>Suite Room</option>
                           </c:when>

                           </c:choose>
                          </select>
                      </td>
                      <td>
                        <input type="text" id="reservationCheckIn" value="">
                      </td>
                      <td>
                         &emsp;&emsp;&emsp;
                         <script type="text/javascript">
                         document.write(datediff(${param.searchFrom},${param.searchTo})+1);
                         </script>
                         ë°
                      </td>
                      <td>
                         <input type="text" id="res_checkout" value="">
                      </td>
                      <!-- <td>
                        <button type="button" name="button" id="minus"onclick="minus()">-</button>
                        <input type="text" value="2" id="count">
                        <button type="button" name="button" id="pl_m" onclick="plus()">+</button>
                      </td> -->
                      <td><button type="button" id="res_btn" onclick="javaScript:searchRoom($('#selectRoom').val());">ę˛ě</button></td>
                    </tr>
                  </table>
                </form>
              </div>
            </div>
        <div class=contain>
           <div class=index_contents>
                 <div class=intro>
                   <span class=intro_facility>
                     <a><img src="/resources/image/stair.png" width= 25px>  ě¸ľě 14  </a>
                     <a><img src="/resources/image/bed.png" width=25px>  ę°ě¤ 60  </a>
                     <a><img src="resources/image/parking.png" width =25px>  ěŁźě°¨ 100ë  </a>
                  </span>
                  <table class=floor_guide>
                     <tr>
                     <th>ě°íěĽ</th>
                     <td>13F</td>
                     <td class=right>13F Lucid Hall</td>
                     </tr>
                     <tr>
                     <th>ëźě´ě§</th>
                     <td>13F-14F</td>
                     <td class=right>13F Executive Rounge</td>
                     </tr>
                     <tr>
                     <th>ěźë°ě¸ľ</th>
                     <td>1F-12F</td>
                     <td class=right>12F-10F ě¤ěí¸ëŁ¸ / 9F-7F ě´ęˇ¸ě íí°ë¸ëŁ¸ / 6F-4F ëë­ě¤ëŁ¸ <br> 3F-1F ě¤í ë¤ëëŁ¸ / 8F, 4F íĄě°ě¤ / 1F ë ě¤í ë, ëĄëš</td>
                     </tr>
                     <tr>
                     <th>ëśëěě¤</th>
                     <td>B1</td>
                     <td class=right>B1F ě¤ë´ ě˛´ěĄę´, ě¤ë´ ěěěĽ</td>
                     </tr>
                     <tr>
                     <th>ëśëěě¤</th>
                     <td>B2</td>
                     <td class=right>B2F ě¤ë´ ęł¨íěĽ, ěŹě°ë</td>
                  </table>
               </div>
               <br><br><br><br><br><br><br>
               <table align=center><tr><td>
               <p> í¸í ëŁ¨ěëë ě¸ě ë íę˛°ę°ě´ íę˛Šěë ěëšě¤ě ěě¤ëĄ ęł ę°ěę˛ ęšě ę°ëě ěŁźë ë¸ëëëĽź ě§íĽíęł  ěěľëë¤.</p>   
               <p> ęˇ í ěë ëźě´íě¤íěźě ěśęľŹíëŠ° íę˛Šě ę°ěšëĽź ěë ęł ę°ëśë¤ě ěí´ ě¸ë ¨ëęł  ěë˝í ę°ě¤ęłź ě¸ěŹí ë°°ë ¤ę° ëŹťě´ëë ęł íę˛Š í¸í ěëšě¤ëĽź ě¤ëšíęł  ěěľëë¤.</p>   
               <p> í¸í ë ě¤í ëęłź ëźě´ě§ěě ě ęłľëë ěľęł ę¸ ěëŚŹë ěŚęą°ě´ ę˛˝íě ě ęłľíëŠ° ë¤ěí ěě¤ě ëšěŚëě¤ě ë ě ëĽź ëŞ¨ë ěŚę¸°ęł  ěśě´íěë ęł ę°ëśë¤ě ë§ěĄąěí¤ëë° ëśěĄąí¨ě´ ěěľëë¤.</p>
               <p> ě§ę¸, í¸í ëŁ¨ěëěě íšëłí ę˛˝íě ěŚę¸°ě¸ě</p>   
          	   </td></tr></table>
          </div>
          <%@include file = "/WEB-INF/views/layout/final.jsp" %>
        </div>
    </body>
</html>