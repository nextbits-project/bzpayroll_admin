//Author: Sarfraz-Malik
var categoryId = -1;
var index = -1;
var categoryName = "";

$(document).ready(function () {
    let row1ID = $('.hideShowMyCatType')[0].cells[0].innerText;
    hideShowMyCat(row1ID);

    $("#AddNewGeneralCategoryDlgId").hide();
	$("#AddNewNonProfitCategoryDlgId").hide();
    $("#EditGeneralCategoryDlgId").hide();
	$("#EditNewNonProfitCategoryDlgId").hide();
	
    $("#addCategoryCombo").prop('disabled', true);
    $("#SubAccountOfCategoryForUpdate").prop('disabled', true);

    $('.hideShowMyCat').click(function () {
    
         var selected = $(this).hasClass("highlight0");
         $(".hideShowMyCat").removeClass("highlight0");
         if(!selected)
             $(this).addClass("highlight0");
    });
	
	$('.hideShowMyCatType').click(function () {
	   
	        var selected = $(this).hasClass("highlight0");
	        $(".hideShowMyCatType").removeClass("highlight0");
	        if(!selected)
	            $(this).addClass("highlight0");
	   });

     $( "#AddNewNonProfitCategory").on("click", function()
	 {
         event.preventDefault();
         $("#addCategoryCombo2").val("");
         $( "#AddNewNonProfitCategoryDlgId").dialog({
            height: 500,
            width: 600,
            modal: true,
            title: 'Add Nonprofit Category'
         });
     });
	 
	  $( "#AddNewGeneralCategory").on("click", function(){
	         event.preventDefault();
	         $("#addCategoryCombo1").val("");
	         $( "#AddNewGeneralCategoryDlgId").dialog({
	            height: 500,
	            width:  600,
	            modal: true,
	            title: 'Add  General Category'
	         });
	     });
		 
     $( "#EditGeneralCategory").on("click", function(){
        event.preventDefault();
        $("#SubAccountOfCategoryForUpdate").val("");
        if(categoryId == -1){
            alert(selectCategoryMsg);
            return false;
        }
        $( "#EditGeneralCategoryDlgId").dialog({
            height: 500,
            width: 600,
            modal: true,
            title: 'Edit General Category'
        });
      loadGeneralCategoryForUpdate();
     });
	 
	 $( "#EditNonProfitCategory").on("click", function(){
	        event.preventDefault();
	        $("#SubAccountOfCategoryForUpdate").val("");
	        if(categoryId == -1){
	            alert(selectCategoryMsg);
	            return false;
	        }
	        $( "#EditNonProfitCategoryDlgId").dialog({
	            height: 500,
	            width: 600,
	            modal: true,
	            title: 'Edit NonProfit  Category'
	        });
	        loadCategoryForUpdate();
	     });

});

function hideShowMyCat(catTypeID){
    let catRows = $('.hideShowMyCat');
    for(let x=0; x<catRows.length; x++){
        let myRow = catRows[x];
        if(catTypeID == myRow.cells[1].innerText)
            myRow.style.display = "table-row";
        else
            myRow.style.display = "none";
    }
}
function selectRow(catId, inv)
{
	
	this.categoryId = catId;
	this.index = inv;
	let selectedROW = $('table.devAcCategoryListTable tbody tr:nth-child('+index+')');
	$('select.CategoryTypeForUpdate').val(selectedROW.find('td:nth-child(2)').attr('value'));
	var parent = selectedROW.find('td:nth-child(8)').attr('value');
	if(parent == 'root'){
		$("#subAccountOfCheckForUpdate").prop("checked", false);
		$("#SubAccountOfCategoryForUpdate").prop('disabled', true);
	}
	else{
		$("#subAccountOfCheckForUpdate").prop("checked", true);
		$("#SubAccountOfCategoryForUpdate").prop('disabled', false);
	}
	categoryName = selectedROW.find('td:nth-child(3)').text().trim();
	$("#CategoryNameForUpdate").val(categoryName);
	$("select#BudgetCategoryForUpdate").val(selectedROW.find('td:nth-child(7)').attr('value'));
	$("#AccountNumberForUpdate").val(selectedROW.find('td:nth-child(4)').text());
	$("#DescriptionForUpdate").val(selectedROW.find('td:nth-child(6)').text());
	var d;
}

function loadGeneralCategoryForUpdate(){
    $.ajax({
        type : "GET",
        url : "CategoryManagerAJAX?tabid=getCategoryDetails&catID="+categoryId,
        success : function(data) {
            document.getElementById("GeneralCategoryTypeForUpdate").value = data.categoryTypeID;
            document.getElementById("GeneralCategoryNameForUpdate").value = data.name;
            document.getElementById("GeneralAccountNumberForUpdate").value = data.categoryNumber;
            document.getElementById("GeneralBudgetCategoryForUpdate").value = data.budgetCategoryID;
            document.getElementById("GeneralDescriptionForUpdate").value = data.description;

            if(data.parent == 'root'){
                $("#GeneralSubAccountOfCategoryForUpdate").prop('disabled', true);
            }else{
                $("#GeneralSubAccountOfCategoryForUpdate").prop('disabled', false);
                document.getElementById("GeneralsubAccountOfCheckForUpdate").checked = data.parent!='root'?true:false;
                document.getElementById("GeneralSubAccountOfCategoryForUpdate").value = data.parent;
            }

        },
         error : function(data) {
            alert(someErrorOccurredMsg);
        }
    });
}
function loadCategoryForUpdate(){
    $.ajax({
        type : "GET",
        url : "CategoryManagerAJAX?tabid=getCategoryDetails&catID="+categoryId,
        success : function(data) {
            document.getElementById("CategoryTypeForUpdate").value = data.categoryTypeID;
            document.getElementById("CategoryNameForUpdate").value = data.name;
            document.getElementById("AccountNumberForUpdate").value = data.categoryNumber;
            document.getElementById("BudgetCategoryForUpdate").value = data.budgetCategoryID;
            document.getElementById("DescriptionForUpdate").value = data.description;

            if(data.parent == 'root'){
                $("#SubAccountOfCategoryForUpdate").prop('disabled', true);
            }else{
                $("#SubAccountOfCategoryForUpdate").prop('disabled', false);
                document.getElementById("subAccountOfCheckForUpdate").checked = data.parent!='root'?true:false;
                document.getElementById("SubAccountOfCategoryForUpdate").value = data.parent;
            }

        },
         error : function(data) {
            alert(someErrorOccurredMsg);
        }
    });
}



function deleteGeneralCategory()
 {
    event.preventDefault();
     if(categoryId == -1){
        alert(selectCategoryMsg);
        return false;
    }
	$.ajax({
        type : "GET",
        url : "CategoryManagerAJAX/Exists?tabid=GeneralCheckChildCategory",
        data :"CategoryId=" + categoryId,
        success : function(isExists) {
            
            if(isExists === false){
                 $.ajax({
                    type : "GET",
                    url : "CategoryManagerAJAX/Exists?tabid=CheckIsCategoryID",
                    data :"CategoryId=" + categoryId,
                    success : function(isExists2) {
                        if(isExists2 === true){
                            return alert(categoryUsedForOtherInvoice);
                        }
                        else{
                            
                            if(window.confirm(wantToDeleteMsg) == true){
                                $.ajax({
                                    type : "POST",
                                    url : "categoryManagerPost?tabid=DeleteCategory&type=general",
                                    data :"CategoryId=" + categoryId,
                                    success : function(data) {
                                        //updateCategoryManager(data);
                                        location.reload();
                                    }
                                });
                            }
                        }
                    },
                 });
            }
            else{
                alert(itemCantDeleteMsg);
                return false;
            }
        },
         error : function(data) {
            alert(someErrorOccurredMsg);
            return false
        }
    });
   $(document.forms[0]).submit(function(event) {
        event.preventDefault();
   });
}
 function deleteNonProfitCategory()
 {
    event.preventDefault();
     if(categoryId == -1){
        alert(selectCategoryMsg);
        return false;
    }
	$.ajax({
        type : "GET",
        url : "CategoryManagerAJAX/Exists?tabid=NonProfitCheckChildCategory",
        data :"CategoryId=" + categoryId,
        success : function(isExists) {
            
            if(isExists === false){
                 $.ajax({
                    type : "GET",
                    url : "CategoryManagerAJAX/Exists?tabid=CheckIsCategoryID",
                    data :"CategoryId=" + categoryId,
                    success : function(isExists2) {
                        if(isExists2 === true){
                            return alert(categoryUsedForOtherInvoice);
                        }
                        else{
                            
                            if(window.confirm(wantToDeleteMsg) == true){
                                $.ajax({
                                    type : "POST",
                                    url : "categoryManagerPost?tabid=DeleteCategory&type=nonProfit",
                                    data :"CategoryId=" + categoryId,
                                    success : function(data) {
                                        //updateCategoryManager(data);
                                        location.reload();
                                    }
                                });
                            }
                        }
                    },
                 });
            }
            else{
                alert(itemCantDeleteMsg);
                return false;
            }
        },
         error : function(data) {
            alert(someErrorOccurredMsg);
            return false
        }
    });
   $(document.forms[0]).submit(function(event) {
        event.preventDefault();
   });
}

$(function() {
	$("#subAccountOfCheckBox").on("click", function(){
		if($("#subAccountOfCheckBox").prop("checked")){
			 $("#addCategoryCombo").prop('disabled', false);
		}else{
			$("#addCategoryCombo").prop('disabled', true);
		}
	});

	$("#subAccountOfCheckForUpdate").on("click", function(){
		if($("#subAccountOfCheckForUpdate").prop("checked")){
			 $("#SubAccountOfCategoryForUpdate").prop('disabled', false);
		}else{
			$("#SubAccountOfCategoryForUpdate").prop('disabled', true);
		}
	});

});


function resetGeneralCategory()
{
	if(window.confirm(wantToResetMsg) == true)
		{
			$.ajax({
			                                  type : "POST",
			                                  url : "categoryManagerPost?tabid=ResetCategory&type=general",
			                                  data :"",
			                                  success : function(data) {
			                                      //updateCategoryManager(data);
			                                      location.reload();
			                                  }
			                              });
			
		}
	
	
}
function resetNonProfitCategory()
{
	if(window.confirm(wantToResetMsg) == true)
			{
				$.ajax({
				                                  type : "POST",
				                                  url : "categoryManagerPost?tabid=ResetCategory&type=nonprofit",
				                                  data :"",
				                                  success : function(data) {
				                                      //updateCategoryManager(data);
				                                      location.reload();
				                                  }
				                              });
				
			}
	
	
}
function saveNewGeneralCategory(value)
{
  
	
    document.getElementById("GeneralCategoryNameForAdd").style = '';
    document.getElementById("GeneralaccountNumberForAdd").style = '';
    document.getElementById("GeneraldescriptionForAdd").style = '';

    var categoryTypeId = document.getElementById("GeneralcategoryTypeForAdd").value;
    var categoryName = $("#GeneralCategoryNameForAdd").val();
    var subAccountOf = $("#GeneralsubAccountOfCheckBox").prop("checked");
    var parent = document.getElementById("GeneraladdCategoryCombo").value;
    var categoryNumber = $("#GeneralaccountNumberForAdd").val();
    var description = $("#GeneraldescriptionForAdd").val();
    var budgetCategoryId = document.getElementById("GeneralbudgetCategoryId").value;
    if(categoryName.trim()==''){
        document.getElementById("GeneralCategoryNameForAdd").style.borderColor = "red";
        return;
    }
    if(categoryNumber.trim()==''){
        document.getElementById("GeneralaccountNumberForAdd").style.borderColor = "red";
        return;
    }
    if(description.trim()==''){
        document.getElementById("GeneraldescriptionForAdd").style.borderColor = "red";
        return;
    }
    TblCategory = {
         "categoryTypeID":categoryTypeId,
         "name":categoryName,
         "subAccountOf":subAccountOf,
         "parent":parent,
         "categoryNumber":categoryNumber,
         "description":description,
         "budgetCategoryID":budgetCategoryId
    };



    var obj = JSON.stringify(TblCategory);
    $.ajax({
        type : "POST",
        url : "categoryManagerPost?tabid=AddNewCategory&type="+value,
        data :"data=" + obj,
        success : function(data) {
			
            $('#AddNewGeneralCategoryDlgId').dialog('close');
            if(data != ""){
                //updateCategoryManager(data);
                location.reload();
            }
            else{
                return alert(categoryNameExistMsg);
               GeneralcategoryManageWithoutUpdate();
            }
        },
         error : function(data) {
            alert(someErrorOccurredMsg);
            return false
        }
    });
    $(document.forms[0]).submit(function( event ) {
        event.preventDefault();
    });
}


function saveNewnonProfitCategory(value)
{
  
    document.getElementById("CategoryNameForAdd").style = '';
    document.getElementById("accountNumberForAdd").style = '';
    document.getElementById("descriptionForAdd").style = '';

    var categoryTypeId = document.getElementById("categoryTypeForAdd").value;
    var categoryName = $("#CategoryNameForAdd").val();
    var subAccountOf = $("#subAccountOfCheckBox").prop("checked");
    var parent = document.getElementById("addCategoryCombo").value;
    var categoryNumber = $("#accountNumberForAdd").val();
    var description = $("#descriptionForAdd").val();
    var budgetCategoryId = document.getElementById("budgetCategoryId").value;
    if(categoryName.trim()==''){
        document.getElementById("CategoryNameForAdd").style.borderColor = "red";
        return;
    }
    if(categoryNumber.trim()==''){
        document.getElementById("accountNumberForAdd").style.borderColor = "red";
        return;
    }
    if(description.trim()==''){
        document.getElementById("descriptionForAdd").style.borderColor = "red";
        return;
    }
    TblCategory = {
         "categoryTypeID":categoryTypeId,
         "name":categoryName,
         "subAccountOf":subAccountOf,
         "parent":parent,
         "categoryNumber":categoryNumber,
         "description":description,
         "budgetCategoryID":budgetCategoryId
    };
	
    var obj = JSON.stringify(TblCategory);
    $.ajax({
        type : "POST",
        url : "categoryManagerPost?tabid=AddNewCategory&type="+value,
        data :"data=" + obj,
        success : function(data) {
			
		
            $('#AddNewNonProfitCategoryDlgId').dialog('close');
            if(data != ""){
                //updateCategoryManager(data);
                location.reload();
            }
            else{
                return alert(categoryNameExistMsg);
                categoryManageWithoutUpdate();
            }
        },
         error : function(data) {
            alert(someErrorOccurredMsg);
            return false
        }
    });
    $(document.forms[0]).submit(function( event ) {
        event.preventDefault();
    });
}

  function updateGeneralCategory(type){
     
     document.getElementById("GeneralCategoryNameForUpdate").style = '';
     document.getElementById("GeneralAccountNumberForUpdate").style = '';
     document.getElementById("GeneralDescriptionForUpdate").style = '';

     var categoryTypeId = $("#GeneralCategoryTypeForUpdate").val();
     var categoryName = $("#GeneralCategoryNameForUpdate").val();
     var subAccountOf = $("#GeneralsubAccountOfCheckForUpdate").prop("checked");
     var parent = $("#GeneralSubAccountOfCategoryForUpdate").val();
     var categoryNumber = $("#GeneralAccountNumberForUpdate").val();
     var description = $("#GeneralDescriptionForUpdate").val();
     var budgetCategoryId = $("#GeneralBudgetCategoryForUpdate").val();
     if(categoryName.trim()==''){
         document.getElementById("GeneralCategoryNameForUpdate").style.borderColor = "red";
         return;
     }
     if(categoryNumber.trim()==''){
         document.getElementById("GeneralAccountNumberForUpdate").style.borderColor = "red";
         return;
     }
     if(description.trim()==''){
         document.getElementById("GeneralDescriptionForUpdate").style.borderColor = "red";
         return;
     }
     TblCategory = {
          "id":categoryId,
          "categoryTypeID":categoryTypeId,
          "name":categoryName,
          "subAccountOf":subAccountOf,
          "parent":parent,
          "categoryNumber":categoryNumber,
          "description":description,
          "budgetCategoryID":budgetCategoryId
     };

     var obj = JSON.stringify(TblCategory);
     $.ajax({
        type : "POST",
        url : "categoryManagerPost?tabid=UpdateCategory&type="+type,
        data :"data=" + obj,
        success : function(data) {
            $('#EditGeneralCategoryDlgId').dialog('close');
            //updateCategoryManager(data);
            categoryId = -1;
            location.reload();
        },
         error : function(data) {
            alert(someErrorOccurredMsg);
            return false
        }
    });
    $(document.forms[0]).submit(function( event ) {
        event.preventDefault();
    });
  }

  
  function updateNonProfitCategory(type)
  {
     
     document.getElementById("CategoryNameForUpdate").style = '';
     document.getElementById("AccountNumberForUpdate").style = '';
     document.getElementById("DescriptionForUpdate").style = '';

     var categoryTypeId = $("#CategoryTypeForUpdate").val();
     var categoryName = $("#CategoryNameForUpdate").val();
     var subAccountOf = $("#subAccountOfCheckForUpdate").prop("checked");
     var parent = $("#SubAccountOfCategoryForUpdate").val();
     var categoryNumber = $("#AccountNumberForUpdate").val();
     var description = $("#DescriptionForUpdate").val();
     var budgetCategoryId = $("#BudgetCategoryForUpdate").val();
     if(categoryName.trim()==''){
         document.getElementById("CategoryNameForUpdate").style.borderColor = "red";
         return;
     }
     if(categoryNumber.trim()==''){
         document.getElementById("AccountNumberForUpdate").style.borderColor = "red";
         return;
     }
     if(description.trim()==''){
         document.getElementById("DescriptionForUpdate").style.borderColor = "red";
         return;
     }
     TblCategory = {
          "id":categoryId,
          "categoryTypeID":categoryTypeId,
          "name":categoryName,
          "subAccountOf":subAccountOf,
          "parent":parent,
          "categoryNumber":categoryNumber,
          "description":description,
          "budgetCategoryID":budgetCategoryId
     };

     var obj = JSON.stringify(TblCategory);
     $.ajax({
        type : "POST",
        url : "categoryManagerPost?tabid=UpdateCategory&type="+type,
        data :"data=" + obj,
        success : function(data) {
            $('#EditNonProfitCategoryDlgId').dialog('close');
            //updateCategoryManager(data);
            categoryId = -1;
            location.reload();
        },
         error : function(data) {
            alert(someErrorOccurredMsg);
            return false
        }
    });
    $(document.forms[0]).submit(function( event ) {
        event.preventDefault();
    });
  }
  function addCss()
  {
	  $(document).ready(function () {
		    $('tr').click(function () {
		         var selected = $(this).hasClass("highlight0");
		         $("tr").removeClass("highlight0");
		         if(!selected)
		             $(this).addClass("highlight0");
		    });
		});
  }
  function updateCategoryManager(data)
  {
	  
	  $(document).find('div#devCategoryTable table').replaceWith($(data).find('div#devCategoryTable').html());
	  $(document).find('div#subCategoryList select').replaceWith("<select class='form-control' id='addCategoryCombo'>"+$(data).find('div#subCategoryList select').html() + "</select>");
	  $('#AddNewCategoryDlgId').find('input:text').val('');
	  $('#EditCategoryDlgId').find('input:text').val('');
	  $("#subAccountOfCheckBox").prop("checked", false);
	  $("#subAccountOfCheckForUpdate").prop("checked", false);
	  $("#addCategoryCombo").prop('disabled', true);
	  $("#SubAccountOfCategoryForUpdate").prop('disabled', true);
      $("#categoryTypeForAdd").val($("#categoryTypeForAdd option:first").val());
      $("#CategoryTypeForUpdate").val($("#categoryTypeForAdd option:first").val());
      $("#budgetCategoryId").val($("#budgetCategoryId option:first").val());
      $("#BudgetCategoryForUpdate").val($("#budgetCategoryId option:first").val());
	  addCss();
  }
  function GeneralcategoryManageWithoutUpdate()
  {
	  $('#GeneralAddNewCategoryDlgId').find('input:text').val('');
	  $('#GeneralEditCategoryDlgId').find('input:text').val('');
	  $("#GeneralsubAccountOfCheckBox").prop("checked",false);
	  $("#GeneraladdCategoryCombo").prop('disabled',true);
      $("#GeneralcategoryTypeForAdd").val($("#categoryTypeForAdd option:first").val());
      $("#GeneralbudgetCategoryId").val($("#budgetCategoryId option:first").val());
      addCss();
  }
  function categoryManageWithoutUpdate()
   {
    $('#AddNewCategoryDlgId').find('input:text').val('');
    $('#EditCategoryDlgId').find('input:text').val('');
    $("#subAccountOfCheckBox").prop("checked",false);
    $("#addCategoryCombo").prop('disabled',true);
       $("#categoryTypeForAdd").val($("#categoryTypeForAdd option:first").val());
       $("#budgetCategoryId").val($("#budgetCategoryId option:first").val());
       addCss();
   }


function GeneralcloseAddDialog(){
    $('#AddNewGeneralCategoryDlgId').dialog('close');
}
function NonProfitcloseAddDialog(){
    $('#AddNewNonProfitCategoryDlgId').dialog('close');
}
function GeneralcloseEditDialog(){
    $('#EditGeneralCategoryDlgId').dialog('close');
}
function NonProfitcloseEditDialog(){
    $('#EditNonProfitCategoryDlgId').dialog('close');
}
