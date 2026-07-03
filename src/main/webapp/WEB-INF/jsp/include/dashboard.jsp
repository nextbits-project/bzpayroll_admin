<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.Dashboard" /></title>

<Style>

<style>
/* Responsive Styles */
@media screen and (max-width: 768px) {
    /* Main layout adjustments */
    #cos {
        padding: 10px;
    }
    
    /* Stack the two-column tables vertically */
    table.section-border > tbody > tr > td {
        display: block;
        width: 100% !important;
    }
    
    /* Remove side margins on stacked tables */
    table.section-border > tbody > tr > td > div {
        margin: 0 !important;
    }
    
    /* Full-width dropdown */
    #dashrangeName {
        width: 100%;
        margin: 10px 0 !important;
    }
    
    /* Stack the title spans */
    #padding > div > span {
        display: block;
        margin: 10px 0 !important;
    }
}

@media screen and (max-width: 480px) {
    /* Convert tables to card-like layout */
    .tabla-listados thead {
        display: none;
    }
    
    .tabla-listados tbody tr {
        display: block;
        border: 1px solid #ddd;
        margin-bottom: 10px;
    }
    
    .tabla-listados tbody td {
        display: flex;
        justify-content: space-between;
        padding: 5px 10px;
        border: none;
        border-bottom: 1px solid #eee;
    }
    
    .tabla-listados tbody td::before {
        content: attr(data-label);
        font-weight: bold;
        margin-right: 10px;
    }
    
    /* Adjust header colors for mobile */
    .statusquo.ok {
        background: #f5f5f5;
    }
}

/* Base responsive rules (apply to all screens) */
.tabla-listados {
    width: 100%;
    table-layout: fixed;
}

#cos, #hoja, #blanquito {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    box-sizing: border-box;
}

/* Preserve existing colors and design */
.statusquo.ok, .section-border, #ddcolortabsline {
    /* Your existing colors remain unchanged */
}
</style>

</Style>
</head>
<body>
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<div>

							<span
								style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
								<spring:message code="BzComposer.Dashboard" />
							</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<span
								style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
								<spring:message code="BzComposer.salesorderboard.daterange" />
							</span> <select name="dashrangeId" id="dashrangeName"
								onchange="filterRangeOptions();" style="margin-left: 20px;">
								<option value="ALL">ALL</option>
								<option value="1M">1 month</option>
								<option value="3M">3 months</option>
								<option value="6M">6 months</option>
								<option value="1Y">1 year</option>
							</select>
						</div>
						<div>
							<table cellspacing="0"
								style="width: 100%; overflow-y: scroll; border: 0;"
								class="section-border">
								<tr>
									<td
										style="font-size: 1.2em; color: #fff; padding-right: 6px; width: 50%;">
										<div
											style="width: 100%; background-color: #05A9C5; padding: 5px;">
											<spring:message code="BzComposer.Purchase" />
										</div>
									</td>
									<td
										style="font-size: 1.2em; color: #fff; width: 50%; font-size: 1.2em; color: #fff; width: 50%; padding-left: 6px;">
										<div
											style="width: 100%; background-color: #05A9C5; padding: 5px;">
											<spring:message code="BzComposer.sales.SalesOrder" />
										</div>
									</td>
								</tr>
								<tr>
									<td style="border: 0; vertical-align: top;">
										<div
											style="height: 200px; overflow-y: scroll; border: 1px solid #ccc; margin: 0 6px 0 0;">
											<table class="tabla-listados" cellspacing="0"
												style="margin: 0; border: 0; text-decoration: none;">
												<thead>
													<tr style="background-color: #05A9C5;">
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.purchase.PONum" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.global.dateadded" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzCompoer.report.customercontract.fullname" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.Dashboard.AdjustedTotal" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${purchaseDetails}" var="objList">
														<tr>
															<td data-label="<spring:message code='BzComposer.purchase.PONum' />">${objList.orderNo}</td>
															<td data-label="<spring:message code='BzComposer.global.dateadded' />">${objList.dateAdded}</td>
															<td data-label="<spring:message code='BzCompoer.report.customercontract.fullname' />">${objList.firstName}${objList.lastName}</td>
															<td data-label="<spring:message code='BzComposer.Dashboard.AdjustedTotal' />">${objList.adjustedtotal}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</td>
									<td style="border: 0; vertical-align: top;">
										 <div class="responsive-panel" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 6px 0 0;">
											<table class="tabla-listados" cellspacing="0"
												style="margin: 0; border: 0; text-decoration: none;">
												<thead>
													<tr>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.salesorder.soNum" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.global.dateadded" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzCompoer.report.customercontract.fullname" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.Dashboard.AdjustedTotal" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${salesOrderDetails}" var="objList">
														<tr>
															<td data-label="<spring:message code='BzComposer.salesorder.soNum' />" >${objList.orderNo}</td>
															<td data-label="<spring:message code='BzComposer.global.dateadded' />">${objList.dateAdded}</td>
															<td data-label="<spring:message code='BzCompoer.report.customercontract.fullname' />">${objList.firstName}${objList.lastName}</td>
															<td data-label="<spring:message code='BzComposer.Dashboard.AdjustedTotal' />">${objList.adjustedtotal}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td style="font-size: 12px">&nbsp;</td>
									<td></td>
								</tr>
								<tr>
									<td style="font-size: 1.2em; color: #fff; padding-right: 6px;">
										<div
											style="width: 100%; background-color: #05A9C5; padding: 5px;">
											<spring:message code="Bizcomposer.invoice" />
										</div>
									</td>
									<td style="font-size: 1.2em; color: #fff; padding-left: 6px;">
										<div
											style="width: 100%; background-color: #05A9C5; padding: 5px;">
											<spring:message code="Bizcomposer.estimate" />
										</div>
									</td>
								</tr>
								<tr>
									<td style="border: 0; vertical-align: top;">
										 <div class="responsive-panel" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 6px 0 0;">
											<table class="tabla-listados" cellspacing="0"
												style="margin: 0; border: 0; text-decoration: none;">
												<thead>
													<tr>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.sales.Order" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.global.dateadded" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzCompoer.report.customercontract.fullname" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.Dashboard.AdjustedTotal" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${invoiceDetails}" var="objList">
														<tr>
															<td data-label="<spring:message code='BzComposer.sales.Order' />">${objList.orderNo}</td>
															<td data-label="<spring:message code='BzComposer.global.dateadded' />">${objList.dateAdded}</td>
															<td data-label="<spring:message code='BzCompoer.report.customercontract.fullname' />">${objList.firstName}${objList.lastName}</td>
															<td data-label="<spring:message code='BzComposer.Dashboard.AdjustedTotal' />">${objList.adjustedtotal}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</td>
									<td style="border: 0; vertical-align: top;">
										 <div class="responsive-panel" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 6px 0 0;">
											<table class="tabla-listados" cellspacing="0"
												style="margin: 0; border: 0; text-decoration: none;margin: 0px 0px 0px 0px;">
												<thead>
													<tr>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.Estimaion.EstNum" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.global.dateadded" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzCompoer.report.customercontract.fullname" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.Dashboard.AdjustedTotal" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${estimateDetails}" var="objList">
														<tr>
															<td data-label="<spring:message code='BzComposer.Estimaion.EstNum' />">${objList.orderNo}</td>
															<td data-label="<spring:message code='BzComposer.global.dateadded' />">${objList.dateAdded}</td>
															<td data-label="<spring:message code='BzCompoer.report.customercontract.fullname'/>" >${objList.firstName}${objList.lastName}</td>
															<td data-label="<spring:message code='BzComposer.Dashboard.AdjustedTotal'/>">${objList.adjustedtotal}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td style="font-size: 12px">&nbsp;</td>
								</tr>
								<tr>
									<td style="font-size: 1.2em; color: #fff; padding-right: 6px;">
										<div
											style="width: 100%; background-color: #05A9C5; padding: 5px;">
											<spring:message code="BzComposer.Item.ItemList" />
										</div>
									</td>
									<td style="font-size: 1.2em; color: #fff; padding-left: 6px">
										<div
											style="width: 100%; background-color: #05A9C5; padding: 5px;">
											<spring:message code="BzComposer.common.ReorderItemList" />
										</div>
									</td>
								</tr>
								<tr>
									<td style="border: 0; vertical-align: top;">
										 <div class="responsive-panel" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 6px 0 0;">
											<table class="tabla-listados" cellspacing="0" style="margin: 0px 0px 0px 0px;">
												<thead>
													<tr>
														<th style="font-size: 12px;"><spring:message
																code="bca.Category" /></th>
														<th style="font-size: 12px;"><spring:message
																code="Bizcomposer.itemCode" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.item.itemtype" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.Item.ItemTitle" /></th>
														<th style="font-size: 12px;"><spring:message
																code="Bizcomposer.qty" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${itemListDetails}" var="objList">
														<tr>
															<td data-label="<spring:message code='bca.Category' />">${objList.category}</td>
															<td
																data-label="<spring:message code='Bizcomposer.itemCode' />">${objList.itemCode}</td>
															<td
																data-label="<spring:message code='BzComposer.item.itemtype' />">${objList.itemType}</td>
															<td
																data-label="<spring:message code='BzComposer.Item.ItemTitle' />">${objList.itemName}</td>
															<td
																data-label="<spring:message code='Bizcomposer.qty' />">${objList.qty}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</td>
									<td style="border: 0; vertical-align: top;">
										 <div class="responsive-panel" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 6px 0 0;">
											<table class="tabla-listados" cellspacing="0" style="margin: 0px 0px 0px 0px;">
												<thead>
													<tr>
														<th style="font-size: 12px;"><spring:message
																code="Bizcomposer.itemCode" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.item.itemtype" /></th>
														<th style="font-size: 12px;"><spring:message
																code="BzComposer.Item.ItemTitle" /></th>
														<th style="font-size: 12px;"><spring:message
																code="Bizcomposer.qty" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${purchaseDetails}" var="objList">
														<tr>
															<td
																data-label="<spring:message code='Bizcomposer.itemCode' />">${objList.poNum}</td>
															<td
																data-label="<spring:message code='BzComposer.item.itemtype' />">${objList.dateAdded}</td>
															<td
																data-label="<spring:message code='BzComposer.Item.ItemTitle' />">${objList.firstName}
																${objList.lastName}</td>
															<td
																data-label="<spring:message code='Bizcomposer.qty' />">${objList.total}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</html>
<script>
function filterRangeOptions(){
	var range = document.getElementById("dashrangeName").value;
	console.log("dashboardrange--"+range);
	window.location = "Dashboard?tabid=Dashboard&dashrangeName="+range;
}

var onLoadrange = document.getElementById("dashrangeName").value;
console.log("onLoadrange--"+onLoadrange);
var deshrangesession = '<%=session.getAttribute("dashrangeName")%>
	';
	console.log("deshrangesession-----------" + deshrangesession);
	if (deshrangesession != null && deshrangesession != null) {
		document.getElementById("dashrangeName").value = deshrangesession;
	} else if (onLoadrange != null) {
		document.getElementById("dashrangeName").value = onLoadrange;
	}
</script>
<script>
function setupTableResponsive() {
    const table = document.querySelector('.tabla-listados');
    
    function checkOverflow() {
        if (window.innerWidth > 480) {
            const hasOverflow = table.scrollWidth > table.clientWidth;
            if (hasOverflow) {
                table.style.display = 'block';
                table.style.overflowX = 'auto';
            } else {
                table.style.display = 'table';
                table.style.overflowX = 'visible';
            }
        }
    }
    
    window.addEventListener('resize', checkOverflow);
    checkOverflow(); // Run on initial load
}

// Run when DOM is loaded
document.addEventListener('DOMContentLoaded', setupTableResponsive);
</script>
