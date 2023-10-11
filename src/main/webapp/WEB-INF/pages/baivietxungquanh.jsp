<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bài vi?t xung quanh</title>
</head>
<body>
    <c:forEach items="${baiviet}" var="p">
        <p>${p.tenBaiViet}<p>
    </c:forEach>


 
</body>
</html>
