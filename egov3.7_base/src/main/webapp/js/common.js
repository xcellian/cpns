function decode(value) {
	return value.replace(/&amp/g, '&amp;')
		.replace(/&quot;/g, '"')
		.replace(/&#39;/g, "'")
		.replace(/&lt;/g, '<')
		.replace(/&gt;/g, '>');
}

function fnQToArr(q) {
	q = decodeURIComponent((q).replace(/\+/g, '%20'));
	arr = {};
	var a = q.split(/&(?!amp;)/g);
	for (x in a) {
		var pair = a[x].split('=');
		arr[pair[0]] = pair[1];
	}
	return arr;
}

function fnAlertInfo(elem, options) {
	var _default = {
		width    : 350,
		title    : 'information',
		closable : true,
		modal    : true,
		visible  : false,
		open     : function(e) {
			e.sender.wrapper.find('.k-dialog-titlebar').addClass('k-icon-info');
			e.sender.wrapper.find('.k-dialog-title').prepend(
				'<span class="k-icon k-icon-20 k-icon-info k-i-information"/>');
		},
		content  : '',
		actions  : [
			{text: 'OK', primary: true}
		]
	};
	
	$.extend(_default, options);
	return $(elem).kendoDialog(_default);
}

function fnAlertNoti(elem, options) {
	var _default = {
		width   : '350px',
		title   : 'notification',
		closable: true,
		modal   : true,
		visible : false,
		open    : function(e) {
			e.sender.wrapper.find('.k-dialog-titlebar').addClass('k-icon-noti');
			e.sender.wrapper.find('.k-dialog-title').prepend(
				'<span class="k-icon k-icon-20 k-icon-noti k-i-notification"/>');
		},
		content : '',
		actions : [
			{text: 'OK', primary: true}
		]
	};
	
	$.extend(_default, options);
	return $(elem).kendoDialog(_default);
}

function fnAlertWarn(elem, options) {
	var _default = {
		width   : '350px',
		title   : 'warning',
		closable: true,
		modal   : true,
		visible : false,
		open    : function(e) {
			e.sender.wrapper.find('.k-dialog-titlebar').addClass('k-icon-warn');
			e.sender.wrapper.find('.k-dialog-title').prepend(
				'<span class="k-icon k-icon-20 k-icon-warn k-i-warning"/>');
		},
		content : '',
		actions : [
			{text: 'OK', primary: true}
		]
	};
	
	$.extend(_default, options);
	return $(elem).kendoDialog(_default);
}

function fnAlertError(elem, options) {
	var _default = {
		width   : '350px',
		title   : 'error',
		closable: true,
		modal   : true,
		visible : false,
		open    : function(e) {
			e.sender.wrapper.find('.k-dialog-titlebar').addClass('k-icon-err');
			e.sender.wrapper.find('.k-dialog-title').prepend(
				'<span class="k-icon k-icon-20 k-icon-err k-i-close-outline"/>');
		},
		content : '',
		actions : [
			{text: 'OK', primary: true}
		]
	};
	
	$.extend(_default, options);
	return $(elem).kendoDialog(_default);
}

function fnAlertSuccess(elem, options) {
	var _default = {
		width    : 350,
		title    : 'success',
		closable : true,
		modal    : true,
		visible  : false,
		open     : function(e) {
			e.sender.wrapper.find('.k-dialog-titlebar').addClass('k-icon-success');
			e.sender.wrapper.find('.k-dialog-title').prepend(
				'<span class="k-icon k-icon-20 k-icon-success k-i-check-outline"/>');
		},
		content  : '',
		actions  : [
			{text: 'OK', primary: true}
		]
	};
	
	$.extend(_default, options);
	return $(elem).kendoDialog(_default);
}

function fnConfirm(elem, options) {
	var _default = {
		width   : '350px',
		title   : 'confirm',
		closable: true,
		modal   : true,
		visible : false,
		open    : function(e) {
			e.sender.wrapper.find('.k-dialog-titlebar').addClass('k-icon-confirm');
			e.sender.wrapper.find('.k-dialog-title').prepend(
				'<span class="k-icon k-icon-20 k-icon-confirm k-i-check-outline"/>');
		},
		content : '',
		actions : [
			{text: 'OK', primary: true},
			{text: 'CANCEL'}
		]
	};
	
	$.extend(_default, options);
	return $(elem).kendoDialog(_default);
}

function fnFormatId(input) {
	var regExp = /^[a-zA-Z0-9_.\-]*$/;
	var id = $.trim(input.val());
	
	if (id && regExp.test(id)) {
		input.val(id);
		return true;
	}
	else {
		return false;
	}
}

function fnFormatCd(input) {
	var regExp = /^[a-zA-Z0-9_]*$/;
	var cd = $.trim(input.val());
	
	if (cd && regExp.test(cd)) {
		input.val(cd);
		return true;
	}
	else {
		return false;
	}
}

function fnFormatBizrno(input) {
	var regExp = /^([0-9]{3})([0-9]{2})([0-9]{5})$/;
	var bizrno = $.trim(input.val()).replace(/\-/g, '');
	
	if (bizrno && regExp.test(bizrno)) {
		var regArr = regExp.exec(bizrno);
		input.val(regArr[1] + '-' + regArr[2] + '-' + regArr[3]);
		return true;
	}
	else {
		return false;
	}
}

function fnFormatTelNo(input) {
	var regExp = /^(02|0[3-9]{1}[0-9]{1})([1-9]{3,4})([0-9]{4})$/;
	var telNo = $.trim(input.val()).replace(/\-/g, '');
	
	if (telNo && regExp.test(telNo)) {
		var regArr = regExp.exec(telNo);
		input.val(regArr[1] + '-' + regArr[2] + '-' + regArr[3]);
		return true;
	}
	else {
		return false;
	}
}

function fnFormatMobile(input) {
	var regExp = /^(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
	var mobile = $.trim(input.val()).replace(/\-/g, '');
	
	if (mobile && regExp.test(mobile)) {
		var regArr = regExp.exec(mobile);
		input.val(regArr[1] + '-' + regArr[2] + '-' + regArr[3]);
		return true;
	}
	else {
		return false;
	}
}

