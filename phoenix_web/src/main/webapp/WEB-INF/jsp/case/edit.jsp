<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/Css/style.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/xheditor/xheditor-1.2.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/xheditor/xheditor_lang/zh-cn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Js/ckform.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Js/common.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
</head>
<sf:form method="post" action="editor" modelAttribute="caseDTO">
<sf:hidden path="id" value="${caseBean.id }"/>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">所属场景</td>
        <td><sf:input path="scenId" value="${caseBean.scenarioBean.id}"/><sf:errors path="scenId"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">用例名称</td>
        <td><sf:input path="caseName" value="${caseBean.caseName}"/><sf:errors path="caseName"/></td>
    </tr>
    <tr>
        <td class="tableleft">用例说明</td>   
        <td><sf:input path="remark" value="${caseBean.remark}"/><sf:errors path="remark"/></td>
    </tr>   
    <tr>
        <td class="tableleft">启用状态</td>
        <td>
            <c:choose>
               <c:when test="${caseBean.status eq 1}">
                  <input type="radio" name="status" value="1" checked="checked"/> 已启用
                  <input type="radio" name="status" value="0"/> 未启用
               </c:when>
               <c:otherwise>
                  <input type="radio" name="status" value="1"/> 已启用
                  <input type="radio" name="status" value="0"  checked="checked"/> 未启用
               </c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td class="tableleft">脚本内容</td>
        <td>
            <!-- cssClass="xheditor-simple" -->
            <textarea name="codeContent" style="height:300px;width:100%;">${caseBean.codeContent }</textarea>
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary">提交</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</sf:form>
<script type="text/javascript">
    $(function () {       
		$('#backid').click(function(){
			var localObj = window.location;
			var contextPath = localObj.pathname.split("/")[1];
			var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
			window.location.href=basePath+"/case/list";
		 });

    });
</script>
</body>
</html>