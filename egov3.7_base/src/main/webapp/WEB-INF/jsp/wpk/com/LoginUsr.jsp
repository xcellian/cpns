<%
/**
 * @Class Name : EgovAuthorGroupManage.java
 * @Description : EgovAuthorGroupManage List 화면
 * @Modification Information
 * @
 * @  수정일                     수정자                    수정내용
 * @ -------       --------    ---------------------------
 * @ 2009.03.23    Lee.m.j       최초 생성
 *   2016.06.13    장동한          표준프레임워크 v3.6 개선
 *
 *  @author Lee.m.j
 *  @since 2009.03.23
 *  @version 1.0
 *  @see
 *
 */
%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<c:set var="pageTitle"><spring:message code="comCopSecRgm.title"/></c:set>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
	<title>${pageTitle} <spring:message code="title.list" /></title>
	<link rel="shortcut icon" href="">
	<link rel="shortcut icon" href="">
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/css/font-awesome-ie7.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.common-material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.mobile.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601031' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?id=20180601001' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?id=20180601001' />"></script>
	<script src="<c:url value='/js/crypto/jsbn.js' />" ></script>
	<script src="<c:url value='/js/crypto/prng4.js' />" ></script>
	<script src="<c:url value='/js/crypto/rng.js' />" ></script>
	<script src="<c:url value='/js/crypto/rsa.js' />" ></script>
	
	<script>
		function resizeContainers() {
			var htmlHeight = (kendo.support.mobileOS) ? parseFloat(window.innerHeight) : $('html').height();
				
			$("#main").height(htmlHeight);
		}
		
		$(function () {
			if (kendo.support.mobileOS) {
				$(document.documentElement).addClass("k-hover-enabled");
			}
		});
		
		$(document).ready(resizeContainers);
		$(window).resize(resizeContainers);
		
		function setCookie (name, value, expires) {
			document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
		}
		
		function getCookie(Name) {
			var search = Name + "=";
			if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
				offset = document.cookie.indexOf(search);
				if (offset != -1) { // 쿠키가 존재하면
					offset += search.length;
					// set index of beginning of value
					end = document.cookie.indexOf(";", offset);
					// 쿠키 값의 마지막 위치 인덱스 번호 설정
					if (end == -1) {
						end = document.cookie.length;
					}
					return unescape(document.cookie.substring(offset, end));
				}
			}
			return "";
		}
		
		function saveid(form) {
			var expdate = new Date();
			// 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
			if (form.checkId.checked) {
				expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 1); // 30일
			}
			else {
				expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
			}
			setCookie("saveid", form.id.value, expdate);
		}
		
		function getid(form) {
			form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
		}
	</script>
</head>
<body>
<noscript>
	<spring:message code="common.noScriptTitle.msg" />
	이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다.
	<a href="http://www.enable-javascript.com/ko/" target="_blank">
	브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
</noscript>

<div id="main">
	<div id="contentWrap">
		<div id="contentBox">
			<div class="main-section k-content">
				<form name="loginForm" id="loginForm" method="post">
					<ul class="fieldlist">
						<c:if test="${userSe ne 'USR'}">
							<li>
								<label for="park">주차장</label>
								<input name="park" id="park" style="width: 100%;"/>
							</li>
						</c:if>
						<li>
							<label for="id">아이디</label>
							<input name="id" id="id" type="text" class="k-textbox" style="width: 100%;" />
						</li>
						<li>
							<label for="password">비밀번호</label>
							<input name="password" id="password" type="password" class="k-textbox" style="width: 100%;" />
						</li>
						<li>
							<input type="checkbox" id="checkId" class="k-checkbox">
							<label class="k-checkbox-label" for="checkId">아이디 저장</label>
						</li>
					</ul>
					<input id="rsaPublicKeyModulus" type="hidden" value="${publicKeyModulus}" />
					<input id="rsaPublicKeyExponent" type="hidden" value="${publicKeyExponent}" />
				</form>
			</div>
			<div class="btn-section">
				<button id="btn-login" class="k-primary k-button" data-role="button" role="button" aria-disabled="false" tabindex="0">로그인</button>
			</div>
			<style>
				.fieldlist {
					margin: 0 0 -2em;
					padding: 0;
				}
				
				.fieldlist li {
					padding-bottom: 2rem;
				}
				
				.fieldlist li:last-child {
					padding-bottom: 0.5rem;
				}
				
				.fieldlist label {
					display: block;
					padding-bottom: 1rem;
					font-weight: bold;
					text-transform: uppercase;
					font-size: 0.8rem;
					color: #444;
				}
				
				.main-section {
					line-height: 1rem;
					max-width: 300px !important;
					padding: 3rem;
				}
				
				.main-section .fieldlist .k-textbox {
					border-top: none;
					border-right: none;
					border-left: none;
				}
				
				#btn-login {
					margin: 0 4px;
					padding: 5px 30px;
					font-size: 15px;
					font-weight: bold;
					text-align: center;
					line-height: 1.33334;
					position: relative;
					display: inline-block;
					border-radius: 2px;
					-webkit-appearance: none;
					cursor: pointer;
				}
				
				.btn-section {
					max-width: 348px;
					float: none;
					margin: 0 auto 2em;
					padding-right: 0;
				}
				
				.btn-section #btn-login {
					float: right;
				}
				
				@media only screen and (max-width: 720px) {
					.btn-section .btn {
						border-radius: 2px;
						padding: 5px 30px;
						line-height: 1.33334;
					} 
				} 
			</style>
			<script>
				$(document).ready(function() {
					
					if ('${userSe}' != 'USR') {
						$('#park').kendoDropDownList({
							filter        : 'contains',
							dataTextField : 'parkNm',
							dataValueField: 'parkCd',
							dataSource    : {
								transport: {
									read: function(options){
										$.ajax({
											url     : '<c:url value="/parks"/>',
											dataType: 'json',
											success : function(result, status, jqXHR) {
												options.success(result.parkList);
											},
											error   : function(jqXHR, status, error) {
												// notify the data source that the request failed
												//options.error(result.parkList);
											}
										});
									}
								}
							},
							change        : function(e) {
								$('#userSe').val(this.value());
							},
							dataBound     : function(e) {
								$('#userSe').val(this.value());
							}
						});
					}
					
					$('#btn-login').click(function(e){
						e.preventDefault();
						
						var rsa = new RSAKey();
						rsa.setPublic($('#rsaPublicKeyModulus').val(), $('#rsaPublicKeyExponent').val());
						
						// 사용자ID와 비밀번호를 RSA로 암호화한다.
						$('#secUser').val(rsa.encrypt($('#id').val()));
						$('#secPassword').val(rsa.encrypt($('#password').val()));
						
						document.secLoginForm.action = '<c:url value="/uat/uia/actionLogin.do"/>';
						document.secLoginForm.submit();
					});
					
					$('#password').keyup(function(e){
						e.preventDefault();
						if (event.which == 13 || event.keyCode == 13) {
							$('#btn-login').click();
							return false;
						}
						return true;
					});
					
					$('#checkId').change(function() {
						saveid(document.forms.loginForm);
					});
					
					var id = getCookie('saveid');
					console.log('saveid :' , id);
				});
			</script>
		</div>
	</div>
	<style>
		#contentWrap {
			margin-top: 6rem;
		}
		
		@media only screen and (max-width: 720px) {
			#contentWrap {
				/* margin: 6rem 6rem 5rem 6rem; */
			}
		} 
	</style>
</div>
<form id="secLoginForm" name="secLoginForm" method="post" class="hidden" >
	<input type="hidden" name="secUser" id="secUser" value="" />
	<input type="hidden" name="secPassword" id="secPassword" value="" />
	<input id="userSe" name="userSe" type="hidden" value="${userSe}">
</form>
</body>
</html>