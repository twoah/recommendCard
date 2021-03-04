

var objdata;

function clearList(elementID)
{
    $(elementID).empty();
}

function test_checkbox() {
	var flag = false;
	var values = document.getElementsByName("benefit");
	var count=0;
	var cateArr = [];
	for (var i = 0; i < values.length; i++) {
		if (values[i].checked) {
			cateArr.push(values[i].value)
			count++;
		}

		if(count>2){
	          $(":checkbox:not(:checked)").attr("disabled","disabled");
	       }else{
	          $("input[name=benefit]:checkbox").removeAttr("disabled");
	       }
	}
	
	// 해당되는 카드만 담을 objArr를 선언한다.
	var objArr = [];
	
	// 전체 카드를 돌면서 이 혜택에 해당하는 카드들만 objArr에 담는다.
	for (var key in objdata){
		if(objCheck(cateArr,objdata[key])){
			objArr.push(objdata[key]);
		}
	}
	
	// objArr에 담긴 카드들만 리스트로 뿌려준다.
	if(cateArr.length == 0){
		to_jsp_cardList(objdata);
	}else{
		to_jsp_cardList(objArr);
	}
	
	return flag;
}

function convert_category_name(benNum){
	switch(benNum){
	case 1:
		return "생활";
	case 2:
		return "문화";
	case 3:
		return "교육";
	case 4:
		return "쇼핑";
	case 5:
		return "외식";
	case 6:
		return "자동차";
	case 7:
		return "통신";
	case 8:
		return "교통";
		
	}
}

function convert_category_num(benName){
	switch(benName){
	case "생활":
		return 1;
	case "문화":
		return 2;
	case "교육":
		return 3;
	case "쇼핑":
		return 4;
	case "외식":
		return 5;
	case "자동차":
		return 6;
	case "통신":
		return 7;
	case "교통":
		return 8;
	}
}

function goCardDetail(id){
	location.href="carddetail?card_id=" + id + "&reviewOn=0";
}

function to_jsp_cardList(data){
	clearList('.cardlist');
	$.each(data,function(idx,data2){
		
		
		var benArr = [];
		benArr[0] = data2.benefit1;
		benArr[1] = data2.benefit2;
		benArr[2] = data2.benefit3;
		benArr[3] = data2.benefit4;
		benArr[4] = data2.benefit5;
		
		var note_string = "";
		note_string = data2.note;
		
		
		var arr = note_string.toString().split("&");
		
		var s_cardList = "";
		s_cardList = "<div class='row'>";
		s_cardList+="<div class='col mb-10'>"
		s_cardList+="<p> </p>"
		s_cardList+="<div class='card' style='max-width:80em; margin-left:5em;'>" // 수정
		s_cardList+="<div class='row no-gutters' style='margin-left:1em'>" // 수정
			
		s_cardList+="<div class='col-4 align-self-center'>"
		s_cardList+="<img src='resources/image/"+data2.card_id+"_card.png' alt='' class='card-img' />"
		s_cardList+="</div>"
			
		s_cardList+="<div class='col-8'>"
		s_cardList+="<div class='card-body' style='margin-left:1.5em;'>" // 수정
		s_cardList+="<div class='row mt-3'>"
		s_cardList+="<div class='col-8' style='text-align: left;'>"
		s_cardList+="<h4 style='font-weight: bold;'>"+data2.card_name+"</h4>"
		s_cardList+="</div>"
			
		s_cardList+="<div class='col-4' style='text-align: right;'>"
		s_cardList+="<button type='button' class='btn btn-outline-danger mr-3' id="+data2.card_id+" onclick='goCardDetail(this.id)'>자세히보기</button>"
		s_cardList+="</div>"
		s_cardList+="</div>"
			
		s_cardList+="<div class='row mt-2'>"
		for(var i=0;i<arr.length;i++){
			s_cardList+="<p style='text-align: left;'>"+arr[i]+"</p>"
		}
		s_cardList+="</div>"
			
		s_cardList+="<div class='row mt-3 mb-3'>"
		s_cardList+="<div class='col-6' style='text-align: left;'>"
		for(var i=0;i<5;i++){
			if(benArr[i] != 0){
				s_cardList+="<span class='badge rounded-pill bg-light even-large-badge text-dark'>"+convert_category_name(benArr[i])+"</span>"
				s_cardList+="&nbsp&nbsp"
			}
		}
		s_cardList+="</div>"
		s_cardList+="</div>"
			
		s_cardList+="<div class='row mt-4'>"
		s_cardList+="<p style='text-align: left;'>연회비 : "+data2.annual_amount+"원</p>"
		s_cardList+="</div>"
		s_cardList+="</div>"
		s_cardList+="</div>"
		s_cardList+="</div>"
		s_cardList+="</div>"
		s_cardList+="</div>"
		s_cardList+="</div>"
		$('.cardlist').append(s_cardList);
	});
}


function objCheck(cateArr, ObjOne){
	
	for(var i=0;i<cateArr.length;i++){
		//alert(cateArr[i] +"::"+ convert_category_name(ObjOne.benefit1));
		
		if(cateArr[i] == convert_category_name(ObjOne.benefit1)){
			return true;
		}
		if(cateArr[i] == convert_category_name(ObjOne.benefit2)){
			return true;
		}
		if(cateArr[i] == convert_category_name(ObjOne.benefit3)){
			return true;
		}
		if(cateArr[i] == convert_category_name(ObjOne.benefit4)){
			return true;
		}
		if(cateArr[i] == convert_category_name(ObjOne.benefit5)){
			return true;
		}
	}
	
	return false;
}


window.onload = function(){
	$.ajax({
		type:'get',
		url:'cardlist_ajax',
		dataType:'json',
		success:function(data, status, xhr){
			objdata = data;
			to_jsp_cardList(data);
		},
		error:function(xhr, status, e){
			console.log("error:",e);
		}
	});
}