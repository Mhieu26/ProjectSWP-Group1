<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${messSuccess != null}">
            <div style="color: darkseagreen">
                ${messSuccess}
            </div>
        </c:if>
        <c:if test="${messError != null}">
            <div style="color: darkred">
                ${messError}
            </div>
        </c:if>
    </body>
</html>
