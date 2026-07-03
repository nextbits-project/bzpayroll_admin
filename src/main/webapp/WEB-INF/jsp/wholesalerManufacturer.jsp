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

    <body style="margin:0; font-family: Arial, Helvetica, sans-serif; color:#0f172a; background:#fafafa;">

      <!-- Hero / Intro -->
      <section style="background:#f8fafc; border-bottom:1px solid #e5e7eb;">
        <div style="max-width:1100px; margin:0 auto; padding:28px 16px;">
          <div style="display:flex; gap:24px; align-items:center; flex-wrap:wrap;">
            <div style="flex:1 1 360px; min-width:280px;">
              <h2 style="margin:0 0 10px 0; font-size:28px; line-height:1.2;">
                Wholesale & Manufacturer
              </h2>
              <p style="margin:0 0 10px 0; font-size:15px; line-height:1.6; color:#334155;">
                Our wholesale and manufacturing software manages bulk orders, tiered pricing, production scheduling, and supplier management. Built for B2B companies that need a scalable supply chain management solution.
              </p>
              <p style="margin:0; font-size:15px; line-height:1.6; color:#334155;">
                Wholesalers and manufacturers need software that can handle large-volume transactions, complex pricing structures, and production schedules. The <span style="font-weight:600;">BzComposer Wholesale & Manufacturer Program</span> offers powerful tools to manage B2B sales, production workflows, and supplier relationships in one platform.
              </p>
              <div style="margin-top:16px;">
                <a href="#features" style="text-decoration:none; background:#111827; color:#fff; padding:10px 14px; border-radius:10px; font-weight:600; display:inline-block;">Explore Features</a>
              </div>
            </div>
            <div style="flex:1 1 360px; min-width:280px;">
              <div style="background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:18px; box-shadow:0 4px 14px rgba(2,6,23,.06);">
                <div style="display:flex; align-items:center; justify-content:space-between; margin-bottom:10px;">
                  <span style="font-weight:700; color:#111827;">Production Snapshot</span>
                  <span style="font-size:12px; color:#6b7280;">Real-time</span>
                </div>
                <div style="display:flex; gap:10px; flex-wrap:wrap;">
                  <div style="flex:1 1 120px; min-width:120px; background:#f9fafb; border:1px dashed #e5e7eb; border-radius:12px; padding:12px;">
                    <div style="font-size:12px; color:#6b7280;">Open POs</div>
                    <div style="font-size:20px; font-weight:800;">128</div>
                  </div>
                  <div style="flex:1 1 120px; min-width:120px; background:#f9fafb; border:1px dashed #e5e7eb; border-radius:12px; padding:12px;">
                    <div style="font-size:12px; color:#6b7280;">In Production</div>
                    <div style="font-size:20px; font-weight:800;">42</div>
                  </div>
                  <div style="flex:1 1 120px; min-width:120px; background:#f9fafb; border:1px dashed #e5e7eb; border-radius:12px; padding:12px;">
                    <div style="font-size:12px; color:#6b7280;">Backorders</div>
                    <div style="font-size:20px; font-weight:800;">9</div>
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
        <div style="max-width:1100px; margin:0 auto; padding:28px 16px;">
          <h3 style="margin:0 0 14px 0; font-size:22px;">Key Features &amp; Benefits</h3>

          <div style="display:flex; flex-wrap:wrap; gap:16px;">
            <!-- Card -->
            <div style="flex:1 1 260px; min-width:260px; background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:16px; box-shadow:0 4px 14px rgba(2,6,23,.04);">
              <div style="font-weight:700; margin-bottom:6px;">Bulk Order Management</div>
              <p style="margin:0; color:#334155; line-height:1.6;">Handle large, recurring, and custom orders with ease.</p>
            </div>

            <div style="flex:1 1 260px; min-width:260px; background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:16px; box-shadow:0 4px 14px rgba(2,6,23,.04);">
              <div style="font-weight:700; margin-bottom:6px;">Tiered Pricing &amp; Discounts</div>
              <p style="margin:0; color:#334155; line-height:1.6;">Offer different pricing structures for various customer segments.</p>
            </div>

            <div style="flex:1 1 260px; min-width:260px; background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:16px; box-shadow:0 4px 14px rgba(2,6,23,.04);">
              <div style="font-weight:700; margin-bottom:6px;">Production Scheduling</div>
              <p style="margin:0; color:#334155; line-height:1.6;">Plan and track manufacturing processes to meet delivery deadlines.</p>
            </div>

            <div style="flex:1 1 260px; min-width:260px; background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:16px; box-shadow:0 4px 14px rgba(2,6,23,.04);">
              <div style="font-weight:700; margin-bottom:6px;">Supplier &amp; PO Tracking</div>
              <p style="margin:0; color:#334155; line-height:1.6;">Manage supplier relationships and monitor purchase orders from request to fulfillment.</p>
            </div>

            <div style="flex:1 1 260px; min-width:260px; background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:16px; box-shadow:0 4px 14px rgba(2,6,23,.04);">
              <div style="font-weight:700; margin-bottom:6px;">Inventory Forecasting</div>
              <p style="margin:0; color:#334155; line-height:1.6;">Predict stock needs based on seasonal trends and order history.</p>
            </div>
          </div>
        </div>
      </section>

      <!-- Integration -->
      <section style="background:#f8fafc; border-top:1px solid #e5e7eb; border-bottom:1px solid #e5e7eb;">
        <div style="max-width:1100px; margin:0 auto; padding:28px 16px;">
          <h3 style="margin:0 0 8px 0; font-size:22px;">Integration &amp; Compatibility</h3>
          <p style="margin:0; color:#334155; line-height:1.7;">
            Works seamlessly with accounting, CRM, and eCommerce modules to keep the entire supply chain connected.
          </p>
          <div style="display:flex; gap:12px; flex-wrap:wrap; margin-top:12px;">
            <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 10px; border-radius:999px; font-size:12px;">Accounting</span>
            <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 10px; border-radius:999px; font-size:12px;">CRM</span>
            <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 10px; border-radius:999px; font-size:12px;">eCommerce</span>
            <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 10px; border-radius:999px; font-size:12px;">Inventory</span>
            <span style="border:1px solid #e5e7eb; background:#ffffff; padding:8px 10px; border-radius:999px; font-size:12px;">Logistics</span>
          </div>
        </div>
      </section>

      <!-- Use Cases -->
      <section style="background:#ffffff;">
        <div style="max-width:1100px; margin:0 auto; padding:28px 16px;">
          <h3 style="margin:0 0 14px 0; font-size:22px;">Use Case Examples</h3>

          <div style="display:flex; flex-wrap:wrap; gap:16px;">
            <div style="flex:1 1 320px; min-width:280px; background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:16px;">
              <div style="font-weight:700; margin-bottom:6px;">Manufacturer</div>
              <p style="margin:0; color:#334155; line-height:1.6;">Tracks raw material usage and predicts restock needs.</p>
            </div>

            <div style="flex:1 1 320px; min-width:280px; background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:16px;">
              <div style="font-weight:700; margin-bottom:6px;">Wholesaler</div>
              <p style="margin:0; color:#334155; line-height:1.6;">Manages bulk orders for multiple retail clients at once.</p>
            </div>

            <div style="flex:1 1 320px; min-width:280px; background:#ffffff; border:1px solid #e5e7eb; border-radius:14px; padding:16px;">
              <div style="font-weight:700; margin-bottom:6px;">Factory</div>
              <p style="margin:0; color:#334155; line-height:1.6;">Schedules production runs to align with confirmed purchase orders.</p>
            </div>
          </div>
        </div>
      </section>

      <!-- CTA -->
      <section style="background:#f8fafc; border-top:1px solid #e5e7eb;">
        <div style="max-width:1100px; margin:0 auto; padding:28px 16px; display:flex; flex-wrap:wrap; align-items:center; gap:18px;">
          <div style="flex:1 1 420px; min-width:280px;">
            <h3 style="margin:0 0 8px 0; font-size:22px;">Optimize Your Supply Chain</h3>
            <p style="margin:0; color:#334155; line-height:1.7;">
              The BzComposer Wholesale &amp; Manufacturer Program keeps production and distribution running smoothly. Contact us today to see it in action.
            </p>
          </div>
          <a id="contact" href="mailto:sales@bzcomposer.example"
             style="text-decoration:none; background:#22c55e; color:#052e16; padding:12px 16px; border-radius:12px; font-weight:800; display:inline-block; border:1px solid #10b981;">
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