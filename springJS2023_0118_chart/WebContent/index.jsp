<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>kosmo</title>
</head>
<body>
<script>
	//�Լ� ����� �̸�����
	function deviceCheck() {
		//javascript ���� :
		//javascript : Ŭ���̾�Ʈ���� �ؼ��Ǵ� ���������� ����̰�, ��ü ���� ����̴�.
		//���������� ������ �ٸ��� ������ �ణ�� �Ľ��� ���̰� ���� �� �ִ�.
		//HTML5�������� ǥ��ȭ�� ���� -> ECMA5 ~ 7 �ø���  -> ���չ����̴�.
		//���� ������ var, let���� �Ѵ�.

		//��
		//userAgent : mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36
		//�ȵ���̵�
		//userAgent : mozilla/5.0 (linux; android 10; sm-g981b) applewebkit/537.36 (khtml, like gecko) chrome/80.0.3987.162 mobile safari/537.36
		var userAgent = navigator.userAgent.toLowerCase();
		//alert(userAgent);
		console.log("userAgent : "+userAgent);

		//var platform = navigator.platform.toLowerCase();
		//console.log("platform : "+platform);

		//����̽� ���� ����
		//indexOf()-> ã�����ϸ� -1
		console.log("indexOf()"+userAgent.indexOf('android'))
		if (userAgent.indexOf('android') > -1 || userAgent.indexOf('iphone') > -1) {
			console.log("mobile");
			//location="�̵��� url"
			location="mobile/"
		}else {
			console.log("PC");
			location="web/"
		}
		//alert("test"); //���â
	}
	deviceCheck();
</script>
</body>
</html>