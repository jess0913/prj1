<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
<script>
function setCookie(name, value, expiredays){
    var todayDate = new Date();
        todayDate.setDate (todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
    }
function closePop(){
        if (document.frm.pop.checked){
        setCookie("popname", "done", 1);
    }
    self.close();
}
</script>
<style type="text/css">
body {
  margin:0;
}
.parent {
  align-items: center;
	width: 100%;
	height: 99vh;
  display: inline-block;
}
.child {
  float:left;
  width: 100%;
  height: 69vh;
  text-align: center;
  background-color: #fcba03;
  display: inline-block;
}
.child2 {
  float:left;
  margin: 0;
  width: 50%;
  height: 25vh;
  text-align: center;
  background-color: #7d7d7d;
  display: inline-block;
  
}
.child3 {
  float:left;
  width: 100%;
  height: 5vh;
  text-align: right;
  background-color: #fcba03;
  display: inline-block;
}
</style>
</head>
<body>
<div class="parent">
<div class="child">
��������
</div>
<div class="child2">
�������� ���
</div>
<div class="child2">
�ڷ��
</div>
<div id="div_laypopup" align="center" class="child3">  
    <input type="checkbox" onClick="closePop();">���� �Ϸ� ���� ���� ����
    <a href="javascript:self.close();" onfocus="this.blur()">[�ݱ�]</a>
 </div> 
</div>
</body>
</html>