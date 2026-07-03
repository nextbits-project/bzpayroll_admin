<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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