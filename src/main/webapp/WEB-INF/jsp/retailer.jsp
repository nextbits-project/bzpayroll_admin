<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<html lang="en">
<title><spring:message code="BzComposer.existingcompetitorstitle"/></title>
<%@ include file="templateHeader.jsp"%>
<style>
.highlight {
  background-color: yellow;
}
</style>
<script type="text/javascript">
function redirectToLogin()
{
	window.location = "Login?tabid=loginPage";
}
function openRegisterPage()
{
    window.location = "Register?tabid=register";
}
function searchText()
{
	var highlightRe = /<span class="highlight">(.*?)<\/span>/g,
	highlightHtml = '<span class="highlight">$1</span>';
	var term = document.getElementById("searchBox").value;
	var txt1 = $('#existingCompetitors').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{

			document.getElementById("existingCompetitors").innerHTML = txt1;
		}
		else
		{
			var txt = $('#existingCompetitors').html().replace(highlightRe,'$1');

			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}
			$("#existingCompetitors").html(txt);
			setTimeout(function(){
				document.getElementById("existingCompetitors").innerHTML = txt1;
			}, 5000);
		}
	}
	else
	{
		alert("<bean:message key='BzComposer.common.emterword'/>");
	}
 }
function searchTextMobile()
{
	var highlightRe = /<span class="highlight">(.*?)<\/span>/g,
	highlightHtml = '<span class="highlight">$1</span>';
	var term = document.getElementById("searchBoxMobile").value;
	var txt1 = $('#existingCompetitors').html();
	if(term.length>1)
	{
		if(term == 'Style' || term == 'style' || term == 'Class' || term == 'class ' || term == 'para-temp')
		{

			document.getElementById("existingCompetitors").innerHTML = txt1;
		}
		else
		{
			var txt = $('#existingCompetitors').html().replace(highlightRe,'$1');

			if(term !== '') {
			        txt = txt.replace(new RegExp('(' + term + ')', 'gi'), highlightHtml);
			}
			$("#existingCompetitors").html(txt);
			setTimeout(function(){
				document.getElementById("existingCompetitors").innerHTML = txt1;
			}, 5000);
		}
	}
	else
	{
		alert("<bean:message key='BzComposer.common.emterword'/>");
	}
}
function openSampleCompany2()
{
	window.location.href="Login.do?tabid=selectedCompanyHome&selectedCompanyId=2&companyName=ABC Retails Company";
}

function openSampleCompany3()
{
	window.location.href="Login.do?tabid=selectedCompanyHome&selectedCompanyId=3&companyName=ABC Wholesale Company";
}

function openSampleCompany4()
{
	window.location.href="Login.do?tabid=selectedCompanyHome&selectedCompanyId=4&companyName=ABC eSales Company";
}
</script>
<body>

	<header>
	<!-- Header for mobile screen starts -->
	<div class="hidden-tablet-landscape-up">
		<div class="header header-mobile-1">
			<div class="container-fluid">
				<div align="center" style="max-width: 100%">
					<div class="logo" style="max-width: 100%;">
						<a href="${pageContext.request.contextPath}/index.jsp"> <img
							src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png"
							alt="Consulting" style="max-width: 100%"/>
						</a>
					</div>
				</div>
				<div align="center" style="max-width: 100%">
					<input type="text" id="searchBoxMobile" name="searchBoxMobile" placeholder="<spring:message code="BzComposer.searchtext"/>" style="max-width: 100%;" />
					<button class="btn btn-primary" onclick="searchTextMobile()"><spring:message code="BzComposer.searchbuttontext"/></button>
				</div>
				<div align="center" style="max-width: 100%">
					<button type="button" class="btn btn-primary" onclick="redirectToLogin()"><spring:message code="BzComposer.login"/></button>
					<button type="button" class="btn btn-primary" onclick="openRegisterPage()"><spring:message code="BzComposer.register"/></button>
					<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
				</div>
			</div>
			<div class="au-navbar-mobile navbar-mobile-1">
				<ul class="au-navbar-menu">
					<li><a href="#"><spring:message code="BzComposer.home"/></a></li>
					<li><a href="${pageContext.request.contextPath}/BzComposer"><spring:message code="BzComposer.whatisbzcomposer"/></a></li>
					<li><a href="${pageContext.request.contextPath}/aboutUS"><spring:message code="BzComposer.aboutus"/></a></li>
					<li><a href="${pageContext.request.contextPath}/existingCompetitors"><spring:message code="BzComposer.existingcompetitors"/></a></li>
					<li class="drop">
						<a href="#"><spring:message code="BzComposer.samplecompaies"/></a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="Login.do?tabid=selectedCompany&selectedCompanyId=4&companyName=ABC eSales Company"><spring:message code="BzComposer.samplecompaies.eSalecompany"/></a></li>
							<li><a href="Login.do?tabid=selectedCompany&selectedCompanyId=2&companyName=ABC Retails Company"><spring:message code="BzComposer.samplecompaies.retailcompany"/></a></li>
							<li><a href="Login.do?tabid=selectedCompany&selectedCompanyId=3&companyName=ABC Wholesale Company"><spring:message code="BzComposer.samplecompaies.wholesalecompany"/></a></li>
						</ul>
						<%-- <ul class="drop-menu bottom-right" id="sampleCompanyList">
                            <logic:iterate name="acList" id="objList1" indexId="ndx">
                                <li id="<bean:write name="objList1" property="companyid" />"><a href="#"><bean:write name="objList1" property="companyName" /></a></li>
                            </logic:iterate>
                        </ul> --%>
					</li>
					<%-- <li><a href="${pageContext.request.contextPath}/applicableIndustries.jsp">Applicable Industries</a></li>
					<li class="drop">
						<a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp">Possible Marketing Ways</a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#valueAddedReseller">Value Added Reseller</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#erp">Electronic Resource Planning(ERP)</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#openSourceProject">Open Source Project</a></li>
							<li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#sharewareDownloads">Shareware Downloads</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/futureUpdate.jsp">Future Update</a></li> --%>
					<li><a href="${pageContext.request.contextPath}/ourServices"><spring:message code="BzComposer.ourservices"/></a></li>
					<li><a href="${pageContext.request.contextPath}/industries"><spring:message code="BzComposer.industires"/></a></li>
					<li class="drop"><a href="${pageContext.request.contextPath}/features"><spring:message code="BzComposer.features"/></a>
						 <span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/features#easySetup"><spring:message code="BzComposer.features.easysetup"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#enhancedFeatures"><spring:message code="BzComposer.features.enshancedfeature"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#customerContactManagement"><spring:message code="BzComposer.features.customercontactmanagement"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#completeOrderManagement"><spring:message code="BzComposer.features.completeordermanagement"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#inventoryWarehouseManagement"><spring:message code="BzComposer.features.inventorywarehousemanagement"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#shippingPaymentIntegration"><spring:message code="BzComposer.features.shippingpaymentintegration"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#fullFeaturedAccountingSystem"><spring:message code="BzComposer.features.accountsystem"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#payRollTax"><spring:message code="BzComposer.features.payrolltax"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#completeRealTimeReports"><spring:message code="BzComposer.features.completerealtimreports"/></a></li>
							<li><a href="${pageContext.request.contextPath}/features#eCommerceIntegration"><spring:message code="BzComposer.features.ecommerceintegration"/></a></li>
						</ul>
					</li>
					<li class="drop">
						<a href="${pageContext.request.contextPath}/products"><spring:message code="BzComposer.products"/></a>
						<span class="arrow"><i></i></span>
						<ul class="drop-menu bottom-right">
							<li><a href="${pageContext.request.contextPath}/products#bzcomposerStandard"><spring:message code="BzComposer.products.bzcomposerstandard"/></a></li>
							<li><a href="${pageContext.request.contextPath}/products#bzcomposerBilling"><spring:message code="BzComposer.products.billing"/></a></li>
							<li><a href="${pageContext.request.contextPath}/products#bzcomposereSales"><spring:message code="BzComposer.products.esales"/></a></li>
							<li><a href="${pageContext.request.contextPath}/products#bzcomposerProfessional"><spring:message code="BzComposer.products.professional"/></a></li>
							<li><a href="${pageContext.request.contextPath}/products#bzcompserStandardShareware"><spring:message code="BzComposer.products.standardshareware"/></a></li>
						</ul>
					</li>
					<%-- <li><a href="${pageContext.request.contextPath}/partners.jsp">Partners</a></li> --%>
					<li><a href="${pageContext.request.contextPath}/contactUs"><spring:message code="BzComposer.contact"/></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Header for mobile screen ends -->
	<!-- Header for bigger screen starts -->

	<div class="hidden-tablet-landscape">
		<div class="header header-1">
			<div class="container">
				<div class="row">
					<div class="col-md-3" align="left">
						<div class="block-left">
							<div class="logo">
								<a href="${pageContext.request.contextPath}/index.jsp">
									<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting" />
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="search-wrap" align="right">
							<div class="input-group" align="right">
								<input type="text" id="searchBox" name="searchBox" placeholder="<spring:message code="BzComposer.searchtext"/>" style="width: 241px" />
								<div class="input-group-btn">
									<button class="btn btn-primary" onclick="searchText()"><spring:message code="BzComposer.searchbuttontext"/></button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3" align="right">
						<div class="input-group">
							<select name="locale" id="locale" class="form-control" onchange="showLocale();">
								<option value=""><spring:message code="BzComposer.selectlanguage"/></option>
								<option value="en"><spring:message code="BzComposer.selectlanguage.english"/></option>
								<option value="zh"><spring:message code="BzComposer.selectlanguage.chinese"/></option>
								<option value="es"><spring:message code="BzComposer.selectlanguage.spanish"/></option>
							</select>
						</div>
					</div>
					<div class="col-md-3" align="right">
						<div align="center">
							<div class="contact-widget contact-widget-1">
								<button type="button" class="btn btn-primary" onclick="redirectToLogin()"><spring:message code="BzComposer.login"/></button>
								<button type="button" class="btn btn-primary" onclick="openRegisterPage()"><spring:message code="BzComposer.register"/></button>
								<button class="hamburger hamburger--spin hidden-tablet-landscape-up" id="toggle-icon">
									<span class="hamburger-box">
										<span class="hamburger-inner"></span>
									</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section section-navbar-1 bg-grey hidden-tablet-landscape"
		id="js-navbar-fixed">
		<div class="text-center">
			<div class="text-center">
				<div class="logo-mobile">
					<a href="${pageContext.request.contextPath}/index.jsp">
						<img src="${pageContext.request.contextPath}/dist/template/images/icons/BzComposerLogo.png" alt="Consulting"/>
					</a>
				</div>
			</div>

				<nav class="text-center">
					<div class="au-navbar navbar-1">
						<ul class="au-navbar-menu">
							<li><a href="#"><spring:message code="BzComposer.home"/></a></li>
							<li><a href="${pageContext.request.contextPath}/BzComposer"><spring:message code="BzComposer.whatisbzcomposer"/></a></li>
							<li><a href="${pageContext.request.contextPath}/aboutUS"><spring:message code="BzComposer.aboutus"/></a></li>
							<li><a href="${pageContext.request.contextPath}/existingCompetitors"><spring:message code="BzComposer.existingcompetitors"/></a></li>
							<%-- <li><a href="${pageContext.request.contextPath}/applicableindustries">Applicable Industries</a></li> --%>
							<li class="drop"><a href="#"><spring:message code="BzComposer.samplecompaies"/></a>
								<span class="arrow"><i></i></span>
								<ul class="drop-menu bottom-right">
									<li><a href="#" onclick="openSampleCompany4();"><spring:message code="BzComposer.samplecompaies.eSalecompany"/></a></li>
									<li><a href="#" onclick="openSampleCompany2();"><spring:message code="BzComposer.samplecompaies.retailcompany"/></a></li>
									<li><a href="#" onclick="openSampleCompany3();"><spring:message code="BzComposer.samplecompaies.wholesalecompany"/></a></li>
								</ul>
								<%-- <ul class="drop-menu bottom-right" id="sampleCompanyList">
                                    <logic:iterate name="acList" id="objList1" indexId="ndx">
                                        <li id="<bean:write name="objList1" property="companyid" />"><a href="#"><bean:write name="objList1" property="companyName" /></a></li>
                                    </logic:iterate>
                                </ul> --%>
							</li>
							<%-- <li><a href="${pageContext.request.contextPath}/applicableindustries">Applicable Industries</a></li>
                            <li class="drop"><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp">Possible Marketing Ways</a>
                                <span class="arrow"><i></i></span>
                                <ul class="drop-menu bottom-right">
                                    <li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#valueAddedReseller">Value Added Reseller</a></li>
                                    <li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#erp">Electronic Resource Planning(ERP)</a></li>
                                    <li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#openSourceProject">Open Source Project</a></li>
                                    <li><a href="${pageContext.request.contextPath}/possibleMarketingWays.jsp#sharewareDownloads">Shareware Downloads</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/futureUpdate.jsp">Future Update</a></li> --%>
							<li><a href="${pageContext.request.contextPath}/ourServices"><spring:message code="BzComposer.ourservices"/></a></li>
							<li><a href="${pageContext.request.contextPath}/industries"><spring:message code="BzComposer.industires"/></a></li>
							<li class="drop"><a href="${pageContext.request.contextPath}/features"><spring:message code="BzComposer.features"/></a>
								<span class="arrow"><i></i></span>
								<ul class="drop-menu bottom-right">
									<li><a href="${pageContext.request.contextPath}/features#easySetup"><spring:message code="BzComposer.features.easysetup"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#enhancedFeatures"><spring:message code="BzComposer.features.enshancedfeature"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#customerContactManagement"><spring:message code="BzComposer.features.customercontactmanagement"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#completeOrderManagement"><spring:message code="BzComposer.features.completeordermanagement"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#inventoryWarehouseManagement"><spring:message code="BzComposer.features.inventorywarehousemanagement"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#shippingPaymentIntegration"><spring:message code="BzComposer.features.shippingpaymentintegration"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#fullFeaturedAccountingSystem"><spring:message code="BzComposer.features.accountsystem"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#payRollTax"><spring:message code="BzComposer.features.payrolltax"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#completeRealTimeReports"><spring:message code="BzComposer.features.completerealtimreports"/></a></li>
									<li><a href="${pageContext.request.contextPath}/features#eCommerceIntegration"><spring:message code="BzComposer.features.ecommerceintegration"/></a></li>
								</ul>
							</li>
							<li class="drop"><a href="${pageContext.request.contextPath}/products"><spring:message code="BzComposer.products"/></a>
								<span class="arrow"><i></i></span>
								<ul class="drop-menu bottom-right">
									<li><a href="${pageContext.request.contextPath}/products#bzcomposerStandard"><spring:message code="BzComposer.products.bzcomposerstandard"/></a></li>
									<li><a href="${pageContext.request.contextPath}/products#bzcomposerBilling"><spring:message code="BzComposer.products.billing"/></a></li>
									<li><a href="${pageContext.request.contextPath}/products#bzcomposereSales"><spring:message code="BzComposer.products.esales"/></a></li>
									<li><a href="${pageContext.request.contextPath}/products#bzcomposerProfessional"><spring:message code="BzComposer.products.professional"/></a></li>
									<li><a href="${pageContext.request.contextPath}/products#bzcompserStandardShareware"><spring:message code="BzComposer.products.standardshareware"/></a></li>
								</ul>
							</li>
							<%-- <li><a href="${pageContext.request.contextPath}/partners.jsp">Partners</a></li> --%>
							<li><a href="${pageContext.request.contextPath}/contactUs"><spring:message code="BzComposer.contact"/></a></li>
						</ul>
					</div>
				</nav>
			</div>
	</div>
	</header>
	<!-- header / end-->

	<div>

<!DOCTYPE html>
<html lang="en">

<body style="margin:0; font-family: Arial, Helvetica, sans-serif; color:#0f172a; background:#f9fafb;">

  <!-- Hero / Intro -->
  <section style="background:#f0f4f8; border-bottom:1px solid #e5e7eb;">
    <div style="max-width:1100px; margin:0 auto; padding:40px 16px;">
      <div style="display:flex; gap:24px; align-items:center; flex-wrap:wrap;">
        <div style="flex:1 1 360px; min-width:280px;">
          <h2 style="margin:0 0 15px 0; font-size:32px; line-height:1.2; color:#1e40af;">
            Retailer version
          </h2>
          <p style="margin:0 0 12px 0; font-size:16px; line-height:1.6; color:#334155;">
            Streamlines in-store sales, inventory tracking, and customer loyalty programs. Perfect for single stores and multi-location retail businesses seeking efficiency and profitability.
          </p>
          <p style="margin:0; font-size:16px; line-height:1.6; color:#334155;">
            Running a retail business requires balancing sales, inventory control, and customer service. The <span style="font-weight:600;">BzComposer Retailer Program</span> helps store owners manage operations efficiently, increase sales, and retain loyal customers.
          </p>
          <div style="margin-top:20px;">
            <a href="#features" style="text-decoration:none; background:#1e40af; color:#fff; padding:12px 16px; border-radius:12px; font-weight:600; display:inline-block; transition:0.3s;">Explore Features</a>
          </div>
        </div>

        <div style="flex:1 1 360px; min-width:280px;">
          <div style="background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:20px; box-shadow:0 6px 18px rgba(2,6,23,.08);">
            <div style="display:flex; align-items:center; justify-content:space-between; margin-bottom:12px;">
              <span style="font-weight:700; color:#111827;">Retail Snapshot</span>
              <span style="font-size:12px; color:#6b7280;">Demo</span>
            </div>
            <div style="display:flex; gap:12px; flex-wrap:wrap;">
              <div style="flex:1 1 120px; min-width:120px; background:#f0f4f8; border-radius:12px; padding:14px; text-align:center;">
                <div style="font-size:12px; color:#6b7280;">POS Transactions</div>
                <div style="font-size:22px; font-weight:800; color:#1e40af;">342</div>
              </div>
              <div style="flex:1 1 120px; min-width:120px; background:#f0f4f8; border-radius:12px; padding:14px; text-align:center;">
                <div style="font-size:12px; color:#6b7280;">Active Stores</div>
                <div style="font-size:22px; font-weight:800; color:#1e40af;">5</div>
              </div>
              <div style="flex:1 1 120px; min-width:120px; background:#f0f4f8; border-radius:12px; padding:14px; text-align:center;">
                <div style="font-size:12px; color:#6b7280;">Loyal Customers</div>
                <div style="font-size:22px; font-weight:800; color:#1e40af;">128</div>
              </div>
            </div>
            <p style="margin:12px 0 0 0; font-size:12px; color:#64748b;">Demo indicators for layout only.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Key Features -->
  <section id="features" style="background:#ffffff;">
    <div style="max-width:1100px; margin:0 auto; padding:36px 16px;">
      <h3 style="margin:0 0 20px 0; font-size:24px; color:#1e40af;">Key Features &amp; Benefits</h3>

      <div style="display:flex; flex-wrap:wrap; gap:18px;">
        <div style="flex:1 1 260px; min-width:260px; background:#f8fafc; border-radius:14px; padding:18px; border:1px solid #e5e7eb; box-shadow:0 4px 18px rgba(2,6,23,.06); transition:0.3s;"
             onmouseover="this.style.boxShadow='0 8px 24px rgba(2,6,23,.12)';" onmouseout="this.style.boxShadow='0 4px 18px rgba(2,6,23,.06)';">
          <div style="font-weight:700; margin-bottom:8px;">POS Integration</div>
          <p style="margin:0; color:#334155; line-height:1.6;">Manage in-store sales quickly with a POS system linked to inventory and accounting.</p>
        </div>

        <div style="flex:1 1 260px; min-width:260px; background:#f8fafc; border-radius:14px; padding:18px; border:1px solid #e5e7eb; box-shadow:0 4px 18px rgba(2,6,23,.06); transition:0.3s;"
             onmouseover="this.style.boxShadow='0 8px 24px rgba(2,6,23,.12)';" onmouseout="this.style.boxShadow='0 4px 18px rgba(2,6,23,.06)';">
          <div style="font-weight:700; margin-bottom:8px;">Inventory Control</div>
          <p style="margin:0; color:#334155; line-height:1.6;">Monitor stock in real-time, set automatic re-order points, and track product performance.</p>
        </div>

        <div style="flex:1 1 260px; min-width:260px; background:#f8fafc; border-radius:14px; padding:18px; border:1px solid #e5e7eb; box-shadow:0 4px 18px rgba(2,6,23,.06); transition:0.3s;"
             onmouseover="this.style.boxShadow='0 8px 24px rgba(2,6,23,.12)';" onmouseout="this.style.boxShadow='0 4px 18px rgba(2,6,23,.06)';">
          <div style="font-weight:700; margin-bottom:8px;">CRM</div>
          <p style="margin:0; color:#334155; line-height:1.6;">Track purchase history, preferences, and loyalty programs for stronger customer connections.</p>
        </div>

        <div style="flex:1 1 260px; min-width:260px; background:#f8fafc; border-radius:14px; padding:18px; border:1px solid #e5e7eb; box-shadow:0 4px 18px rgba(2,6,23,.06); transition:0.3s;"
             onmouseover="this.style.boxShadow='0 8px 24px rgba(2,6,23,.12)';" onmouseout="this.style.boxShadow='0 4px 18px rgba(2,6,23,.06)';">
          <div style="font-weight:700; margin-bottom:8px;">Multi-Location Support</div>
          <p style="margin:0; color:#334155; line-height:1.6;">Manage inventory and sales across multiple stores from a single dashboard.</p>
        </div>

        <div style="flex:1 1 260px; min-width:260px; background:#f8fafc; border-radius:14px; padding:18px; border:1px solid #e5e7eb; box-shadow:0 4px 18px rgba(2,6,23,.06); transition:0.3s;"
             onmouseover="this.style.boxShadow='0 8px 24px rgba(2,6,23,.12)';" onmouseout="this.style.boxShadow='0 4px 18px rgba(2,6,23,.06)';">
          <div style="font-weight:700; margin-bottom:8px;">Sales Reporting</div>
          <p style="margin:0; color:#334155; line-height:1.6;">Access daily, weekly, and monthly sales reports to make informed decisions.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Integration -->
  <section style="background:#f0f4f8; border-top:1px solid #e5e7eb; border-bottom:1px solid #e5e7eb;">
    <div style="max-width:1100px; margin:0 auto; padding:36px 16px;">
      <h3 style="margin:0 0 12px 0; font-size:22px; color:#1e40af;">Integration &amp; Compatibility</h3>
      <p style="margin:0; color:#334155; line-height:1.7;">
        Fully integrates with BzComposer eCommerce, Accounting, and Payroll modules, keeping retail operations connected and streamlined.
      </p>
      <div style="display:flex; gap:12px; flex-wrap:wrap; margin-top:14px;">
        <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 12px; border-radius:999px; font-size:12px;">Accounting</span>
        <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 12px; border-radius:999px; font-size:12px;">CRM</span>
        <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 12px; border-radius:999px; font-size:12px;">eCommerce</span>
        <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 12px; border-radius:999px; font-size:12px;">Inventory</span>
        <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 12px; border-radius:999px; font-size:12px;">Reporting</span>
      </div>
    </div>
  </section>

  <!-- Use Cases -->
  <section style="background:#ffffff;">
    <div style="max-width:1100px; margin:0 auto; padding:36px 16px;">
      <h3 style="margin:0 0 18px 0; font-size:22px; color:#1e40af;">Use Case Examples</h3>

      <div style="display:flex; flex-wrap:wrap; gap:18px;">
        <div style="flex:1 1 320px; min-width:280px; background:#f8fafc; border-radius:14px; padding:18px; border:1px solid #e5e7eb; transition:0.3s;"
             onmouseover="this.style.boxShadow='0 8px 24px rgba(2,6,23,.12)';" onmouseout="this.style.boxShadow='0 0 0 rgba(0,0,0,0)';">
          <div style="font-weight:700; margin-bottom:6px;">Boutique Store</div>
          <p style="margin:0; color:#334155; line-height:1.6;">Tracks customer preferences to send personalized promotions.</p>
        </div>

        <div style="flex:1 1 320px; min-width:280px; background:#f8fafc; border-radius:14px; padding:18px; border:1px solid #e5e7eb; transition:0.3s;"
             onmouseover="this.style.boxShadow='0 8px 24px rgba(2,6,23,.12)';" onmouseout="this.style.boxShadow='0 0 0 rgba(0,0,0,0)';">
          <div style="font-weight:700; margin-bottom:6px;">Retail Chain</div>
          <p style="margin:0; color:#334155; line-height:1.6;">Monitors inventory across multiple locations from one dashboard.</p>
        </div>

        <div style="flex:1 1 320px; min-width:280px; background:#f8fafc; border-radius:14px; padding:18px; border:1px solid #e5e7eb; transition:0.3s;"
             onmouseover="this.style.boxShadow='0 8px 24px rgba(2,6,23,.12)';" onmouseout="this.style.boxShadow='0 0 0 rgba(0,0,0,0)';">
          <div style="font-weight:700; margin-bottom:6px;">Gift Shop</div>
          <p style="margin:0; color:#334155; line-height:1.6;">Automatically reorders best-selling items when stock runs low.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA -->
  <section style="background:#f0f4f8; border-top:1px solid #e5e7eb;">
    <div style="max-width:1100px; margin:0 auto; padding:36px 16px; display:flex; flex-wrap:wrap; align-items:center; gap:20px;">
      <div style="flex:1 1 420px; min-width:280px;">
        <h3 style="margin:0 0 10px 0; font-size:24px; color:#1e40af;">Transform Your Retail Operations</h3>
        <p style="margin:0; color:#334155; line-height:1.7;">
          Focus less on admin tasks and more on growing your store. Request a demo and experience smarter retail management.
        </p>
      </div>
      <a id="contact" href="mailto:sales@bzcomposer.example"
         style="text-decoration:none; background:#22c55e; color:#052e16; padding:14px 18px; border-radius:12px; font-weight:800; display:inline-block; border:1px solid #10b981; transition:0.3s;"
         onmouseover="this.style.background='#16a34a'; this.style.color='#ffffff';" onmouseout="this.style.background='#22c55e'; this.style.color='#052e16';">
         Schedule Demo
      </a>
    </div>
  </section>

</body>
</html>

</div>

     <%@ include file="templateFooter.jsp"%>
     <div id="up-to-top">
		<i class="fa fa-angle-up"></i>
	</div>
     <%@ include file="templateScript.jsp"%>
	</body>
</html>