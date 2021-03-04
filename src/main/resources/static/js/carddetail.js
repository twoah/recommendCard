
function thumb_count(rev_id,isgood,card_id){
	var goodurl='';
	if(isgood){
		goodurl= 'review_good_ajax?review_id=' + rev_id+'&status=1';
		$.ajax({
			type:'post',
			url: goodurl,
			success:function(data3, status, xhr){
				if(data3 == 1){
					card_detail_review_ajax(card_id);
				}
				else{
					alert("서버 접속 에러");
				}
			
			},
			error:function(xhr, status, e){
				console.log("error:",e);
			}
		});
	}
	else{
		goodurl= 'review_good_ajax?review_id=' + rev_id+'&status=0';
		$.ajax({
			type:'post',
			url: goodurl,
			success:function(data3, status, xhr){
				if(data3 == 1){
					card_detail_review_ajax(card_id);
				}
				else{
					alert("서버 접속 에러");
				}
			
			},
			error:function(xhr, status, e){
				console.log("error:",e);
			}
		});
	}
	
	
}

function card_detail_review_ajax(card_id){
	$.ajax({
		type:'get',
		url:'review_carddetail_ajax?card_id=' + card_id,
		dataType:'json',
		success:function(data, status, xhr){
			$('#allReview').empty();
			$.each(data,function(idx,data2){
				var goodcnt = data2.status_good;
				var badcnt = data2.status_bad;
				var good='rev_good_'+data2.review_id;
				var bad='rev_bad_'+data2.review_id;
				
				
				var s_ReviewList = "";
				s_ReviewList = "<div class='comment mt-4'>";
				s_ReviewList+= "<h5 style='font-weight: bold;'>"+data2.user_id+"</h5>";
				s_ReviewList+= "<p style='font-size:17px;'>"+data2.body+"</p>";
				s_ReviewList+= "<div id='thumbtndiv'>";
				s_ReviewList+= "<button type='button' id='thumbbtn' onclick='thumb_count("+data2.review_id+",false,"+card_id+")'>";
				s_ReviewList+= "<i class='far fa-thumbs-down' id='rev_bad_"+data2.review_id+"'>싫어요  "+badcnt+"</i>";
				s_ReviewList+="</button>";
				s_ReviewList+= "<button type='button' id='thumbbtn' onclick='thumb_count("+data2.review_id+",true,"+card_id+")'>";
				s_ReviewList+= "<i class='far fa-thumbs-up' id='rev_good_"+data2.review_id+"'>좋아요  "+goodcnt+"</i>";
				s_ReviewList+="</button>"
					
				if(data2.user_id == get_current_userID()){
					s_ReviewList+= "<button type='button' id='deletebtn' onclick='delete_review("+data2.review_id+","+card_id+")' style='height: 44px;'>";
					s_ReviewList+= "<p id='rev_del_"+data2.review_id+"'>리뷰 삭제</p>";
					s_ReviewList+="</button>"
				}

						
				s_ReviewList+= "</div>";
				s_ReviewList+= "</div>";
				$('#allReview').append(s_ReviewList);
			})
		},
		error:function(xhr, status, e){
			console.log("error:",e);
		}
	});	
}

var current_userid = '';

function set_current_userID(userid){
	current_userid = userid;
}


function get_current_userID(){
	return current_userid;
}

function user_card_ajax(user_id,card_id){
	$.ajax({
		type:'post',
		url:'usercard_have_ajax?user_id='+user_id + '&card_id='+card_id,
		success:function(data4, status, xhr){
			if(data4 == 1){
				$('#create_card').val("카드 해지");
			}
			else{
				$('#create_card').val("카드 신청");
				$('.form-horizontal').hide();
				
				$('#comment').hide();
				$('#review_text_cnt').hide();
				$('#add_review').hide();
				$('#write_review_title').hide();
				$('.form-horizontal').hide();
			}
		},
		error:function(xhr, status, e){
			console.log("error:",e);
		}
	});	
}

function create_card(temp,user_id,card_id){

	if(temp == "카드 신청"){
		
		$.ajax({
			type:'post',
			url:'usercard_create_ajax?user_id='+user_id + '&card_id='+card_id,
			success:function(data5, status, xhr){
				
			},
			error:function(xhr, status, e){
				console.log("error:",e);
			}
		});	
		
		
		var s_modal = "";
		$('#myModal').empty();
		s_modal+="<div class='modal-dialog'>";
		s_modal+="<div class='modal-content'>";
		s_modal+="<div class='modal-header'>";
		s_modal+="<h4 class='ns-font modal-title'>카드 신청 완료</h4>";
		s_modal+="<button type='button' class='close' onclick='closeModalBtn()'>&times;</button>";
		s_modal+="</div>";
		s_modal+="<div class='modal-body'>";
		s_modal+="<p class='ns-font'>카드 신청이 완료되었습니다.</p>";
		s_modal+="</div>";
		s_modal+="<div class='modal-footer'>";
		s_modal+="<button type='button' class='btn btn-success ns-font' onclick='closeModalBtn()'>Close</button>";
		s_modal+="</div>";
		s_modal+="</div>";
		s_modal+="</div>";
		$('#myModal').append(s_modal);
	    $('#myModal').modal("show");
	    $('#create_card').val("카드 해지");
	}
	else{
		
		
		var s_modal = "";
		$('#myModal').empty();
		s_modal+="<div class='modal-dialog'>";
		s_modal+="<div class='modal-content'>";
		s_modal+="<div class='modal-header'>";
		s_modal+="<h4 class='ns-font modal-title'>카드 해지</h4>";
		s_modal+="<button type='button' class='close' onclick='closeModalBtn()'>&times;</button>";
		s_modal+="</div>";
		s_modal+="<div class='modal-body'>";
		s_modal+="<p class='ns-font'>카드 해지는 1577-8000으로 전화하세요.</p>";
		s_modal+="</div>";
		s_modal+="<div class='modal-footer'>";
		s_modal+="<button type='button' class='btn btn-success ns-font' onclick='closeModalBtn()'>Close</button>";
		s_modal+="</div>";
		s_modal+="</div>";
		s_modal+="</div>";
		$('#myModal').append(s_modal);
	    $('#myModal').modal("show");
		
	}
}

function closeModalBtn(){
	$('#myModal').modal("hide");
}


function review_benefit_tab(IsReview){
	if(IsReview == false){
		var benefitbtn = document.getElementById('#nav-home-tab');
		var reviewbtn = document.getElementById('#nav-profile-tab');
		var benefit = document.getElementById('#nav-home');
		var review = document.getElementById('#nav-profile');
		
		benefitbtn.setAttribute("class", "nav-link active btn btn-danger");
		reviewbtn.setAttribute("class", "nav-link btn btn-danger");

		benefitbtn.setAttribute("aria-selected","true");
		reviewbtn.setAttribute("aria-selected","false");
		
		benefit.setAttrbute("class","tab-pane fade show active");
		review.setAttrbute("class","tab-pane fade");
	}
}


function delete_review(reviewID,card_id){
	$.ajax({
		type : 'get',
		url:'review_delete?review_id='+reviewID,
		success:function(data, status, xhr){
			console.log("success");
			card_detail_review_ajax(card_id);
		},
		error:function(xhr, status, e){
			console.log("error:",e);
		}
	});	
}






