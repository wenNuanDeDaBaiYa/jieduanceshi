<%@page contentType="text/html; UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Title and other stuffs -->
    <title>百知后台登录页面</title>
    <!-- Stylesheets 样式 -->
    <link href="http://system.tjldsd.com:80/style/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://system.tjldsd.com:80/style/animate.css" />
    <link href="http://system.tjldsd.com:80/style/loginstyle.css" rel="stylesheet" />
    <script type="text/javascript">
    </script>
</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">BZ</h1>
        </div>
        <h3>百知仓库后台管理系统</h3>
        <form class="m-t" action="${pageContext.request.contextPath}/admin/login" method="post">
            <span style="color: red">${message}</span>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="用户名" name="name"/>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" name="password"/>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录
            </button>
        </form>
    </div>
</div>
</body>
</html>