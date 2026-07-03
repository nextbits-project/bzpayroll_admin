(function (window, $) {
    "use strict";

    if (!$) {
        return;
    }

    function hasElement(selector) {
        return $(selector).length > 0;
    }

    function dialogButtons(okHandler, cancelHandler) {
        return {
            Ok: function () {
                $(this).dialog("close");
                if (okHandler) {
                    okHandler();
                }
            },
            Cancel: function () {
                $(this).dialog("close");
                if (cancelHandler) {
                    cancelHandler();
                }
            }
        };
    }

    function openConfirmDialog(selector, okHandler, cancelHandler) {
        if (!hasElement(selector)) {
            if (okHandler) {
                okHandler();
            }
            return;
        }

        $(selector).dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: dialogButtons(okHandler, cancelHandler)
        });
    }

    function openInfoDialog(selector) {
        if (!hasElement(selector)) {
            return;
        }

        $(selector).dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    function showErrorDialog() {
        openInfoDialog("#errorOccurred");
    }

    function showEmptyDataDialog() {
        openInfoDialog("#federaltaxemptydata");
    }

    function valueOrEmpty(value) {
        return value == null ? "" : value;
    }

    function syncSelectedTaxYear(year) {
        $("#selectedTaxYear").val(year);
        $("#selectedTaxYearEmplyr").val(year);
    }

    function applyFederalTaxData(data) {
        if (!data) {
            return;
        }

        if (data.autoFIT != null) {
            $("#autoFIT").val(String(data.autoFIT));
        }
        if (data.selectedTaxYear != null) {
            syncSelectedTaxYear(String(data.selectedTaxYear));
        }
        if (data.yearFIT != null) {
            syncSelectedTaxYear(String(data.yearFIT));
        }

        $("#rateFICA").val(valueOrEmpty(data.rateFICA));
        $("#rateSocialTax").val(valueOrEmpty(data.rateSocialTax));
        $("#socialTaxLimit").val(valueOrEmpty(data.socialTaxLimit));
        $("#rateMedicareTax").val(valueOrEmpty(data.rateMedicareTax));
        $("#rateFUTA").val(valueOrEmpty(data.rateFUTA));
        $("#rateFIT").val(valueOrEmpty(data.rateFIT));
    }

    function loadFederalTaxYear(year) {
        if (!year) {
            return;
        }

        $.ajax({
            type: "GET",
            url: "/dashboard/Configuration/FederalTax/companyTaxInfo/loadTaxYear/" + year,
            success: function (response) {
                applyFederalTaxData(response);
            },
            error: function () {
                showErrorDialog();
            }
        });
    }

    function updateEmployerEmployeeRows(activeIndex) {
        if (!hasElement("#trFIT") || !hasElement("#trFUTA")) {
            return;
        }

        if (activeIndex === 1) {
            $("#trFUTA").show();
            $("#trFIT").hide();
            return;
        }

        $("#trFUTA").hide();
        $("#trFIT").show();
    }

    function bindDependentToggle(checkboxSelector, inputSelectors) {
        $(checkboxSelector).on("change", function () {
            var isChecked = $(this).is(":checked");
            inputSelectors.forEach(function (inputSelector, index) {
                $(inputSelector).prop("disabled", !isChecked);
                if (isChecked && index === 0) {
                    $(inputSelector).trigger("focus");
                }
            });
        });
    }

    function renderDeductionRows(items) {
        var tbody = $("#tbl-comtaxoptions-deduction-list > tbody");
        tbody.empty();

        (items || []).forEach(function (item, index) {
            var row = $("<tr>", {
                "class": "row-comp-tax-deduction",
                id: index + "-row-comp-tax-deduction"
            });

            row.on("click", function () {
                window.setCompanyTaxDeduction(
                    this,
                    item.deductionListId,
                    item.deductionListName,
                    item.deductionAmount,
                    item.deductionRate,
                    item.useRate,
                    item.isTaxExempt
                );
            });

            row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(valueOrEmpty(item.deductionListName)));
            row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(valueOrEmpty(item.deductionAmount)));
            row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(valueOrEmpty(item.deductionRate)));
            row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(valueOrEmpty(item.useRate)));
            row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(item.isTaxExempt === 1 ? "Yes" : "No"));

            tbody.append(row);
        });
    }

    function renderCompanyTaxOptionRows(items) {
        var tbody = $("#tbl-comtaxoptions-option-list > tbody");
        tbody.empty();

        (items || []).forEach(function (item, index) {
            var row = $("<tr>", {
                "class": "row-comp-tax-option",
                id: index + "-row-comp-tax-option"
            });

            row.on("click", function () {
                window.setCompanyTaxOption(
                    this,
                    item.startingDate,
                    item.daily,
                    item.weekly,
                    item.monthly,
                    item.annually,
                    item.biweekly,
                    item.quarterly,
                    item.semiAnnually,
                    item.semiMonthly,
                    item.dailyOver,
                    item.weeklyOver,
                    item.dailyOverVal,
                    item.weeklyOverVal,
                    item.wendSt,
                    item.wendStRate,
                    item.wendSn,
                    item.wendSnRate,
                    item.holiday,
                    item.overtimeRate,
                    item.holidayRate,
                    item.dayOfWeek,
                    item.dayOfWeekVal,
                    item.dayOfMonth,
                    item.dayOfMonthVal,
                    item.optionId
                );
            });

            row.append($("<td>", { width: "50%", style: "font-size:12px;" }).text(valueOrEmpty(item.startingDate)));
            row.append($("<td>", { width: "50%", style: "font-size:12px;" }).text(valueOrEmpty(item.createdAt)));

            tbody.append(row);
        });
    }

    function currentDeductionPayload(isEdit) {
        var deductionListId = isEdit ? $("#deductionListId").val() : "";
        var deductionListName = $("#deductionName").val();
        var deductionRate = 0;
        var deductionAmount = 0;

        if ($("#deductRateChck").is(":checked")) {
            deductionRate = $("#deductionRate").val();
        } else if ($("#deductAmountChck").is(":checked")) {
            deductionAmount = $("#deductionAmount").val();
        }

        return {
            isEdit: isEdit,
            deductionListId: deductionListId,
            deductionListName: deductionListName,
            deductionRate: deductionRate,
            deductionAmount: deductionAmount,
            isTaxExempt: $("#taxExemption").is(":checked") ? 1 : 0
        };
    }

    function currentCompanyTaxOptionPayload(isEdit) {
        var optionId = isEdit ? $("#optionId").val() : "";

        return {
            isEdit: isEdit,
            optionId: optionId,
            startingDate: $("#selectStartingDate").val(),
            daily: $("#dailyOrMiscellaneous").is(":checked") ? 1 : 0,
            weekly: $("#weekly").is(":checked") ? 1 : 0,
            monthly: $("#monthly").is(":checked") ? 1 : 0,
            annually: $("#annually").is(":checked") ? 1 : 0,
            biweekly: $("#biWeekly").is(":checked") ? 1 : 0,
            quarterly: $("#quartely").is(":checked") ? 1 : 0,
            semiAnnually: $("#semiAnnually").is(":checked") ? 1 : 0,
            semiMonthly: $("#semiMonthly").is(":checked") ? 1 : 0,
            dailyOver: $("#dailyOverHours").is(":checked") ? 1 : 0,
            weeklyOver: $("#weeklyOverHours").is(":checked") ? 1 : 0,
            dailyOverVal: $("#dailyHours").val(),
            weeklyOverVal: $("#weeklyHours").val(),
            wendSt: $("#weekendSaturday").is(":checked") ? 1 : 0,
            wendStRate: $("#weekendSaturdayRate").val(),
            wendSn: $("#weekendSunday").is(":checked") ? 1 : 0,
            wendSnRate: $("#weekendSundayRate").val(),
            holiday: $("#holiday").is(":checked") ? 1 : 0,
            holidayRate: $("#holidayRate").val(),
            dayOfWeek: $("#daysOfWeek").is(":checked") ? 1 : 0,
            dayOfWeekVal: $("#txtDayOfWeek").val(),
            dayOfMonth: $("#daysOfMonth").is(":checked") ? 1 : 0,
            dayOfMonthVal: $("#txtDayOfMonth").val(),
            overtimeRate: $("#overtimeRate").val()
        };
    }

    window.clearCompanyTaxDeduction = function () {
        $(".row-comp-tax-deduction").removeClass("draft");
        $("#deductionListId").val("");
        $("#deductionName").val("");
        $("#deductionRate").val("").prop("disabled", true);
        $("#deductionAmount").val("").prop("disabled", false);
        $("#deductAmountChck").prop("checked", true);
        $("#deductRateChck").prop("checked", false);
        $("#taxExemption").prop("checked", false);
    };

    window.clearCompanyTaxOption = function () {
        $(".row-comp-tax-option").removeClass("draft");
        $("#optionId").val("");
        $("#selectStartingDate").val("");
        $("#daysOfWeek, #daysOfMonth, #dailyOrMiscellaneous, #weekly, #biWeekly, #semiMonthly, #monthly, #quartely, #semiAnnually, #annually, #weekendSaturday, #weekendSunday, #holiday")
            .prop("checked", false);
        $("#dailyOverHours, #weeklyOverHours").prop("checked", false);
        $("#txtDayOfWeek, #txtDayOfMonth, #dailyHours, #weeklyHours, #weekendSaturdayRate, #weekendSundayRate, #holidayRate")
            .val("")
            .prop("disabled", true);
        $("#overtimeRate").val("");
    };

    window.saveFederalTax = function () {
        openConfirmDialog("#saveFederaTax", function () {
            $.ajax({
                type: "POST",
                url: "/dashboard/Configuration/FederalTax/companyTaxInfo",
                data: {
                    federalTaxID: $("#federalTaxID").val(),
                    fiscalMonth: $("#fiscalMonth").val(),
                    autoFIT: parseInt($("#autoFIT").val(), 10) || 0,
                    yearFIT: $("#selectedTaxYear").val(),
                    rateFICA: $("#rateFICA").val(),
                    rateSocialTax: $("#rateSocialTax").val(),
                    socialTaxLimit: $("#socialTaxLimit").val(),
                    rateMedicareTax: $("#rateMedicareTax").val(),
                    rateFUTA: $("#rateFUTA").val(),
                    rateFIT: $("#rateFIT").val()
                },
                success: function (response) {
                    if (response && response.success) {
                        alert(response.message || "Federal tax configuration saved successfully.");
                        return;
                    }

                    alert((response && response.message) || "Unable to save federal tax configuration.");
                },
                error: function () {
                    showErrorDialog();
                }
            });
        });
    };

    window.deleteCompanyTaxDeduction = function () {
        var deductionListId = $("#deductionListId").val();
        if (!deductionListId) {
            showEmptyDataDialog();
            return;
        }

        openConfirmDialog("#deleteFederalTaxCompanyDeduction", function () {
            $.ajax({
                type: "POST",
                url: "/dashboard/Configuration/FederalTax/companyTaxOption/deduction/delete",
                data: { deductionListId: deductionListId },
                success: function (response) {
                    window.clearCompanyTaxDeduction();
                    renderDeductionRows(response);
                },
                error: function () {
                    showErrorDialog();
                }
            });
        });
    };

    window.deleteCompanyTaxOption = function () {
        var optionId = $("#optionId").val();
        if (!optionId) {
            showEmptyDataDialog();
            return;
        }

        openConfirmDialog("#deleteFederalTaxCompanyOption", function () {
            $.ajax({
                type: "POST",
                url: "/dashboard/Configuration/FederalTax/companyTaxOption/option/delete",
                data: { optionId: optionId },
                success: function (response) {
                    window.clearCompanyTaxOption();
                    renderCompanyTaxOptionRows(response);
                },
                error: function () {
                    showErrorDialog();
                }
            });
        });
    };

    window.saveCompanyTaxDeduction = function (isEdit) {
        var payload = currentDeductionPayload(isEdit);

        if ((payload.isEdit && !payload.deductionListId)
                || (!payload.isEdit && payload.deductionListId)
                || !payload.deductionListName) {
            showEmptyDataDialog();
            return;
        }

        openConfirmDialog("#saveFederalTaxCompanyDeduction", function () {
            $.ajax({
                type: "POST",
                url: "/dashboard/Configuration/FederalTax/companyTaxOption/deduction",
                data: {
                    deductionListId: payload.deductionListId || "0",
                    deductionListName: payload.deductionListName,
                    deductionRate: payload.deductionRate,
                    deductionAmount: payload.deductionAmount,
                    isTaxExempt: payload.isTaxExempt
                },
                success: function (response) {
                    window.clearCompanyTaxDeduction();
                    renderDeductionRows(response);
                },
                error: function () {
                    showErrorDialog();
                }
            });
        });
    };

    window.saveCompanyTaxOption = function (isEdit) {
        var payload = currentCompanyTaxOptionPayload(isEdit);

        if ((payload.isEdit && !payload.optionId) || (!payload.isEdit && payload.optionId)) {
            showEmptyDataDialog();
            return;
        }

        openConfirmDialog("#saveFederalTaxCompanyOption", function () {
            $.ajax({
                type: "POST",
                url: "/dashboard/Configuration/FederalTax/companyTaxOption/option",
                data: $.extend({}, payload, {
                    optionId: payload.optionId || "0"
                }),
                success: function (response) {
                    window.clearCompanyTaxOption();
                    renderCompanyTaxOptionRows(response);
                },
                error: function () {
                    showErrorDialog();
                }
            });
        });
    };

    window.setCompanyTaxDeduction = function (row, deductionListId, deductionListName, deductionAmount, deductionRate, useRate, isTaxExempt) {
        $(".row-comp-tax-deduction").removeClass("draft");
        $(row).addClass("draft");

        $("#deductionListId").val(valueOrEmpty(deductionListId));
        $("#deductionName").val(valueOrEmpty(deductionListName));
        $("#deductionRate").val("").prop("disabled", true);
        $("#deductionAmount").val("").prop("disabled", true);

        if (Number(deductionRate) > 0) {
            $("#deductRateChck").prop("checked", true);
            $("#deductAmountChck").prop("checked", false);
            $("#deductionRate").val(deductionRate).prop("disabled", false);
        } else {
            $("#deductRateChck").prop("checked", false);
            $("#deductAmountChck").prop("checked", true);
            $("#deductionAmount").val(valueOrEmpty(deductionAmount)).prop("disabled", false);
        }

        $("#taxExemption").prop("checked", Number(isTaxExempt) === 1);
    };

    window.setCompanyTaxOption = function (row, startingDate, daily, weekly, monthly, annually, biweekly, quarterly, semiAnnually, semiMonthly, dailyOver, weeklyOver, dailyOverVal, weeklyOverVal, wendSt, wendStRate, wendSn, wendSnRate, holiday, overtimeRate, holidayRate, dayOfWeek, dayOfWeekVal, dayOfMonth, dayOfMonthVal, optionId) {
        window.clearCompanyTaxOption();
        $(".row-comp-tax-option").removeClass("draft");
        $(row).addClass("draft");

        $("#optionId").val(valueOrEmpty(optionId));
        $("#selectStartingDate").val(valueOrEmpty(startingDate));

        $("#daysOfWeek").prop("checked", Number(dayOfWeek) === 1).trigger("change");
        $("#txtDayOfWeek").val(valueOrEmpty(dayOfWeekVal));

        $("#daysOfMonth").prop("checked", Number(dayOfMonth) === 1).trigger("change");
        $("#txtDayOfMonth").val(valueOrEmpty(dayOfMonthVal));

        $("#dailyOrMiscellaneous").prop("checked", Number(daily) === 1);
        $("#weekly").prop("checked", Number(weekly) === 1);
        $("#biWeekly").prop("checked", Number(biweekly) === 1);
        $("#semiMonthly").prop("checked", Number(semiMonthly) === 1);
        $("#monthly").prop("checked", Number(monthly) === 1);
        $("#quartely").prop("checked", Number(quarterly) === 1);
        $("#semiAnnually").prop("checked", Number(semiAnnually) === 1);
        $("#annually").prop("checked", Number(annually) === 1);

        $("#dailyOverHours").prop("checked", Number(dailyOver) === 1).trigger("change");
        $("#dailyHours").val(valueOrEmpty(dailyOverVal));

        $("#weeklyOverHours").prop("checked", Number(weeklyOver) === 1).trigger("change");
        $("#weeklyHours").val(valueOrEmpty(weeklyOverVal));

        $("#weekendSaturday").prop("checked", Number(wendSt) === 1).trigger("change");
        $("#weekendSaturdayRate").val(valueOrEmpty(wendStRate));

        $("#weekendSunday").prop("checked", Number(wendSn) === 1).trigger("change");
        $("#weekendSundayRate").val(valueOrEmpty(wendSnRate));

        $("#holiday").prop("checked", Number(holiday) === 1).trigger("change");
        $("#holidayRate").val(valueOrEmpty(holidayRate));

        $("#overtimeRate").val(valueOrEmpty(overtimeRate));
    };

    $(function () {
        if (!hasElement("#tabsFederalTax")) {
            return;
        }

        $("#tabsFederalTax").tabs();
        $("#tabsCompanyTaxOption").tabs();
        $("#tabsEmployeeFederalTax").tabs({
            activate: function (_event, ui) {
                updateEmployerEmployeeRows(ui.newTab.index());
            }
        });
        updateEmployerEmployeeRows($("#tabsEmployeeFederalTax").tabs("option", "active"));

        bindDependentToggle("#weekendSaturday", ["#weekendSaturdayRate"]);
        bindDependentToggle("#weekendSunday", ["#weekendSundayRate"]);
        bindDependentToggle("#holiday", ["#holidayRate"]);
        bindDependentToggle("#daysOfWeek", ["#txtDayOfWeek"]);
        bindDependentToggle("#daysOfMonth", ["#txtDayOfMonth"]);
        bindDependentToggle("#deductRateChck", ["#deductionRate"]);
        $("#deductRateChck").on("change", function () {
            if ($(this).is(":checked")) {
                $("#deductionAmount").prop("disabled", true);
            }
        });
        bindDependentToggle("#deductAmountChck", ["#deductionAmount"]);
        $("#deductAmountChck").on("change", function () {
            if ($(this).is(":checked")) {
                $("#deductionRate").prop("disabled", true);
            }
        });
        bindDependentToggle("#dailyOverHours", ["#dailyHours"]);
        $("#dailyOverHours").on("change", function () {
            if ($(this).is(":checked")) {
                $("#weeklyHours").prop("disabled", true);
            }
        });
        bindDependentToggle("#weeklyOverHours", ["#weeklyHours"]);
        $("#weeklyOverHours").on("change", function () {
            if ($(this).is(":checked")) {
                $("#dailyHours").prop("disabled", true);
            }
        });

        $("#selectedTaxYear, #selectedTaxYearEmplyr").on("change", function () {
            var selectedYear = $(this).val();
            syncSelectedTaxYear(selectedYear);
            loadFederalTaxYear(selectedYear);
        });
    });
}(window, window.jQuery));
