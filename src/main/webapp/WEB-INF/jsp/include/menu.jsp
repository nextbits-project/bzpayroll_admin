<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

	<style>
		/* Enable multi-level dropdowns in Bootstrap 5 */
		.dropdown-submenu {
			position: relative;
		}

		.dropdown-submenu>.dropdown-menu {
			top: 0;
			left: 100%;
			margin-left: 0.1rem;
			margin-right: 0.1rem;
			display: none;
		}

		.dropdown-submenu:hover>.dropdown-menu {
			display: block;
		}

		#menubar2 .container-fluid {
			padding-left: 0;
			padding-right: 0;
		}

		#menubar2 {
			clear: both;
			margin-top: 6px;
			text-align: left;
		}

		#menubar2 .top-app-navbar {
			display: block;
			width: 100%;
			background: #7d7d7d;
			border-top: 0;
			border-bottom: 3px solid #05a9c5;
			padding: 0;
			margin-top: 0;
			min-height: 34px;
		}

		#menubar2 .navbar-collapse,
		#menubar2 .top-app-navbar .navbar-collapse {
			display: block !important;
			width: 100%;
			flex: 0 0 auto;
			text-align: left;
		}

		#menubar2 .top-app-navbar .navbar-nav {
			display: flex !important;
			flex-direction: row !important;
			justify-content: flex-start !important;
			width: auto;
			flex-wrap: nowrap;
			align-items: stretch;
			margin: 0;
			padding-left: 0;
		}

		#menubar2 .top-app-navbar .nav-item {
			display: flex;
			flex: 0 0 auto;
			align-items: stretch;
			border-right: 1px solid #5f5f5f;
			position: relative;
		}

		#menubar2 .top-app-navbar .nav-link {
			display: flex;
			align-items: center;
			justify-content: center;
			min-height: 34px;
			padding: 0 17px;
			color: #ffffff;
			font-size: 13px;
			font-weight: 700;
			letter-spacing: 0;
			text-transform: uppercase;
			white-space: nowrap;
			background: transparent;
			line-height: 1;
		}

		#menubar2 .top-app-navbar .nav-link:hover,
		#menubar2 .top-app-navbar .nav-link:focus,
		#menubar2 .top-app-navbar .nav-item.show>.nav-link {
			color: #ffffff;
			background: #6b6b6b;
		}

		#menubar2 .top-app-navbar .dropdown-toggle::after {
			margin-left: 0.45rem;
			vertical-align: middle;
		}

		#menubar2 .menu-icon-divider {
			min-width: 52px;
			justify-content: center;
			padding: 0 12px;
			color: #05a9c5;
			cursor: default;
			pointer-events: none;
			min-height: 34px;
		}

		#menubar2 .menu-icon-divider i {
			font-size: 1rem;
		}

		#menubar2 .dropdown-menu {
			border-radius: 0;
			z-index: 2000;
		}

		#menubar2 .nav-item.dropdown:hover>.dropdown-menu,
		#menubar2 .nav-item.dropdown:focus-within>.dropdown-menu {
			display: block;
			margin-top: 0;
		}

		@media (max-width: 991.98px) {
			#menubar2 {
				margin-top: 10px;
			}

			#menubar2 .top-app-navbar .navbar-nav {
				width: 100%;
				flex-wrap: wrap;
			}

			#menubar2 .top-app-navbar .nav-item {
				width: 100%;
				border-right: 0;
				border-bottom: 1px solid #5f5f5f;
			}

			#menubar2 .menu-icon-divider-item {
				display: none;
			}
		}

		.calculator {
			width: 350px;
			height: 320px;
			box-shadow: 0px 0px 0px 10px #666;
			border: 1px solid;
			border-radius: 2px;
			text-align: center
		}

		#display {
			width: 320px;
			height: 40px;
			text-align: right;
			border: 1px solid black;
			font-size: 20px;
			left: 2px;
			top: 2px;
			color: black;
		}

		.btnTop {
			color: white;
			background-color: black;
			font-size: 14px;
			margin: auto;
			width: 50px;
			height: 25px;
			padding: 0px;
		}

		.btnNum {
			color: black;
			font-size: 20px;
			margin: auto;
			width: 50px;
			height: 25px;
			padding: 0px;
		}

		.btnMath {
			color: black;
			font-size: 20px;
			margin: auto;
			width: 50px;
			height: 25px;
			padding: 0px;
		}

		.btnOpps {
			color: black;
			font-size: 20px;
			margin: auto;
			width: 50px;
			height: 25px;
			padding: 0px;
		}

		.modal1 {
			overflow: visible;
			height: auto;
			vertical-align: top;
		}
		.sub-sub-menu{
			color: #212529;
    		padding-left: 23px;
		}
		.sub-sub-menu a:hover {
			color: #16181b;
			text-decoration: none;
			background-color: #f8f9fa;
		}
		.sub-sub-drop-menu{
			left: 179px !important;
    		top: 1px !important;
		}
		.dropdown-mm{
			padding: 6px 0px;
    		border-bottom: none;
		}
		.dropdown-mm a:hover{
			text-decoration: none;
			color: #212529;
		}

	</style>

	<div id="menubar2" style="width: 100%; display:none;">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg top-app-navbar">

				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<!-- file dropdown -->
							<a class="nav-link dropdown-toggle" href="#" id="fileDropDown" role="button"
								data-toggle="dropdown" aria-expanded="false">
								<spring:message code="BzComposer.File" />
							</a>
							<ul class="dropdown-menu" aria-labelledby="fileDropDown">
								<li>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/payroll-dashboard"
										style="cursor: pointer;">
										<span>
											<spring:message code="BzComposer.Dashboard" />
										</span>
									</a>
								</li>
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="#" onclick="employeeImportData()" style="cursor: pointer;">
										<span>
											<spring:message code="menu.file.Import" />
										</span>
									</a>
								</li>

								<li class="dropdown-submenu">
									<a class="dropdown-item" href="#" onclick="employeeExportData()" style="cursor: pointer;">
										<span>
											<spring:message code="menu.file.ExportTo" />
										</span>
									</a>
								</li>
								<li>
									<a class="dropdown-item" href="#" onclick="showEventCalendar()"
										style="cursor: pointer;">
										<span>
											<spring:message code="menu.file.Calendar" />
										</span>
									</a>
								</li>
								<li>
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal"
										style="cursor: pointer;">
										<span>
											<spring:message code="menu.file.Calculator" />
										</span>
									</a>
								</li>
								<li>
									<a class="dropdown-item" href="./Logout" style="cursor: pointer;">
										<span>
											<spring:message code="menu.file.Exit" />
										</span>
									</a>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="employeeDropDown" role="button"
								data-toggle="dropdown" aria-expanded="false">
								<spring:message code="BzComposer.Employee" />
							</a>
							<ul class="dropdown-menu" aria-labelledby="employeeDropDown">
								<li>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/employee-list">
										Employee List
									</a>
								</li>
								<li>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/employee-board">
										Employee Board
									</a>
								</li>
								<li class="nav-item dropdown dropdown-mm" style="padding: 6px 0px;border-bottom: none;">
									<a class="sub-sub-menu dropdown-toggle" href="#" id="employeeDropDown" role="button"
										data-toggle="dropdown" aria-expanded="false">
										Inactive Employee
									</a>
									<ul class=" sub-sub-drop-menu dropdown-menu" aria-labelledby="employeeDropDown">
										<li>
											<a class="dropdown-item" href="${pageContext.request.contextPath}/inactive-employee-list">
												Employee List
											</a>
										</li>
										<li>
											<a class="dropdown-item" href="${pageContext.request.contextPath}/create-inactive-employee-timesheet">
												Timesheets
											</a>
										</li>
										<li>
											<a class="dropdown-item" href="${pageContext.request.contextPath}/created-inactive-timesheet">
												Timesheet History
											</a>
										</li>
										<li>
											<a class="dropdown-item" href="${pageContext.request.contextPath}/inactive-payroll-list">
												Payroll History
											</a>
										</li>
										
									</ul>
									<!-- <a class="dropdown-item" href="${pageContext.request.contextPath}/employee-list">
										Inactive Employee
									</a> -->
								</li>
								<li>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/employee-w2form">
										W2 Form
									</a>
								</li>
								<li>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/formw4">
										W4 Form
									</a>
								</li>
								<li>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/form1099nec">
										1099-NEC Formx
									</a>
								</li>
								<li>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/employee-reviews">
										Reviews
									</a>
								</li>
							</ul>
						</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="timesheetDropdown" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							TIMESHEET
						</a>
						<div class="dropdown-menu" aria-labelledby="timesheetDropdown">
							<a class="dropdown-item" href="/create-employee-timesheet">Create Timesheet</a>
							<a class="dropdown-item" href="/created-timesheet">Timesheet History</a>
						</div>
					</li>


					<!-- <li class="nav-item dropdown">
                   <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                     SETTINGS
                   </a>
                   <ul class="dropdown-menu">


                     <li><a class="dropdown-item" href="/settings/employee">General Setting</a></li>
                      <li><a class="dropdown-item" href="/dashboard/employee/employeeRole">Employee Role</a>

                    <li class="dropdown-submenu">
                       <a class="dropdown-item dropdown-toggle" href="#">Tax Info</a>
                       <ul class="dropdown-menu">
                         <li><a class="dropdown-item" href="/dashboard/Configuration?tabid=config0012&&tab=tr12">Employee</a></li>
                         <li><a class="dropdown-item" href="/dashboard/Configuration?tabid=config00012&&tab=tr12">Employer</a></li>
                       </ul>
                     </li>


                     <li class="dropdown-submenu">
                       <a class="dropdown-item dropdown-toggle" href="#">Tax Option</a>
                       <ul class="dropdown-menu">
                         <li><a class="dropdown-item" href="/dashboard/Configuration?tabid=config000012&&tab=tr12">Deduction</a></li>
                         <li><a class="dropdown-item" href="/dashboard/Configuration?tabid=config0000012&&tab=tr12">Option</a></li>
                       </ul>
                     </li>

                     <li><a class="dropdown-item" href="/dashboard/Configuration?tabid=config0012&&tab=tr12">Federal Tax</a></li>


                     <li><a class="dropdown-item" href="/dashboard/Configuration?tabid=config012&&tab=tr12">State Tax</a></li>
                   </ul>
                 </li>-->
					<!-- Create Payroll-->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="payrollDropdown" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							PAYROLL
						</a>
						<div class="dropdown-menu" aria-labelledby="payrollDropdown">
							<a class="dropdown-item" href="/create/payroll">Create Payroll</a>
							<a class="dropdown-item" href="/payroll-list">Payroll List</a>
						</div>
					</li>
					<!-- Settings Menu Trigger -->
					<!-- Reports Menu -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="reportsDropdown" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							REPORTS
						</a>
						<ul class="dropdown-menu" aria-labelledby="reportsDropdown">
							<li>
								<a class="dropdown-item" href="/form940">Form 940</a>
							</li>
							<li>
								<a class="dropdown-item" href="/form941">Form 941</a>
							</li>
							<li>
								<a class="dropdown-item" href="/employee-w9form">W-9 Form</a>
							</li>
							<li>
								<a class="dropdown-item" href="" onclick="employeeListsReport()">Employee Lists</a>
							</li>
							<li>
								<a class="dropdown-item" href="" onclick="timeSheetsReport()">Timesheets</a>
							</li>
							<li>
								<a class="dropdown-item" href="" onclick="timesheetsHistoryReport()">Timesheet History</a>
							</li>
							<li>
								<a class="dropdown-item" href="" onclick="payrollHistoryReport()">Payroll History</a>
							</li>
							<li>
								<a class="dropdown-item" href="" onclick="payrollStatements()">Payroll Statements</a>
							</li>
							
							<li class="nav-item dropdown dropdown-mm" style="padding: 6px 0px;border-bottom: none;">
									<a class="sub-sub-menu dropdown-toggle" href="#" id="employeeDropDown" role="button"
										data-toggle="dropdown" aria-expanded="false">
										Inactive Employee Report
									</a>
									<ul class=" sub-sub-drop-menu dropdown-menu" aria-labelledby="employeeDropDown" style=" left: 241px !important; ">
										<li>
											<a class="dropdown-item" href="" onclick="employeeListsReportInActive()">
												Employee List
											</a>
										</li>
										<li>
											<a class="dropdown-item" href="" onclick="timeSheetsReportInActive()">
												Timesheets
											</a>
										</li>
										<li>
											<a class="dropdown-item" href="" onclick="timesheetsHistoryReportInActive()">
												Timesheet History
											</a>
										</li>
										<li>
											<a class="dropdown-item" href="" onclick="payrollHistoryReportInActive()">
												Payroll History
											</a>
										</li>
									</ul>
								</li>
							
						</ul>
					</li>
					<!-- Settings Menu -->
					<li class="nav-item dropdown">
						<a class="nav-link " href="/settings/general">SETTINGS</a>
					</li>
					<!-- About-->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="payrollDropdown" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							ABOUT
						</a>
						<div class="dropdown-menu" aria-labelledby="payrollDropdown">
							<a class="dropdown-item" href="/About?content=overview">Help Contents</a>
							<a class="dropdown-item" href="/">Feedback</a>
							<a class="dropdown-item" href="/">BZpayroll Products</a>
							<a class="dropdown-item" href="/">About</a>
						</div>
					</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>


	<!-- Calculator Modal -->
	<div class="modal fade" id="myModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content p-3" style="border-radius:15px; padding-bottom: 0px !important;">
				<div class="modal-body">
					<form name="sci-calc">
						<center>
							<table class="calculator" cellspacing="0" cellpadding="1">
								<tr>
									<td colspan="5"><input id="display" name="display" value="0" size="28"
											maxlength="25"></td>
								</tr>
								<tr>
									<td><input type="button" class="btnTop" name="btnTop" value="C"
											onclick="this.form.display.value=  0 "></td>
									<td><input type="button" class="btnTop" name="btnTop" value="<--"
											onclick="deleteChar(this.form.display)"></td>
									<td><input type="button" class="btnTop" name="btnTop" value="="
											onclick="if(checkNum(this.form.display.value)) { compute(this.form) }"></td>
									<td><input type="button" class="btnOpps" name="btnOpps" value="&#960;"
											onclick="addChar(this.form.display,'3.14159265359')"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="%"
											onclick=" percent(this.form.display)"></td>
								</tr>
								<tr>
									<td><input type="button" class="btnNum" name="btnNum" value="7"
											onclick="addChar(this.form.display, '7')"></td>
									<td><input type="button" class="btnNum" name="btnNum" value="8"
											onclick="addChar(this.form.display, '8')"></td>
									<td><input type="button" class="btnNum" name="btnNum" value="9"
											onclick="addChar(this.form.display, '9')"></td>
									<td><input type="button" class="btnOpps" name="btnOpps" value="x&#94;"
											onclick="if(checkNum(this.form.display.value)) { exp(this.form) }"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="/"
											onclick="addChar(this.form.display, '/')"></td>
								<tr>
									<td><input type="button" class="btnNum" name="btnNum" value="4"
											onclick="addChar(this.form.display, '4')"></td>
									<td><input type="button" class="btnNum" name="btnNum" value="5"
											onclick="addChar(this.form.display, '5')"></td>
									<td><input type="button" class="btnNum" name="btnNum" value="6"
											onclick="addChar(this.form.display, '6')"></td>
									<td><input type="button" class="btnOpps" name="btnOpps" value="ln"
											onclick="if(checkNum(this.form.display.value)) { ln(this.form) }"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="*"
											onclick="addChar(this.form.display, '*')"></td>
								</tr>
								<tr>
									<td><input type="button" class="btnNum" name="btnNum" value="1"
											onclick="addChar(this.form.display, '1')"></td>
									<td><input type="button" class="btnNum" name="btnNum" value="2"
											onclick="addChar(this.form.display, '2')"></td>
									<td><input type="button" class="btnNum" name="btnNum" value="3"
											onclick="addChar(this.form.display, '3')"></td>
									<td><input type="button" class="btnOpps" name="btnOpps" value="&radic;"
											onclick="if(checkNum(this.form.display.value)) { sqrt(this.form) }"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="-"
											onclick="addChar(this.form.display, '-')"></td>
								</tr>
								<tr>
									<td><input type="button" class="btnMath" name="btnMath" value="&#177"
											onclick="changeSign(this.form.display)"></td>
									<td><input type="button" class="btnNum" name="btnNum" value="0"
											onclick="addChar(this.form.display, '0')"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="&#46;"
											onclick="addChar(this.form.display, '&#46;')"></td>
									<td><input type="button" class="btnOpps" name="btnOpps" value="x&#50;"
											onclick="if(checkNum(this.form.display.value)) { square(this.form) }"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="+"
											onclick="addChar(this.form.display, '+')"></td>
								</tr>
								<tr>
									<td><input type="button" class="btnMath" name="btnMath" value="("
											onclick="addChar(this.form.display, '(')"></td>
									<td><input type="button" class="btnMath" name="btnMath" value=")"
											onclick="addChar(this.form.display,')')"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="cos"
											onclick="if(checkNum(this.form.display.value)) { cos(this.form) }"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="sin"
											onclick="if(checkNum(this.form.display.value)) { sin(this.form) }"></td>
									<td><input type="button" class="btnMath" name="btnMath" value="tan"
											onclick="if(checkNum(this.form.display.value)) { tan(this.form) }"></td>
								</tr>
							</table>
						</center>
					</form>
					<div class="text-center mt-3">
						<a data-dismiss="modal" style="color: #007bff;cursor: pointer;">
							<spring:message code="BzComposer.global.close" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#menubar2").show();
		});
		var screenHeight = $(window).height() / 2;
		var screenWidth = $(window).width() / 2;
		var top = $(window).height() / 4;
		var left = $(window).width() / 4;
		function companyinfo() {
			//window.open("/dashboard/file?tabid=CompanyInfo",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no," );
		}
		function openCouponDesign()	//added on 08-01-2019
		{
			window.open("/dashboard/file?tabid=CouponDesign", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showInvoiceList(action) {
			if (action == 'AllInvoice') {
				window.open("/dashboard/SalesBord?tabid=AllInvoiceList&ilist=1", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			}
			else if (action == 'PaidInvoice') {
				window.open("/dashboard/SalesBord?tabid=PaidInvoiceList&ilist=2", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			}
			else if (action == 'UnPaidInvoice') {
				window.open("/dashboard/SalesBord?tabid=UnPaidInvoiceList&ilist=3", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			}
		}
		function showRefundInvoiceReport() {
			window.open("/dashboard/SalesBord?tabid=refundInvoiceReport", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showBudgetVsActual() {
			//window.open("SalesBord?tabid=refundInvoiceReport",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			window.open("/dashboard/Customer?tabid=BudgetVsActual", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showBudgetOverview() {
			window.open("/dashboard/Customer?tabid=BudgetOverview", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowIncomeCustomerDetail() {
			window.open("/dashboard/Customer?tabid=IncomeCustomerSummary", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowProfitLossByJob() {
			alert("Not yet supported.");
		}
		function showSalesReport(action) {
			if (action == 'SalesRBC') {
				window.open("/dashboard/SalesBord?tabid=SalesRBC&ilist=1", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			}
			else if (action == 'SalesRID') {
				window.open("/dashboard/SalesBord?tabid=SalesRID&ilist=3", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			}
			else if (action == 'SalesRBI') {
				window.open("/dashboard/SalesBord?tabid=SalesRBI&ilist=2", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			}
		}
		function showEstimationList() {
			window.open("/dashboard/EstimationBoard?tabid=AllEstimationList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowvendorList() {
			window.open("/dashboard/PurchaseBoard?tabid=AllVendorList", null, "scrollbars=yes,height=500,width=1250,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowvendorPhoneList() {
			window.open("/dashboard/PurchaseBoard?tabid=VendorPhoneList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowVendorContactList() {
			window.open("/dashboard/PurchaseBoard?tabid=VendorContactList", null, "scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowsvendorBalanceDetails() {
			window.open("/dashboard/PurchaseBoard?tabid=VendorBalancedetails", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowsvendorBalanceSymmary() {
			window.open("/dashboard/PurchaseBoard?tabid=VendorBalancesymmary", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowsAllPurchaseorders() {
			window.open("/dashboard/PurchaseBoard?tabid=AllPurchaseOrderList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowAllPurchaseBills() {
			window.open("/dashboard/PurchaseBoard?tabid=AllPurchaseBillList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowPaidPurchaseBills() {
			window.open("/dashboard/PurchaseBoard?tabid=PaidPurchaseBillList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowUnPaidPurchaseBills() {
			window.open("PurchaseBoard?tabid=ShowUnPaidPurchaseBills", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showInventoryList() {
			window.open("/dashboard/Item?tabid=InventoryList", null, "scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCancelledPurchaseRefBill() {
			window.open("/dashboard/PurchaseBoard?tabid=CancelledPurREfBill", null, "scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowVendor1099List() {
			window.open("/dashboard/PurchaseBoard?tabid=Vendor1099List", null, "scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}

		function Vendor1099TransactionSummary() {
			window.open("/dashboard/PurchaseBoard?tabid=vendor1099TransactionSummary", null, "scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function vendor1099TransactionDetail() {
			window.open("/dashboard/PurchaseBoard?tabid=vendor1099TransactionDetail", null, "scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showReservedInventoryList() {
			window.open("/dashboard/SalesOrderBoard?tabid=ReservedInventoryList", null, "scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCustomerList() {
			window.open("/dashboard/Customer?tabid=CustomerList", null, "scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCustomerPhoneList() {
			window.open("Customer?tabid=CustomerPhoneList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCustomerContactList() {
			window.open("Customer?tabid=CustomerContactList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowTrancsactionbylistCustomer() {
			window.open("/dashboard/Customer?tabid=CustomerTransactionList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCustomerBalSummary() {
			window.open("/dashboard/Customer?tabid=CustomerBalanceSummary", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCustomerBalDetail() {
			window.open("/dashboard/Customer?tabid=CustomerBalDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowSalesByCustomerSummary() {
			window.open("/dashboard/Customer?tabid=SalesByCustomerSummary", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowIncomeCustomerSummary() {
			window.open("/dashboard/Customer?tabid=IncomeCustomerSummary", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showItemPriceList() {
			window.open("/dashboard/Item?tabid=ItemPriceList", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showDiscontinuedInventoryList() {
			window.open("/dashboard/Item?tabid=DiscontinuedList", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showInvValSummary() {
			window.open("/dashboard/Item?tabid=InventoryValSummary", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showInvValDetail() {
			window.open("/dashboard/Item?tabid=InvValDetail", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showInvOrderReport() {
			window.open("/dashboard/Item?tabid=InvOrderReport", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showInvStatistic() {
			window.open("/dashboard/Item?tabid=InvStatistic", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowSalesTaxSummary() {
			//window.open("/dashboard/Item?tabid=ShowSalesTaxSummary",null,"scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no" );
			alert("Not Yet Supported");
		}
		function ShowReportTaxDetail() {
			//window.open("/dashboard/Item?tabid=ShowSalesTaxSummary",null,"scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no" );
			alert("Not Yet Supported");
		}
		function showDamagedInventoryList() {
			window.open("/dashboard/Item?tabid=DamagedInvList", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showDamageInventoryList() {
			window.open("/dashboard/Item?tabid=showDamageInventoryList", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showUnknownInventoryList() {
			window.open("/dashboard/Item?tabid=showUnknownInventoryList", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showReturnedInventoryList() {
			window.open("/dashboard/Item?tabid=showReturnedInventoryList", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showDailyItemSummary() {
			window.open("/dashboard/Item?tabid=showDailyItemSummary", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showDailySalesSummary() {
			window.open("/dashboard/Item?tabid=showDailySalesSummary", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function MissingInventoryList() {
			window.open("Item?tabid=MissingInventoryList", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ReturnInventoryList() {
			window.open("/dashboard/Item?tabid=ReturnInventoryList", null, "scrollbars=yes,height=600,width=850,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowEmployeeSalesByRep() {
			window.open("/dashboard/SalesBord?tabid=SalesByRepDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowEmployeeSalesReportByRep() {
			window.open("/dashboard/SalesBord?tabid=SalesReportByRep", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function banking() {
			window.open("/dashboard/Accounting?tabid=Banking", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCheckDetail() {
			window.open("/dashboard/BankingAccounting?tabid=CheckDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowDepositDetail() {
			window.open("/dashboard/BankingAccounting?tabid=DepositDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowBillDetail() {
			window.open("/dashboard/BankingAccounting?tabid=BillDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function TransactionDeatail() {
			//window.open("BankingAccounting?tabid=BillDetail",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );
			alert("Not Yet Supprted");
		}
		function ShowAccountReceivableGraph() {
			window.open("/dashboard/BankingAccounting?tabid=ARGraph", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowAccountReceivable() {
			window.open("/dashboard/AccountReceivableAR?tabid=AccontReceivableReport", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowAccountPayable() {
			window.open("/dashboard/Customer?tabid=AccountPayable", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function AccountPayableGraph() {
			window.open("/dashboard/Customer?tabid=AccountPayableGraph", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowProfitLoss() {
			window.open("/dashboard/Category?tabid=ProfitLoss", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowProfitLossDetail() {
			window.open("/dashboard/Customer?tabid=ProfitLossDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showProfitLossByItem() {
			window.open("/dashboard/Item?tabid=ProfitLossByItem", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function showIncomeStatement() {
			window.open("/dashboard/Category?tabid=IncomeStatement", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowBalSheet() {
			window.open("/dashboard/Accounting?tabid=BalanceSheet", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCashFlow() {
			window.open("/dashboard/ShowCashFlow?tabid=CashFlowStatement", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShowCashFlowForeCast() {
			//window.open("ShowCashFlowForeCast?tabid=ShowCashFlowForeCast",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );
			alert("Not Yet Supprted");
		}
		function IncomeExpenseGraph() {
			//window.open("ShowCashFlowForeCast?tabid=ShowCashFlowForeCast",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );
			window.open("/dashboard/BankingAccounting?tabid=IncomeExpenseGraph", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			//alert("Income Expence graph");
		}
		function Networth() {
			//window.open("ShowCashFlowForeCast?tabid=ShowCashFlowForeCast",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );
			window.open("/dashboard/BankingAccounting?tabid=NetworthGraph", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			//alert("Income Expence graph");
		}
		function BudgetvsActualGraph() {
			//window.open("ShowCashFlowForeCast?tabid=ShowCashFlowForeCast",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );
			window.open("/dashboard/BankingAccounting?tabid=BudgetvsActualGraph", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
			//alert("Income Expence graph");
		}
		function ChartsofCategories() {
			window.open("/dashboard/ReportCenterLists?tabid=ChartsofCategories", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function TermList() {
			window.open("/dashboard/ReportCenterLists?tabid=TermList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function SaleRepList() {
			window.open("/dashboard/ReportCenterLists?tabid=SaleRepList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function PaymentMethodList() {
			window.open("/dashboard/ReportCenterLists?tabid=PaymentMethodList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ShipViaList() {
			window.open("/dashboard/ReportCenterLists?tabid=ShipViaList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function TaxTypeList() {
			window.open("/dashboard/ReportCenterLists?tabid=TaxTypeList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function FootnoteList() {
			window.open("/dashboard/ReportCenterLists?tabid=FootnoteList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function MessageList() {
			window.open("/dashboard/ReportCenterLists?tabid=MessageList", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ESales_Invoice_Detail() {
			window.open("/dashboard/ReportCenterESales?tabid=ESalesInvoiceDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ESales_Refund_Detail() {
			window.open("/dashboard/ReportCenterESales?tabid=ESalesRefundDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ESales_sale_Detail() {
			window.open("/dashboard/ReportCenterESales?tabid=ESalessaleDetail", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ESales_Inventory_Sale_Statistics() {
			window.open("/dashboard/ReportCenterESales?tabid=ESalesInventorySaleStatistics", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function Cross_Sell_Inventory_Report() {
			window.open("/dashboard/ReportCenterESales?tabid=CrossSellInventoryReport", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function ESale_Sales_Graph() {
			window.open("/dashboard/ReportCenterESales?tabid=ESaleSalesGraph", null, "scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		/*file menu*/
		function SetUpprintForms() {
			window.open("/dashboard/file?tabid=SetUpprintForms", null, "scrollbars=no,height=300,width=800,status=yes,toolbar=no,menubar=no,location=center");
		}
		function MultiPrintInvoice() {
			window.open("/dashboard/file?tabid=MultiPrintInvoice", null, "scrollbars=no,height=300,width=800,status=yes,toolbar=no,menubar=no,location=no");
		}
		function customerImport() {
			window.location("/dashboard/file?tabid=ImportCustomer", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		function vendorImport() {
			window.open("/dashboard/file?tabid=ImportVendor", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		function uploadItem() {
			window.open("/dashboard/Item?tabid=UploadItem", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		function exportCustomer() {
			window.open("/dashboard/file?tabid=ExportCustomer", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		function exportVendor() {
			window.open("/dashboard/file?tabid=ExportVendor", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		function exportItem() {
			window.open("/dashboard/Item?tabid=ExportItem", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		function quickBookImport() {
			window.open("/dashboard/file?tabid=QuickBookImport", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		function orderImport() {
			window.open("/dashboard/file?tabid=OrderImport", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		function moduleImport() {
			window.open("/dashboard/Module?tabid=ImportModule", null, "scrollbars=no,height=" + screenHeight + ",width =" + screenWidth + ",left = " + left + ",top = " + top + ",status=yes,toolbar=no,menubar=no,location=no");
		}
		/*esales board*/
		/* function eSalesSalesBoard()
		{
			window.open("/dashboard/eSalesBoard?tabid=eSalesSalesBoard",null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=no,location=no" );
		} */
		function showEventCalendar() {
			window.open("Calendar", null, "scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function employeeImportData() {
			window.open(
				"/employees/employee-import",
				"_blank",
				"scrollbars=yes,resizable=yes,width=1200,height=800,left=" + left + ",top=" + top + ",status=yes,toolbar=no,menubar=no,location=no"
			);
		}

		function employeeExportData() {
			window.open(
				"/employees/employee-export",
				"_blank",
				"scrollbars=yes,resizable=yes,width=1200,height=800,left=" + left + ",top=" + top + ",status=yes,toolbar=no,menubar=no,location=no"
			);
		}

	</script>

	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>

	<script>
		function employeeListsReport() {
			window.open("report/employee-lists", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		function timeSheetsReport() {
			window.open("report/timesheets", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		function timesheetsHistoryReport() {
			window.open("report/timesheets-history", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		function payrollHistoryReport() {
			window.open("report/payroll-history", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		function payrollStatements(){
			window.open("report/payroll-statements", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		function employeeListsReportInActive() {
			window.open("report/employee-lists-inactive", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		function timeSheetsReportInActive() {
			window.open("report/timesheets-inactive", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		function timesheetsHistoryReportInActive() {
			window.open("report/timesheets-history-inactive", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		function payrollHistoryReportInActive() {
			window.open("report/payroll-history-inactive", null, "scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
	</script>

	<script type="text/javascript">
		function ShowCustomerList() {
			window.open("Customer?tabid=CustomerList", null, "scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		}
		function addChar(input, character) {
			if (input.value == null || input.value == "0")
				input.value = character
			else
				input.value += character
		}
		function cos(form) {
			form.display.value = Math.cos(form.display.value);
		}
		function sin(form) {
			form.display.value = Math.sin(form.display.value);
		}
		function tan(form) {
			form.display.value = Math.tan(form.display.value);
		}
		function sqrt(form) {
			form.display.value = Math.sqrt(form.display.value);
		}
		function ln(form) {
			form.display.value = Math.log(form.display.value);
		}
		function exp(form) {
			form.display.value = Math.exp(form.display.value);
		}
		function deleteChar(input) {
			input.value = input.value.substring(0, input.value.length - 1)
		}
		var val = 0.0;
		function percent(input) {
			val = input.value;
			input.value = input.value + "%";
		}
		function changeSign(input) {
			if (input.value.substring(0, 1) == "-")
				input.value = input.value.substring(1, input.value.length)
			else
				input.value = "-" + input.value
		}
		function compute(form) {
			//if (val !== 0.0) {
			// var percent = form.display.value;
			// percent = pcent.substring(percent.indexOf("%")+1);
			// form.display.value = parseFloat(percent)/100 * val;
			//val = 0.0;
			// } else
			form.display.value = eval(form.display.value);
		}
		function square(form) {
			form.display.value = eval(form.display.value) * eval(form.display.value)
		}
		function checkNum(str) {
			for (var i = 0; i < str.length; i++) {
				var ch = str.charAt(i);
				if (ch < "0" || ch > "9") {
					if (ch != "/" && ch != "*" && ch != "+" && ch != "-" && ch != "." && ch != "(" && ch != ")" && ch != "%") {
						alert("invalid entry!")
						return false
					}
				}
			}
			return true
		}
	</script>