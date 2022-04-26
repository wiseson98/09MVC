<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�Ǹ� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">�Ǹ� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">���� ��¥</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��� ����</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase"  items="${ list }">
		<c:set var="i" value="${ i+1 }" />	
		<tr class="ct_list_pop">
			<td align="center">
				<a href="/purchase/getPurchase?tranNo=${ purchase.tranNo }">${ i }</a>
			</td>
			<td></td>
			<td align="left">
				<a href="/product/getProduct?prodNo=${ purchase.purchaseProd.prodNo }">${ purchase.purchaseProd.prodNo }</a>
			</td>
			<td></td>
			<td align="left">${ purchase.buyer.userId }</td>
			<td></td>
			<td align="left">${ purchase.orderDate }</td>
			<td></td>
			<td align="left">
				<c:if test="${ purchase.tranCode  == '002' }">
					���ſϷ�					
				</c:if>
				<c:if test="${ purchase.tranCode == '003' }">
					�����
				</c:if>
				<c:if test="${ purchase.tranCode  ==  '004' }">
					��ۿϷ�
				</c:if>			
			</td>
			<td></td>
			<td align="left">
				<c:if test="${ purchase.tranCode == '002' }">
					<a href="/purchase/updateTranCode?tranNo=${ purchase.tranNo }&tranCode=003&menu=manage">����ϱ�</a>
				</c:if>
			</td>
			<td></td>
		</tr>	
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>		
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp" />			
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>