<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html
    PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="${pageContext.request.contextPath}/styles/form.css" media="screen" rel="Stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/tableStyle/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/papaparse@5.4.1/papaparse.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/xlsx/dist/xlsx.full.min.js"></script>

    <title>
        <spring:message code="BzComposer.importemployeetitle" />
    </title>
    <%@include file="/include/header.jsp" %>
    <script>
        function downloadTemplate(type) {
            document.forms[0].action = "/employees/download-employee-template?type=" + type;
            document.forms[0].submit();
        }

        function CloseMe() {
            window.close();
        }
        function pleaseWait() {
            document.getElementById("pleaseWait").style.display = "block";
        }
    </script>
    <style>
        .import-method-wrapper {
			padding: 10px 40px;
		}
		.import-option {
			margin-right: 25px;
			font-weight: 600;
			cursor: pointer;
		}
    </style>
	 <style>
      body { font-family: Arial, sans-serif; }

      .mapping-container { position: relative; }
      .header-row {
        display: flex; gap: 150px; align-items: center; margin-bottom: 6px;
      }
      .header-cell {
        flex: 1; text-align: center; font-weight: 600; color: #333;
        background: #f1f1f1; border: 1px solid #d5d5d5; border-radius: 4px; padding: 6px 0;
      }

      #sharedScrollContainer {
        position: relative;
        display: flex;
        gap: 150px;
        align-items: flex-start;
        max-height: 320px;
        overflow-y: auto;
        border: 1px solid #ddd;
        background: #fafafa;
        border-radius: 4px;
        padding: 10px;
      }

      .column-box {
        flex: 1;
        background: #fff;
        border-radius: 4px;
        padding: 6px 10px;
      }
      .column-left  { border-right: 1px solid #c9c9c9; }

      .field-item {
        display: flex; align-items: center; gap: 8px;
        margin: 3px 0;
        border: 1px solid #bfc4c9;
        background: #f3f5f7;
        border-radius: 3px;
        padding: 4px 6px;
        cursor: pointer;
        min-height: 26px;
        box-shadow: inset 0 1px 0 #fff, inset 0 -1px 0 #e6e8ea;
      }
      .field-item:hover { background: #e7eefc; }

      .src .label { flex: 1; text-align: right;  color:#222; font-weight:600; }
      .tgt .label { flex: 1; text-align: left;   color:#222; font-weight:600; }

      .arrow-box {
        display:inline-flex; align-items:center; justify-content:center;
        width: 18px; height: 18px;
      }
      .arrow-svg { width: 12px; height: 12px; }

      #mappingCanvas {
        position: absolute; left: 0; top: 0;
        pointer-events: none; z-index: 10;
      }
	  .spinner {
		width: 46px;
		height: 46px;
		border: 5px solid #ddd;
		border-top: 5px solid #28a745 !important;
		margin-left: 22px;
		border-radius: 50%;
		animation: spin 0.9s linear infinite;
	}

	@keyframes spin {
		0% { transform: rotate(0deg); }
		100% { transform: rotate(360deg); }
	}

    </style>
</head>

<body>
	<div id="globalSuccessMessage"
     style="display:none;
            margin:15px 40px;
            padding:10px 15px;
            border:1px solid #28a745;
            background:#eafaf0;
            color:#155724;
            font-weight:600;">
</div>

    <div style="margin: 20px 10px 0px 40px;">
        <span style="font-size: 1.2em; font-weight: normal; color: #05A9C5 !important;">
            <spring:message code="BzComposer.importEmployee" />
        </span>
    </div>
    <!-- Import Method Selection -->
    <div class="import-method-wrapper">
        <label class="import-option">
            <input type="radio" name="importMethod" value="easy" checked>
            Easy Import
        </label>

        <label class="import-option">
            <input type="radio" name="importMethod" value="advanced">
            Advanced Import
        </label>
    </div>
    <div id="easy-import">
        <div style="margin: 20px 10px 0px 40px;">
            <table>
                <tr>
                    <th style="background-color: #dddddd;text-align: center;padding: 0px 7px;border-radius: 4px;">STEP 1<br>Download
                        Excel/CSV File</th>
                    <th>&thinsp;&thinsp;</th>
                    <th style="background-color: #dddddd;text-align: center;padding: 0px 7px;border-radius: 4px;">STEP 2<br>Fill Excel/CSV
                        File data according to instruction</th>
                    <th>&thinsp;&thinsp;</th>
                    <th style="background-color: #dddddd;text-align: center;padding: 0px 7px;border-radius: 4px;">STEP 3<br>Validate data
                        and complete import</th>
                </tr>
            </table>
        </div>
        <div style="margin: 20px 10px 0px 40px;">
            <b>Instructions:</b>
            <ol>
                <li>Download the format file (Download XLS Template/Download CSV Template and fill) it
                    with proper data.</li>
                <li>You can see the first record to understand how the data must be filled.</li>
                <li>Then please removed/edit 1st record according to your input.</li>
                <li>Once you downloaded and filled the template file upload it in the form below and
                    submit.</li>
                <li>After uploading Employees you need to edit them and change the various fields(if you
                    want?).</li>
                <li>If any Employees data not imported then it means your Phone number and Email matched
                    with existing data.</li>
            </ol>
        </div>
        <div>
            <form:form action="UploadEmployeeFile" method="post"
                enctype="MULTIPART/FORM-DATA" id="uploadForm" modelAttribute="companyInfoDto">
                <div style="margin: 20px 10px 0px 40px;">
                    <table style="width:100%;">
                        <tr>
                            <td colspan="3" align="right" style="padding-right:50px;">
                                <input type="button" class="formbutton"
                                    value="<spring:message code='BzComposer.global.downloadxlstemplate'/>"
                                    onclick="downloadTemplate('xls')" />
                                <input type="button" class="formbutton"
                                    value="<spring:message code='BzComposer.global.downloadcsvtemplate'/>"
                                    onclick="downloadTemplate('csv')" />
                                <input type="button" class="formbutton" onclick="CloseMe();"
                                    value="<spring:message code='BzComposer.global.close'/>" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:33%;">
                                <spring:message code="BzComposer.itemimport.csvorexcelfile" />
                            </td>
                            <td style="width:33%;"><input type="file" name="attachFile" /></td>
                            <td style="width:33%;">
                                <input type="submit" class="formbutton" onclick="pleaseWait();"
                                    value="<spring:message code='BzComposer.global.upload'/>" />
                            </td>
                        </tr>
                        
                        
                    </table>
                </div>
                <div>
                    <span style="color: green;display:none;" id="pleaseWait">
                        <spring:message code="BzComposer.configuration.pleaseWait" />
                    </span>
                    <c:if test="${not empty successMessage}">
                        <span style="color: green">
                            <spring:message code="BzComposer.FileUpload" />
                        </span>
                        <% session.removeAttribute("successMessage"); %>
                    </c:if>
                </div>
            </form:form>
        </div>
    </div>
    <div id="advanced-import" style="display: none;">
        <div style="margin: 22px 10px 0px 40px;">
            <table>
                <tr>
                    <th style="background-color: #dddddd;text-align: center;padding: 0px 7px;border-radius: 4px;">STEP 1<br>Download
                        Excel/CSV/SQL/TXT File</th>
                    <th>&thinsp;&thinsp;</th>
                    <th style="background-color: #dddddd;text-align: center;padding: 0px 7px;border-radius: 4px;">STEP 2<br>Fill Excel/CSV/SQL/TXT
                        File data according to instruction</th>
                    <th>&thinsp;&thinsp;</th>
                    <th style="background-color: #dddddd;text-align: center;padding: 0px 7px;border-radius: 4px;">STEP 3<br>Validate data
                        and complete import</th>
                </tr>
            </table>
        </div>
        <div style="margin: 20px 10px 0px 40px;">
            <b>Instructions (Advanced Import):</b>
            <ol>
                <li>Download the format file (XLS, CSV, SQL, or TXT template) and fill it with proper data.</li>
				<li>Review the first record to understand how the data should be entered.</li>
				<li>Please remove or edit the first record according to your input.</li>
				<li>Upload the Excel, CSV, SQL, or TXT file using the form below.</li>
				<li>Map the file fields to the corresponding database fields and review the data in the preview section.</li>
				<li>After importing employees, you may edit them and update the required fields if needed.</li>
				<li>If any employee data is not imported, it means the Phone Number or Email already exists in the system.</li>
            </ol>
        </div>
        <div>
            <div style="margin: 20px 10px 0px 40px;">
                <table style="width:100%;">
                    <tr>
                        <td colspan="3" align="right" style="padding-right:50px;">
                            <input type="button" class="formbutton"
                                value="<spring:message code='BzComposer.global.downloadxlstemplate'/>"
                                onclick="downloadTemplate('xls')" />
								<input type="button" class="formbutton"
                                value="<spring:message code='BzComposer.global.downloadcsvtemplate'/>"
                                onclick="downloadTemplate('csv')" />
							<input type="button" class="formbutton"
                                value="<spring:message code='BzComposer.global.downloadsqltemplate'/>"
                                onclick="downloadTemplate('sql')" />
							<input type="button" class="formbutton"
                                value="<spring:message code='BzComposer.global.downloadtxttemplate'/>"
                                onclick="downloadTemplate('txt')" />
                            
                            <input type="button" class="formbutton" onclick="CloseMe();"
                                value="<spring:message code='BzComposer.global.close'/>" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div>
            <div style="margin: 20px 10px 0px 40px;">
                <table style="width:100%;">
                    <tr>
                        <td style="width:33%;">
                            <spring:message code="BzComposer.itemimport.allfile" />
                        </td>
                        <td style="width:33%;"><input type="file" name="attachFile" id="importFile"/></td>
                        <td style="width:33%;">

                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="text-align: center;">
            <span style="color: green;display:none;" id="adPleaseWait">
                <spring:message code="BzComposer.configuration.pleaseWait" />
            </span>
            <c:if test="${not empty successMessage}">
                <span style="color: green">
                    <spring:message code="BzComposer.FileUpload" />
                </span>
                <% session.removeAttribute("successMessage"); %>
            </c:if>
        </div>

		<div id="fieldMappingSection2" style="display:none;margin:20px 10px 0 40px;border:1px solid #ddd;padding:15px;background:#f9f9f9;" class="mapping-container">
			<h3 style="color:#05a9c5;margin:0 0 8px 0;">Field Mapping</h3>
			<p style="margin:0 0 10px 0;">Map the columns from your file to database fields:</p>

			<div class="header-row">
				<div class="header-cell">Source Fields</div>
				<div class="header-cell">Target Fields (Database Column Names)</div>
			</div>

			<div id="sharedScrollContainer">
				<div class="column-box column-left">
				<div id="sourceFields"></div>
				</div>
				<div class="column-box column-right">
				<div id="targetFields"></div>
				</div>
				<canvas id="mappingCanvas"></canvas>
			</div>

			<div style="margin-top:15px;text-align:center;">
				<button type="button" class="formbutton" onclick="showClearAllDialog()">Clear All</button>
				<button type="button" class="formbutton" onclick="directMapFields()">Direct Map</button>
				<button type="button" class="formbutton" onclick="autoMapFields()">Auto Map</button>
				<button type="button" class="formbutton" style="background:#28a745;color:#fff;" onclick="proceedWithImport()">Proceed Import</button>
			</div>

			<span id="pleaseWait" style="color:green;display:none"><spring:message code="BzComposer.configuration.pleaseWait"/></span>
		</div>

    </div>

<script>
var sourceDisplayNames = {};

/* ================= IMPORT METHOD TOGGLE ================= */
document.querySelectorAll('input[name="importMethod"]').forEach(radio => {
    radio.addEventListener('change', function () {
        document.getElementById('advanced-import').style.display =
            this.value === 'advanced' ? 'block' : 'none';
        document.getElementById('easy-import').style.display =
            this.value === 'easy' ? 'block' : 'none';
    });
});

/* ================= CONFIG ================= */
const requiredHeaders = ["Email"];

let allPreviewRows = [];
let currentPage = 1;
const MAPPING_SECTION_ID = "fieldMappingSection2";
let uploadedCSVFile = null;
let type = "";

/* ================= FILE CHANGE ================= */
document.getElementById('importFile').addEventListener('change', function () {
    if (!this.files.length) return;

    if (document.querySelector('input[name="importMethod"]:checked').value !== 'advanced') {
        return;
    }

    const file = this.files[0];
    const fileName = file.name.toLowerCase();

    if (fileName.endsWith(".csv")) {
        readCSVFile(file);
    } else if (fileName.endsWith(".xls") || fileName.endsWith(".xlsx")) {
        readExcelFile(file);
    } else if (fileName.endsWith(".txt")) {
        readTXTFile(file);
    } else if (fileName.endsWith(".sql")) {
        readSQLFile(file);
    } else {
        alert("Unsupported file type. Please upload CSV, XLS, XLSX, TXT, or SQL.");
        this.value = "";
    }
});
/* ================= Txt READ ================= */
function readTXTFile(file) {
    type = "TXT";
    const reader = new FileReader();

    reader.onload = function (e) {
        const text = e.target.result;
        const lines = text.split(/\r?\n/).filter(l => l.trim() !== "");

        if (lines.length < 2) {
            alert("TXT file does not contain enough data.");
            return;
        }

        // 1️⃣ Read headers (TAB separated)
        let headers = lines[0].split("\t").map(h => h.trim());

        // 2️⃣ HARD FILTER headers
        headers = headers.filter(h =>
            typeof h === "string" &&
            /^[a-zA-Z0-9_]+$/.test(h) &&
            h.length <= 40
        );

        // 3️⃣ Read rows
        const rows = [];
        for (let i = 1; i < lines.length; i++) {
            const values = lines[i].split("\t");
            const row = {};

            headers.forEach((h, idx) => {
                row[h] = values[idx] ? values[idx].trim() : "";
            });

            rows.push(row);
        }

        if (!rows.length) {
            alert("No valid data rows found in TXT file.");
            return;
        }

        // 4️⃣ Set preview data
        allPreviewRows = rows;
        currentPage = 1;

        // 5️⃣ Validate required headers
        if (!validateRequiredHeaders(headers)) return;

        // 6️⃣ Show mapping + preview
        showMappingWithColumns(headers);

    };
    reader.readAsText(file);
}
/* ================= SQL file READ ================= */
function readSQLFile(file) {
    type = "SQL";
    const reader = new FileReader();

    reader.onload = function (e) {
        const sql = e.target.result;

        /* ========= 1. Extract column names ========= */
        const colMatch = sql.match(/\(([^)]+)\)\s*VALUES/i);
        if (!colMatch) {
            alert("Invalid SQL format. Columns not found.");
            return;
        }

        const headers = colMatch[1]
            .split(",")
            .map(h => h.replace(/[`"' ]/g, "").trim())
            .filter(h => /^[a-zA-Z0-9_]+$/.test(h));

        /* ========= 2. Extract VALUES block ========= */
        const valuesIndex = sql.toUpperCase().indexOf("VALUES");
        if (valuesIndex === -1) {
            alert("VALUES keyword not found.");
            return;
        }

        const valuesText = sql.substring(valuesIndex + 6);

        /* ========= 3. Extract rows SAFELY ========= */
        const rows = [];
        let current = "";
        let depth = 0;
        let inQuotes = false;

        for (let i = 0; i < valuesText.length; i++) {
            const ch = valuesText[i];

            if (ch === "'" && valuesText[i - 1] !== "\\") {
                inQuotes = !inQuotes;
            }

            if (ch === "(" && !inQuotes) {
                depth++;
                if (depth === 1) {
                    current = "";
                    continue;
                }
            }

            if (ch === ")" && !inQuotes) {
                depth--;
                if (depth === 0) {
                    rows.push(parseSqlRow(current, headers));
                    continue;
                }
            }

            if (depth >= 1) {
                current += ch;
            }
        }

        if (!rows.length) {
            alert("No SQL data rows found.");
            return;
        }

        /* ========= 4. Set preview ========= */
        allPreviewRows = rows;
        currentPage = 1;

        if (!validateRequiredHeaders(headers)) return;

        showMappingWithColumns(headers);
    };

    reader.readAsText(file);
}

function parseSqlRow(rowText, headers) {
    const values = [];
    let current = "";
    let inQuotes = false;

    for (let i = 0; i < rowText.length; i++) {
        const ch = rowText[i];

        if (ch === "'" && rowText[i - 1] !== "\\") {
            inQuotes = !inQuotes;
            continue;
        }

        if (ch === "," && !inQuotes) {
            values.push(current.trim());
            current = "";
            continue;
        }

        current += ch;
    }

    values.push(current.trim());

    const row = {};
    headers.forEach((h, i) => {
        row[h] = (values[i] || "").replace(/^'+|'+$/g, "");
    });

    return row;
}

/* ================= Excel READ ================= */
function readExcelFile(file) {
    type = "EXCEL";
    const reader = new FileReader();

    reader.onload = function (e) {
        const data = new Uint8Array(e.target.result);
        const workbook = XLSX.read(data, { type: "array" });

        const firstSheetName = workbook.SheetNames[0];
        const worksheet = workbook.Sheets[firstSheetName];

        // Convert sheet to JSON
        const jsonData = XLSX.utils.sheet_to_json(worksheet, {
            defval: "",
            raw: false
        });

        if (!jsonData.length) {
            alert("Excel file is empty.");
            return;
        }

        const headers = Object.keys(jsonData[0]);

        allPreviewRows = jsonData;
		console.log("jsonData+"+jsonData);
        currentPage = 1;

        if (!validateRequiredHeaders(headers)) return;
		
		showMappingWithColumns(headers);

    };

    reader.readAsArrayBuffer(file);
}

/* ================= CSV READ ================= */
function readCSVFile1(file) {
    type = "CSV";
    Papa.parse(file, {
        header: true,
        skipEmptyLines: true,
        delimiter: "",
        dynamicTyping: false,
        complete: function (results) {

            // 1️⃣ Always take headers from meta.fields
            let csvHeaders = (results.meta.fields || [])
                .filter(h =>
                    typeof h === "string" &&
                    h.trim() !== "" &&
                    !h.includes("function")
                )
                .map(h => h.trim());

            console.log("CSV HEADERS:", csvHeaders);

            if (!csvHeaders.length) {
                alert("No headers found in CSV");
                return;
            }

            // 2️⃣ Keep rows as-is
            const validRows = results.data || [];


            // 3️⃣ Show mapping UI
            showMappingWithColumns(csvHeaders);

            // Optional: preview data
            allPreviewRows = validRows;
            currentPage = 1;
        }
    });
}

function readCSVFile(file) {
    type = "CSV";
    console.log("FILE:", file);
    console.log("Is File:", file instanceof File);

    uploadedCSVFile = file;   // store file for upload

    Papa.parse(file, {
        header: true,
        skipEmptyLines: true,
        dynamicTyping: false,
        quoteChar: '"',
        escapeChar: '"',
        complete: function (results) {

            let csvHeaders = (results.meta.fields || [])
                .filter(h => typeof h === "string" && h.trim() !== "" && !h.includes("function"))
                .map(h => h.trim());

            console.log("CSV HEADERS:", csvHeaders);

            if (!csvHeaders.length) {
                alert("No headers found in CSV");
                return;
            }

            const validRows = results.data || [];

            showMappingWithColumns(csvHeaders);

            allPreviewRows = validRows;
            currentPage = 1;
        }
    });
}

/* ================= Header RENDER ================= */
function renderPreviewHeadersFromMapping() {
    const headerRow = document.getElementById("previewHeaderRow");
    headerRow.innerHTML = "";

    const mappedTargets = getMappedPreviewHeaders();

    if (!mappedTargets.length) {
        headerRow.innerHTML =
            "<th style='color:#999'>No mapped fields</th>";
        return;
    }

    mappedTargets.forEach(target => {
        const th = document.createElement("th");
        th.textContent = target;
        headerRow.appendChild(th);
    });
}


/* ================= VALIDATION ================= */
function validateRequiredHeaders(csvHeaders) {
    const missing = requiredHeaders.filter(h => !csvHeaders.includes(h));
    if (missing.length) {
        alert(
            "Import blocked.\nMissing required column(s):\n" +
            missing.join(", ")
        );
        return false;
    }
    return true;
}


/* =========================================================
   BRIDGE: ADVANCED IMPORT → FIELD MAPPING UI (Section 2)
========================================================= */

var fieldMappings = {};
var selectedTargetField = null;
/* ================= Load TARGET COLUMNS ================= */

$(document).ready(function () {
    loadEmployeeTargetFields();
});


function loadEmployeeTargetFields() {
    $.ajax({
        url: "/employees/get-employee-target-fields",
        type: "GET",
        dataType: "json",
        success: function (data) {

            if (data.success) {
                // Normalize backend response
                targetFields = $.map(data.targetFields || [], function (f) {
                    return {
                        name: f.name,
                        displayName: f.displayName
                    };
                });

                console.log("Employee target fields loaded:", targetFields);

            } else {
                console.error("Error loading employee target fields:", data.message);
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX error loading employee target fields:", error);
        }
    });
}


function showMappingWithColumns(columns) {
    if (!columns || !columns.length) return;

    sourceColumns = normalizeSourceColumns(columns);


    const mappingSection = document.getElementById(MAPPING_SECTION_ID);
    if (!mappingSection) return;

    mappingSection.style.display = "block";
    scrollToMapping();

    populateSourceFields();
    populateTargetFields();
    autoMapFields();


    setTimeout(drawConnectionLines, 120);
}

function normalizeSourceColumns(cols) {
    if (!Array.isArray(cols)) return [];

    const VALID_COL_REGEX = /^[a-zA-Z0-9_]+$/;

    return cols
        .filter(c => typeof c === "string")
        .map(c => c.trim())
        .filter(c => c.length > 0)
        .filter(c => c.length <= 40)
        .filter(c => VALID_COL_REGEX.test(c)); // 🔥 THIS IS THE KEY
}



function scrollToMapping() {
    const el = document.getElementById(MAPPING_SECTION_ID);
    if (el) {
        el.scrollIntoView({ behavior: "smooth", block: "start" });
    }
}

    function populateSourceFields(){
        const box = document.getElementById("sourceFields");
        box.innerHTML = "";
        const cols = normalizeSourceColumns(sourceColumns);
		if (!cols.length) {
			box.innerHTML = "<div style='color:#999;padding:6px'>No valid columns found</div>";
			return;
		}

        cols.forEach((name, idx)=>{
		const row = document.createElement("div");
		row.className = "field-item src";
		row.id = "source-"+idx;
		row.setAttribute("data-name", name);
		
		// Check if this source is mapped
		const isMapped = fieldMappings[name] !== undefined;
		if(isMapped){
		row.style.background = "#d4edff";
		row.style.fontWeight = "bold";
		row.style.borderColor = "#2187cd";
		row.title = "Mapped to: " + fieldMappings[name] + " (Click to remove)";
		}
		
		const labelSpan = document.createElement("span");
		labelSpan.className = "label";
		const displayName = sourceDisplayNames[name] || name;
		labelSpan.textContent = displayName;

		// Allow rename ONLY for Tag fields
		if (/^Tag\d+$/i.test(name)) {
			labelSpan.style.cursor = "pointer";
			labelSpan.title = "Click to rename this tag";

			labelSpan.ondblclick = function (e) {
				e.stopPropagation();
				renameSourceTag(name, labelSpan);
			};
		}

		
		const arrowBox = document.createElement("span");
		arrowBox.className = "arrow-box";
		arrowBox.innerHTML = `<svg class="arrow-svg" viewBox="0 0 10 10"><polygon points="0,0 10,5 0,10" fill="${isMapped ? '#2187cd' : '#333'}" /></svg>`;
		
		row.appendChild(labelSpan);
		row.appendChild(arrowBox);
		row.onclick = ()=>selectSourceField(name, row);
		box.appendChild(row);
	});
}
function renameSourceTag(sourceName, labelEl) {
    const current = sourceDisplayNames[sourceName] || sourceName;

    const newName = prompt(
        "Rename source tag:",
        current
    );

    if (!newName) return;

    // Validation: safe column-like name
    if (!/^[a-zA-Z0-9_ ]{1,40}$/.test(newName)) {
        alert("Invalid name. Use letters, numbers, space or underscore only.");
        return;
    }

    sourceDisplayNames[sourceName] = newName.trim();

    // Refresh UI only (mapping remains intact)
    populateSourceFields();
    drawConnectionLines();
}

	function selectSourceField(name, el){
        // Check if this source is already mapped
		if(fieldMappings[name]){
			// If already mapped, remove the mapping
			removeMapping(name);
			return;
		}
		document.querySelectorAll("#sourceFields .field-item").forEach(e=>e.style.background="#f3f5f7");
		el.style.background = "#dff0ff";
		selectedSourceField = name;
		if(selectedSourceField && selectedTargetField) createMapping();
	}
	function removeMapping(sourceName){
		if(fieldMappings[sourceName]){
			const targetName = fieldMappings[sourceName];
			delete fieldMappings[sourceName];
			console.log("Removed mapping: " + sourceName + " -> " + targetName);
			populateSourceFields();
			populateTargetFields();
			drawConnectionLines();
		}
	}
    function selectTargetField(name, el){
		// Check if this target is already mapped to a source
		const existingSource = Object.keys(fieldMappings).find(src => fieldMappings[src] === name);
		if(existingSource){
			// If already mapped, remove the mapping
			removeMapping(existingSource);
			return;
		}
		
		document.querySelectorAll("#targetFields .field-item").forEach(e=>e.style.background="#f3f5f7");
		el.style.background = "#e5ffe8";
		selectedTargetField = name;
		if(selectedSourceField && selectedTargetField) createMapping();
	}
	function createMapping(){
		// Check if source is already mapped (shouldn't happen, but double-check)
		if(fieldMappings[selectedSourceField]){
			alert("Source field '" + selectedSourceField + "' is already mapped. Remove the existing mapping first.");
			selectedSourceField = null;
			selectedTargetField = null;
			return;
		}
		
		// Check if target is already mapped to another source
		const existingSource = Object.keys(fieldMappings).find(src => fieldMappings[src] === selectedTargetField);
		if(existingSource){
			alert("Target field '" + selectedTargetField + "' is already mapped to '" + existingSource + "'. Remove that mapping first.");
			selectedSourceField = null;
			selectedTargetField = null;
			return;
		}
		
		// Create the mapping
		fieldMappings[selectedSourceField] = selectedTargetField;
		console.log("Created mapping: " + selectedSourceField + " -> " + selectedTargetField);
		
		populateSourceFields();
		populateTargetFields();
		drawConnectionLines();

		selectedSourceField = null;
		selectedTargetField = null;
	}
    function populateTargetFields(){
        const box = document.getElementById("targetFields");
        box.innerHTML = "";
        targetFields.forEach((f, idx)=>{
          const row = document.createElement("div");
          row.className = "field-item tgt";
          row.id = "target-"+idx;
          row.setAttribute("data-name", f.name);
          
          // Check if this target is mapped
          const mappedSource = Object.keys(fieldMappings).find(src => fieldMappings[src] === f.name);
          const isMapped = mappedSource !== undefined;
          if(isMapped){
            row.style.background = "#d4f5d8";
            row.style.fontWeight = "bold";
            row.style.borderColor = "#38b241";
            row.title = "Mapped from: " + mappedSource + " (Click to remove)";
          }
          
          const arrowBox = document.createElement("span");
          arrowBox.className = "arrow-box";
          arrowBox.innerHTML = `<svg class="arrow-svg" viewBox="0 0 10 10"><polygon points="10,0 0,5 10,10" fill="${isMapped ? '#38b241' : '#333'}" /></svg>`;
          
          const labelSpan = document.createElement("span");
          labelSpan.className = "label";
          labelSpan.textContent = f.displayName;
          
          row.appendChild(arrowBox);
          row.appendChild(labelSpan);
          row.onclick = ()=>selectTargetField(f.name, row);
          box.appendChild(row);
        });
      }
	function autoMapFields(){
		fieldMappings = {};
		
		// Direct mapping: match source column names to target field names
		sourceColumns.forEach(sourceCol => {
			// Try exact match first
			const exactMatch = targetFields.find(tf => tf.name === sourceCol);
			if(exactMatch){
			fieldMappings[sourceCol] = exactMatch.name;
			return;
			}
			
			// Try case-insensitive match
			const sourceNormalized = sourceCol.toLowerCase().trim();
			const caseMatch = targetFields.find(tf => tf.name.toLowerCase().trim() === sourceNormalized);
			if(caseMatch){
			fieldMappings[sourceCol] = caseMatch.name;
			return;
			}
			
			// Try removing special characters and matching
			const sourceClean = sourceNormalized.replace(/[^a-z0-9]/g, "");
			const cleanMatch = targetFields.find(tf => {
			const targetClean = tf.name.toLowerCase().replace(/[^a-z0-9]/g, "");
			return targetClean === sourceClean;
			});
			if(cleanMatch){
			fieldMappings[sourceCol] = cleanMatch.name;
			}
		});
		
		console.log("Auto-mapped fields:", fieldMappings);
		populateSourceFields();
		populateTargetFields();
		drawConnectionLines();
	}

      /* === Arrow + Line + Arrow (straight, like sample image) === */
      function drawConnectionLines() {
        const canvas = document.getElementById("mappingCanvas");
        const scroll = document.getElementById("sharedScrollContainer");
        if (!canvas || !scroll) return;

        const ctx = canvas.getContext("2d");
        canvas.width = scroll.scrollWidth;
        canvas.height = scroll.scrollHeight;
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        const cRect = scroll.getBoundingClientRect();

        // Style: crisper, thicker, opaque color and shadow for clarity
        ctx.strokeStyle = "#2187cd";
        ctx.fillStyle = "#38b241";
        ctx.lineWidth = 2.5;
        ctx.shadowColor = "rgba(80,166,255,0.25)";
        ctx.shadowBlur = 5;

        Object.keys(fieldMappings).forEach(srcName => {
          const tgtName = fieldMappings[srcName];
          const sRow = [...document.querySelectorAll("#sourceFields .field-item")]
            .find(el => el.getAttribute("data-name") === srcName);
          const tRow = [...document.querySelectorAll("#targetFields .field-item")]
            .find(el => el.getAttribute("data-name") === tgtName);
          if (!(sRow && tRow)) return;

          const sRect = sRow.getBoundingClientRect();
          const tRect = tRow.getBoundingClientRect();
          const y1 = sRect.top + sRect.height / 2 - cRect.top + scroll.scrollTop;
          const y2 = tRect.top + tRect.height / 2 - cRect.top + scroll.scrollTop;
          const x1 = sRect.right - cRect.left + scroll.scrollLeft + 16;
          const x2 = tRect.left - cRect.left + scroll.scrollLeft + 8;

          // Refined control points for horizontal line
          const midX = (x1 + x2) / 2;

          // Draw left connector to main line
          ctx.beginPath();
          ctx.moveTo(x1 - 22, y1);
          ctx.lineTo(x1, y1);
          ctx.stroke();

          // Draw right connector from main line
          ctx.beginPath();
          ctx.moveTo(x2, y2);
          ctx.lineTo(x2 - 18, y2);
          ctx.stroke();

          // Draw main connection with a slight curve for clarity
          ctx.beginPath();
          ctx.moveTo(x1, y1);
          ctx.bezierCurveTo(midX, y1, midX, y2, x2 - 18, y2);
          ctx.stroke();

          // Custom arrowhead at the end (always points right)
          const arrowHead = (ctx, x, y, size, angle) => {
            ctx.save();
            ctx.translate(x, y);
            ctx.rotate(angle);
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(-size, size * 0.55);
            ctx.lineTo(-size, -size * 0.55);
            ctx.closePath();
            ctx.fill();
            ctx.restore();
          };
          // Arrow at left (source) pointing right, green for clarity
          ctx.save();
          ctx.shadowColor = "rgba(56,178,65,0.19)";
          ctx.fillStyle = "#38b241";
          arrowHead(ctx, x1, y1, 10, 0);
          ctx.restore();

          // Arrow at right (target) also pointing right, green for clarity
          ctx.save();
          ctx.shadowColor = "rgba(56,178,65,0.19)";
          ctx.fillStyle = "#38b241";
          arrowHead(ctx, x2, y2, 10, 0);
          ctx.restore();
        });

        // Remove shadow so it doesn't affect other canvas drawings after this function
        ctx.shadowBlur = 0;
        ctx.shadowColor = "transparent";
      }
    function directMapFields(){
        fieldMappings = {};
        
        // Map fields in order: 1st source -> 1st target, 2nd source -> 2nd target, etc.
        const maxMappings = Math.min(sourceColumns.length, targetFields.length);
        
        for(let i = 0; i < maxMappings; i++){
          const sourceCol = sourceColumns[i];
          const targetField = targetFields[i];
          fieldMappings[sourceCol] = targetField.name;
        }
        
        console.log("Direct-mapped fields (in order):", fieldMappings);
        console.log("  - Mapped " + maxMappings + " fields");
        if(sourceColumns.length > targetFields.length){
          console.log("  - Warning: " + (sourceColumns.length - targetFields.length) + " source fields have no target (more sources than targets)");
        } else if(targetFields.length > sourceColumns.length){
          console.log("  - Note: " + (targetFields.length - sourceColumns.length) + " target fields unmapped (more targets than sources)");
        }
        
        populateSourceFields();
        populateTargetFields();
        drawConnectionLines();
    }  
	function clearAllMappings(){
		fieldMappings = {};
		console.log("Cleared all mappings");
		populateSourceFields();
		populateTargetFields();
		drawConnectionLines();
	}

	function getMappedPreviewHeaders() {
    // target fields (DB columns)
		return Object.values(fieldMappings);
	}

	function getSourceByTarget(targetName) {
		// reverse lookup: target → source
		const entry = Object.entries(fieldMappings)
			.find(([src, tgt]) => tgt === targetName);
		return entry ? entry[0] : null;
	}
	function renderPreviewHeaders(headers) {
		const headerRow = document.getElementById("previewHeaderRow");
		headerRow.innerHTML = "";

		headers.forEach(h => {
			const th = document.createElement("th");
			th.textContent = h;
			headerRow.appendChild(th);
		});
	}
	function buildMappedPayload1() {
		const mappedRows = [];

		allPreviewRows.forEach(row => {
			const mappedRow = {};

			Object.entries(fieldMappings).forEach(([csvCol, dbCol]) => {
				mappedRow[dbCol] = row[csvCol] ?? "";
			});

			mappedRows.push(mappedRow);
		});

		return mappedRows;
	}
    function buildMappedPayload() {

    const mappedRows = [];

    allPreviewRows.forEach(row => {

        // skip empty rows
        if (!row || Object.values(row).every(v => !v || v.trim() === "")) {
            return;
        }

        const mappedRow = {};

        Object.entries(fieldMappings).forEach(([csvCol, dbCol]) => {
            mappedRow[dbCol] = row[csvCol] ?? "";
        });

        mappedRows.push(mappedRow);
    });

    return mappedRows;
}

	function validateRequiredMappings() {
		const requiredTargets = ["Email", "Phone"];

		const mappedTargets = Object.values(fieldMappings);

		const missing = requiredTargets.filter(req => !mappedTargets.includes(req));

		if (missing.length) {
			showValidationErrorDialog("Import blocked.\nPlease map the following required fields:\n\n" +
				missing.join(", "));
			
			return false;
		}
		return true;
	}

	function proceedWithImport(){
		if (!validateRequiredMappings()) {
			return;
		}
		showConfirmImportDialog();
	}

	function processImportData(){
		startLoading();
		// 3️⃣ Build mapped payload
		const payload = buildMappedPayload();
		console.log("Mapped payload:", payload);

		// 4️⃣ Safety: empty payload
		if (!payload.length) {
			alert("No data available to import.");
			return;
		}
		$.ajax({
			url: "/employees/import-mapped",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(payload),
			success: function (resp) {
				closeLoading();
				showSuccessDialog(resp.totalRecord, resp.importFailed, resp.employeeAlreadyExits);
			},
			error: function (xhr, status, error) {
				closeLoading();
				console.error(error);
				alert("Import failed. Please check logs.");
				window.location.reload();
			}
		});

	}
	function showClearAllDialog() {
		event.preventDefault();
		$("#showClearAllDialog").dialog({
			resizable: false,
			height: 200,
			width: 440,
			modal: true,
			buttons: {
				"confirm": function () {
					$(this).dialog("close");
					clearAllMappings();
				},
				"cancel": function () {
					$(this).dialog("close");
				}
        	}
		});
		return false;
	}
function showConfirmImportDialog() {
	event.preventDefault();
	$("#showConfirmImportDialog").dialog({
		resizable: false,
		height: 200,
		width: 440,
		modal: true,
		buttons: {
			"confirm": function () {
				$(this).dialog("close");
                if(type == "CSV"){
                    processCSVImport();
                }else{
				    processImportData();
                }
			},
			"cancel": function () {
				$(this).dialog("close");
			}
		}
	});
	return false;
}

function processCSVImport() {
    startLoading();
    if (!uploadedCSVFile) {
        alert("Please upload CSV file first.");
        return;
    }

    var formData = new FormData();
    formData.append("attachFile", uploadedCSVFile);

    $.ajax({
        url: "/employees/UploadEmployeeFile",   // FIXED URL
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (resp) {
            closeLoading();
			showSuccessDialog(resp.totalRecord, resp.importFailed, resp.employeeAlreadyExits);
        },
        error: function (xhr) {
            console.log(xhr);
            closeLoading();
            alert("Upload failed");
        }
    });
}
function showValidationErrorDialog(errorMessage) {
	document.getElementById("validateRequiredMappingErrorMessage").innerText = errorMessage;
	event.preventDefault();
	$("#showValidationErrorDialog").dialog({
		resizable: false,
		height: 270,
		width: 460,
		modal: true,
		buttons: {
			"Ok": function () {
				$(this).dialog("close");
			}
		}
	});
	return false;
}
function showSuccessDialog(totalRecord, importFailed, customerAlreadyExists) {
	event.preventDefault();
	const importedSuccess = totalRecord - importFailed - customerAlreadyExists;

	$("#totalRecord").text(totalRecord);
	$("#importedSuccess").text(importedSuccess);
	$("#importFailed").text(importFailed);
	$("#alreadyExists").text(customerAlreadyExists);

	$("#showSuccessDialog").dialog({
		title: "Employee Import Summary",
		resizable: false,
		height: 340,
		width: 520,
		modal: true,
		buttons: {
			"OK": function () {
				$(this).dialog("close");
				// ✅ STORE MESSAGE BEFORE RELOAD
            sessionStorage.setItem(
                "importSuccessMessage",
                "Employee import completed successfully."
            );

            window.location.reload();
			}
		}
	});

	return false;
}
$(document).ready(function () {
    const msg = sessionStorage.getItem("importSuccessMessage");
    if (msg) {
        const $box = $("#globalSuccessMessage");
        $box.text(msg).fadeIn(300);
        setTimeout(function () {
            $box.fadeOut(500);
        }, 3000);
        sessionStorage.removeItem("importSuccessMessage");
    }
});
function startLoading() {
    const loader = document.getElementById("globalLoader");
    if (loader) {
        loader.style.display = "flex";
    }
}

function closeLoading() {
    const loader = document.getElementById("globalLoader");
    if (loader) {
        loader.style.display = "none";
    }
}


</script>
<!-- Global Loader -->
<div id="globalLoader"
     style="display:none;
            position:fixed;
            top:0; left:0;
            width:100%; height:100%;
            background:rgba(255,255,255,0.75);
            z-index:9999;
            align-items:center;
            justify-content:center;">
    <div style="text-align:center;">
        <div class="spinner"></div>
        <div style="margin-top:10px;font-weight:600;color:#333;">
            Please wait...
        </div>
    </div>
</div>

</body>
</html>
<div id="showClearAllDialog" style="display:none;">
    <p>Remove all field mappings?</p>
</div>
<div id="showConfirmImportDialog" style="display:none;">
    <p>Do you want to proceed with the import?</p>
</div>
<div id="showValidationErrorDialog" style="display:none;">
    <p id="validateRequiredMappingErrorMessage"></p>
</div>
<div id="showSuccessDialog" style="display:none;">
	<p>The employee import process has been completed successfully. Below is the summary:</p>

	<table style="width:100%; margin-top:10px;">
		<tr>
			<td><strong>Total Records</strong></td>
			<td>: <span id="totalRecord"></span></td>
		</tr>
		<tr>
			<td><strong>Imported Successfully</strong></td>
			<td>: <span id="importedSuccess"></span></td>
		</tr>
		<tr>
			<td><strong>Failed Records</strong></td>
			<td>: <span id="importFailed"></span></td>
		</tr>
		<tr>
			<td><strong>Already Existing Employees</strong></td>
			<td>: <span id="alreadyExists"></span></td>
		</tr>
	</table>
</div>