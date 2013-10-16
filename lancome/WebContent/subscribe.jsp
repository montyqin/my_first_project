<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<%=contextPath %>/css/common.css" rel="stylesheet">
<link href="<%=contextPath %>/css/category.css" rel="stylesheet">
<script src="<%=contextPath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
<!--
function subscribe()
{
	var email = $.trim($('#email').val());
	if (!checkEmail())
		return;
	
	$.post('<%=contextPath%>/user/subscribe', { 'email':email }, function(json)
	{
		if (json.result == true)
		{
			alert(json.detail);
		}
		else
		{
			alert(json.detail);
		}
		$('#email').val("");
	}, "json");
}
function checkEmail()
{
	var email = $.trim($('#email').val());
	if (email.length == 0)
	{
		alert("请输入邮箱地址")
		return false;
	}
	
	if (email.length > 0 && !arvato.isEmail(email))
	{
		alert("请输入正确的邮箱地址");
		return false;
	}
	return true;
}
//-->
</script>
<div class="subscribe">
	<div><h1 style="text-align:center;">订阅</h1></div>
	<div style="text-align:center;margin:5px"><span>输入邮箱地址</span></div>
	<div style="text-align:center;"><input type="text" style="height:30px; width:80%; font-size:18px" name="email" id="email" value=""></div>
	<div style="text-align:center;margin:10px;"><input type="submit" class="btn_submit" value="" onclick="subscribe()"></div>
</div>