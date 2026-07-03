<%@ page language="java" contentType="text/html; " pageEncoding="ISO-8859-1" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daily Event Calendar</title>

    <!-- jQuery must load first -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="distdata/js/index.global.js"></script>

    <!-- FullCalendar v5 (UMD builds - separate plugins for List Week/Month support) -->
    <link href="https://unpkg.com/@fullcalendar/core@5.11.3/main.min.css" rel="stylesheet" />
    <link href="https://unpkg.com/@fullcalendar/daygrid@5.11.3/main.min.css" rel="stylesheet" />
    <link href="https://unpkg.com/@fullcalendar/timegrid@5.11.3/main.min.css" rel="stylesheet" />
    <link href="https://unpkg.com/@fullcalendar/list@5.11.3/main.min.css" rel="stylesheet" />

    <!-- Load FullCalendar core first, then plugins in order -->
    <script src="https://unpkg.com/@fullcalendar/core@5.11.3/main.min.js"></script>
    <script src="https://unpkg.com/@fullcalendar/daygrid@5.11.3/main.min.js"></script>
    <script src="https://unpkg.com/@fullcalendar/timegrid@5.11.3/main.min.js"></script>
    <script src="https://unpkg.com/@fullcalendar/list@5.11.3/main.min.js"></script>
    <script src="https://unpkg.com/@fullcalendar/interaction@5.11.3/main.min.js"></script>

    <meta charset='utf-8' />
    <!-- Use Bootstrap 4 only (remove bootstrap 5 to avoid conflicts) -->
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var calendar;
        document.addEventListener('DOMContentLoaded', function () {
            // helper: format Date or ISO string to "yyyy-MM-ddTHH:mm" for datetime-local
            function toDateTimeLocalString(d) {
                if (!d) return '';
                var date = (typeof d === 'string') ? new Date(d) : d;
                if (isNaN(date.getTime())) return '';
                var pad = function (n) { return n < 10 ? '0' + n : n; };
                return date.getFullYear() + '-' + pad(date.getMonth() + 1) + '-' + pad(date.getDate())
                    + 'T' + pad(date.getHours()) + ':' + pad(date.getMinutes());
            }
            // ensure "YYYY-MM-DDTHH:mm:SS" -> add :00 if missing
            function ensureSeconds(datetimeLocalVal) {
                if (!datetimeLocalVal) return "";
                if (/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}$/.test(datetimeLocalVal)) {
                    return datetimeLocalVal + ":00";
                } else if (/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$/.test(datetimeLocalVal)) {
                    return datetimeLocalVal;
                } else {
                    // try parsing as Date
                    var dt = new Date(datetimeLocalVal);
                    if (!isNaN(dt.getTime())) {
                        return dt.toISOString().slice(0, 19);
                    }
                }
                return datetimeLocalVal;
            }

            // Helper function to escape HTML (Java 8 compatible - no template literals)
            function escapeHtml(text) {
                if (!text) return '';
                var map = {
                    '&': '&amp;',
                    '<': '&lt;',
                    '>': '&gt;',
                    '"': '&quot;',
                    "'": '&#039;'
                };
                return String(text).replace(/[&<>"']/g, function (m) { return map[m]; });
            }

            // Double-click detection for dateClick:
            var lastDateClick = 0;

            var calendarEl = document.getElementById('calendar');
            if (!calendarEl) {
                console.error('Calendar element not found!');
                alert('Calendar element not found. Please check the page structure.');
                return;
            }

            // Wait a bit for all scripts to load (UMD builds need time to register)
            setTimeout(function () {
                // Check if FullCalendar is loaded
                if (typeof FullCalendar === 'undefined') {
                    console.error('FullCalendar is not loaded!');
                    calendarEl.innerHTML = '<div class="alert alert-danger">FullCalendar library failed to load. Please check your internet connection and refresh the page.</div>';
                    return;
                }

                // Try to access plugins - with UMD builds they should be on FullCalendar object
                var dayGridPlugin = FullCalendar.dayGridPlugin;
                var timeGridPlugin = FullCalendar.timeGridPlugin;
                var listPlugin = FullCalendar.listPlugin;
                var interactionPlugin = FullCalendar.interactionPlugin;

                // Also try alternative ways to access list plugin
                if (!listPlugin && typeof FullCalendar !== 'undefined') {
                    // Try different property names
                    listPlugin = FullCalendar.list || FullCalendar.ListPlugin || FullCalendar['listPlugin'];
                }

                // Build plugins array - listPlugin is required for listWeek/listMonth views
                var pluginsArray = [];
                var hasListPlugin = false;

                if (dayGridPlugin) {
                    pluginsArray.push(dayGridPlugin);
                    console.log('DayGrid plugin found');
                }
                if (timeGridPlugin) {
                    pluginsArray.push(timeGridPlugin);
                    console.log('TimeGrid plugin found');
                }
                if (listPlugin) {
                    pluginsArray.push(listPlugin);
                    hasListPlugin = true;
                    console.log('List plugin loaded successfully');
                } else {
                    console.warn('List plugin object not found, but list script is loaded');
                    // The list script is loaded, so FullCalendar should be able to use list views
                    // We'll include listWeek/listMonth in toolbar and let FullCalendar handle it
                    hasListPlugin = true;
                }
                if (interactionPlugin) {
                    pluginsArray.push(interactionPlugin);
                    console.log('Interaction plugin found');
                }

                // Always include listWeek and listMonth in toolbar (list script is loaded)
                // FullCalendar v5 can auto-detect plugins even if not explicitly in array
                var rightToolbar = 'dayGridMonth,timeGridWeek,timeGridDay,listWeek,listMonth';
                console.log('Toolbar configuration:', rightToolbar);

                // For UMD builds, plugins might be accessed differently
                // Try to get plugins - they should be available as FullCalendar.dayGridPlugin, etc.
                try {
                    var calendarConfig = {
                        // Include required plugins for List Week and List Month views
                        // If listPlugin wasn't found but script is loaded, FullCalendar may auto-detect it
                        plugins: pluginsArray.length > 0 ? pluginsArray : [
                            dayGridPlugin,
                            timeGridPlugin,
                            listPlugin || undefined, // Include even if undefined - FullCalendar may handle it
                            interactionPlugin
                        ].filter(function (p) { return p !== undefined; }),
                        initialView: 'dayGridMonth',
                        headerToolbar: {
                            left: 'prevYear,prev,next,nextYear today',
                            center: 'title',
                            right: rightToolbar
                        },
                        buttonText: {
                            today: 'Today',
                            day: 'Day'
                        },
                        views: {
                            listMonth: { buttonText: 'List Month' },
                            listWeek: { buttonText: 'List Week' }
                        },
                        navLinks: true,
                        selectable: true,
                        selectMirror: true,
                        displayEventTime: false,
                        expandRows: true,
                        handleWindowResize: true,
                        displayEventEnd: false,
                        showNonCurrentDates: false,
                        eventTimeFormat: {
                            hour: 'numeric',
                            minute: '2-digit',
                            meridiem: 'short'
                        },

                        // load events from backend JSON endpoint - map backend fields to FullCalendar format
                        events: function (fetchInfo, successCallback, failureCallback) {
                            $.ajax({
                                url: 'event-list',
                                method: 'GET',
                                dataType: 'json',
                                data: {
                                    start: fetchInfo.startStr,
                                    end: fetchInfo.endStr
                                },
                                success: function (data) {
                                    try {
                                        // Map backend fields (eventStartDate, eventEndDate) to FullCalendar format (start, end)
                                        var events = (data || []).map(function (e) {
                                            return {
                                                id: (e.eventId || e.id || ''),
                                                title: (e.eventName || e.title || ''),
                                                start: (e.eventStartDate || e.start || null),
                                                end: (e.eventEndDate || e.end || null),
                                                extendedProps: {
                                                    description: (e.eventMemo || e.description || '')
                                                },
                                                allDay: false
                                            };
                                        });
                                        successCallback(events);
                                    } catch (ex) {
                                        console.error('Error mapping events:', ex);
                                        failureCallback(ex);
                                    }
                                },
                                error: function (xhr, status, err) {
                                    console.error('Error fetching events:', status, err);
                                    alert('Error fetching events from server.');
                                    failureCallback(err);
                                }
                            });
                        },

                        // Click on date - update week calendar and show activities
                        dateClick: function (info) {
                            var now = Date.now();
                            var timeSinceLastClick = now - lastDateClick;
                            var clickedDate = info.dateStr;

                            // Update week calendar to show the week containing the clicked date
                            if (typeof calendarWeek !== 'undefined' && calendarWeek) {
                                calendarWeek.gotoDate(clickedDate);
                                console.log('Week calendar updated to show date:', clickedDate);
                            }

                            // Show day schedule for the clicked date
                            showDaySchedule(clickedDate);

                            if (timeSinceLastClick < 500 && timeSinceLastClick > 0) {
                                // Double click detected - open Add modal
                                console.log('Double click detected on:', clickedDate);
                                // open Add modal with default times (09:00 - 17:00 local)
                                if (document.getElementById("addEvent_name")) {
                                    document.getElementById("addEvent_name").value = "";
                                    document.getElementById("addEvent_memo").value = "";
                                    document.getElementById("addEvent_start_date").value = clickedDate + "T09:00";
                                    document.getElementById("addEvent_end_date").value = clickedDate + "T17:00";
                                    $('#add_event_modal').modal('show');
                                }
                                lastDateClick = 0; // Reset to prevent triple-click detection
                            } else {
                                // Single click - just update week view and show schedule
                                lastDateClick = now;
                            }
                        },

                        // When view changes, show day schedule for Day view
                        viewDidMount: function (viewInfo) {
                            if (viewInfo.view.type === 'timeGridDay') {
                                var currentDate = viewInfo.view.currentStart;
                                if (currentDate) {
                                    var dateStr = currentDate.toISOString().split('T')[0];
                                    showDaySchedule(dateStr);
                                }
                            } else {
                                // Hide day schedule for other views
                                $('#daySchedule').hide();
                            }
                        },

                        // selecting a range opens Add modal with times
                        select: function (selectionInfo) {
                            document.getElementById("addEvent_start_date").value = toDateTimeLocalString(selectionInfo.start);
                            document.getElementById("addEvent_end_date").value = toDateTimeLocalString(selectionInfo.end);
                            $('#add_event_modal').modal('show');
                            calendar.unselect();
                        },

                        // click on event to open viewing/edit modal
                        eventClick: function (info) {
                            var ev = info.event;
                            document.getElementById("event_id").value = ev.id;
                            document.getElementById("event_name").value = ev.title || '';
                            document.getElementById("event_memo").value = (ev.extendedProps && ev.extendedProps.description) ? ev.extendedProps.description : '';
                            document.getElementById("event_start_date").value = toDateTimeLocalString(ev.start);
                            document.getElementById("event_end_date").value = ev.end ? toDateTimeLocalString(ev.end) : toDateTimeLocalString(ev.start);
                            // set readOnly by default
                            document.getElementById('event_name').readOnly = true;
                            document.getElementById('event_memo').readOnly = true;
                            document.getElementById('event_start_date').readOnly = true;
                            document.getElementById('event_end_date').readOnly = true;
                            document.getElementById('event_assignedTo').disabled = true;
                            $('#event_entry_modal').modal('show');
                        },

                        // allow dragging/resizing and push updates to server
                        editable: true,
                        eventDrop: function (info) {
                            persistEventFromCalendar(info.event);
                        },
                        eventResize: function (info) {
                            persistEventFromCalendar(info.event);
                        },

                        eventMouseEnter: function (arg) {
                            // optional popup (you already have small popup)
                        }
                    };

                    // Create calendar instance for Month view
                    calendar = new FullCalendar.Calendar(calendarEl, calendarConfig);

                    // Render the calendar
                    calendar.render();
                    console.log('Calendar rendered successfully');

                    // Track sync state to avoid infinite loops when syncing calendars
                    var isSyncingCalendars = false;

                    // Create Week view calendar (make it global so month calendar can access it)
                    var calendarWeekEl = document.getElementById('calendarWeek');
                    var calendarWeek = null; // Declare as global variable
                    if (!calendarWeekEl) {
                        console.error('Week calendar element (calendarWeek) not found!');
                        alert('Week calendar element not found. Please check the page structure.');
                    } else {
                        console.log('Week calendar element found, initializing...');
                    }
                    if (calendarWeekEl) {
                        var calendarWeekConfig = {
                            // Include required plugins for List Week and List Month views
                            // If listPlugin wasn't found but script is loaded, FullCalendar may auto-detect it
                            plugins: pluginsArray.length > 0 ? pluginsArray : [
                                dayGridPlugin,
                                timeGridPlugin,
                                listPlugin || undefined, // Include even if undefined - FullCalendar may handle it
                                interactionPlugin
                            ].filter(function (p) { return p !== undefined; }),
                            initialView: 'timeGridWeek',
                            headerToolbar: {
                                left: 'prev,next today',
                                center: 'title',
                                right: 'listWeek,listMonth'
                            },
                            buttonText: {
                                today: 'Today',
                                day: 'Day'
                            },
                            views: {
                                listMonth: { buttonText: 'List Month' },
                                listWeek: { buttonText: 'List Week' }
                            },
                            navLinks: true,
                            selectable: true,
                            selectMirror: true,
                            displayEventTime: true,
                            expandRows: true,
                            handleWindowResize: true,
                            displayEventEnd: false,
                            showNonCurrentDates: false,
                            eventTimeFormat: {
                                hour: 'numeric',
                                minute: '2-digit',
                                meridiem: 'short'
                            },
                            // Same events function
                            events: function (fetchInfo, successCallback, failureCallback) {
                                $.ajax({
                                    url: 'event-list',
                                    method: 'GET',
                                    dataType: 'json',
                                    data: {
                                        start: fetchInfo.startStr,
                                        end: fetchInfo.endStr
                                    },
                                    success: function (data) {
                                        try {
                                            var events = (data || []).map(function (e) {
                                                return {
                                                    id: (e.eventId || e.id || ''),
                                                    title: (e.eventName || e.title || ''),
                                                    start: (e.eventStartDate || e.start || null),
                                                    end: (e.eventEndDate || e.end || null),
                                                    extendedProps: {
                                                        description: (e.eventMemo || e.description || '')
                                                    },
                                                    allDay: false
                                                };
                                            });
                                            successCallback(events);
                                        } catch (ex) {
                                            console.error('Error mapping events:', ex);
                                            failureCallback(ex);
                                        }
                                    },
                                    error: function (xhr, status, err) {
                                        console.error('Error fetching events:', status, err);
                                        failureCallback(err);
                                    }
                                });
                            },
                            // Click handler for week view - show day schedule
                            dateClick: function (info) {
                                var now = Date.now();
                                var timeSinceLastClick = now - lastDateClick;
                                var clickedDate = info.dateStr;

                                // Show day schedule for the clicked date
                                showDaySchedule(clickedDate);

                                // Sync month calendar to the same date
                                if (typeof calendar !== 'undefined' && calendar) {
                                    calendar.gotoDate(clickedDate);
                                }

                                if (timeSinceLastClick < 500 && timeSinceLastClick > 0) {
                                    // Double click detected - open Add modal
                                    console.log('Double click detected on week view:', clickedDate);
                                    if (document.getElementById("addEvent_name")) {
                                        document.getElementById("addEvent_name").value = "";
                                        document.getElementById("addEvent_memo").value = "";
                                        document.getElementById("addEvent_start_date").value = clickedDate + "T09:00";
                                        document.getElementById("addEvent_end_date").value = clickedDate + "T17:00";
                                        $('#add_event_modal').modal('show');
                                    }
                                    lastDateClick = 0;
                                } else {
                                    lastDateClick = now;
                                }
                            },
                            // Event click handler
                            eventClick: function (info) {
                                var ev = info.event;
                                if (document.getElementById("event_id")) {
                                    document.getElementById("event_id").value = ev.id;
                                    document.getElementById("event_name").value = ev.title || '';
                                    document.getElementById("event_memo").value = (ev.extendedProps && ev.extendedProps.description) ? ev.extendedProps.description : '';
                                    document.getElementById("event_start_date").value = toDateTimeLocalString(ev.start);
                                    document.getElementById("event_end_date").value = ev.end ? toDateTimeLocalString(ev.end) : toDateTimeLocalString(ev.start);
                                    document.getElementById('event_name').readOnly = true;
                                    document.getElementById('event_memo').readOnly = true;
                                    document.getElementById('event_start_date').readOnly = true;
                                    document.getElementById('event_end_date').readOnly = true;
                                    document.getElementById('event_assignedTo').disabled = true;
                                    $('#event_entry_modal').modal('show');
                                }
                            },
                            editable: true,
                            eventDrop: function (info) {
                                persistEventFromCalendar(info.event);
                            },
                            eventResize: function (info) {
                                persistEventFromCalendar(info.event);
                            }
                        };

                        calendarWeek = new FullCalendar.Calendar(calendarWeekEl, calendarWeekConfig);
                        calendarWeek.render();

                        // Verify the calendar was rendered
                        if (calendarWeek && calendarWeek.view) {
                            console.log('Week calendar successfully rendered with view:', calendarWeek.view.type);
                        } else {
                            console.error('Week calendar failed to render properly');
                        }

                        // Make calendarWeek globally accessible
                        window.calendarWeek = calendarWeek;

                        // Sync week calendar to show current week when month view changes
                        calendar.on('datesSet', function (dateInfo) {
                            if (!calendarWeek || isSyncingCalendars) {
                                return;
                            }
                            isSyncingCalendars = true;
                            try {
                                // Get the current date from the month view
                                var currentDate = dateInfo.start;
                                var today = new Date();

                                // If the month view includes today, show this week
                                // Otherwise, show the first week of the visible month
                                var dateToShow = today;
                                if (today < dateInfo.start || today > dateInfo.end) {
                                    // Month view doesn't include today, show first week of visible month
                                    dateToShow = new Date(dateInfo.start);
                                }

                                // Ensure week view shows the week containing this date
                                calendarWeek.gotoDate(dateToShow);
                            } finally {
                                isSyncingCalendars = false;
                            }
                        });

                        // Initial sync: show current week when page loads
                        setTimeout(function () {
                            if (calendar && calendarWeek) {
                                var today = new Date();
                                calendarWeek.gotoDate(today);
                            }
                        }, 500);
                        calendarWeek.on('datesSet', function (dateInfo) {
                            if (!calendar || isSyncingCalendars) {
                                return;
                            }
                            isSyncingCalendars = true;
                            try {
                                calendar.gotoDate(dateInfo.start);
                            } finally {
                                isSyncingCalendars = false;
                            }
                        });

                        // When week calendar view changes, refresh to show all activities
                        calendarWeek.on('viewDidMount', function (viewInfo) {
                            console.log('Week calendar view mounted:', viewInfo.view.type);
                            // Refetch events to ensure all activities are shown
                            calendarWeek.refetchEvents();
                        });

                        console.log('Week calendar rendered successfully with list views');
                    } else {
                        console.error('Week calendar element not found - week view will not be displayed');
                    }
                } catch (error) {
                    console.error('Error initializing calendar:', error);
                    if (calendarEl) {
                        calendarEl.innerHTML = '<div class="alert alert-danger">Error loading calendar: ' + error.message + '. Please refresh the page or check the browser console for details.</div>';
                    }
                }
            }, 100); // Wait 100ms for all scripts to load

            // After drag/resize, update server
            function persistEventFromCalendar(ev) {
                var EventDetail = {
                    eventId: ev.id,
                    eventName: ev.title,
                    eventMemo: (ev.extendedProps && ev.extendedProps.description) ? ev.extendedProps.description : '',
                    eventStartDate: ev.start ? ev.start.toISOString().slice(0, 19) : null,
                    eventEndDate: ev.end ? ev.end.toISOString().slice(0, 19) : null
                };
                $.ajax({
                    type: "POST",
                    url: "opportunityEvent?tabid=update",
                    data: "data=" + JSON.stringify(EventDetail),
                    success: function () {
                        calendar.refetchEvents();
                    },
                    error: function () {
                        alert("Error updating event");
                    }
                });
            }

            // Show day schedule when double-clicking a day
            var selectedDay = null;
            window.showDaySchedule = function (dateStr) {
                console.log('showDaySchedule called with:', dateStr);
                selectedDay = dateStr;
                var dayScheduleEl = document.getElementById('daySchedule');
                var dayScheduleContentEl = document.getElementById('dayScheduleContent');

                if (!dayScheduleEl) {
                    console.error('daySchedule element not found');
                    return;
                }

                dayScheduleEl.style.display = 'block';
                if (dayScheduleContentEl) {
                    dayScheduleContentEl.innerHTML = '<p>Loading schedule for ' + dateStr + '...</p>';
                }

                // Fetch events for this day
                var startDate = dateStr + 'T00:00:00';
                var endDate = dateStr + 'T23:59:59';

                $.ajax({
                    url: 'event-list',
                    method: 'GET',
                    dataType: 'json',
                    data: {
                        start: startDate,
                        end: endDate
                    },
                    success: function (data) {
                        var html = '<table class="table table-striped"><thead><tr><th>Start Date & Time</th><th>End Date & Time</th><th>Event</th><th>Memo</th><th>Actions</th></tr></thead><tbody>';
                        if (data && data.length > 0) {
                            // Map backend response to display format
                            data.forEach(function (event) {
                                // Backend returns eventStartDate, eventEndDate, eventName, eventMemo, eventId
                                var startTime = event.eventStartDate || event.start || '';
                                // Format the time for display (Java 8 compatible date string handling)
                                if (startTime) {
                                    try {
                                        var date = new Date(startTime);
                                        if (!isNaN(date.getTime())) {
                                            var hours = date.getHours();
                                            var minutes = date.getMinutes();
                                            var ampm = hours >= 12 ? 'PM' : 'AM';
                                            hours = hours % 12;
                                            hours = hours ? hours : 12;
                                            minutes = minutes < 10 ? '0' + minutes : minutes;
                                            startTime = hours + ':' + minutes + ' ' + ampm;
                                        }
                                    } catch (e) {
                                        // Keep original format if parsing fails (Java 8 date string compatibility)
                                    }
                                }
                                var eventStartDate = event.eventStartDate;
                                var eventEndDate = event.eventEndDate;

                                // Format Start Date (DD/MM/YYYY, HH:mm)
                                var startDateTime = eventStartDate || '';
                                if (startDateTime) {
                                    try {
                                        var sd = new Date(startDateTime);
                                        if (!isNaN(sd.getTime())) {
                                            var d = String(sd.getDate()).padStart(2, '0');
                                            var m = String(sd.getMonth() + 1).padStart(2, '0');
                                            var y = sd.getFullYear();

                                            var h = String(sd.getHours()).padStart(2, '0');
                                            var min = String(sd.getMinutes()).padStart(2, '0');

                                            startDateTime = d + '/' + m + '/' + y + ', ' + h + ':' + min;
                                        }
                                    } catch (e) { }
                                }

                                // Format End Date (DD/MM/YYYY, HH:mm)
                                var endDateTime = eventEndDate || '';
                                if (endDateTime) {
                                    try {
                                        var ed = new Date(endDateTime);
                                        if (!isNaN(ed.getTime())) {
                                            var d2 = String(ed.getDate()).padStart(2, '0');
                                            var m2 = String(ed.getMonth() + 1).padStart(2, '0');
                                            var y2 = ed.getFullYear();

                                            var h2 = String(ed.getHours()).padStart(2, '0');
                                            var min2 = String(ed.getMinutes()).padStart(2, '0');

                                            endDateTime = d2 + '/' + m2 + '/' + y2 + ', ' + h2 + ':' + min2;
                                        }
                                    } catch (e) { }
                                }

                                var title = event.eventName || event.title || 'Untitled';
                                var memo = (event.eventMemo || event.description || '');
                                var eventId = event.eventId || event.id || '';

                                var opportunityID = event.opportunityID;
                                var opportunityName = event.opportunityName;
                                html += '<tr>';
                                html += '<td>' + escapeHtml(startDateTime) + '</td>';
                                html += '<td>' + escapeHtml(endDateTime) + '</td>';
                                html += '<td>' + escapeHtml(title) + '</td><td>' + escapeHtml(memo) + '</td>';
                                html += '<td><button class="btn btn-sm btn-primary" style="padding: 4px 22px;" onclick="editEventFromSchedule('
                                    + '\'' + escapeHtml(eventId) + '\','
                                    + '\'' + escapeHtml(title) + '\','
                                    + '\'' + escapeHtml(memo) + '\','
                                    + '\'' + escapeHtml(eventStartDate) + '\','
                                    + '\'' + escapeHtml(eventEndDate) + '\','
                                    + '\'' + escapeHtml(opportunityID) + '\','
                                    + '\'' + escapeHtml(opportunityName) + '\''
                                    + ')">Edit</button>';
                                html += '<button class="btn btn-sm btn-danger ml-3" style="padding: 4px 22px;"  onclick="showDeleteEvent('
                                    + '\'' + escapeHtml(eventId) + '\''
                                    + ')">Delete</button></td>';
                                html += '</tr>';
                            });
                        } else {
                            html += '<tr><td colspan="4">No events scheduled for this day.</td></tr>';
                        }
                        html += '</tbody></table>';
                        var dayScheduleContentEl = document.getElementById('dayScheduleContent');
                        if (dayScheduleContentEl) {
                            dayScheduleContentEl.innerHTML = html;
                        } else {
                            console.error('dayScheduleContent element not found');
                        }
                    },
                    error: function () {
                        var dayScheduleContentEl = document.getElementById('dayScheduleContent');
                        if (dayScheduleContentEl) {
                            dayScheduleContentEl.innerHTML = '<p class="text-danger">Error loading schedule.</p>';
                        }
                    }
                });
            };

            window.openAddModalForDay = function () {
                if (selectedDay) {
                    document.getElementById("addEvent_name").value = "";
                    document.getElementById("addEvent_memo").value = "";
                    document.getElementById("addEvent_start_date").value = selectedDay + "T09:00";
                    document.getElementById("addEvent_end_date").value = selectedDay + "T17:00";
                    $('#add_event_modal').modal('show');
                } else {
                    document.getElementById("addEvent_name").value = "";
                    document.getElementById("addEvent_memo").value = "";
                    $('#add_event_modal').modal('show');
                }
            };

            window.editEventFromSchedule = function (eventId, title, memo, eventStartDate, eventEndDate, opportunityID, opportunityName) {
                document.getElementById("edit_event_id").value = eventId;
                document.getElementById("edit_event_name").value = title;
                document.getElementById("edit_event_memo").value = memo;
                document.getElementById("edit_event_start_date").value = toDateTimeLocalString(eventStartDate);
                document.getElementById("edit_event_end_date").value = eventEndDate ? toDateTimeLocalString(eventEndDate) : toDateTimeLocalString(eventStartDate);
                document.getElementById("editOpportunityID").value = opportunityID;

                // set readOnly by default
                document.getElementById('edit_event_name').readOnly = true;
                document.getElementById('edit_event_memo').readOnly = true;
                document.getElementById('edit_event_start_date').readOnly = true;
                document.getElementById('edit_event_end_date').readOnly = true;
                document.getElementById('edit_event_assignedTo').disabled = true;

                $('#edit_event_entry_modal').modal('show');
            };
            // Expose save_event for Add modal
            window.save_event = function () {
                var event_name = $("#addEvent_name").val();
                var event_start_date = $("#addEvent_start_date").val();
                var event_end_date = $("#addEvent_end_date").val();
                var event_memo = $("#addEvent_memo").val();

                if (!event_name || !event_start_date || !event_end_date) {
                    $('#fieldError').modal('toggle');
                    return;
                }

                var EventDetail = {
                    "eventName": event_name,
                    "eventMemo": event_memo,
                    "eventStartDate": ensureSeconds(event_start_date),
                    "eventEndDate": ensureSeconds(event_end_date),
                    "eventType": "1", // or appropriate type
                    "opportunityID": "15"
                };

                $.ajax({
                    type: "POST",
                    url: "save-event",
                    data: "data=" + JSON.stringify(EventDetail),
                    success: function (data) {
                        $('#add_event_modal').modal('hide');
                        calendar.refetchEvents();
                        // Refresh day schedule if it's visible
                        if (selectedDay) {
                            showDaySchedule(selectedDay);
                        }
                        alert("Event added successfully!");
                        window.location.reload();
                    },
                    error: function () {
                        alert("Error saving event");
                    }
                });
            };

            // Update event (Edit -> Update)
            window.update_event = function () {
                var event_id = $("#event_id").val();
                var event_name = $("#event_name").val();
                var event_start_date = $("#event_start_date").val();
                var event_end_date = $("#event_end_date").val();
                var event_memo = $("#event_memo").val();

                if (!event_name || !event_start_date || !event_end_date || !event_memo) {
                    alert("Please enter all required details.");
                    return false;
                }

                var EventDetail = {
                    "eventId": event_id,
                    "eventName": event_name,
                    "eventMemo": event_memo,
                    "eventStartDate": ensureSeconds(event_start_date),
                    "eventEndDate": ensureSeconds(event_end_date)
                };
                $.ajax({
                    type: "POST",
                    url: "update-event",
                    data: "data=" + JSON.stringify(EventDetail),
                    success: function (data) {
                        $('#event_entry_modal').modal('hide');
                        calendar.refetchEvents();
                        alert("Event updated Successfully !!");
                        window.location.reload();
                    },
                    error: function (data) {
                        alert("Error updating event");
                    }
                });
            };

        }); // DOMContentLoaded

        // small AddZero helper retained
        Number.prototype.AddZero = function (b, c) {
            var l = (String(b || 10).length - String(this).length) + 1;
            return l > 0 ? new Array(l).join(c || '0') + this : this;
        }
    </script>

    <style>
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #calendar,
        #calendarWeek {
            max-width: 100%;
            margin: 0 auto;
            width: 100%;
        }

        /* Ensure calendar containers are visible */
        #calendar {
            display: block !important;
            visibility: visible !important;
        }

        #calendarWeek {
            display: block !important;
            visibility: visible !important;
        }

        .fc {
            font-size: 14px;
        }

        .fc-toolbar {
            padding: 10px;
        }

        .fc-button {
            padding: 6px 12px;
            font-size: 13px;
        }

        .fc-daygrid-day {
            min-height: 100px;
        }

        .fc-timeGridWeek-view .fc-timegrid-slot {
            min-height: 2.5em;
        }

        .required:after {
            content: " *";
            color: red;
        }
    </style>

</head>

<body>

    <div class="container" style="background: #fffff; width: 100%; max-width: 100%; padding: 20px;">

        <!-- Calendar Container with Month and Week side by side -->
        <div id="calendarContainer"
            style="display: flex; gap: 15px; flex-wrap: nowrap; justify-content: space-between; width: 100%; box-sizing: border-box;">
            <!-- Month View Calendar -->
            <div style="flex: 1 1 48%; min-width: 300px; box-sizing: border-box;">
                <h4 style="margin-bottom: 10px; text-align: center;">Month View</h4>
                <div id="calendar"
                    style="background: #f2f3f4; min-height: 600px; width: 100%; box-sizing: border-box;">
                </div>
            </div>

            <!-- Week View Calendar - Current Week Schedule -->
            <div style="flex: 1 1 48%; min-width: 300px; box-sizing: border-box;">
                <h4 style="margin-bottom: 10px; text-align: center;">Current Week Schedule</h4>
                <div id="calendarWeek"
                    style="background: #f2f3f4; min-height: 600px; width: 100%; box-sizing: border-box;">
                </div>
            </div>
        </div>

        <!-- Day Schedule Section (shown when double-clicking a day or selecting Day view) -->
        <div id="daySchedule"
            style="margin-top: 20px; display: none; border: 1px solid #ddd; padding: 15px; background: #f9f9f9; max-width: 1100px; margin-left: auto; margin-right: auto;">
            <h4>Day Schedule</h4>
            <div id="dayScheduleContent"></div>
            <button class="btn btn-primary mt-2" onclick="openAddModalForDay()">Add Event</button>
        </div>

        <!-- Event VIEW/EDIT modal -->
        <div class="modal fade" id="event_entry_modal" tabindex="-1" role="dialog"
            aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">
                            <spring:message code="BzComposer.customer.opportunity.updateEvent" />
                        </h5>
                        <button type="button" class="close"
                            data-dismiss="modal"><span>&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="img-container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="event_id">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventId" />
                                        </label>
                                        <input type="text" name="event_id" id="event_id"
                                            class="form-control" readonly="readonly">
                                        <label class="required" for="event_name">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventName" />
                                        </label>
                                        <input type="text" name="event_name" id="event_name"
                                            class="form-control" placeholder="Enter your event name"
                                            readonly="readonly">
                                        <label for="event_memo">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventMemo" />
                                        </label>
                                        <input type="text" name="event_memo" id="event_memo"
                                            class="form-control" placeholder="Enter your event Memo"
                                            readonly="readonly">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="required" for="event_start_date">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventStartDate" />
                                        </label>
                                        <input type="datetime-local" name="event_start_date"
                                            id="event_start_date" class="form-control"
                                            readonly="readonly" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="required" for="event_end_date">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventEndDate" />
                                        </label>
                                        <input type="datetime-local" name="event_end_date"
                                            id="event_end_date" class="form-control"
                                            readonly="readonly" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label for="event_assignedTo">
                                        <spring:message
                                            code="BzComposer.customer.opportunity.assignedTo" />
                                    </label>
                                    <select name="event_assignedTo" id="event_assignedTo"
                                        class="form-control" disabled>
                                        <option value="0">
                                            <spring:message code="BzComposer.ComboBox.Select" />
                                        </option>
                                        <option value="1">user</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer" align="center">
                        <button type="button" class="btn btn-secondary" onclick="showDeleteEvent(0)">
                            <spring:message code="BzComposer.global.delete" />
                        </button>
                        <button type="button" class="btn btn-secondary"
                            onclick="document.getElementById('event_name').readOnly=false; document.getElementById('event_memo').readOnly=false; document.getElementById('event_start_date').readOnly=false; document.getElementById('event_end_date').readOnly=false; document.getElementById('event_assignedTo').disabled=false;">
                            <spring:message code="BzComposer.global.edit" />
                        </button>
                        <button type="button" class="btn btn-secondary" onclick="update_event()">
                            <spring:message code="BzComposer.global.update" />
                        </button>
                        <button type="button" class="btn btn-secondary"
                            onclick="$('#event_entry_modal').modal('hide')">
                            <spring:message code="BzComposer.global.cancel" />
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <!-- Added By Ram  -->
        <!-- Event New EDIT modal -->
        <div class="modal fade" id="edit_event_entry_modal" tabindex="-1" role="dialog"
            aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <spring:message code="BzComposer.customer.opportunity.updateEvent" />
                        </h5>
                        <button type="button" class="close"
                            data-dismiss="modal"><span>&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="img-container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="edit_event_id">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventId" />
                                        </label>
                                        <input type="text" name="edit_event_id" id="edit_event_id"
                                            class="form-control" readonly="readonly">
                                        <label class="required" for="edit_event_name">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventName" />
                                        </label>
                                        <input type="text" name="edit_event_name" id="edit_event_name"
                                            class="form-control" placeholder="Enter your event name"
                                            readonly="readonly">
                                        <label for="edit_event_memo">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventMemo" />
                                        </label>
                                        <input type="text" name="edit_event_memo" id="edit_event_memo"
                                            class="form-control" placeholder="Enter your event Memo"
                                            readonly="readonly">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="required" for="edit_event_start_date">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventStartDate" />
                                        </label>
                                        <input type="datetime-local" name="edit_event_start_date"
                                            id="edit_event_start_date" class="form-control"
                                            readonly="readonly" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="required" for="edit_event_end_date">
                                            <spring:message
                                                code="BzComposer.customer.opportunity.eventEndDate" />
                                        </label>
                                        <input type="datetime-local" name="edit_event_end_date"
                                            id="edit_event_end_date" class="form-control"
                                            readonly="readonly" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label for="edit_event_assignedTo">
                                        <spring:message
                                            code="BzComposer.customer.opportunity.assignedTo" />
                                    </label>
                                    <select name="edit_event_assignedTo" id="edit_event_assignedTo"
                                        class="form-control" disabled>
                                        <option value="0">
                                            <spring:message code="BzComposer.ComboBox.Select" />
                                        </option>
                                        <option value="1">user</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="" id="editOpportunityID" />
                    <div class="modal-footer" align="center">
                        <button type="button" class="btn btn-secondary"
                            onclick="document.getElementById('edit_event_name').readOnly=false; document.getElementById('edit_event_memo').readOnly=false; document.getElementById('edit_event_start_date').readOnly=false; document.getElementById('edit_event_end_date').readOnly=false; document.getElementById('edit_event_assignedTo').disabled=false;">
                            <spring:message code="BzComposer.global.edit" />
                        </button>
                        <button type="button" class="btn btn-secondary" onclick="saveEditEvent()">
                            <spring:message code="BzComposer.global.update" />
                        </button>
                        <button type="button" class="btn btn-secondary"
                            onclick="$('#edit_event_entry_modal').modal('hide')">
                            <spring:message code="BzComposer.global.cancel" />
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <!-- Add Event modal -->
        <div class="modal fade" id="add_event_modal" tabindex="-1" role="dialog"
            aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <spring:message code="BzComposer.customer.opportunity.addEvent" />
                        </h5>
                        <button type="button" class="close"
                            data-dismiss="modal"><span>&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="addEvent_name">
                                <spring:message code="BzComposer.customer.opportunity.eventName" />
                            </label>
                            <input type="text" id="addEvent_name" class="form-control" />
                            <label for="addEvent_memo">
                                <spring:message code="BzComposer.customer.opportunity.eventMemo" />
                            </label>
                            <input type="text" id="addEvent_memo" class="form-control" />
                            <label for="addEvent_start_date" class="mt-2">
                                <spring:message code="BzComposer.customer.opportunity.eventStartDate" />
                            </label>
                            <input type="datetime-local" id="addEvent_start_date"
                                class="form-control" />
                            <label for="addEvent_end_date" class="mt-2">
                                <spring:message code="BzComposer.customer.opportunity.eventEndDate" />
                            </label>
                            <input type="datetime-local" id="addEvent_end_date" class="form-control" />
                            <label for="addEvent_assignedTo" class="mt-2">
                                <spring:message code="BzComposer.customer.opportunity.assignedTo" />
                            </label>
                            <select id="addEvent_assignedTo" class="form-control">
                                <option value="0">
                                    <spring:message code="BzComposer.ComboBox.Select" />
                                </option>
                                <option value="1">user</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" onclick="save_event()">
                            <spring:message code="BzComposer.global.save" />
                        </button>
                        <button class="btn btn-secondary" data-dismiss="modal">
                            <spring:message code="BzComposer.global.cancel" />
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Event modal -->
        <div class="modal fade" id="delete_event_modal" tabindex="-1" role="dialog"
            aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Event</h5>
                        <button type="button" class="close"
                            data-dismiss="modal"><span>&times;</span></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete the selected event?
                    </div>
                    <input type="hidden" id="deleteEventId" />
                    <div class="modal-footer">
                        <button class="btn btn-primary" onclick="deleteEvent()"> Yes </button>
                        <button class="btn btn-secondary" onclick="closeDeleteEvent()"> No</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- hidden event list inputs kept for backward compatibility (not used by calendar) -->
        <div>
            <input type="hidden" name="eventListSize" id="eventListSize" value='${eventList.size()}' />
            <c:if test="${not empty eventList}">
                <c:forEach items="${eventList}" var="event" varStatus="loop">
                    <input type="hidden" id='${loop.index}eventId' value='${event.eventId}' />
                    <input type="hidden" id='${loop.index}eventName' value='${event.eventName}' />
                    <input type="hidden" id='${loop.index}eventMemo' value='${event.eventMemo}' />
                    <input type="hidden" id='${loop.index}eventStartDate'
                        value='${event.eventStartDate}' />
                    <input type="hidden" id='${loop.index}eventEndDate' value='${event.eventEndDate}' />
                </c:forEach>
            </c:if>
        </div>

        <!-- small info popup -->
        <div class="modal fade bd-example-modal-sm" id="event_popup" tabindex="-1" role="dialog"
            aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="card text-white bg-info mb-0" style="max-width: 20rem;">
                        <div class="card-header"><label id="eName">Test</label></div>
                        <div class="card-body">
                            <h6 class="card-title"><b> Event Memo: </b></h6> <label class="card-text"
                                id="eMemo">Details</label>
                            <h6 class="card-title"><b> Assigned To </b></h6> <label class="card-text"
                                id="eAssign">Emp name</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- field error modal -->
        <div class="modal fade" id="fieldError" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <spring:message code="BzComposer.customer.opportunity.error" />
                        </h5>
                    </div>
                    <div class="modal-body">
                        <p>
                            <spring:message code="BzComposer.customer.opportunity.allFieldRequired" />
                        </p>
                    </div>
                    <div class="modal-footer"><button class="btn btn-primary" data-dismiss="modal">
                            <spring:message code="BzComposer.global.ok" />
                        </button></div>
                </div>
            </div>
        </div>
    </div>

</body>



<script>

    function edit_event() {

        document.getElementById('event_name').readOnly = false;
        document.getElementById('event_memo').readOnly = false;
        document.getElementById('event_start_date').readOnly = false;
        document.getElementById('event_end_date').readOnly = false;
        document.getElementById('event_assignedTo').readOnly = false;

    }

    function cancel_event() {


        $('#event_entry_modal').modal('hide');

    }
    function update_event() {
        var event_id = $("#event_id").val();
        var event_name = $("#event_name").val().trim();
        var event_start_date = $("#event_start_date").val();
        var event_end_date = $("#event_end_date").val();
        var event_memo = $("#event_memo").val().trim();
        if (!event_name || !event_start_date || !event_end_date || event_name === "") {
            $('#fieldError').modal('toggle');
            return false;
        }
        var payload = {
            eventId: event_id,
            eventName: event_name,
            eventMemo: event_memo,
            eventStartDate: ensureSeconds(event_start_date),
            eventEndDate: ensureSeconds(event_end_date)
        };
        $.ajax({
            type: "POST",
            url: "update-event",
            data: "data=" + encodeURIComponent(JSON.stringify(payload)),
            success: function (data) {
                $('#update_event_modal').modal('hide');
                $('#event_entry_modal').modal('hide');
                try {
                    if (typeof calendar !== 'undefined' && calendar !== null && typeof calendar.refetchEvents === 'function') {
                        calendar.refetchEvents();
                    } else {
                        location.reload();
                    }
                } catch (e) {
                    console.error("Error refreshing calendar:", e);
                    location.reload();
                }
                alert("Event updated successfully!");
            },
            error: function (xhr, status, err) {
                console.error("Error updating event:", status, err, xhr && xhr.responseText);
                if (typeof showerrordialog === 'function') {
                    showerrordialog();
                } else {
                    alert("Error updating event. See console for details.");
                }
            }
        });
        return false;
    }

    function saveEditEvent() {
        var event_id = $("#edit_event_id").val();
        var event_name = $("#edit_event_name").val().trim();
        var event_start_date = $("#edit_event_start_date").val();
        var event_end_date = $("#edit_event_end_date").val();
        var event_memo = $("#edit_event_memo").val().trim();
        if (!event_name || !event_start_date || !event_end_date || event_name === "") {
            $('#fieldError').modal('toggle');
            return false;
        }
        var payload = {
            eventId: event_id,
            eventName: event_name,
            eventMemo: event_memo,
            eventStartDate: ensureSeconds(event_start_date),
            eventEndDate: ensureSeconds(event_end_date)
        };
        $.ajax({
            type: "POST",
            url: "update-event",
            data: "data=" + encodeURIComponent(JSON.stringify(payload)),
            success: function (data) {
                alert("Event updated successfully!");
                location.reload();
            },
            error: function (xhr, status, err) {
                console.error("Error updating event:", status, err, xhr && xhr.responseText);
                if (typeof showerrordialog === 'function') {
                    showerrordialog();
                } else {
                    alert("Error updating event. See console for details.");
                }
            }
        });

        return false;
    }

    function ensureSeconds(datetimeLocalVal) {
        if (!datetimeLocalVal) return "";
        if (/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}$/.test(datetimeLocalVal)) {
            return datetimeLocalVal + ":00";
        }
        return datetimeLocalVal;
    }

    function showDeleteEvent(id) {
        if (id == 0) {
            $('#event_entry_modal').modal('hide');
            var iddd = document.getElementById("event_id").value;
            document.getElementById("deleteEventId").value = iddd;
        } else {
            document.getElementById("deleteEventId").value = id;
        }

        $('#delete_event_modal').modal('show');
    }

    function closeDeleteEvent() {
        document.getElementById("deleteEventId").value = "";
        $('#delete_event_modal').modal('hide');
    }
    function deleteEvent() {
        var id = document.getElementById("deleteEventId").value;
        $.ajax({
            url: "delete-event?deletedEventId=" + id,
            type: "POST",
            data: "",
            success: function (response) {
                alert("Event deleted successfully!");
                window.location.reload();
            },
            error: function (xhr, status, error) {
                alert("Failed to delete event. Please try again.");
                // window.location.reload();
            }
        });
    }

</script>

</html>