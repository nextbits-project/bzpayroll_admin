<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.HelpContentsTitle" /></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.sidebar {
	height: 100vh;
	overflow-y: auto;
	background-color: #f8f9fa;
	border-right: 1px solid #dee2e6;
	transition: width 0.2s ease;
}

.folder-title {
	font-weight: bold;
	cursor: pointer;
	margin-top: 0.5rem;
}

.file-item, .folder-item {
	cursor: pointer;
}

.nested-folder {
	padding-left: 1.5rem;
}

.nested-folder-item {
	padding-left: 3rem;
}

.fa-folder {
	color: #0dcaf0;
}

#resizer {
	width: 5px;
	cursor: col-resize;
	background: #dee2e6;
	height: 100vh;
}

#mainContent {
	overflow-y: auto;
	height: 100vh;
}

div#padding div span {
	color: #000 !important;
	/* padding: 1px 5px; */
}
/* div#padding div span:hover{
            color: #000 !important;
            background: #0dcaf0;
            padding: 1px 5px;
        } */
h3 {
	margin: 0px !important;
}

.active-item {
	background-color: #0dcaf0 !important;
	color: white;
}

div#padding div span {
	font-family: none !important;
	border-bottom: none !important;
}

.hcp1 {
	margin-bottom: 1px;
}
</style>
</head>

<body>
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>

	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<div class="pt-3 pb-3">
							<span style="font-size: 1.2em;"><spring:message
									code="BzComposer.About.HelpContents" /></span>
						</div>
						<div class="d-flex">

							<!-- Sidebar -->
							<nav id="sidebar" class="sidebar p-3" style="width: 30%;">
								<div class="file-item"
									onclick="activateItem(this.querySelector('.item-span')); showContent('overview')">
									<i class="fa fa-file" aria-hidden="true"></i> <span
										class="item-span">Overview</span>
								</div>

								<!-- Getting Started Start -->
								<div class="folder-title" data-bs-toggle="collapse"
									data-bs-target="#gettingStarted">
									<i class="fa fa-folder" aria-hidden="true"></i> <span
										class="item-span">Getting Started</span>
								</div>
								<div class="collapse" id="gettingStarted">
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span'));showContent('setupBiz')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Setting up BizComposer</span>
									</div>
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span'));showContent('CreatingNewCompanyFile')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Creating a new company file</span>
									</div>
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span'));showContent('SettingUpYourCompanyInformation')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Setting up your Company Information</span>
									</div>
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span'));showContent('SettingUpYourAccountInformation')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Setting up your Account Information
										</span>
									</div>
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span'));showContent('CreatingCompanyPreferences')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Creating Company Preferences</span>
									</div>

									<!-- Nested Folder -->
									<div class="folder-title nested-folder"
										data-bs-toggle="collapse" data-bs-target="#customerList"
										onclick="activateItem(this.querySelector('.item-span')); showContent('CreatingYourCustomerList')">
										<i class="fa fa-folder" aria-hidden="true"></i> <span
											class="item-span">Creating your Customer List</span>
									</div>

									<div class="collapse" id="customerList">
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('GeneralInformation')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">General Information (Customer List)</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('Sales_Account')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Sales/Account (Customer List)</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('BillingShippingAddress')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Billing/Shipping Address (Customer
												List)</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('Memo')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Memo (Customer List)</span>
										</div>
									</div>
									<!-- Nested Folder -->
									<div class="folder-title nested-folder"
										data-bs-toggle="collapse" data-bs-target="#VendorList"
										onclick="activateItem(this.querySelector('.item-span')); showContent('CreatingYourVendorList')">
										<i class="fa fa-folder" aria-hidden="true"></i> <span
											class="item-span">Creating your Vendor List</span>
									</div>
									<div class="collapse" id="VendorList">
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('GeneralInformationVendorList')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">General Information (Vendor List)</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('SalesAccountVendorList')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Sales Account (Vendor List)</span>
										</div>
									</div>
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span')); showContent('Setting_up_Product_Information')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Setting up Product Information</span>
									</div>
								</div>
								<!-- Getting Started End -->
								<!-- Sales Start -->
								<div class="folder-title" data-bs-toggle="collapse"
									data-bs-target="#sales">
									<i class="fa fa-folder" aria-hidden="true"></i> <span
										class="item-span">Sales</span>
								</div>
								<div class="collapse" id="sales">
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span')); showContent('salesBoard')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Sales Board</span>
									</div>
									<div class="folder-title nested-folder"
										data-bs-toggle="collapse" data-bs-target="#Invoices"
										onclick="activateItem(this.querySelector('.item-span')); showContent('Invoices')">
										<i class="fa fa-folder" aria-hidden="true"></i> <span
											class="item-span">Invoices</span>
									</div>
									<div class="collapse" id="Invoices">
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('HeadingInformation')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Heading Information</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('InvoiceMiddle')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Invoice (Middle)</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('InvoiceBottom')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Invoice (Bottom)</span>
										</div>
									</div>
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span')); showContent('EstimationForm')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Estimation Form</span>
									</div>
									<div class="folder-title nested-folder"
										data-bs-toggle="collapse" data-bs-target="#Customer"
										onclick="activateItem(this.querySelector('.item-span')); showContent('Sales_Customer')">
										<i class="fa fa-folder" aria-hidden="true"></i> <span
											class="item-span">Customer</span>
									</div>
									<div class="collapse" id="Customer">
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('Sales_CustomerList')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Customer list</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('AddNewCustomer')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Add new Customer</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('PrintLabels')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Print Labels</span>
										</div>
									</div>
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span')); showContent('DataManager')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Data Manager</span>
									</div>
								</div>
								<!-- Sales End -->

								<!-- Purchases Start -->
								<div class="folder-title" data-bs-toggle="collapse"
									data-bs-target="#purchase">
									<i class="fa fa-folder" aria-hidden="true"></i> <span
										class="item-span">Purchases</span>
								</div>
								<div class="collapse" id="purchase">
									<div class="file-item pl-4"
										onclick="activateItem(this.querySelector('.item-span')); showContent('PurchaseOrders')">
										<i class="fa fa-file" aria-hidden="true"></i> <span
											class="item-span">Purchase Orders</span>
									</div>
									<div class="folder-title nested-folder"
										data-bs-toggle="collapse" data-bs-target="#Vendor">
										<i class="fa fa-folder" aria-hidden="true"></i> <span
											class="item-span">Vendor</span>
									</div>
									<div class="collapse" id="Vendor">
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('VendorList')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Vendor List</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('AddNewVendor')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Add New Vendor</span>
										</div>
										<div class="file-item nested-folder-item"
											onclick="activateItem(this.querySelector('.item-span')); showContent('PrintLabelVendor')">
											<i class="fa fa-file" aria-hidden="true"></i> <span
												class="item-span">Print Label (Vendor)</span>
										</div>
									</div>

								</div>
								<!-- Purchases End -->
							</nav>

							<!-- Resizer -->
							<div id="resizer"></div>

							<!-- Main Content -->
							<main id="mainContent" class="flex-grow-1 pl-2"
								style="width: 70%;">
								<h1 style="color: #0000ff;">
									<span style="color: #000080;"><font color=navy>Welcome
											to BizComposer</font></span>
								</h1>
								<h1 style="color: #0000ff; font-size: 12pt;">Overview</h1>
								<p class="hcp1">BizComposer has been created to assist you
									in your bookkeeping and accounting needs so that you may manage
									your business more easily and productively.</p>

								<p class="hcp1">This program will allow you to perform
									functions that will support your business needs:</p>

								<ul style="list-style: disc;" type=disc>
									<li class="kadov-p"><p class="hcp1">Invoice - Keep
											track of how many items you have sold in one transaction.</p></li>

									<li class="kadov-p"><p class="hcp1">Purchase Order -
											See how many products you bought from individual vendors.</p></li>

									<li class="kadov-p"><p class="hcp1">Sales Report -
											Glimpse at your current sales.</p></li>

									<li class="kadov-p"><p class="hcp1">Product - Look at
											your current inventory.</p></li>

									<li class="kadov-p"><p class="hcp1">Customer and
											Vendor - Save contact and billing information.</p></li>

									<li class="kadov-p"><p class="hcp1">Payroll - Manage
											and plan your own payroll processing.</p></li>
								</ul>

								<p style="font-style: italic; font-size: 10pt;">plus more...</p>
							</main>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
	<input type="hidden" id="selected-store-is-default" value="0" />
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/scripts/helpcontents.js"
		type="text/javascript"></script>
</body>

</html>