window.onload = function() {
	$(".note-editable")[0].innerHTML = $(".note-editable2")[0].innerHTML;
};
function generateHideElement(name, value) {
	var tempInput = document.createElement("input");
	tempInput.type = "hidden";
	tempInput.name = name;
	tempInput.value = value;
	return tempInput;
}
function check() {
	// 定义参数变量
	var formid = "#form";
	// 新建一个form 属性值复制自原表单
	var form = document.createElement("form");
	// document.body.appendChild(form);
	form.method = $(formid).attr("method");
	form.action = $(formid).attr("action");
	form.id = "generateForm";
	// 获取原表单的提交内容
	var q = $(formid).serializeArray();
	// 向form中添加隐藏的input，还原原本的表单值
	for ( var i in q) {
		form.appendChild(generateHideElement(q[i].name, q[i].value));
	}
	// console.log($(".note-editable")[0].innerHTML);
	// 添加自定义的表单值
	form.appendChild(generateHideElement("pdesp",
			$(".note-editable")[0].innerHTML.replace(' width',' data-width')));

	var tempInput2 = document.createElement("input");
	tempInput2.id = "generateHideSubmit";
	tempInput2.type = "submit";
	tempInput2.value = "";
	tempInput2.style = "display: none;";
	form.appendChild(tempInput2);

	// 将表单加入DOM
	document.body.appendChild(form);
	// 手动提交表单
	// $("#generateForm").submit();
	$("#generateHideSubmit").click();
	// 停止原表单提交
	return false;
}