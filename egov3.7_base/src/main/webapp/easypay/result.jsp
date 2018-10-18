<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>KICC EASYPAY8.0 SAMPLE</title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./js/default.js"></script>
<%!
/**
 * 파라미터 체크 메소드
 */
public String getNullToSpace(String param) {
	return (param == null) ? "" : param.trim();
}
%>
<%
request.setCharacterEncoding("utf-8");

// CA : 카드승인, CAO : 카드승인옵션 
// CC : 카드승인취소, CCO : 카드승인취소옵션, CPC : 카드매입취소 

String res_cd               = getNullToSpace(request.getParameter("res_cd"));           // 응답코드          (CA, CAO, CC, CCO, CPC)
String res_msg              = getNullToSpace(request.getParameter("res_msg"));          // 응답메시지        (CA, CAO, CC, CCO, CPC)
String cno                  = getNullToSpace(request.getParameter("cno"));              // PG거래번호        (CA, CAO, CC, CCO, CPC)
String amount               = getNullToSpace(request.getParameter("amount"));           // 총 결제금액       (CA,                  )
String order_no             = getNullToSpace(request.getParameter("order_no"));         // 주문번호          (CA,                  )
String auth_no              = getNullToSpace(request.getParameter("auth_no"));          // 승인번호          (CA,                  )
String tran_date            = getNullToSpace(request.getParameter("tran_date"));        // 승인일시          (CA,      CC,      CPC)
String escrow_yn            = getNullToSpace(request.getParameter("escrow_yn"));        // 에스크로 사용유무 (CA,                  )
String complex_yn           = getNullToSpace(request.getParameter("complex_yn"));       // 복합결제 유무     (CA,                  )
String stat_cd              = getNullToSpace(request.getParameter("stat_cd"));          // 상태코드          (CA,      CC,      CPC)
String stat_msg             = getNullToSpace(request.getParameter("stat_msg"));         // 상태메시지        (CA,      CC,      CPC)
String pay_type             = getNullToSpace(request.getParameter("pay_type"));         // 결제수단          (CA,                  )
String mall_id              = getNullToSpace(request.getParameter("mall_id"));          // 가맹점 Mall ID    (CA                   )
String card_no              = getNullToSpace(request.getParameter("card_no"));          // 카드번호          (CA,          CCO     )
String issuer_cd            = getNullToSpace(request.getParameter("issuer_cd"));        // 발급사코드        (CA,          CCO     )
String issuer_nm            = getNullToSpace(request.getParameter("issuer_nm"));        // 발급사명          (CA,          CCO     )
String acquirer_cd          = getNullToSpace(request.getParameter("acquirer_cd"));      // 매입사코드        (CA,          CCO     )
String acquirer_nm          = getNullToSpace(request.getParameter("acquirer_nm"));      // 매입사명          (CA,          CCO     )
String install_period       = getNullToSpace(request.getParameter("install_period"));   // 할부개월          (CA,          CCO     )
String noint                = getNullToSpace(request.getParameter("noint"));            // 무이자여부        (CA                   )
String part_cancel_yn       = getNullToSpace(request.getParameter("part_cancel_yn"));   // 부분취소 가능여부 (CA                   )
String card_gubun           = getNullToSpace(request.getParameter("card_gubun"));       // 신용카드 종류     (CA                   )
String card_biz_gubun       = getNullToSpace(request.getParameter("card_biz_gubun"));   // 신용카드 구분     (CA                   )
String cpon_flag            = getNullToSpace(request.getParameter("cpon_flag"));        // 쿠폰 사용유무     (    CAO,     CCO     )
String used_cpon            = getNullToSpace(request.getParameter("used_cpon"));        // 쿠폰 사용금액     (    CAO              )
String canc_acq_date        = getNullToSpace(request.getParameter("canc_acq_date"));    // 매입취소일시      (                  CPC)
String canc_date            = getNullToSpace(request.getParameter("canc_date"));        // 취소일시          (CC,               CPC)
String account_no           = getNullToSpace(request.getParameter("account_no"));       // 계좌번호          (CC,                  )
%>

<body>
<table border="0" width="910" cellpadding="10" cellspacing="0">
	<tr>
		<td>
			<table border="0" width="900" cellpadding="0" cellspacing="0">
				<tr>
					<td height="30" bgcolor="#FFFFFF" align="left">&nbsp;<img src="./img/arow3.gif" border="0" align="absmiddle">&nbsp;<b>결과</b></td>
				</tr>
				<tr>
					<td height="2" bgcolor="#2D4677"></td>
				</tr>
			</table>
			<table border="0" width="900" cellpadding="0" cellspacing="0">
				<tr>
					<td height="5"></td>
				</tr>
			</table>
			<table border="0" width="1000" cellpadding="0" cellspacing="1" bgcolor="#DCDCDC">
				<tr>
					<td height="25" bgcolor="#EDEDED" width="150">&nbsp;응답코드</td>
					<td bgcolor="#FFFFFF" width="180">&nbsp;<%=res_cd%></td>
					<td bgcolor="#EDEDED" width="150">&nbsp;응답메시지</td>
					<td bgcolor="#FFFFFF" width="180">&nbsp;<%=res_msg%></td>
					<td height="25" bgcolor="#EDEDED" width="150">&nbsp;PG거래번호</td>
					<td bgcolor="#FFFFFF" width="180">&nbsp;<%=cno%></td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;총 결제금액</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=amount%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;주문번호</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=order_no%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;승인번호</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=auth_no%></td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;승인일시</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=tran_date%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;에스크로 사용유무</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=escrow_yn%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;복합결제 유무</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=complex_yn%></td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;상태코드</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=stat_cd%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;계좌번호</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=account_no%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;결제수단</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=pay_type%></td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;가맹점 Mall ID</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=mall_id%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;카드번호</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=card_no%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;발급사코드</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=issuer_cd%></td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;발급사명</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=issuer_nm%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;매입사코드</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=acquirer_cd%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;매입사명</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=acquirer_nm%></td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;할부개월</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=install_period%></td>
					<td bgcolor="#EDEDED">&nbsp;무이자여부</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=noint%></td>
					<td bgcolor="#EDEDED">&nbsp;</td>
					<td bgcolor="#FFFFFF">&nbsp;</td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;부분취소 가능여부</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=part_cancel_yn%></td>
					<td bgcolor="#EDEDED">&nbsp;신용카드 종류</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=card_gubun%></td>
					<td height="25" bgcolor="#EDEDED">&nbsp;신용카드 구분</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=card_biz_gubun%></td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;쿠폰 사용유무</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=cpon_flag%></td>
					<td bgcolor="#EDEDED">&nbsp;쿠폰 사용금액</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=used_cpon%></td>
					<td bgcolor="#EDEDED">&nbsp;매입취소일시</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=canc_acq_date%></td>
				</tr>
				<tr>
					<td height="25" bgcolor="#EDEDED">&nbsp;취소일시</td>
					<td bgcolor="#FFFFFF">&nbsp;<%=canc_date%></td>
					<td bgcolor="#EDEDED">&nbsp;</td>
					<td bgcolor="#FFFFFF">&nbsp;</td>
					<td bgcolor="#EDEDED">&nbsp;</td>
					<td bgcolor="#FFFFFF">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>