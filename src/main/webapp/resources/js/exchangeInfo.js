console.log("exchange......");

var exchangeService = (function(){
	
		function exchange(param, callback, error) {
			console.log("환율 계산.....");
			// currenylayer api에 있는 사용 예시를 가져와서 사용하였습니다.
			$.ajax({
			    url: 'http://apilayer.net/api/live?access_key=4eb6f6f5eb2243afbec800885a485c47&currencies=JPY,KRW,CNY,EUR&source=USD&format=1',
			    dataType: 'jsonp',
			    success: function(result, status, xhr) {
			    // 만약 ajax로 url에 요청을 성공한다면 콜백 함수를 사용하도록 처리하였습니다.	
			    	if(callback) {
			    		callback(result);
			    	}
			    }, error : function(xhr, status, er) {
			    	error(er);
			    }
			}); 
			
		}
	
	return {exchange:exchange};
})();