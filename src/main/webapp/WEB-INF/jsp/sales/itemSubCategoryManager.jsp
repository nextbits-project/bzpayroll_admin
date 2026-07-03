<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title><spring:message code="BzComposer.categorymanagertitle"/></title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
div#pie {
	padding: 10px 0px 20px 0px;
}
table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 20px 0px 20px 0px;
}
table.tabla-listados thead tr th {
	font-size: .7em;
	text-align: left;
	padding: 5px 10px;
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	text-shadow: #999 0px 1px 1px;
	white-space: nowrap;
}
table.tabla-listados tbody tr td {
	font-size: .8em;
	padding: 5px 0px 5px 14px;
	background: #fff;
	vertical-align: top;
}
.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable {
	min-width: 55%;
	min-height: 300px;
	height: auto;
	width: 200px;
	display: block;
	z-index: 101;
}
#highlight { background-color: blue; }
.highlight { background-color: #00CED1 !important;color: #fff }

.switch { position: relative; display: inline-block; width: 50px; height: 28px; }
.slider { position: absolute; cursor: pointer;
    top: 0; left: 0; right: 0; bottom: 0;
    background-color: #ccc; -webkit-transition: .4s; transition: .4s;
}
.slider:before { position: absolute; content: "";
    height: 20px; width: 20px; left: 4px; bottom: 4px;
    background-color: white; -webkit-transition: .4s; transition: .4s;
}
input:checked + .slider { background-color: #17a2b8; }
input:checked + .slider:before {
  -webkit-transform: translateX(20px);
  -ms-transform: translateX(20px);
  transform: translateX(20px);
}

/* --------- Rounded sliders ---------- */
.slider.round { border-radius: 34px; }
.slider.round:before { border-radius: 50%; }
.paddingLeft30PX{ padding-left: 30px! important; }
.inactiveText { color: #ccc; }
</style>

<style>
.dataTables_length {
	display: none;
}

.dataTables_filter {
	font-size: 14px;
	float: left !important;
}

.dataTables_info {
	font-size: 14px;
}

.dataTables_paginate {
	font-size: 14px;
}

table.sortable thead {
	background-color: #eee;
	color: #666666;
	font-weight: bold;
	cursor: default;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 0px 0px 0px 0px;
}

table.tabla-listados tbody tr.odd td {
	background: #e1e5e9;
}

table.tabla-listados thead tr th {
	font-size: 14px;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
}
</style>

</head>
<body onload="initialize();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<!-- begin Contents -->
						<div>
							<div>
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									<spring:message code="BzComposer.categorymanager.sub.itemcategorymanager" /> <c:if
										test="${not empty actionMsg}">
										<br /> ${actionMsg}
            <%
            session.removeAttribute("actionMsg");
            %>
									</c:if>
								</span>
							</div>
							<div class="btngroup2-fixed mt-3 text-center" style="position:relative;">
                				<button class="btn btn-info" style="font-size: 14px;" id="back" onclick="BackButton()" >
                    			<spring:message code="BzComposer.global.back"/>
                				</button>
                				<button class="btn btn-info" style="font-size: 14px;" id="AddItemBtn">
                    			<spring:message code="BzComposer.global.add"/>
                				</button>
                				<button class="btn btn-info" style="font-size: 14px;" id="EditItemBtn">
                    			<spring:message code="BzComposer.global.edit"/>
                				</button>
                				<button class="btn btn-info" style="font-size: 14px;" id="DeleteItemBtn">
                    			<spring:message code="BzComposer.global.delete"/>
                				</button>
            				</div>
						</div>
						<input type="hidden" id="lSize" value='${subCategoryList.size()}' />
						<table id="custTable" class="tabla-listados sortable"
							cellspacing="0"
							style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
							align="center">
							<thead>
								<tr valign="center">
									<th style="padding-right: 30px !important;"><spring:message code="BzComposer.Customer.ID" /></th>
									<th><spring:message code="BzComposer.item.category.manager.name" /></th>
									<th><spring:message code="BzComposer.item.sub.category.manager.name" /></th>
									<th><spring:message code="BzComposer.item.sub.category.manager.description" /></th>
									<th><spring:message code="BzComposer.item.category.manager.status" /></th>
								</tr>
							</thead>
							<tbody id="custTableBody">
								<c:if test="${not empty subCategoryList}">
									<c:forEach items="${subCategoryList}" var="objList"
										varStatus="loop">
										<tr id='${loop.index}$$'
											onclick="setRowId(${objList.subItemCategoryID}, ${loop.index}, true);">
											<td class=""><input type="checkbox" id="custID${loop.index}"
												value="${objList.subItemCategoryID}"
												onchange="addRowIndex(${loop.index}, ${objList.subItemCategoryID})" />
												${objList.subItemCategoryID}</td>
											<td>${objList.categoryName}</td>
											<td>${objList.name}</td>
											<td>${objList.detail}</td>
											<td>${objList.active}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
							
						</table>
					</div>
					<div>
						<input type="hidden" name="tabid" id="tabid" value="" />
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--    Here is the AddItem dialog started -->
<div class="container-fluid" id="AddEditItemDlg">
	<div class="table-responsive" style="padding:10 20px;font-size: 14px;border: 1px solid #ced4da;border-radius: .25rem;min-height: 220px">
         <h6><spring:message code="BzComposer.item.category.sub.categoryinformation"/></h6>
         <hr/>
	     <form:form action="/ItemCategoryManager?tabid=SaveItemSubCategoryManager" method="post" onsubmit="return validateAddItemForm(this);" modelAttribute="itemCategoryDto">
	        <div class="row">
                <div class="col-md-1"></div>
                <label class="col-md-3 text-right"><spring:message code="BzComposer.item.category.manager.name"/></label>
                <div class="col-md-5">
                    <form:input type="text" value="Software" class="form-control" path="itemName" />
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <label class="col-md-3 text-right"><spring:message code="BzComposer.item.sub.category.manager.name"/></label>
                <div class="col-md-5">
                    <form:input type="text" class="form-control" path="itemSubName" />
                </div>
                <div class="col-md-3"></div>
            </div>
			<div class="row">
			    <div class="col-md-1"></div>
				<label class="col-md-3 text-right"><spring:message code="BzComposer.categorymanager.active"/></label>
				<div class="col-md-5">
                    <form:select class="form-control" path="itemActive">
                        <option value="1"><spring:message code="BzComposer.categorymanager.active"/></option>
                        <option value="0"><spring:message code="BzComposer.categorymanager.inactive"/></option>
                    </form:select>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" id="itemDescriptionROW">
			    <div class="col-md-1"></div>
                <label class="col-md-3 text-right">
                    <spring:message code="BzComposer.item.sub.category.manager.description"/>
                </label>
                <div class="col-md-5">
                    <form:input type="text" class="form-control" path="itemDescription" />
                </div>
                <div class="col-md-3"></div>
            </div>
            <div><form:input type="hidden" class="form-control" path="itemCategoryID" /></div>
            <div><form:input type="hidden" class="form-control" path="subItemCategoryID" /></div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-8 pt-2" style="font-size: 14px;">
                    <button type="submit" class="btn btn-info"><spring:message code="BzComposer.global.save"/></button>
                    <button type="button" class="btn btn-info" onclick="closeItemDialog();"><spring:message code="BzComposer.global.close"/></button>
                </div>
            </div>
         </form:form>
	</div>
</div>
	
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

<script>

let itemID = 0;
let itemIndex = 0;
let selectedRowIndexs = [];

$(document).ready(function() {
    $('#custTable').DataTable({
        "iDisplayLength": 20,
        "ordering": true,
        "order": [[0, 'desc']],
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, false);
            hightlightROW();
        }
    });
});

function initialize(){
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
    	if(document.getElementById('0$$') != null){
    		document.getElementById('0$$').className = "even";
    	}
    }
}
window.onload = function() {
    AddNewItem();
  };
  function AddNewItem(){
    $( "#AddEditItemDlg").dialog({
            modal: true,
            title: 'Add Item'
        });
        $("#itemID").val('0');
        $("#itemName").val("${categoryName}").attr("disabled", true);
        $("#itemSubName").val('');
        $("#itemDescription").val('');
        if($("#categoryTypeA").val()==1){
        $("#itemCategoryID").val($("#categoryIDA").val());
        }
    }
function setRowId(rowid, rowIndex, flag){
    let lSize = document.getElementById("lSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        itemID = rowid;
        itemIndex = rowIndex;
        if(rowIndex%2 == 1){ ;
            document.getElementById(rowIndex+"$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$').classList.add('draft');
    }
}
function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
    }
}

function addRowIndex(rowId, custID){
    let isFound = false;
    let isChecked = document.getElementById('custID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == custID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(custID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(custID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}

$(document).ready(function () {
    
    $('tr').click(function () {
         var selected = $(this).hasClass("highlight");
         $("tr").removeClass("highlight");
         if(!selected)
             $(this).addClass("highlight");
    });

	 $("#AddEditCategoryDlg").hide();
	 $("#AddEditItemDlg").hide();
	
     $( "#AddCategoryBtn").on("click", function(){
         $( "#AddEditCategoryDlg").dialog({
            modal: true,
            title: 'Add Category'
         });
         $("#categoryID").val('0');
         $("#categoryName").val('');
         $("#description").val('');
         document.getElementById('parentIdDev').style.display = "none";
     });
     $( "#EditCategoryBtn").on("click", function(){
         if($("#CategoryListTbl tr.highlight").length==0){
            return selectcategorydialog();
            return false;
         }
         $( "#AddEditCategoryDlg").dialog({
            modal: true,
            title: 'Edit Category'
         });
         setCategoryType($("#categoryTypeA").val());
         $("#categoryType").val($("#categoryTypeA").val())
         $("#categoryID").val($("#categoryIDA").val());
         $("#parentID").val($("#parentIDA").val());
         $("#categoryName").val($("#categoryNameA").val());
         $("#description").val($("#description").val());
         $("#active").val($("#categoryEnabled").is(":checked")?1:0);
     });
     $( "#AddItemBtn").on("click", function(){
          $( "#AddEditItemDlg").dialog({
             modal: true,
             title: 'Add Item'
          });
          $("#itemID").val('0');
          $("#itemName").val("${categoryName}").attr("disabled", true);
          $("#itemSubName").val('');
          $("#itemDescription").val('');
          if($("#categoryTypeA").val()==1){
            $("#itemCategoryID").val($("#categoryIDA").val());
          }
     });
     $( "#EditItemBtn").on("click", function(){
         if($("#custTable tr.highlight").length==0){
            return selectitemdialog();
            return false;
         }
         $( "#AddEditItemDlg").dialog({
             modal: true,
             title: 'Edit Item'
         });
         let ItemListTblCells = $("#custTable tr.highlight")[0].cells;
         $("#subItemCategoryID").val(ItemListTblCells[0].innerText);
         $("#itemName").val(ItemListTblCells[1].innerText).attr("disabled", true);
         $("#itemSubName").val(ItemListTblCells[2].innerText);
         $("#itemActive").val(ItemListTblCells[4].innerText=='Active'?1:0);
         $("#itemDescription").val(ItemListTblCells[3].innerText);
         $("#itemDescriptionROW").show();

         let itemIDs = '';
         let itemNames = '';
         var inputs = document.querySelectorAll('.itemListChk');
         for (var i = 0; i < inputs.length; i++) {
             let curCheckbox = inputs[i];
             if(curCheckbox.checked){
                 itemIDs = itemIDs + curCheckbox.value + ',';
                 itemNames = itemNames + curCheckbox.parentElement.parentElement.cells[5].innerText + ',';
             }
         }
         itemIDs = itemIDs.substring(0, itemIDs.length-1);
         itemNames = itemNames.substring(0, itemNames.length-1);
         if(itemIDs.split(',').length>1){
            $("#itemDescriptionROW").hide();
            $("#itemName").val(itemNames);
            $("#itemIDs").val(itemIDs);
         }
     });
     $( "#DeleteItemBtn").on("click", function(){
         if($("#custTable tr.highlight").length==0){
            return selectitemdialog();
            return false;
         }
         event.preventDefault();
         $("#deletedialogbox").dialog({
        	 	title:'Delete Item',
        	    resizable: false,
        	    height: 200,
        	    width: 500,
        	    modal: true,
        	    buttons: {
        	        "<spring:message code='BzComposer.global.ok' />": function () {
        	            // Add the following line to set the value of #itemID
        	            $("#itemID").val(ItemListTblCells[0].innerText);
        	            $(this).dialog("close");
    					//	console.log("value:"+$("#itemID").val());
        	            // Redirect to the new URL
        	            var redirectURL = "ItemCategoryManager?tabid=DeleteItemSubCategoryManager&itemId=" + selectedRowIndexs;
						window.location = redirectURL;
        	        },
        	        "<spring:message code='BzComposer.global.cancel' />": function () {
        	            $(this).dialog("close");
        	            return false;
        	        }
        	    }
        	});
         let ItemListTblCells = $("#custTable tr.highlight")[0].cells;
         $("#itemID").val(ItemListTblCells[0].innerText);
         $("#itemCategoryID").val(ItemListTblCells[1].innerText);
         $("#itemDescription").val(ItemListTblCells[2].innerText);
         $("#itemDescriptionROW").show();

         let itemIDs = '';
         let itemNames = '';
         var inputs = document.querySelectorAll('.itemListChk');
         for (var i = 0; i < inputs.length; i++) {
             let curCheckbox = inputs[i];
             if(curCheckbox.checked){
                 itemIDs = itemIDs + curCheckbox.value + ',';
                 itemNames = itemNames + curCheckbox.parentElement.parentElement.cells[5].innerText + ',';
             }
         }
         itemIDs = itemIDs.substring(0, itemIDs.length-1);
         itemNames = itemNames.substring(0, itemNames.length-1);
         if(itemIDs.split(',').length>1){
            $("#itemDescriptionROW").hide();
            $("#itemName").val(itemNames);
            $("#itemIDs").val(itemIDs);
         }
     });
     
});

function init(){

    //let row1ID = $('.hideShowSubCatItems')[0].cells[0].innerText;

    if($("#CategoryListTbl tr").length>2){
        $("#CategoryListTbl tr")[2].cells[0].click();
    }
}

function closeCategoryDialog(){
    $('#AddEditCategoryDlg').dialog('close');
}
function closeItemDialog(){
    $('#AddEditItemDlg').dialog('close');
}
function mainCategoryClicked(categoryID, active, categoryName, description){
    setCategoryType(0);
    document.getElementById('categoryTypeA').value = 0;
    document.getElementById('parentIDA').value = '';
    document.getElementById('categoryIDA').value = categoryID;
    document.getElementById('categoryEnabled').checked = active;
    document.getElementById('categoryNameA').value = categoryName;
    document.getElementById('description').value = description;
}
function subCategoryClicked(categoryID, parentID, active, categoryName, description){
    let tblRows = document.getElementById('ItemListTbl').getElementsByTagName("tr");
    for(let x=1; x<tblRows.length; x++){
        let myRow = tblRows[x];
        if(myRow.cells[1].innerText == categoryID)
            myRow.style.display = "table-row";
        else
            myRow.style.display = "none";
    }
    document.getElementById('categoryTypeA').value = 1;
    document.getElementById('categoryIDA').value = categoryID;
    document.getElementById('parentIDA').value = parentID;
    document.getElementById('categoryEnabled').checked = active;
    document.getElementById('categoryNameA').value = categoryName;
    document.getElementById('description').value = description;
}

function setCategoryType(catType){
    if(catType==0){
        document.getElementById('parentIdDev').style.display = "none";
    }else{
        document.getElementById('parentIdDev').style.display = "flex";
    }
}

function validateAddCategoryForm(form){
    if(form.categoryType.value == 1 && form.parentID.value == ''){
        form.parentID.style.borderColor = "red";
        return false;
    }
    else if(form.categoryName.value.trim() == ''){
        form.categoryName.style.borderColor = "red";
        return false;
    }
    return true;
}
function validateAddItemForm(form){
    if(form.itemCategoryID.value == ''){
        form.itemCategoryID.style.borderColor = "red";
        return false;
    }
    else if(form.itemName.value.trim() == ''){
        form.itemName.style.borderColor = "red";
        return false;
    }
    return true;
}
function selectcategorydialog(){
    event.preventDefault();
    $("#selectcategorydialog").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function selectitemdialog(){
    event.preventDefault();
    $("#selectitemdialog").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function BackButton(){
	var redirectURL = "ItemCategoryManager?tabid=ItemCategoryManager";
	window.location = redirectURL;
}

</script>
</body>
</html>
<script>
function initialize(){
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
        document.getElementById('0$$').className = "even";
    }
}
</script>
<!-- Dialog box used in this page -->
<div id="selectcategorydialog" style="display:none;">
	<p><spring:message code='BzComposer.categorymanager.selectcategory'/></p>
</div>
<div id="selectitemdialog" style="display:none;">
	<p><spring:message code='BzComposer.categorymanager.selectitemrow'/></p>
</div>
<div id="showerrordialog" style="display:none;">
	<p><spring:message code='BzComposer.reconciliation.someerroroccurred'/></p>
</div>
<div id="deletedialogbox" style="display:none;">
	<p><spring:message code='BzComposer.categorymanager.wanttodelete'/></p>
</div>
<div id="deleteCustomer" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselecteditem" />
	</p>
</div>