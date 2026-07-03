<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/WEB-INF/jsp/include/header.jsp"%>

<title><spring:message code="BzComposer.configuration.NonProfitOrganization" /></title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />
<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

<style type="text/css">

.card-body
{

height: 400px;
}
.card-text
{
height: 50px;
}
p
{
font-size: 11px;
}

h5
{
 font-size: 15px;
}
.btn btn-outline-info
{
height: 15px;
}
.card-title
{
font-weight: bold;
 font-size: 18px;
  height: 50px;
}
.card
{
background:#F8F8F8;

}
h6
{
font-size: 12px;
color:#355449;
font-weight: bold;
}
.card-header
{
background: #05A9C5;
	color: #FFFFFF;
	font-weight: bold;
align-content: center;
vertical-align:center;
height: 40px;
}

table.tabla-listados {
	width: 100%;
	border: 4px solid rgb(207, 207, 207);
	margin: 10px 0px 10px 0px;
}
.card-footer
{
height:60px;
}

</style>
</head>



<body>
                     <div align="center">
                                           <img src="/ConfigurationImages/NPO.png" height="60" width="60">
                                            <span
																				style="font-size: 1.6em; font-weight: bold; color:#05A9C5;; margin: 30px 30px 30px 30px;  padding: 0 0 .3em 0;">
																				<spring:message
																					code="BzComposer.configuration.NonProfitOrganization" />
											</span>
                                            </div>
                                            <br>
                                         <div align="center">
                                            <table class="table.tabla-listados" width="80%"  style=" padding:10px 0 .3em 0;">
															
															<tr>
															
																<td>
															<div class="card" style="width: 15rem;">
															  
														   <div class="card-body" align="center">
														    <h6 class="card-title">${bcaVersionMembershipPlansList[0].name}</h6>
														    <br>
														   
														    
														    <p class="card-text">${bcaVersionMembershipPlansList[0].features}</p>
														    <br>
														  <p >
														    Start at:</p>
														      <b>
														       ${bcaVersionMembershipPlansList[0].price} $/month </b>  
														 
														  <br>
														 <br>
														 <input type="checkbox"   data-toggle="toggle" data-on="Active" data-off="Not Active" data-onstyle="success" data-offstyle="warning">
														 
														 
														 <br>
														 <br>
														 <br>
														
														 
														  <button type="button" class="formbutton"> Buy now </button>
														   
														  </div>
														  
														</div>
														
															<td>
															<div class="card" style="width: 15rem;">
															  
														  <div class="card-body" align="center">
														    <h6 class="card-title">${bcaVersionMembershipPlansList[1].name}</h6>
														    <br>
														  
														    
														    <p class="card-text">${bcaVersionMembershipPlansList[1].features}</p>
														    <br>
														  <p >
														    Start at:</p>
														      <b>
														       ${bcaVersionMembershipPlansList[1].price} $/month </b>  
														 
														  <br>
														 <br>
														 <input type="checkbox"   data-toggle="toggle" data-on="Active" data-off="Not Active" data-onstyle="success" data-offstyle="warning">
														 
														 
														 
														 <br>
														  <br>
														  <br>
														
														 
														  <button type="button" class="formbutton"  disabled="disabled"> Buy now </button>
														   
														  </div>
														  
														</div>
															
															</td>
															
															<td>
															<div class="card" style="width: 15rem;">
															<div class="card-body" align="center">
														    <h6 class="card-title">${bcaVersionMembershipPlansList[2].name}</h6>
														    <br>
														    
														    
														    <p class="card-text">${bcaVersionMembershipPlansList[2].features}</p>
														    <br>
														  <p >
														    Start at:</p>
														      <b>
														       ${bcaVersionMembershipPlansList[2].price} $/month </b>  
														  <br>
														 <br>
														 <input type="checkbox"   data-toggle="toggle" data-on="Active" data-off="Not Active" data-onstyle="success" data-offstyle="warning">
														 
														 
														 <br>
														 <br>
														 <br>
														
														 
														  <button type="button" class="formbutton"> Buy now </button>
														</div>
														</div>
														
															</td>
															
															</tr>
															
															</table>
															
															</div>
															<br>
															<br>
															<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>

</body>
</html>