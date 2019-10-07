<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

$(function(){
	IMP.init('imp31415942'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	//커밋하고싶은데
	
$('#dateBtn').click(function(){
			
	
	var model = $('#modelNum').val();
	var book_date = $('#date').val();
	console.log('dateBtn 속')
	
	if(model == ""){
		alert('예약하고싶은 모델을 선택해주세요.');
		return false;
	}else if(book_date == ""){
		alert('예약하고싶은 날짜를 선택해주세요.');
		return false;
	}else{
		
		$.ajax({
			type:"POST",
			url:"bookCheck",
			data:{model:model,
				book_date:book_date},
			success:function(num){
				
				if(num == 0){
					
					if(confirm("현재 예약이 비어있습니다. 해당 날짜로 예약을 진행 하시겠습니까?") == true){
						$('#book').attr("value","T");
						$('#dateBtn').attr("type","hidden");
						$('#dateUpdate').attr("type","button");
						$('#dateUpdate').attr("disabled",true);
						$('#date').attr("disabled",true);
						$('#modelNum').attr("disabled",true);
						
					}else{
						console.log('갑자기여기서?');
						$.ajax({
							type:"POST",
							url:"bookDelete",
							success:function(num){
							console.log('가예약 삭제');
							},
							error:function(){
								alert('통신실패');
							}
						});
						return;
					}
						
					
				}else{
					alert('이미 예약이 된 날짜입니다.');
					return false;
				}
			},
			error:function(){
				alert('통신실패');
			}
		});
	}
});

var class_by_id = $('#select').attr('class');

if(class_by_id == 'modal fade'){
	
	$.ajax({
		type:"POST",
		url:"bookDelete",
		success:function(num){
		console.log(num)
		},
		error:function(){
			alert('통신실패');
		} 
	});

}// if문끝
}); // 문서읽기끝


	function check(){
		
		console.log('check 변수생성전');
		var book = $('#book').val();
		var model = $('#modelNum').val();
		var book_date = $('#date').val();
		var content = $('#bookInpor').val();
		console.log('check 변수생성후');
	
		if(book == 'F'){
			alert('예약날짜를 확인해주세요!');
			return false;
		}else if(content == ''){
			alert('요구사항을 기록해주세요.');
			return false;
		}else{ // book이 T일때
			
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:부산오빠',
		    amount : 101,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '부산 영도구 남항동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp){
		    if (rsp.success){
		    	
		    	console.log('결제완료 끝 ajax 시작 전');
				$.ajax({
					type:"POST",
					url:"bookAdd",
					data:{model:model,
						book_date:book_date,
						book:book,
						content:content},
						success:function(num){
						console.log('예약추가가되긴하고?');
						if(num == 1){
							console.log('예약완료 콘솔');		
							alert('예약완료! Mypage에서 예약정보를 확인하세요.');
							location.href='/model/main';
							return true;
						}else{
							alert('이미 예약이 되어있습니다.');
							return false;
						}						
					},
					error:function(){
						alert('통신실패');
					}
				});
		    	
		        var msgS = '결제가 완료되었습니다.';
		        msgS += '고유ID : ' + rsp.imp_uid;
		        msgS += '상점 거래ID : ' + rsp.merchant_uid;
		        msgS += '결제 금액 : ' + rsp.paid_amount;
		        msgS += '카드 승인번호 : ' + rsp.apply_num;
		    } else {		    			    			
		        var msgF = '결제에 실패하였습니다. 다시 시도해주십시요.';
		        msgF += '에러내용 : ' + rsp.error_msg;
		        alert(msgF);
		        return false;
		    }
		    alert(msgS);
		});
	
		}// else book이 'T' 끝
	}// function check 끝

$('#resetBtn').click(function(){
	
	var class_by_id = $('#select').attr('class');
	
	if(class_by_id == 'modal fade show'){
		
		$.ajax({
			type:"POST",
			url:"bookDelete",
			success:function(num){
				
				if(num == 0){
					alert('저장되있는 예약정보 초기화');
					
					$( "#subForm" ).each( function () {
			            this.reset();
			        });
					$('#book').attr("value","F");
					$('#dateBtn').attr("type","button");
					$('#dateUpdate').attr("type","hidden");
					$('#dateUpdate').attr("disabled",false);
					$('#date').attr("disabled",false);
					$('#modelNum').attr("disabled",false);
					
				}
				
			},
			error:function(){
				alert('통신실패');
			}
	});
	
	}
});

	$('textarea').on('keyup', function(){
	    // 남은 글자 수를 구한다.

	var letterLength = $(this).val().length;
    var remain = 400 - letterLength;
    $('em').html(remain);
	    if(remain < 0){
	    	$(".submit").prop("disabled", true);
	    	$("span > em").addClass("warning");
	    }else{
	    	$(".submit").prop("disabled", false);
	    }
	    // 문서 객체에 입력한다.
	    
	});
	

</script>