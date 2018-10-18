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
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/css/font-awesome-ie7.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.common-material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.mobile.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601027' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/common.js?v=20180601008' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/cultures/kendo.culture.ko-KR.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.dialog.min.js?v=20180601001' />"></script>
</head>
<body>
<div id="main">
	<div id="contentWrap">
		<div class="btn-section pdr-0" style="padding-bottom: 1rem;">
			<button id="btn-list" type="button" class="k-button btn-action float-r" style="margin-left:.5rem;">목록</button>
			<button id="btn-cancel" type="button" class="k-button btn-action float-r hidden" style="margin-left:.5rem;">취소</button>
			<button id="btn-edit" type="button" class="k-button k-primary btn-action float-r hidden disabled">수정</button>
			<button id="btn-save" type="button" class="k-button k-primary btn-action float-r hidden">저장</button>
		</div>
		<div id="contentBox">
			<div class="main-section k-content pd-3">
				<form id="dtlForm">
					<ul class="fieldlist">
						<li>
							<label for="input-parkNm" class="required">주차장</label>
							<input id="input-parkNm" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${custVO.parkNm}' escapeXml='true' />" />
						</li>
						<li>
							<label for="input-custId" class="required">아이디</label>
							<input id="input-custId" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${custVO.custId}' escapeXml='true' />" />
						</li>
						<li>
							<label for="input-custPwd" class="required" style="display: inline-block;">비밀번호</label>
							<button id="btn-pwdReset" class="k-button slim chocolate float-r" style="display: none; position: relative; top: -5px;">
								<span class="k-icon k-icon-13 k-i-reset" style="top: -1px;"></span> 비밀번호 초기화
							</button>
							<input id="input-custPwd" type="text" class="k-textbox op-1" style="width: 100%;" />
						</li>
						<li>
							<label for="sel-useYn" class="required">상태</label>
							<input id="sel-useYn" name="상태" class="op-1 editable" style="width: 100%;" />
						</li>
						<li>
							<label for="input-custNm" class="required">입주사명</label>
							<input id="input-custNm" name="입주사명" type="text" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${custVO.custNm}' escapeXml='true' />" autocomplete="off" data-maxLen="30" required />
						</li>
						<li>
							<label for="input-chargeNm" class="required">담당자명</label>
							<input id="input-chargeNm" name="담당자명" type="text" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${custVO.chargeNm}' escapeXml='true' />" autocomplete="off" data-maxLen="20" required />
						</li>
						<li>
							<label for="input-chargeEmail">담당자 이메일</label>
							<input id="input-chargeEmail" name="담당자 이메일" type="email" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${custVO.eMailAddr}' escapeXml='true' />" autocomplete="off" data-maxLen="100" />
						</li>
						<li>
							<label for="input-bizrno">사업자번호</label>
							<input id="input-bizrno" name="사업자번호" type="text" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${custVO.bizrno}' escapeXml='true' />" autocomplete="off" />
						</li>
						<li>
							<label for="input-ownerNm">대표자명</label>
							<input id="input-ownerNm" name="대표자명" type="text" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${custVO.ownerNm}' escapeXml='true' />" autocomplete="off" data-maxLen="20" />
						</li>
						<li>
							<label for="input-telNo">전화번호</label>
							<input id="input-telNo" name="전화번호" type="text" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${custVO.telNo}' escapeXml='true' />" autocomplete="off" />
						</li>
						<li>
							<label for="input-chargeMobile">휴대폰번호(담당자)</label>
							<input id="input-chargeMobile" name="휴대폰번호(담당자)" type="text" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${custVO.mobile}' escapeXml='true' />" autocomplete="off" />
						</li>
						<li>
							<label for="input-faxNo">Fax</label>
							<input id="input-faxNo" name="Fax" type="text" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${custVO.faxNo}' escapeXml='true' />" autocomplete="off" />
						</li>
						<li>
							<label for="input-memo">메모</label>
							<textarea id="input-memo" name="메모" class="k-textbox op-1 editable" style="width: 100%;" rows="5" data-maxLen="200" ><c:out value='${custVO.remark}' escapeXml='true' /></textarea>
						</li>
						<li style="width: 49%;" class="float-l">
							<label for="input-regDt">등록일</label>
							<input id="input-regDt" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${custVO.regDt}' escapeXml='true' />" />
						</li>
						<li style="width: 49%; padding-left: 2%;" class="float-l">
							<label for="input-regID">등록자</label>
							<input id="input-regID" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${custVO.regId}' escapeXml='true' />" />
						</li>
						<li style="width: 49%;" class="float-l">
							<label for="input-updtDt">수정일</label>
							<input id="input-updtDt" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${custVO.updtDt}' escapeXml='true' />" />
						</li>
						<li style="width: 49%; padding-left: 2%;" class="float-l">
							<label for="input-updtID">수정자</label>
							<input id="input-updtID" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${custVO.updtId}' escapeXml='true' />" />
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="dialog"></div>
<script>
$(document).ready(function () {
	
	//전체 항목 비활성화
	$('.k-textbox').prop('disabled', true).addClass('k-state-disabled');
	
	//상태 combobox 초기화
	var useYn = $('#sel-useYn').kendoComboBox({
		filter        : 'none',
		dataTextField : 'useYnNm',
		dataValueField: 'useYnCd',
		clearButton   : false,
		dataSource    : [
			{useYnNm: '사용', useYnCd: '1'},
			{useYnNm: '해지', useYnCd: '0'}
		]
	}).data("kendoComboBox");
	
	//combobx 비활성화
	useYn.select(function(dataItem) {
		return dataItem.useYnCd === '<c:out value="${custVO.useYn}" />';
	});
	useYn.enable(false);
	
	//유효성 검사 설정
	var validator = $("#dtlForm").kendoValidator({
		rules   : {
			maxDataLength: function(input){
				if (input.is('[data-maxLen]') && input.val() != '') {
					var maxLen = input.attr('data-maxLen');
					return $.trim(input.val()).length <= maxLen;
				}
				return true;
			},
			bizrnoFormat : function(input) {
				if (input.is('[id="input-bizrno"]') && input.val() != '') {
					return fnFormatBizrno(input);
				}
				return true;
			},
			telNoFormat  : function(input) {
				if (input.is('[id="input-telNo"]') && input.val() != '') {
					return fnFormatTelNo(input);
				}
				return true;
			},
			mobileFormat : function(input) {
				if (input.is('[id="input-chargeMobile"]') && input.val() != '') {
					return fnFormatMobile(input);
				}
				return true;
			},
			faxNoFormat  : function(input) {
				if (input.is('[id="input-faxNo"]') && input.val() != '') {
					return fnFormatTelNo(input);
				}
				return true;
			}
		},
		messages: {
			required     : '{0}은(는) 필수 입력 항목입니다.',
			maxDataLength: function(input) {
				if (input.is('[data-maxLen]') && input.val() != '') {
					var name = input.attr('name'),
						maxLen = input.attr('data-maxLen');
					return name + '은(는) ' + maxLen + '자 이하로 입력해 주세요.';
				}
			},
			email       : '이메일 주소 형식이 아닙니다.',
			bizrnoFormat: '사업자번호 형식이 올바르지 않습니다.',
			telNoFormat : '전화번호 형식이 올바르지 않습니다.',
			mobileFormat: '휴대폰번호 형식이 올바르지 않습니다.',
			faxNoFormat : 'FAX 형식이 올바르지 않습니다.'
		}
	}).data("kendoValidator");
	
	//상태 [사용]인 경우만 수정 버튼 활성화 및 이벤트 바인딩
	if ('1' == '<c:out value="${custVO.useYn}" />') {
		
		//입력항목 상태 전환
		var fnToggleStatus = function(editable) {
			if (editable) {
				$('.k-textbox.editable').prop('disabled', false).removeClass('k-state-disabled');
				useYn.enable(true);
				useYn.input.attr("readonly", true).on("keydown", function(e) {
					if (e.keyCode === 8) {
						e.preventDefault();
					}
				});
				
				$('#btn-pwdReset').css('display', 'inline-block');
			}
			else {
				$('.k-textbox').prop('disabled', true).addClass('k-state-disabled');
				useYn.enable(false);
				
				$('#btn-pwdReset').css('display', 'none');
			}
			
			$('.k-button.btn-action').toggleClass('hidden');
		};
		
		//저장 action
		var fnSaveAction = function() {
			if (validator.validate()) {
				var data = {
					useYn    : useYn.value(),
					custNm   : $.trim($('#input-custNm').val()),
					bizrno   : $('#input-bizrno').val(),
					ownerNm  : $.trim($('#input-ownerNm').val()),
					chargeNm : $.trim($('#input-chargeNm').val()),
					eMailAddr: $('#input-chargeEmail').val(),
					telNo    : $('#input-telNo').val(),
					mobile   : $('#input-chargeMobile').val(),
					faxNo    : $('#input-faxNo').val(),
					remark   : $.trim($('#input-memo').val())
				};
				
				$.ajax({
					type       : 'PUT',
					url        : '<c:url value="/cpns/custs/" />' + '${custVO.custSeq}',
					contentType: 'application/json; charset=utf-8',
					dataType   : 'json',
					data       : JSON.stringify(data),
					success    : function(result, status, jqXHR) {
						if (result.retMsg == 'common.message.success') {
							fnAlertSuccess($('#dialog'), {
								content: '입주사 정보를 수정하였습니다.',
								actions: [
									{
										text   : 'OK',
										primary: true,
										action : function() {
											location.href = '<c:url value="/cpns/custs/" />' + '${custVO.custSeq}' + document.location.search;
										}
									}
								]
							}).data("kendoDialog").open();
						}
						else {
							fnAlertError($('#dialog'), {
								content: '입주사 정보 수정에 실패하였습니다.',
								actions: [{text   : 'Ok', primary: true}]
							}).data("kendoDialog").open();
						}
					},
					error      : function(jqXHR, status, error) {
						fnAlertError($('#dialog'), {
							content: '입주사 정보 수정에 실패하였습니다.',
							actions: [{text   : 'Ok', primary: true}]
						}).data("kendoDialog").open();
					}
				});
			}
			else {
				fnAlertWarn($('#dialog'), {
					content: '입력 내용이 올바르지 않은 항목이 존재합니다.<br/>입력 내용을 확인해 주세요.',
					actions: [{text   : 'Ok', primary: true}]
				}).data("kendoDialog").open();
				
				return true;
			}
		};
		
		$('#btn-edit').removeClass('hidden disabled');
		
		//수정 버튼 이벤트
		$('#btn-edit').click(function(e) {
			e.preventDefault();
			
			fnToggleStatus(true);
		});
		
		//저장 버튼 이벤트
		$('#btn-save').click(function(e) {
			e.preventDefault();
			
			fnConfirm($('#dialog'), {
				content: '입주사 정보를 수정하시겠습니까?',
				actions: [
					{
						text   : 'OK', 
						primary: true,
						action : fnSaveAction
					},
					{
						text   : 'CANCEL'
					}
				]
			}).data("kendoDialog").open();
		});
		
		//취소 버튼 이벤트
		$('#btn-cancel').click(function(e) {
			e.preventDefault();
			
			fnConfirm($('#dialog'), {
				content: '수정 내용이 저장되지 않았습니다.<br/>수정을 취소하시겠습니까?',
				actions: [
					{
						text   : 'OK', 
						primary: true,
						action : function() {
							$('#dtlForm')[0].reset();
							
							setTimeout(function() {
								useYn.select(function(dataItem) {
									return dataItem.useYnCd === '<c:out value="${custVO.useYn}" />';
								});
							}, 50);
							
							fnToggleStatus(false);
							
							//유효성검사 메세지 초기화
							validator.hideMessages();
						}
					},
					{
						text   : 'CANCEL'
					}
				]
			}).data("kendoDialog").open();
		});
		
		//비밀번호 초기화 action
		var fnPwdResetAction = function() {
			var data = {
				custId : '<c:out value='${custVO.custId}' escapeXml='true' />',
				isReset: 'true'
			};
			
			$.ajax({
				type       : 'PUT',
				url        : '<c:url value="/cpns/custs/" />' + '${custVO.custSeq}',
				contentType: 'application/json; charset=utf-8',
				dataType   : 'json',
				data       : JSON.stringify(data),
				success    : function(result, status, jqXHR) {
					if (result.retMsg == 'common.message.success') {
						fnAlertSuccess($('#dialog'), {
							content: '비밀번호를 초기화 하였습니다.',
							actions: [
								{
									text   : 'OK',
									primary: true,
									action : function() {
										location.href = '<c:url value="/cpns/custs/" />' + '${custVO.custSeq}' + document.location.search;
									}
								}
							]
						}).data("kendoDialog").open();
					}
					else {
						fnAlertError($('#dialog'), {
							content: '비밀번호 초기화가 실패하였습니다.',
							actions: [{text   : 'Ok', primary: true}]
						}).data("kendoDialog").open();
					}
				},
				error      : function(jqXHR, status, error) {
					fnAlertError($('#dialog'), {
						content: '비밀번호 초기화가 실패하였습니다.',
						actions: [{text   : 'Ok', primary: true}]
					}).data("kendoDialog").open();
				}
			});
		};
		
		//비밀번호 초기화 이벤트 바인딩
		$('#btn-pwdReset').click(function(e) {
			e.preventDefault();
			
			fnConfirm($('#dialog'), {
				content: '비밀번호가 "0000"으로 초기화 됩니다.<br/>초기화를 진행하시겠습니까?',
				actions: [
					{
						text   : 'OK', 
						primary: true,
						action : fnPwdResetAction
					},
					{
						text   : 'CANCEL'
					}
				]
			}).data("kendoDialog").open();
		});

	}
	
	//목록 버튼 이벤트
	$('#btn-list').click(function(){
		location.href = '<c:url value="/cpns/custs/view" />' + document.location.search;
	});
});
</script>
</body>
</html>


















<%-- 
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">

<link type="text/css" rel="stylesheet" href="<c:url value='/js/jui/ui/ui.css' />" />
<link type="text/css" rel="stylesheet" href="<c:url value='/js/jui/ui/ui-jennifer.css' />" />
<link type="text/css" rel="stylesheet" href="<c:url value='/js/qx/q-indigo.css' />" />

<script src="<c:url value='/js/jquery/jquery-3.3.1.js' />" ></script>
<script src="<c:url value='/js/jui/core/core.js' />" ></script>
<script src="<c:url value='/js/jui/ui/ui.js' />" ></script>
<script src="<c:url value='/js/qx/q-5.0.2.js' />" ></script>

<script defer="defer">
/* function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

	var resultCheck = false;

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var selectAuthor = document.listForm.authorManageCombo;
    var booleanRegYn = document.listForm.regYn;
    var listMberTyCode = document.listForm.mberTyCode;

    var returnId = "";
    var returnAuthor = "";
    var returnRegYn = "";
    var returnmberTyCode = "";

    var checkedCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkedCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnId == "") {
                        returnId = checkField[i].value;
                        returnAuthor = selectAuthor[i].value;
                        returnRegYn = booleanRegYn[i].value;
                        returnmberTyCode = listMberTyCode[i].value;
                    }
                    else {
                    	returnId = returnId + ";" + checkField[i].value;
                    	returnAuthor = returnAuthor + ";" + selectAuthor[i].value;
                    	returnRegYn = returnRegYn + ";" + booleanRegYn[i].value;
                    	returnmberTyCode = returnmberTyCode + ";" + listMberTyCode[i].value;

                    }
                }
            }

            if(checkedCount > 0)
            	resultCheck = true;
            else {
                alert("선택된  항목이 없습니다.");
                resultCheck = false;
            }

        } else {
        	 if(document.listForm.delYn.checked == false) {
                alert("선택 항목이 없습니다.");
                resultCheck = false;
            }
            else {
                returnId = checkId.value;
                returnAuthor = selectAuthor.value;
                returnRegYn = booleanRegYn.value;
                returnmberTyCode = listMberTyCode.value;

                resultCheck = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.userIds.value = returnId;
    document.listForm.authorCodes.value = returnAuthor;
    document.listForm.regYns.value = returnRegYn;
    document.listForm.mberTyCodes.value = returnmberTyCode;
    return resultCheck;
}

function fncSelectAuthorGroupList(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
    document.listForm.submit();
}

function fncAddAuthorGroupInsert() {

	if(!fncManageChecked()) return;

    if(confirm("등록하시겠습니까?")) {

        document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupInsert.do'/>";
        document.listForm.submit();
    }
}

function fncAuthorGroupDeleteList() {

	if(!fncManageChecked()) return;

    if(confirm("삭제하시겠습니까?")) {
        document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupDelete.do'/>";
        document.listForm.submit();
    }
}

function linkPage(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorGroupPop() {

    if(document.listForm.searchCondition.value == '3') {
    	window.open("<c:url value='/sec/gmt/EgovGroupSearchList.do'/>","notice","height=500, width=485, top=50, left=20, scrollbars=no, resizable=no");
    } else {
        alert("그룹을 선택하세요.");
        return;
    }

    
    var url = "<c:url value='/sec/gmt/EgovGroupSearchView.do'/>";
    var varParam = new Object();
    var openParam = "dialogWidth:500px;dialogHeight:485px;scroll:no;status:no;center:yes;resizable:yes;";
    var retVal;

    if(document.listForm.searchCondition.value == '3') {
        retVal = window.showModalDialog(url, varParam, openParam);
        if(retVal) {
            document.listForm.searchKeyword.value = retVal;
        }
    } else {
        alert("그룹을 선택하세요.");
        return;
    }
    

}

function onSearchCondition() {
	document.listForm.searchKeyword.value = "";
	if(document.listForm.searchCondition.value == '3') {
        document.listForm.searchKeyword.readOnly = true;
	} else {
		document.listForm.searchKeyword.readOnly = false;
	}
}

function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorGroupList('1');
    }
}
 */




/**
 * @lint ignoreDeprecated(alert)
 */
qx.Class.define("demobrowser.demo.ui.FormRenderer",
{
  extend : qx.application.Inline,
   members :
  {
    main : function()
    {
      this.base(arguments);
       // create the form
      var form = new qx.ui.form.Form();

       // add the first headline
       form.addGroupHeader("Registration");

       // add usernamne
       var userName = new qx.ui.form.TextField();
       userName.setRequired(true);
       form.add(userName, "Name");
       // add password
       var password = new qx.ui.form.PasswordField();
       password.setRequired(true);
       form.add(password, "Password");
       // add a save checkbox
       form.add(new qx.ui.form.CheckBox(), "Save?");

       // add the second header
       form.addGroupHeader("Personal Information");

       // add some additional widgets
       form.add(new qx.ui.form.Spinner(), "Age");
       form.add(new qx.ui.form.TextField(), "Country");
       var genderBox = new qx.ui.form.SelectBox();
       genderBox.add(new qx.ui.form.ListItem("male"));
       genderBox.add(new qx.ui.form.ListItem("female"));
       form.add(genderBox, "Gender");
       form.add(new qx.ui.form.TextArea(), "Bio");

       // send button with validation
       var sendButton = new qx.ui.form.Button("Send");
       sendButton.addListener("execute", function() {
         if (form.validate()) {
           alert("send...");
         }
       }, this);
       form.addButton(sendButton);

       // reset button
       var resetButton = new qx.ui.form.Button("Reset");
       resetButton.addListener("execute", function() {
         form.reset();
       }, this);
       form.addButton(resetButton);

       // create the form and add it to the document
       this.getRoot().add(new qx.ui.form.renderer.Single(form), {left: 10, top: 10});
     }
   }
 });






</script>
</head>
<body>
<!-- javascript warning tag  -->
<noscript>
	<spring:message code="common.noScriptTitle.msg" />
	<!-- 이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다. -->
	<a href="http://www.enable-javascript.com/ko/" target="_blank">
	브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
</noscript>
	
	
	
	




	
<form:form name="listForm" action="${pageContext.request.contextPath}/sec/ram/EgovAuthorGroupList.do" method="post">
<div class="board">
	<h1>${pageTitle} <spring:message code="title.list" /></h1>
	<!-- 검색영역 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<!-- 조회조건 -->
			<li>
				<select name="searchCondition" onchange="onSearchCondition()" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
				<option value="1" <c:if test="${authorGroupVO.searchCondition == '1'}">selected</c:if> ><spring:message code="comCopSecRgm.searchCondition.userId" /></option><!-- 사용자 ID -->
				<option value="2" <c:if test="${authorGroupVO.searchCondition == '2'}">selected</c:if> ><spring:message code="comCopSecRgm.searchCondition.userNm" /></option><!-- 사용자 명- -->
				<option value="3" <c:if test="${authorGroupVO.searchCondition == '3'}">selected</c:if> ><spring:message code="comCopSecRgm.searchCondition.group" /></option><!-- 그룹 -->
				</select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" >

				<input type="button" class="s_btn" onClick="fncSelectAuthorGroupPop()" value="<spring:message code="comCopSecRgm.btn.groupInquire" />" title="<spring:message code="title.delete" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" onClick="fncSelectAuthorGroupList('1')" value="<spring:message code="button.inquire" />" title="<spring:message code="button.inquire" /> <spring:message code="input.button" />" />
				
				<input type="button" class="s_btn" onClick="fncAuthorGroupDeleteList()" value="<spring:message code="title.delete" />" title="<spring:message code="title.delete" /> <spring:message code="input.button" />" />
				<input type="button" class="s_btn" onClick="fncAddAuthorGroupInsert()" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="button.create" />" />
			</li>
		</ul>
	</div>

	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 5%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 20%;">
		<col style="width: 10%;">
	</colgroup>
	<thead>
	<tr>
		<th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="<spring:message code="input.selectAll.title" />"></th>
		<th class="board_th_link"><spring:message code="comCopSecRgm.list.userId" /></th><!-- 사용자 ID -->
		<th><spring:message code="comCopSecRgm.list.userNm" /></th><!-- 사용자 명 -->
		<th><spring:message code="comCopSecRgm.list.userType" /></th><!-- 사용자 유형 -->
		<th><spring:message code="comCopSecRgm.list.author" /></th><!-- 권한 -->
		<th><spring:message code="comCopSecRgm.list.regYn" /></th><!--등록 여부 -->
	</tr>
	</thead>
	<tbody class="ov">
	<c:if test="${fn:length(authorGroupList) == 0}">
	<tr>
		<td colspan="6"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	<c:forEach var="authorGroup" items="${authorGroupList}" varStatus="status">
	<tr>
		<td><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorGroup.uniqId}"/>"/></td>
		<td><c:out value="${authorGroup.userId}"/></td>
		<td><c:out value="${authorGroup.userNm}"/></td>
		<td><c:out value="${authorGroup.mberTyNm}"/><input type="hidden" name="mberTyCode" value="${authorGroup.mberTyCode}"/></td>
		<td><select name="authorManageCombo" title="<spring:message code="comCopSecRgm.list.authorManageCombo" />"> <!-- 권한선택 -->
			<c:forEach var="authorManage" items="${authorManageList}" varStatus="status">
			<option value="<c:out value="${authorManage.authorCode}"/>" <c:if test="${authorManage.authorCode == authorGroup.authorCode}">selected</c:if> ><c:out value="${authorManage.authorNm}"/></option>
			</c:forEach>
			</select></td>
		<td><c:out value="${authorGroup.regYn}"/><input type="hidden" name="regYn" value="<c:out value="${authorGroup.regYn}"/>"></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<c:if test="${!empty authorGroupVO.pageIndex }">
		<!-- paging navigation -->
		<div class="pagination">
			<ul><ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/></ul>
		</div>
	</c:if>

</div><!-- end div board -->

<input type="hidden" name="userId"/>
<input type="hidden" name="userIds"/>
<input type="hidden" name="authorCodes"/>
<input type="hidden" name="regYns"/>
<input type="hidden" name="mberTyCodes"/>
<input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>
</form:form>

</body>
</html> --%>
