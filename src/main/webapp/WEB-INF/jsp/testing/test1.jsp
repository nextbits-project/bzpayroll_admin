<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Configuration</title>
<link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<style>
.dataTables_length {
	font-size: 14px;
}

.dataTables_filter {
	font-size: 14px;
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
<style>

/* The final, definitive fix for the tab colors and borders */
.ui-tabs .ui-tabs-nav {
  /* Remove all borders from the main navigation bar */
  border: none !important;

}
.ui-tabs .ui-tabs-nav li {
  /* Style all tabs with a gray background and no border */
  border: 1px solid #ccc !important;


}
.ui-tabs .ui-tabs-nav li.ui-tabs-active {
  /* Style the active tab to be white and remove its bottom border */
  background: white !important;
  border-bottom: 1px solid white !important; /* This creates the seamless look */
  box-shadow: none !important;
}
.ui-tabs .ui-tabs-nav li.ui-tabs-active a {
  /* Ensure the link text is black and remove any outline/shadow */
  background: white !important;
  color: black !important;
  outline: none !important;
  box-shadow: none !important;
}
}
</style>


<script>
$(function() {
  $("#tabs").tabs({ active: 0 });
});
</script>
</head>
<body style="min-width: 1366px;">

<div style="padding:20px;">
  <div id="formCustomization">
    <div id="tabs">
      <ul>
        <li><a href="#statusTab">Employee Status</a></li>
        <li><a href="#deptTab">Department</a></li>
      </ul>

      <!-- Status Tab -->
      <div id="statusTab">
        <p>Employee Status content goes here.</p>
      </div>

      <!-- Department Tab -->
      <div id="deptTab">
        <p>Department content goes here.</p>
      </div>
    </div>
  </div>
</div>

</body>
</html>
