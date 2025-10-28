<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
    <title><tiles:getAsString name="title"/></title>
</head>
<body>

<!-- Header -->
<tiles:insertAttribute name="header" ignore="true"/>

<!-- Main body -->
<tiles:insertAttribute name="body" ignore="true"/>

<!-- Footer -->
<tiles:insertAttribute name="footer" ignore="true"/>

</body>
</html>
