<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <script src="https://media.twiliocdn.com/sdk/js/client/v1.13/twilio.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@include file="/WEB-INF/jsp/include/header1.jsp" %>

    <c:if test="${not empty AdminURL && AdminURL=='administer'}">
        <%@include file="/WEB-INF/jsp/include/menuAdmin.jsp" %>
    </c:if>
    <c:if test="${empty AdminURL}">
        <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
    </c:if>
    <title>
        <spring:message code="BzComposer.sales.ContactBoard" />
    </title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
        integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .btn-m-j {
            padding: 15px 3rem;
            font-size: 16px;
            display: flex;
            align-items: center;
            background-color: #efefef;
            color: #000;
            border: none;
        }

        .btn-m-j:hover {
            background-color: #e5e3e3;
            color: #000;
        }

        .btn-m-j:active {
            background-color: #e5e3e3;
            color: #000;
        }

        h1 {
            font-size: 2em;
            font-weight: normal;
        }

        h2,
        h5 {
            font-weight: normal;
        }

        .call-screen {
            background-color: white;
            margin: auto auto;
            width: 400px;
            height: 550px;
            overflow: hidden;
            border-radius: 20px;
            box-shadow: 5px 5px 25px rgba(0, 0, 0, 0.2);
        }

        .call-header {
            width: 100%;
            height: 40px;
            padding: 5px 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.03), 0 10px 40px rgba(0, 0, 0, 0.09);
            display: table;
        }

        @keyframes calling {
            0% {
                opacity: .2;
            }

            20% {
                opacity: 1;
            }

            100% {
                opacity: .2;
            }
        }

        @keyframes calling2 {
            0% {
                box-shadow: 0px 0px 0px 0px rgba(62, 149, 255, 0.09);


            }

            50% {
                box-shadow: 0px 0px 0px 5px rgba(62, 149, 255, 0.2);

            }

            100% {
                box-shadow: 0px 0px 0px 15px rgba(62, 149, 255, 0.5);

            }
        }

        .caller-id span {
            animation-name: calling;
            animation-duration: 1s;
            animation-iteration-count: infinite;
            animation-fill-mode: both;
        }

        .caller-id span:nth-child(2) {
            animation-delay: .2s;
        }

        .caller-id span:nth-child(3) {
            animation-delay: .4s;
        }

        .caller-id,
        .caller-time {
            display: table-cell;
        }

        .caller-id {
            width: 50%;
        }

        .caller-time {
            width: 40%;
            text-align: right;
        }

        .caller-img {
            font-size: 40px;
            font-weight: 500;
            width: 100px;
            border-radius: 50%;
            height: 100px;
            overflow: hidden;
            margin: 15% auto;
            border: 1px solid rbga(0, 0, 0, 0.1);
            animation: calling2 0.8s ease-in-out infinite alternate;
            justify-content: center;
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .caller-img img {
            width: 100%;
        }
        .caller-img img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .on-call-caller-img {
            font-size: 40px;
            font-weight: 500;
            width: 100px;
            border-radius: 50%;
            height: 100px;
            overflow: hidden;
            margin: 15% auto;
            justify-content: center;
            background-color: #81979e;
            color: white;
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .on-call-caller-img img {
            width: 100%;
        }
        .on-call-caller-img img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .caller-details {
            width: 100%;
            text-align: center;
        }

        .caller-control {
            width: 100%;
            text-align: center;
            display: flex;
            justify-content: center;
            gap: 30px;
        }
        .caller-control-a-d {
            width: 100%;
            text-align: center;
            justify-content: center;
            gap: 30px;
        }

        .call-icon {
            padding: 20px;
            background-color: #fff;
            border-radius: 50%;
            color: black;
            height: 50px;
            width: 50px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.23), 0 10px 40px rgba(0, 0, 0, 0.19);
            transition: 0.5s ease-in-out;

        }

        .call-icon:hover {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.33), 0 10px 40px rgba(0, 0, 0, 0.39);
            transition: 0.5s ease-in-out;
        }

        .call-drop {
            color: red;
        }

        .agent-search-dialog {
            padding: 10px 20px;
            display: none;
        }

        label {
            display: block;
            margin: -80px 20px;
            font-size: 10px;
            text-align: left;
        }

        input {
            display: block;
            height: 40px;
            width: 330px;
            font-size: 18px;
            padding: 0 10px;
            margin: 15px auto;
            border: 1px solid rgba(0, 0, 0, .3);
            border-radius: 4px;
            box-shadow: 10px 10px 20px rgba(0, 0, 0, .2);
        }
    </style>
    <style>
        .call-screen-wrapper {
            position: fixed;
            top: 100px;
            right: 20px;
            width: 300px;
            z-index: 1050;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            cursor: move;
        }

        .call-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }




        .call-icon {
            font-size: 18px;
            color: white;
            background-color: #81979e;
            padding: 10px;
            border-radius: 50%;
            text-decoration: none;
        }
        .blink-icon {
            animation: blinkColor 1s infinite;
        }

        @keyframes blinkColor {
            0% { color: white; }
            50% { color: #1ebc70; }
            100% { color: white; }
        }

        #caller-customer-details{
            display: none;
        }
        #incomingPopup, #OnCallerControlIncomingPopup {
            display: none;
        }
        #overlay {
            display: none;
            position: fixed;
            top: 0; left: 0;
            height: 100%; width: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 999;
        }

    </style>
</head>

<body>
    <!-- begin shared/header -->
    <div id="ddcolortabsline">&nbsp;</div>
        <div id="cos">
            <div class="statusquo ok">
                <div id="hoja">
                    <div id="blanquito">
                        <div id="padding">
                            <!-- begin Contents -->
                            <div>
                                <div style="float: left;">
                                    <span
                                        style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
                                        <spring:message code="BzComposer.JobBooking.Calls" />
                                    </span>
                                </div>
                            </div>
                            <div style="padding-top: 60px;">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="ms-5">
                                            <div>
                                                <button type="button" class="btn btn-lg btn-m-j"
                                                    style="width: 225px;">
                                                    <svg xmlns="http://www.w3.org/2000/svg"
                                                        xmlns:xlink="http://www.w3.org/1999/xlink"
                                                        width="28" height="28" viewBox="0 0 512 512"
                                                        style="margin-right: 15px;">
                                                        <image
                                                            xlink:href="data:image/png;base64,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"
                                                            x="0" y="0" width="512" height="512" />
                                                    </svg>
                                                    Manual Job
                                                </button>
                                            </div>
                                            <div id="caller-customer-details" style="padding: 10px;background: #1ebc70;color: white;width: 225px;border-radius: 5px;margin-top: 70px;">
                                                <div class="row">
                                                    <div class="col-sm-2">
                                                        <i class="fa fa-phone blink-icon" aria-hidden="true"
                                                            style="font-size: 20px; padding-top: 5px; margin-left: 10px;"></i>
                                                    </div>
                                                    <div class="col-sm-10">
                                                        <div style="color: white !important;"><span style="color: white !important;" id="callerPhone1">Unknown</span></div>
                                                        <div style="color: white !important;"><span style="color: white !important;" id="customerName">Unknown</span></div>
                                                        <div style="color: white !important;"><span style="color: white !important;" id="customerType">Unknown</span></div>
                                                        <!-- <div style="color: white !important;"><span style="color: white !important;">Facebook</span> </div> -->
                                                        <div id="customerCallTimer" style="color: white !important;"><span id="timerText" style="color: white !important;">00:00</span></div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-9 p-3" style="border: 1px solid #c6c6c6;height: 500px;">
                                        <div id="callInfo">Waiting for call...</div>
                                    </div>

                                </div>
                            </div>
                            <div>
                                <input type="hidden" name="tabid" id="tabid" value="" />
                                <input type="hidden" id="selectedCvID" value="${selectedCvID}" />
                                <c:forEach items="${CustomerDetails}" var="objList" varStatus="loop">
                                    <input type="hidden" id="selectedCvIndex${objList.clientVendorID}"
                                        value="${loop.index}" />
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    <div id="incomingPopup" class="call-screen-wrapper">
        <div class="call-header">
            <div class="caller-id">
                <span>Phone Call</span>
            </div>
            <div class="caller-time">
                <!-- <i class="fa fa-close" style="font-size: 20px;"></i> -->
            </div>
        </div>
        <div class="call-body">
            <div class="caller-img">
                PM
            </div>
            <div class="caller-details">
                <div class="py-1"><span>Incoming call from</span></div>
                <div class="py-1"><span class="h4" id="callerPhoneName1">Unknown</span></div>
                <div class="py-1"><span id="callerPhone2">Unknown</span></div>


            </div>
            <div class="caller-control-a-d py-4" id="CallerControl">
                <div>
                    <button onclick="acceptPopupCall()" class="btn btn-lg btn-primary" style="width: 90%;font-size: 14px;">ANSWER</button>
                </div>
                <div>
                    <button onclick="declinePopupCall()" class="btn btn-lg" style="width: 90%;font-size: 14px;">DECLINE</button>
                </div>
            </div>
            <div class="agent-search-dialog">
                <input name="agent-id" type="text" />
                <label for="agent-id">Search Agent</label>
            </div>
        </div>
    </div>
    <div id="OnCallerControlIncomingPopup" class="call-screen-wrapper">
        <div class="call-header">
            <div class="caller-id">
                <span>Phone Call</span>
            </div>
            <div class="caller-time">
                <!-- <i class="fa fa-close" style="font-size: 20px;"></i> -->
            </div>
        </div>
        <div class="call-body">
            <div class="on-call-caller-img">
                PM
            </div>
            <div class="caller-details">
                <div class="py-1"><span class="h4" id="callerPhoneName">Unknown</span></div>
                <div class="py-1"><span id="callerPhone">Unknown</span></div>
                <span id="timerTextOnCall" class="py-1">00:00</span></div>

            </div>
            <div class="caller-control  py-4">
                <a onclick="toggleMute()" class="call-icon call-pause" id="call-pause" style="cursor: pointer;">
                    <img id="mic-icon" src="images/icons/mic-mute.png" width="30px" />
                </a>
                <a onclick="toggleHold()" class="call-icon call-transfer" id="call-transfer" style="cursor: pointer;">
                    <img src="images/icons/call-hold.png" width="30px"/>
                </a>
                <a onclick="hangUp()" class="call-icon call-drop" id="call-drop" style="cursor: pointer;">
                    <img src="images/icons/hang-up-256.png" width="30px"/>
                </a>
            </div>
            <div class="agent-search-dialog">
                <input name="agent-id" type="text" />
                <label for="agent-id">Search Agent</label>
            </div>
        </div>
    </div>




    <script>
        const dragElement = (elmnt) => {
            let pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
            elmnt.onmousedown = dragMouseDown;

            function dragMouseDown(e) {
                e.preventDefault();
                // get initial cursor position
                pos3 = e.clientX;
                pos4 = e.clientY;
                document.onmouseup = closeDragElement;
                document.onmousemove = elementDrag;
            }

            function elementDrag(e) {
                e.preventDefault();
                // calculate new cursor position
                pos1 = pos3 - e.clientX;
                pos2 = pos4 - e.clientY;
                pos3 = e.clientX;
                pos4 = e.clientY;
                // set element's new position
                elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
                elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
            }

            function closeDragElement() {
                document.onmouseup = null;
                document.onmousemove = null;
            }
        };

        // Make the call screen draggable
        dragElement(document.getElementById("incomingPopup"));
    </script>
<script>
    let device;
    let pendingConnection = null;
    let isMuted = false;
    let isOnHold = false;

    let timerInterval;
    let secondsElapsed = 0;
    let timerIntervalon;
    let secondsElapsedon = 0;

    function startTimerOn() {
        clearInterval(timerIntervalon); // Clear any previous timer
        secondsElapsedon = 0;
        timerIntervalon = setInterval(() => {
            secondsElapsedon++;
            const minutes = String(Math.floor(secondsElapsedon / 60)).padStart(2, '0');
            const seconds = String(secondsElapsedon % 60).padStart(2, '0');
            document.getElementById("timerTextOnCall").innerText = minutes+ ":" +seconds;
        }, 1000);
    }

    function stopTimerOn() {
        clearInterval(timerIntervalon);
        document.getElementById("timerTextOnCall").innerText = "00:00";
    }

    function startTimer() {
        clearInterval(timerInterval); // Clear any previous timer
        secondsElapsed = 0;
        timerInterval = setInterval(() => {
            secondsElapsed++;
            const minutes = String(Math.floor(secondsElapsed / 60)).padStart(2, '0');
            const seconds = String(secondsElapsed % 60).padStart(2, '0');
            document.getElementById("timerText").innerText = minutes+ ":" +seconds;
        }, 1000);
    }

    function stopTimer() {
        clearInterval(timerInterval);
        document.getElementById("timerText").innerText = "00:00";
    }

    function setupDevice() {
        checkAudioPermission();

        fetch('/token')
            .then(res => res.json())
            .then(data => {
                device = new Twilio.Device(data.token, { debug: true });

                device.on('ready', function () {
                    console.log("✅ Twilio Device Ready");
                });

                device.on('incoming', function (connection) {
                    console.log("✅ Twilio incoming");
                    pendingConnection = connection;
                    // Get caller's number
                    const callerNumber = connection.parameters.From;
                    document.getElementById("callerPhone").innerText = callerNumber;
                    document.getElementById("callerPhone1").innerText = callerNumber;
                    document.getElementById("callerPhone2").innerText = callerNumber;
                    // Call your API to fetch customer details
                    fetch("/calls/get-customer-details?phoneNumber="+encodeURIComponent(callerNumber))
                        .then(response => response.json())
                        .then(data => {
                            console.log("📞 Customer details fetched:", data);
                            // Assuming you have an element to show customer name/details
                            if (data) {
                                document.getElementById("customerName").innerText = data.name;
                                document.getElementById("callerPhoneName1").innerText = data.name;
                                document.getElementById("callerPhoneName").innerText = data.name;
                                if(data.customerType != "NA"){
                                    document.getElementById("customerType").innerText = data.customerType;
                                }else{
                                    document.getElementById("customerType").style.display = "none";
                                }

                            } else {
                                document.getElementById("customerName").innerText = "Unknown caller";
                            }
                        })
                        .catch(error => {
                            console.error("❌ Error fetching customer details:", error);
                        });
                    showPopup('incomingPopup');
                    showPopup('caller-customer-details');
                    startTimer();
                });

                device.on('disconnect', function () {
                    document.getElementById("callInfo").innerText = "📴 Call ended.";
                    hidePopup('OnCallerControlIncomingPopup');
                    hidePopup('caller-customer-details');
                    stopTimer();
                });
                device.on('cancel', function () {
                    document.getElementById("callInfo").innerText = "📴 Call Canceled.";
                    hidePopup('OnCallerControlIncomingPopup');
                    hidePopup('incomingPopup');
                    hidePopup('caller-customer-details');
                    stopTimer();
                });
                device.on('error', function (error) {
                    console.error("❌ Twilio Error:", error);
                });
            });
    }

    function checkAudioPermission() {
        const audioContext = new (window.AudioContext || window.webkitAudioContext)();
        if (audioContext.state === 'suspended') {
            document.body.addEventListener('click', () => {
                audioContext.resume().then(() => {
                    console.log('🔊 AudioContext resumed after user gesture');
                });
            }, { once: true });

            alert('🔒 Please click anywhere to enable audio.');
        }

        navigator.mediaDevices.getUserMedia({ audio: true })
            .then(stream => {
                console.log("✅ Microphone access granted");
                stream.getTracks().forEach(track => track.stop());
            })
            .catch(error => {
                console.error("❌ Microphone permission denied", error);
                alert("Please allow microphone access for calling.");
            });
    }


    function showPopup(id) {
        document.getElementById(id).style.display = 'block';
    }

    function hidePopup(id) {
        document.getElementById(id).style.display = 'none';
    }

    function acceptPopupCall() {
        if (pendingConnection) {
            pendingConnection.accept();
            document.getElementById("callInfo").innerText = "✅ Call connected!";
            const callerNumber = pendingConnection.parameters.From || "Unknown";
            document.getElementById("callerPhone").innerText = callerNumber;
            document.getElementById("callerPhone1").innerText = callerNumber;
            document.getElementById("callerPhone2").innerText = callerNumber;
        }
        hidePopup('incomingPopup');
        showPopup('OnCallerControlIncomingPopup');
        startTimerOn()
    }

    function declinePopupCall() {
        if (pendingConnection) {
            pendingConnection.reject();
            document.getElementById("callInfo").innerText = "❌ Call declined.";
        }
        hidePopup('incomingPopup');
        hidePopup('OnCallerControlIncomingPopup');
        hidePopup('caller-customer-details');
        stopTimer();
    }

    function toggleMute() {
    if (pendingConnection) {
        isMuted = !isMuted;
        pendingConnection.mute(isMuted);

        // Change icon based on mute state
        const micIcon = document.getElementById('mic-icon');
        micIcon.src = isMuted ?  'images/icons/mic-unmute.png' : 'images/icons/mic-mute.png';

        console.log(isMuted ? "🔇 Muted" : "🔊 Unmuted");
    }
}


    function toggleHold() {
        if (pendingConnection) {
            isOnHold = !isOnHold;

            if (isOnHold) {
                pendingConnection.mute(true); // Mute mic
                document.getElementById("callInfo").innerText = "⏸️ Call on Hold";
            } else {
                pendingConnection.mute(false); // Unmute mic
                document.getElementById("callInfo").innerText = "📞 Call Resumed";
            }
        }
    }


    function hangUp() {
        if (pendingConnection) {
            pendingConnection.disconnect();
            document.getElementById("callInfo").innerText = "❌ Call ended.";
            hidePopup('incomingPopup');
            hidePopup('OnCallerControlIncomingPopup');
            hidePopup('caller-customer-details');
            stopTimer();
            stopTimerOn()
        }
    }

    setupDevice();
</script>



    <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
        <link rel="stylesheet"
            href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
        <script src="${pageContext.request.contextPath}/includeAll/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/includeAll/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/includeAll/jquery-ui.css" />
        <script type="text/javascript"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>

</html>