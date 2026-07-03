(function (window, $) {
    "use strict";

    if (!$) {
        return;
    }

    function hasElement(selector) {
        return $(selector).length > 0;
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
            buttons: {
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

    function getSelectedStateId() {
        return $("#stateList").find(":selected").val();
    }

    function toggleOtherStateInputs(index, enabled) {
        $("#otherStateInput_" + index).prop("disabled", !enabled);
        $("#otherStateTaxRate_" + index).prop("disabled", !enabled);
        $("#otherStateUpto_" + index).prop("disabled", !enabled);
    }

    function clearOtherStateEntry(index) {
        $("#otherStateChck_" + index).prop("checked", false);
        $("#otherStateInput_" + index).val("");
        $("#otherStateTaxRate_" + index).val("");
        $("#otherStateUpto_" + index).val("");
        toggleOtherStateInputs(index, false);
    }

    function updateStateActionButtons(stateDto) {
        $("#sitStateActive").hide();
        $("#sitStateInActive").hide();
        $("#setAsDefault").hide();

        if (!stateDto) {
            return;
        }

        if (stateDto.active == null && stateDto.asDefault == null) {
            return;
        }

        if (stateDto.active) {
            $("#sitStateInActive").show();
        } else {
            $("#sitStateActive").show();
        }

        if (!stateDto.asDefault) {
            $("#setAsDefault").show();
        }
    }

    function clearStateTaxForm() {
        $("#stateTaxId").val("");
        $("#pitRate").val("");
        $("#sdiRate").val("");
        $("#upToSdi").val("");
        $("#uiRate").val("");
        $("#upToui").val("");
        $("#ettRate").val("");
        $("#upToEtt").val("");

        clearOtherStateEntry(1);
        clearOtherStateEntry(2);
        clearOtherStateEntry(3);

        updateStateActionButtons(null);
    }

    function applyStateTaxForm(stateDto) {
        clearStateTaxForm();
        if (!stateDto) {
            return;
        }

        $("#stateTaxId").val(valueOrEmpty(stateDto.stateTaxId));
        $("#pitRate").val(valueOrEmpty(stateDto.pitRate));
        $("#sdiRate").val(valueOrEmpty(stateDto.sdiRate));
        $("#upToSdi").val(valueOrEmpty(stateDto.upToSdi));
        $("#uiRate").val(valueOrEmpty(stateDto.uiRate));
        $("#upToui").val(valueOrEmpty(stateDto.upToui));
        $("#ettRate").val(valueOrEmpty(stateDto.ettRate));
        $("#upToEtt").val(valueOrEmpty(stateDto.upToEtt));

        [1, 2, 3].forEach(function (index) {
            var isChecked = Number(stateDto["otherStateChck" + index]) === 1;
            $("#otherStateChck_" + index).prop("checked", isChecked);
            toggleOtherStateInputs(index, isChecked);
            $("#otherStateInput_" + index).val(valueOrEmpty(stateDto["otherStateInput" + index]));
            $("#otherStateTaxRate_" + index).val(valueOrEmpty(stateDto["otherStateTaxRate" + index]));
            $("#otherStateUpto_" + index).val(valueOrEmpty(stateDto["otherStateUpto" + index]));
        });

        updateStateActionButtons(stateDto);
    }

    function loadStateTax(stateId) {
        if (!stateId) {
            clearStateTaxForm();
            return;
        }

        $.ajax({
            type: "GET",
            url: "/dashboard/Configuration/StateTax/" + stateId,
            success: function (response) {
                applyStateTaxForm(response);
            },
            error: function () {
                showErrorDialog();
            }
        });
    }

    function configuredStateNames() {
        return $("#stateList option").map(function () {
            return ($(this).text() || "").split(" (")[0];
        }).get();
    }

    window.clearSIDOthers = function () {
        clearStateTaxForm();
    };

    window.saveSID = function () {
        var stateId = getSelectedStateId();
        if (!stateId) {
            showEmptyDataDialog();
            return;
        }

        openConfirmDialog("#saveFederalTaxCompanyOption", function () {
            $.ajax({
                type: "POST",
                url: "/dashboard/Configuration/StateTax",
                data: {
                    stateId: stateId,
                    stateTaxId: $("#stateTaxId").val(),
                    pitRate: $("#pitRate").val(),
                    sdiRate: $("#sdiRate").val(),
                    upToSdi: $("#upToSdi").val(),
                    uiRate: $("#uiRate").val(),
                    upToui: $("#upToui").val(),
                    ettRate: $("#ettRate").val(),
                    upToEtt: $("#upToEtt").val(),
                    otherStateChck1: $("#otherStateChck_1").is(":checked") ? 1 : 0,
                    otherStateInput1: $("#otherStateInput_1").val(),
                    otherStateTaxRate1: $("#otherStateTaxRate_1").val(),
                    otherStateUpto1: $("#otherStateUpto_1").val(),
                    otherStateChck2: $("#otherStateChck_2").is(":checked") ? 1 : 0,
                    otherStateInput2: $("#otherStateInput_2").val(),
                    otherStateTaxRate2: $("#otherStateTaxRate_2").val(),
                    otherStateUpto2: $("#otherStateUpto_2").val(),
                    otherStateChck3: $("#otherStateChck_3").is(":checked") ? 1 : 0,
                    otherStateInput3: $("#otherStateInput_3").val(),
                    otherStateTaxRate3: $("#otherStateTaxRate_3").val(),
                    otherStateUpto3: $("#otherStateUpto_3").val()
                },
                success: function (response) {
                    if (response && response.success) {
                        applyStateTaxForm(response.data);
                        alert(response.message || "State tax configuration saved successfully.");
                        return;
                    }

                    alert((response && response.message) || "Unable to save state tax configuration.");
                },
                error: function () {
                    showErrorDialog();
                }
            });
        });
    };

    window.setSITAsDefault = function () {
        var stateId = getSelectedStateId();
        if (!stateId) {
            showEmptyDataDialog();
            return;
        }

        $("#setAsDefault").hide();
        openConfirmDialog("#saveSITsetAsDefault", function () {
            $.ajax({
                type: "POST",
                url: "/dashboard/Configuration/StateTax/setAsDefault",
                data: { stateId: stateId },
                success: function (response) {
                    applyStateTaxForm(response);
                },
                error: function () {
                    showErrorDialog();
                    updateStateActionButtons({ active: false, asDefault: false });
                }
            });
        }, function () {
            $("#setAsDefault").show();
        });
    };

    window.setSITStateActive = function (active) {
        var stateId = getSelectedStateId();
        if (!stateId) {
            showEmptyDataDialog();
            return;
        }

        var dialogSelector = active ? "#saveSITStateStatusActive" : "#saveSITStateStatusInActive";

        openConfirmDialog(dialogSelector, function () {
            $.ajax({
                type: "POST",
                url: "/dashboard/Configuration/StateTax/setActive",
                data: {
                    active: active,
                    stateId: stateId
                },
                success: function (response) {
                    applyStateTaxForm(response);
                },
                error: function () {
                    showErrorDialog();
                }
            });
        });
    };

    window.openAddStateModal = function () {
        $.ajax({
            type: "GET",
            url: "/dashboard/Configuration/States",
            success: function (response) {
                var configuredNames = configuredStateNames();
                var options = ["<option value=''>Select State</option>"];

                (response || []).forEach(function (state) {
                    if (configuredNames.indexOf(state.name) !== -1) {
                        return;
                    }

                    options.push("<option value='" + state.id + "'>" + state.name + "</option>");
                });

                $("#allStatesDropdown").html(options.join(""));
                $("#addStateModal").dialog({
                    resizable: false,
                    height: 220,
                    width: 350,
                    modal: true,
                    buttons: {
                        Save: function () {
                            var stateId = $("#allStatesDropdown").val();
                            if (!stateId) {
                                alert("Please select a state.");
                                return;
                            }

                            var dialog = this;
                            $.ajax({
                                type: "POST",
                                url: "/dashboard/Configuration/StateTax/add",
                                data: { stateId: stateId },
                                success: function (saveResponse) {
                                    if (saveResponse && saveResponse.success) {
                                        $(dialog).dialog("close");
                                        window.location.reload();
                                        return;
                                    }

                                    alert((saveResponse && saveResponse.message) || "Unable to add state.");
                                },
                                error: function () {
                                    showErrorDialog();
                                }
                            });
                        },
                        Cancel: function () {
                            $(this).dialog("close");
                        }
                    }
                });
            },
            error: function () {
                showErrorDialog();
            }
        });
    };

    window.deleteSelectedState = function () {
        var stateId = getSelectedStateId();
        if (!stateId) {
            alert("Please select a state to delete.");
            return;
        }

        if (!window.confirm("Are you sure you want to delete this state from the list?")) {
            return;
        }

        $.ajax({
            type: "POST",
            url: "/dashboard/Configuration/StateTax/delete",
            data: { stateId: stateId },
            success: function (response) {
                if (response && response.success) {
                    window.location.reload();
                    return;
                }

                alert((response && response.message) || "Unable to delete state.");
            },
            error: function () {
                showErrorDialog();
            }
        });
    };

    $(function () {
        if (!hasElement("#stateList")) {
            return;
        }

        if (hasElement("#tabsEmployeeStateTax")) {
            $("#tabsEmployeeStateTax").tabs();
        }

        [1, 2, 3].forEach(function (index) {
            toggleOtherStateInputs(index, $("#otherStateChck_" + index).is(":checked"));
            $("#otherStateChck_" + index).on("change", function () {
                toggleOtherStateInputs(index, $(this).is(":checked"));
            });
        });

        $("#stateList").on("change", function () {
            loadStateTax($(this).val());
        });

        if ($("#stateList option").length > 0 && !getSelectedStateId()) {
            $("#stateList option:first").prop("selected", true);
        }

        loadStateTax(getSelectedStateId());
    });
}(window, window.jQuery));
