<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><spring:message code="BzComposer.HelpContentsTitle" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .sidebar { height: 100vh; overflow-y: auto; background-color: #f8f9fa; border-right: 1px solid #dee2e6; }
        .folder-title { font-weight: bold; cursor: pointer; margin-top: 0.5rem; }
        .file-item, .folder-title { cursor: pointer; padding: 0.25rem 0.5rem; border-radius: 0.25rem; }
        .file-item:hover, .folder-title:hover { background-color: #e9ecef; }
        .nested-folder { padding-left: 1.5rem; }
        .nested-folder-item { padding-left: 3rem; }
        .fa-folder { color: #0dcaf0; }
        #resizer { width: 5px; cursor: col-resize; background: #dee2e6; height: 100vh; }
        #mainContent { overflow-y: auto; height: 100vh; padding: 1rem; display: block; }
        .active-item { background-color: #0dcaf0 !important; color: white !important; }
        .loading-spinner { display: flex; justify-content: center; align-items: center; height: 100%; }
    </style>
</head>
<body>
<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>

    <div id="cos">
        <div class="d-flex">
            <!-- Sidebar -->
            <nav id="sidebar" class="sidebar p-3" style="width: 30%;")>
                <c:forEach var="item" items="${helpContents}">
                    <c:if test="${item.parentId == null}">
                        <c:choose>
                            <c:when test="${item.type == 'folder'}">
                                <div class="folder-title" data-bs-toggle="collapse" data-bs-target="#${item.contentId}">
                                    <i class="fas fa-folder"></i> <span><c:out value="${item.title}" /></span>
                                </div>
                                <div id="${item.contentId}" class="collapse nested-folder">
                                    <c:forEach var="child" items="${helpContents}">
                                        <c:if test="${child.parentId == item.contentId}">
                                            <c:choose>
                                                <c:when test="${child.type == 'folder'}">
                                                    <div class="folder-title nested-folder-item" data-bs-toggle="collapse" data-bs-target="#${child.contentId}">
                                                        <i class="fas fa-folder"></i> <span><c:out value="${child.title}" /></span>
                                                    </div>
                                                    <div id="${child.contentId}" class="collapse nested-folder-item">
                                                        <c:forEach var="grandchild" items="${helpContents}">
                                                            <c:if test="${grandchild.parentId == child.contentId}">
                                                                <div class="file-item nested-folder-item" onclick="showContent('${grandchild.contentId}')">
                                                                    <i class="fas fa-file"></i> <span><c:out value="${grandchild.title}" /></span>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="file-item nested-folder-item" onclick="showContent('${child.contentId}')">
                                                        <i class="fas fa-file"></i> <span><c:out value="${child.title}" /></span>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="file-item" onclick="showContent('${item.contentId}')">
                                    <i class="fas fa-file"></i> <span><c:out value="${item.title}" /></span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>
             <!--    <button onclick="refreshSidebar()" class="btn btn-primary m-2">Refresh Sidebar</button> -->
            </nav>

            <!-- Resizer -->
            <div id="resizer"></div>

            <!-- Main Content -->
            <main id="mainContent" class="flex-grow-1">
                <div class="text-center mt-5">
                    <h4>Select a help topic from the sidebar</h4>
                </div>
            </main>
        </div>
    </div>

    <script>
        function showContent(contentId) {
            console.log("showContent called with contentId:", contentId);
            try {
                const mainContent = document.getElementById('mainContent');
                if (!mainContent) throw new Error("Main content area not found");

                mainContent.innerHTML = `
                    <div class="loading-spinner">
                        <div class="spinner-border text-primary" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>`;

                const contextPath = '${pageContext.request.contextPath}';
                console.log("Context Path:", contextPath);
                const url = contextPath + '/help/content/' + encodeURIComponent(contentId);
                console.log("Fetching URL:", url);

                fetch(url)
                    .then(response => {
                        if (!response.ok) throw new Error('Failed to load: ' + response.status);
                        return response.text();
                    })
                    .then(data => {
                        console.log("Response data:", data);
                        mainContent.innerHTML = data;
                        console.log("mainContent HTML:", mainContent.innerHTML);
                        updateActiveItem(contentId);
                        history.pushState({contentId: contentId}, '', '?content=' + contentId);
                        sessionStorage.setItem('lastHelpContent', contentId);
                    })
                    .catch(error => {
                        console.error("Fetch error:", error);
                        mainContent.innerHTML = `
                            <div class="alert alert-danger m-3">
                                <h4>Error</h4>
                                <p>${error.message}</p>
                                <button onclick="showContent('overview')" class="btn btn-sm btn-secondary">
                                    Return to Overview
                                </button>
                            </div>`;
                    });
            } catch (error) {
                console.error("Error in showContent:", error);
                mainContent.innerHTML = `
                    <div class="alert alert-danger m-3">
                        <h4>Error</h4>
                        <p>${error.message}</p>
                        <button onclick="showContent('overview')" class="btn btn-sm btn-secondary">
                            Return to Overview
                        </button>
                    </div>`;
            }
        }

        function updateActiveItem(contentId) {
            if (!contentId) {
                console.warn("contentId is empty, skipping active item update");
                return;
            }

            document.querySelectorAll('.file-item, .folder-title').forEach(item => {
                item.classList.remove('active-item');
            });

            const selector = `[onclick*="showContent('${contentId}')"], [onclick*="showContent(\"${contentId}\")"]`;
            try {
                const activeItem = document.querySelector(selector);
                if (activeItem) {
                    activeItem.classList.add('active-item');
                    expandParentFolders(activeItem);
                } else {
                    console.warn(`No element found for selector: ${selector}`);
                }
            } catch (error) {
                console.error("Error in updateActiveItem:", error);
            }
        }

        function expandParentFolders(element) {
            let parent = element.closest('.collapse');
            while (parent) {
                const parentId = parent.id;
                const trigger = document.querySelector(`[data-bs-target="#${parentId}"]`);
                if (trigger) new bootstrap.Collapse(parent, {toggle: true});
                parent = parent.closest('.collapse');
            }
        }

        function refreshSidebar() {
            fetch('${pageContext.request.contextPath}/help/sidebar')
                .then(response => response.text())
                .then(html => {
                    document.getElementById('sidebar').innerHTML = html;
                })
                .catch(error => console.error('Error refreshing sidebar:', error));
        }

        document.addEventListener('DOMContentLoaded', function() {
            const params = new URLSearchParams(window.location.search);
            const contentId = params.get('content') || sessionStorage.getItem('lastHelpContent') || 'overview';
            showContent(contentId);

            window.addEventListener('popstate', function(event) {
                const contentId = (event.state && event.state.contentId) || 'overview';
                showContent(contentId);
            });

            const resizer = document.getElementById('resizer');
            if (resizer) {
                resizer.addEventListener('mousedown', function(e) {
                    const sidebar = document.getElementById('sidebar');
                    const mainContent = document.getElementById('mainContent');
                    let startX = e.clientX;
                    let startWidth = sidebar.offsetWidth;

                    function doDrag(e) {
                        sidebar.style.width = (startWidth + e.clientX - startX) + 'px';
                        mainContent.style.width = 'calc(100% - ' + sidebar.offsetWidth + 'px)';
                    }

                    function stopDrag() {
                        document.removeEventListener('mousemove', doDrag);
                        document.removeEventListener('mouseup', stopDrag);
                    }

                    document.addEventListener('mousemove', doDrag);
                    document.addEventListener('mouseup', stopDrag);
                });
            }
        });
        
        window.onload = function() {
        	refreshSidebar();
        };
    </script>
</body>
</html>
