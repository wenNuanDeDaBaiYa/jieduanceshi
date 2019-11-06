<%@page contentType="text/html; UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!--引入BootStrap的css样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <!--BootStrap与JQGRID整合后的css样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot-jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <!--引入jquery的js文件-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.3.1.min.js"></script>
    <!--引入BootStrap的js文件-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <!--jqgrid与bootstrap整合的国际化的js文件-->
    <script src="${pageContext.request.contextPath}/boot-jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <!--jqgrid与bootstrap整合的js文件-->
    <script src="${pageContext.request.contextPath}/boot-jqgrid/js/trirand/jquery.jqGrid.min.js"></script>
    <script type="application/javascript">
        $(function () {
            $("#table").jqGrid({
                styleUI:"Bootstrap",
                url:"${pageContext.request.contextPath}/supplier/SelectAll",//获取数据地址
                datatype:"json",//自动把后台响应回json协议
                cellEdit:true,
                autowidth:true,
                pager:"#pager",
                rowNum:2,
                rowList:["2","4","6"],
                viewrecords:true,
                editurl:"${pageContext.request.contextPath}/supplier/dml",
                colNames:["供应商ID","供应商名称","负责人","联系电话","操作"],
                colModel:[
                    {name:"id"},
                    {name:"name",editable: true},
                    {name:"leader",editable: true},
                    {name:"phone",editable: true},
                    {
                        name: "option", formatter: function (cellvalue, options, rowObject) {
                            return "<a class='btn btn-primary' onclick=\"del('" + rowObject.id + "')\">删除</a>&nbsp;<a class='btn btn-info' onclick=\"update('" + rowObject.id + "')\">修改</a>";
                        }
                    }
                ],
            }).jqGrid("navGrid","#pager",{edit:true});
            $("#add").click(function () {
                $("#table").jqGrid('editGridRow', 'new', {
                    height: 300,
                    reloadAfterSubmit: true
                });
            })
        });
        function update(rowid) {
            if(rowid!=null)
                $("#table").jqGrid('editGridRow',rowid,{
                    height:300,
                    reloadAfterSubmit:true
                });
            else
                alert("请选择一行修改")
        }

        function del(rowid) {
            if(rowid!=null)
                $("#table").jqGrid('delGridRow',rowid,{
                    height:300,
                    reloadAfterSubmit:true
                });
            else
                alert("请选择一行删除")
        }
    </script>

</head>
<body>

<!--导航条-->
<nav class="navbar navbar-default">

    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header row">
            <div class="col-sm-4">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#a">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="col-sm-8 col-md-12">
                <a class="navbar-brand" href="#">仓库管理系统</a>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="a">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <li><a href="#"><span class="glyphicon glyphicon-user">admin</span></a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--流式布局-->
<div class="container-fluid">
    <div class="row">
        <!--左-->
        <div class="col-md-2">

            <!--手风琴-->
            <div class="panel-group" id="accordion" >

                <div class="panel panel-default">
                    <div class="panel-heading" >
                        <h4 class="panel-title">
                            <a  data-toggle="collapse" data-parent="#accordion" href="#collapseOne" >
                                库存管理
                            </a>
                        </h4>
                    </div>
                    <!--展示的具体内容-->
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <a href="javaScript:$('#carousel-example-generic').load('./fubei.html')">用户列表</a>
                        </div>
                        <div class="panel-body">
                            用户添加
                        </div>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading" >
                        <h4 class="panel-title">
                            <a  data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" >
                                出入库管理管理
                            </a>
                        </h4>
                    </div>
                    <!--展示的具体内容-->
                    <div id="collapseTwo" class="panel-collapse collapse ">
                        <div class="panel-body">
                            图书列表
                        </div>
                        <div class="panel-body">
                            订单添加
                        </div>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading" >
                        <h4 class="panel-title">
                            <a  data-toggle="collapse" data-parent="#accordion" href="#collapseThree" >
                                人员管理
                            </a>
                        </h4>
                    </div>
                    <!--展示的具体内容-->
                    <div id="collapseThree" class="panel-collapse collapse ">
                        <div class="panel-body">
                        </div>
                        <div class="panel-body">
                            用户添加
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" >
                        <h4 class="panel-title">
                            <a  data-toggle="collapse" data-parent="#accordion" href="#collapseFour" >
                                基础数据
                            </a>
                        </h4>
                    </div>
                    <!--展示的具体内容-->
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                            供应商信息管理
                        </div>
                        <div class="panel-body">
                            客户信息管理
                        </div>
                        <div class="panel-body">
                            货物信息管理
                        </div>
                        <div class="panel-body">
                            仓库信息管理
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" >
                        <h4 class="panel-title">
                            <a  data-toggle="collapse" data-parent="#accordion" href="#collapseThreefive" >
                                系统维护
                            </a>
                        </h4>
                    </div>
                    <!--展示的具体内容-->
                    <div id="collapseThreefive" class="panel-collapse collapse ">
                        <div class="panel-body">
                        </div>
                        <div class="panel-body">
                            用户添加
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-10">

            <div class="panel panel-default">
                <div class="panel-heading">供应商信息管理</div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-8">
                            <form class="form-inline">

                                <div class="form-group">
                                    <select name="sousuo" class="form-control">
                                        <option value="请选择">所有</option>
                                        <option value="供应商ID">供应商ID</option>
                                        <option value="供应商名称">供应商名称</option>
                                        <option value="负责人">负责人</option>
                                        <option value="联系电话">联系电话</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control">
                                </div>
                                <button class="btn btn-success">查询</button>
                            </form>

                        </div>
                    </div>
                </div>
                <a href="#" id="add" class="btn btn-default"><span class="glyphicon glyphicon-plus">添加</span></a>
                <div class="panel-body">
                    <table id="table"></table>
                    <div id="pager"></div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>