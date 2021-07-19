<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="org.kpu.myweb.domain.ReservationVO"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>좌석 조회</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/jumbotron/">

    <!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
	<link rel="stylesheet" href="../resources/reserve.css" type="text/css"></link>
	</head>
<script type="text/javascript">
    function send() {
        // 자바스트립트에서 표현식 사용 가능
        var row = 10;
        var col = 6;
        var n = 0;
        var resultString="";
        
        
        for (var i = 0; i < row * col; i++) {
        	var check = document.getElementById("ch"+i);
            if (check.checked == true){
            	n++;
            	resultString+=i+","
            }
        }
        
        if (n < 1 || n > 5) {
            alert("좌석은 1~5개 까지 가능 합니다.");
            return;
        }
        
        
        document.getElementById("arrayParam").value = resultString;
        document.checkboxForm.action="http://localhost:8080/myweb/airport/reservingPost"
    	document.checkboxForm.submit();
    }
</script>

<body>
	<%@ include file="../include/menu.jsp" %>
        <div class="bpk-content-bubble_bpk-content-bubble__container__34oF4">
            <div class="bpk-content-bubble_bpk-content-bubble__content-wrapper__3VYi7">
                <div class="DetailsPanelHeader_content__1UCBv">
                    <span
                        class="BpkText_bpk-text__2VouB BpkText_bpk-text--xxxxl__1wbuM BpkText_bpk-text--bold__NhE9P DetailsPanelHeader_destinationName__tm7bK">좌석
                        선택</span>
                    <div class="DetailsPanelHeader_flightDetails__11JF2">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18"
                            fill="rgb(255, 255, 255)" style="width: 1.125rem; height: 1.125rem;">
                            <path
                                d="M10.8 1.774A2.637 2.637 0 0 1 12 1.5a2.563 2.563 0 0 1 1.196.28.685.685 0 0 1 .304.62v2.262A1.377 1.377 0 0 1 12 6a1.377 1.377 0 0 1-1.5-1.338V2.4a.681.681 0 0 1 .3-.626zM15 13.835V9.452a1.514 1.514 0 0 0-.536-1.277 4.444 4.444 0 0 0-2.429-.675 4.575 4.575 0 0 0-2.5.784A1.545 1.545 0 0 0 9 9.568v4.383a2.458 2.458 0 0 0 .295 1.217c.05.087.103.175.157.263a3.131 3.131 0 0 1 .563 1.414l.408 4.312c.054.764.483 1.343.995 1.343h1.235c.511 0 .94-.58.994-1.343l.408-4.312a3.272 3.272 0 0 1 .477-1.32c.074-.14.148-.277.214-.417A3.083 3.083 0 0 0 15 13.835z">
                            </path>
                        </svg>
                        <span
                            class="BpkText_bpk-text__2VouB BpkText_bpk-text--xs__1ycc8">${airport.departureCountry}</span>
                        <div class="DetailsPanelHeader_bulletpoint__36Dhq">•</div>
                        <span
                            class="BpkText_bpk-text__2VouB BpkText_bpk-text--xs__1ycc8">${airport.arriveCountry}</span>
                    </div>
                    <span class="BpkText_bpk-text__2VouB BpkText_bpk-text--xs__1ycc8">${airport.price}원</span>
                </div>
            </div>
        </div>
        
	
	
	
	
<div class="DetailsPanelContent_content__El2wi">
    <div class="Itinerary_leg__3gRMj">
        <div class="LegHeader_container__3jKJM">
            <div class="LegHeader_titleContainer__9o69l">
                <h4 class="BpkText_bpk-text__2VouB BpkText_bpk-text--lg__1PdnC BpkText_bpk-text--bold__NhE9P">출발 날짜 : 
                </h4>
                
                <!-- 날짜 받아오기 -->
                <fmt:parseDate value='${ airport.departureTime }' var='regDate' pattern="yyyy-MM-dd-H-m" />
                <fmt:parseDate value='${ airport.arriveTime }' var='arriveDate' pattern="yyyy-MM-dd-H-m" />
                
                

                
                <!-- 시간 계산 -->
                <fmt:parseDate var="Time1_D" value='${ airport.departureTime }' pattern="yyyy-MM-dd-HH-mm" /> 
                <fmt:parseDate var="Time2_D" value='${ airport.arriveTime }' pattern="yyyy-MM-dd-HH-mm" /> 
                
                <fmt:parseNumber var="sum_dd" value="${(Time2_D.time/(1000*60*60) - Time1_D.time/(1000*60*60))/24}" integerOnly="true" />
                <fmt:parseNumber var="sum_hh" value="${(Time2_D.time/(1000*60*60) - Time1_D.time/(1000*60*60))%24}" integerOnly="true" />
				<fmt:parseNumber var="sum_mm" value="${(Time2_D.time/(1000*60) - Time1_D.time/(1000*60))%60}" integerOnly="true" />
				
				<fmt:formatNumber var="format_dd" value="${sum_dd}" minIntegerDigits="2" />
				<fmt:formatNumber var="format_hh" value="${sum_hh}" minIntegerDigits="2" />
				<fmt:formatNumber var="format_mm" value="${sum_mm}" minIntegerDigits="2" />
                
                
                &nbsp;<h4 class="BpkText_bpk-text__2VouB BpkText_bpk-text--base__3REoZ LegHeader_legDate__1uPxp">
                	<fmt:formatDate value="${ regDate }" pattern="yyyy년 MM월 dd일 (E)"/></h4>
            </div>
        </div>
        <button type="button" class="LegSummary_container__129Ld">
            <div class="LegSummary_detailsContainer__BAkI8">
                <div class="LegDetails_container__3uhle LegSummary_legDetailsWithChevron__333Y2" aria-hidden="false">
                    <div class="LegInfo_legInfo__2UyXp">
                    
                        <div class="LegInfo_routePartialDepart__Ix_Rt"><span
                                class="BpkText_bpk-text__2VouB BpkText_bpk-text--lg__1PdnC LegInfo_routePartialTime__ngmkT">
                                
                                
                                
                                <div><span class="BpkText_bpk-text__2VouB BpkText_bpk-text--base__3REoZ">
                                		<fmt:formatDate value="${ regDate }" pattern="a h:m"/>
										</span></div>
                                
                                
                            </span><span class="BpkText_bpk-text__2VouB BpkText_bpk-text--base__3REoZ"><span
                                    class="BpkText_bpk-text__2VouB BpkText_bpk-text--base__3REoZ LegInfo_routePartialCityTooltip__Ao7U-">${airport.departureCountry}</span></span>
                        </div>
                        <div class="LegInfo_stopsContainer__2Larg">
                            <div class="LegInfo_stopLine__3Zhmj"><svg version="1.1" id="Layer_1"
                                    xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 12 12"
                                    enable-background="new 0 0 12 12" xml:space="preserve"
                                    class="LegInfo_planeEnd__sWZ93">
                                    <path fill="#898294"
                                        d="M3.922,12h0.499c0.181,0,0.349-0.093,0.444-0.247L7.949,6.8l3.233-0.019C11.625,6.791,11.989,6.44,12,6 c-0.012-0.44-0.375-0.792-0.818-0.781L7.949,5.2L4.866,0.246C4.77,0.093,4.602,0,4.421,0L3.922,0c-0.367,0-0.62,0.367-0.489,0.71 L5.149,5.2l-2.853,0L1.632,3.87c-0.084-0.167-0.25-0.277-0.436-0.288L0,3.509L1.097,6L0,8.491l1.196-0.073 C1.382,8.407,1.548,8.297,1.632,8.13L2.296,6.8h2.853l-1.716,4.49C3.302,11.633,3.555,12,3.922,12">
                                    </path>
                                </svg></div>
                                <span class="BpkText_bpk-text__2VouB BpkText_bpk-text--xs__1ycc8 Duration_duration__2Evn6">${sum_dd}일 ${format_hh}시간 ${format_mm}분</span>
                              <br><br>
                        </div>
                        <div class="LegInfo_routePartialArrive__1fHVy"><span
                                class="BpkText_bpk-text__2VouB BpkText_bpk-text--lg__1PdnC LegInfo_routePartialTime__ngmkT">
                                <div><span class="BpkText_bpk-text__2VouB BpkText_bpk-text--base__3REoZ">
                            
                                		<fmt:formatDate value="${ arriveDate }" pattern="a h:m"/>
                                		</span></div>
                            </span><span class="BpkText_bpk-text__2VouB BpkText_bpk-text--base__3REoZ"><span
                                    class="BpkText_bpk-text__2VouB BpkText_bpk-text--base__3REoZ LegInfo_routePartialCityTooltip__Ao7U-">${airport.arriveCountry}</span></span>
                        </div>
                    </div>
                </div>
            </div>
        </button>
        <div style="height: 0px; overflow: hidden; transition: height 200ms ease 0s;">
            <div style="display: none;">
                <div></div>
            </div>
        </div>
    </div>
    </div>

<% 
request.setCharacterEncoding("utf-8"); 
int row=10, 
col=6; 
int w=30+col*30+col/5*20; 
if(col%5==0) 
    w-=20; 
%>

<br/><br/>
<div class="checkSeat" align="center">
    <form name=checkboxForm method="post">
    <input type="hidden" id="arrayParam" name="arrayParam"/>
    <input type="hidden" id="basicInfo" name="basicInfo"  value='${ airport.airportlistId }'/>
        <table width="<%=w%>">
            <tr height="30">
                <% 
                //좌석번호
                out.println("<td width='30'>&nbsp;</td>");
                out.println("<td width='30' align='center'>A</td>");
                out.println("<td width='30' align='center'>B</td>");
                out.println("<td width='30' align='center'>C</td>");
                out.println("<td width='20'>&nbsp;</td>");
                out.println("<td width='20'>&nbsp;</td>");
                out.println("<td width='30' align='center'>D</td>");
                out.println("<td width='30' align='center'>E</td>");
                out.println("<td width='30' align='center'>F</td>");
                %>
            </tr>
            
			<%  
			ArrayList<Integer> checked = new ArrayList<Integer>(); 
			List<ReservationVO> reserveList =(List<ReservationVO>)request.getAttribute("reservations");
			
			for(int i=0;i<reserveList.size();i++){
				checked.add(reserveList.get(i).getReserveSeat());
			}
			
            Integer s; 
            for(int i=1; i<=row; i++) { 
            	//좌석번호
                out.println("<tr height='25'>");
                out.println("<td align='center'>"+i+"</td>");
                for(int j=1; j<=col; j++) { 
                    if(j!=1 && j%3==1 && j !=6) {
                        out.println("<td width='20'>&nbsp;</td>");
                        out.println("<td width='20'>&nbsp;</td>");
                    }
                    //체크박스
                    out.print("<td width='30' align='center'>");
                    s=(i-1)*6+(j-1);
                    out.print("<input type='checkbox' id= 'ch"+s+"' name='ch"+s+"' value='"+s+"'");
                    if(checked.contains((i-1)*6+(j-1))){
                    	out.print("disabled");
                    }
                    out.print(">");
                    out.println("</td>");
                }
                out.println("</tr>");
            }
            %>

        </table>

        <table width="<%=w%>">
            <tr height="50">
                <td align="right">
				<button type="button" class="btn btn-outline-dark"onclick='javascript:send()'>좌석예약</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>