<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>환율 시스템</title>
</head>
<body>
	<h1>환율 정보 시스템 - 지원자 이경택</h1>
	<table>
	  <tbody>
	    <tr>
	      <td><input type="number" min="0" max="10000" id="inputNum" value="0" style="width: 180px; height: 45px; border: 1px solid #dfe1e5; border-radius: 6px; margin-bottom:15px;"></td>
	      <td><div>
	      <select style="height: 45px; padding-left: 8px; text-align: left; vertical-align: middle; width: 150px; margin-left: 10px; margin-bottom:15px;">
	        <option>미국 달러</option>
	      </select>
	      </div></td>
	    </tr>
	    <tr>
	      <td><input type="number" id="resultM" value="0" min="0" readonly="readonly" style="width: 180px; height: 45px; border: 1px solid #dfe1e5; border-radius: 6px;"></td>
	      <td><div>
	      <select id="moneyName" style="height: 45px; padding-left: 8px; text-align: left; vertical-align: middle; width: 150px; margin-left: 10px;">
	        <option value="">-선택-</option>
	        <option value="USDKRW">대한민국 원</option>
	        <option value="USDJPY">일본 엔</option>
	        <option value="USDCNY">중국 위안화</option>
	        <option value="USDEUR">유로</option>
	      </select>
	      </div>
	      </td>
	      <td><input type="button" id="calMoney" value="계산하기" class="btn btn-default" style="margin-left: 10px;"></td>
	    </tr>
	  </tbody>
	</table>
	<h2 id="massage"></h2>
</body>

<script type="text/javascript" src="/resources/js/exchangeInfo.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 계산하기 버튼을 클릭시 함수를 실행합니다.
	$("#calMoney").on("click", function(){
		
		// 사용자가 선택한 값과 입력한 숫자를 변수에 담습니다.
		var getName = $("#moneyName").val();
		
		var getNum = parseInt($("#inputNum").val());
		
		// 환전된 금액을 넣을 변수를 만듭니다.
		var outMoney = 0;
		
		// 유효성 검사를 통해서 사용자가 입력 가능한 달러 값을 0 ~ 10000달러 사이로 지정해두었습니다.
		// 만약 해당하는 값이 아니라면 경고창과 함께 리턴하도록 처리하였습니다.
		if(inputNum <= 0 || inputNum >= 10000) {
			
			alert("입력 가능한 달러 범위는 0 ~ 10000$ 입니다.");
		
			return false;
		
		// 사용자가 환전 국가를 선택하지 않았을 경우 경고창과 함께 처리를 리턴하도록 하였습니다.
		}else if(moneyName === "") {
			
			alert("환전할 원화를 선택해주세요.");
			return false;
		}
		
		// resources 폴더에 api를 사용해서 현재 환율을 가져오는 함수를 만들고 객체 안에 담아두었습니다. 
		exchangeService.exchange({}, function(result){
			
			var curArr = result.quotes;
			
			// 사용자가 선택한 원화의 이름과 일치하는 데이터를 찾아서 환율 공식을 적용해 결과 값을 얻습니다.
			// 각각의 원화 이름은 USDKRW = 한국 / USDJPY = 일본 / USDCNY = 중국 / USDEUR = 유로 입니다.
			if(getName === "USDKRW"){
				outMoney = getNum * curArr.USDKRW;
	    	}else if(getName === "USDJPY") {
	    		outMoney = getNum * curArr.USDJPY;
	    	}else if(getName === "USDCNY") {
	    		outMoney = getNum * curArr.USDCNY;
	    	}else if(getName === "USDEUR") {	
	    		outMoney = getNum * curArr.USDEUR;
	    	}
				// 환율 계산이 완료되면 결과 값을 Math.round 함수를 사용해 소수점 둘째자리까지 출력하도록 하였습니다.
				outMoney = Math.round(outMoney * 100) / 100;
				$("#resultM").val(outMoney);
		});
	
	});
	
});
</script>
</html>    