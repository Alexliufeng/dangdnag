<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Xsy
  Date: 2020/7/14
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>
<%@ include file="/front/commons/header.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <img src="images/DDlogoNEW.gif" alt="">
        </div>
        <div class="col-md-6">
            <form action="${pageContext.request.contextPath}/front/Front_selectByValue">
                <div class="input-group navbar-btn">
                    <input type="text" name="value" placeholder="搜索关键字" id="" class="form-control">
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-search"></span></button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-3">
            <ul class="nav nav-pills">
                <li class="bg-success"><a href=""><span class="text-muted">购物车</span><span class="badge">0</span></a></li>
                <li class="bg-info"><a href=""><span class="text-muted">我的订单</span></a></li>
            </ul>
        </div>
    </div>

    <div class="navbar navbar-default">
        <div class="container-fluid">
            <ol class="breadcrumb navbar-left navbar-btn">
                <span>你当前所在的位置：</span>
                <li><a href="main.html">当当图书</a></li>
                <li >搜索</li>
                <li class="active">${value}</li>
            </ol>

            <ul class="pager navbar-right navbar-btn">
                <li>第 <span>${page.pageNum}</span> 页</li>
                <c:if test="${!page.hasPreviousPage}">
                    <li class="disabled"><a href="javascript:void(0)">上一页</a></li>
                </c:if>
                <c:if test="${page.hasPreviousPage}">
                    <li><a href="${pageContext.request.contextPath}/front/searchBook?bookName=${bookName}&page=${page.pageNum-1}&size=${page.pageSize}">上一页</a></li>
                </c:if>

                <c:if test="${page.hasNextPage}">
                    <li><a href="${pageContext.request.contextPath}/front/searchBook?bookName=${bookName}&page=${page.pageNum+1}&size=${page.pageSize}">下一页</a></li>
                </c:if>
                <c:if test="${!page.hasNextPage}">
                    <li class="disabled"><a href="javascript:void(0)">下一页</a></li>
                </c:if>
                <li>共 <span>${page.pages}</span> 页</li>
            </ul>

        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="media-list">
                        <c:forEach var="b" items="${list5}">
                            <li class="media">
                                <div class="media-left media-middle">
                                    <a href="${pageContext.request.contextPath}/front/showOneBook?id=${b.id}"><img class="media-object" src="${b.cover}" alt="" style="width:150px"></a>
                                </div>
                                <div class="media-body">
                                    <a href="${pageContext.request.contextPath}/front/showOneBook?id=${b.id}"><h5 class="text-primary">${b.name}</h5></a>
                                    <hr>
                                    <p class="small text-muted">作者：<span>${b.author}</span></p>
                                    <p class="small text-muted">出版社：<span>${b.press}</span>
                                        出版时间：<span><fmt:formatDate value="${b.press_date}" pattern="yyyy-MM-dd"/> </span></p>
                                    <p>${b.editorRecommend}</p>
                                    <p><del class="">￥${b.price}</del> <strong style="color:red">￥${b.dprice}</strong> 节省：<span class="text-success">￥${b.price - b.dprice}</span>
                                        <a href="${pageContext.request.contextPath}/front/cart/addCart?id=${b.id}" class="btn btn-danger">加入购物车</a>
                                    </p>
                                </div>
                            </li>
                            <hr>
                        </c:forEach>

                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
