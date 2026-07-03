<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function invaliddaysdialog()
{
	event.preventDefault();
	$("#invaliddaysdialog").dialog({
    	resizable: false,
        height: 200,
        width: 450,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;
	if (unicode!=8)
	{
 		//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1)
		{
 			return true;
		}
		else
		if (unicode<48||unicode>57) //if not a number
			return false; //disable key press
	}
}
</script>
<table class="table-notifications" width="100%">
	<tr>
		<td style="font-size:12px;">
			<input type="checkbox" path="showReminder" id="showReminder" value="${configDto.showReminder}" ${configDto.showReminder=='on'?'checked':''}  />
			<label><spring:message code="BzComposer.configuration.showreminder" /></label>
		</td>
	</tr>
	<tr>
		<th align="left" style="font-size:12px; padding: 5px;">
			<spring:message code="BzComposer.configuration.reminderlist" />
		</th>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td align="right" style="width:100px;font-size:12px;">
						<b><spring:message code="BzComposer.configuration.remindme" /></b>
					</td>
					<td style="width:100px;">&nbsp;&nbsp;</td>
					<td style="width:100px;">&nbsp;&nbsp;</td>
					<td align="left" style="width:150px;font-size:12px;">
						<b><spring:message code="BzComposer.configuration.dontremindme" /></b>
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.memorizeinvoice" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="invoiceMemo" value="1" id="invoiceMemoRemindMe" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="invoiceMemo" value="0" id="invoiceMenoDontRemindMe" />
					</td>
					<td style="font-size:12px;">
						<form:input path="invoiceMemoDays" id="invoiceMemoDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);" />
					</td>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.daysaftermemorizedate" />
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.memorizeestimation" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="memorizeEstimation" value="1" id="memorizeRemindMe" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="memorizeEstimation" value="0" id="memorizeDontRemindMe" />
					</td>
					<td style="font-size:12px;">
						<form:input path="memorizeEstimationDays" id="memorizeEstimationDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);" />
					</td>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.daysaftermemorizedate" />
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.overdueinvoices" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="overdueInvoice" value="1" id="overdueInvoice" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="overdueInvoice" value="0" id="overdueInvoiceDontRemindMe" />
					</td>
					<td style="font-size:12px;">
						<form:input path="overdueInvoiceDays" id="overdueInvoiceDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);" />
					</td>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.daysbeforeduedate" />
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.inventorytoreorder" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="inventoryOrder" value="1" id="inventoryOrderRemindMe" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="inventoryOrder" value="0" id="inventoryOrderDontRemindme" />
					</td>
					<td style="font-size:12px;">
						<form:input path="inventoryOrderDays" id="inventoryOrderDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);" />
					</td>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.qtybeforereorderpoint" />
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.servicebilling" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="serviceBilling" value="1" id="serviceBillingRemindMe" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="serviceBilling" value="0" id="serviceBillingDontRemindMe" />
					</td>
					<td style="font-size:12px;">
						<form:input path="serviceBillingDays" id="serviceBillingDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);" />
					</td>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.daysbeforeschedulebillingdate" />
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.billstopay" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="billsToPay" value="1" id="billsToPayRemindMe" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="billsToPay" value="0" id="billsToPayDontRemindMe" />
					</td>
					<td style="font-size:12px;">
						<form:input path="billsToPayDays" id="billsToPayDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);" />
					</td>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.daysbeforeduedate" />
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.memorizepurchaseorder" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="memorizePurchaseOrder" value="1" id="memorizePurchaseOrderRemindMe" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="memorizePurchaseOrder" value="0" id="memorizePurchaseOrderDontRemindMe" />
					</td>
					<td style="font-size:12px;">
						<form:input path="memorizePurchaseOrderDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);" />
					</td>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.daysaftermemorizedate" />
					</td>
				</tr>
				<tr>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.memorizebill" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="memorizeBill" value="1" id="memorizeBillRemindMe" />
					</td>
					<td align="center" style="font-size:12px;">
						<form:radiobutton path="memorizeBill" value="0" id="memorizeBillDontRemindMe" />
					</td>
					<td style="font-size:12px;">
						<form:input path="memorizeBillDays" id="memorizeBillDays" size="10" maxlength="4" onkeypress="return numbersonly(event,this.value);" />
					</td>
					<td style="font-size:12px;">
						<spring:message code="BzComposer.configuration.daysaftermemorizedate" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<div>
	<input type="hidden" name="showReminderStatus" id="showReminderStatus" value="" />
</div>
<div id="invaliddaysdialog" style="display:none;">
	<p><spring:message code="BzComposer.configuration.reminder.insertedvaluenotgreater"/></p>
</div>