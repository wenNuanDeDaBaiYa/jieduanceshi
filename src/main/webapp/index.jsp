<%@ page contentType="text/html;charset=UTF-8"  isELIgnored="false" pageEncoding="UTF-8" %>
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
                caption:"供应表",
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
        function add() {
            $("#table").jqGrid('editGridRow', 'new', {
                height: 300,
                reloadAfterSubmit: true
            });
        }
    </script>

</head>
<body>

<table id="table"></table>
<div id="pager"></div>
</body>
</html>