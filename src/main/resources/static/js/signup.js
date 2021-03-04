   var lst = [];
   var count=0;

   var cnt=0;
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
function test_checkbox(i){
   var values = document.getElementsByName("benefit");
   if (values[i].checked) {
       count++;
       lst.push(values[i].value);
    }
   if(!values[i].checked){
       count--;
       var a = lst.indexOf(values[i].value)
       lst.splice(a,1);

     }
    if(count==0){
         document.getElementById("benefit1_p").innerText='';
         document.getElementById("benefit2_p").innerText='';
         document.getElementById("benefit3_p").innerText='';
         document.getElementById("benefit1").value=0;
         document.getElementById("benefit2").value=0;
         document.getElementById("benefit3").value=0;
      }
      if(count==1){
         document.getElementById("benefit1_p").innerText='';
         document.getElementById("benefit2_p").innerText='';
         document.getElementById("benefit3_p").innerText='';
         document.getElementById("benefit1_p").innerText+=' '+lst[0];
         document.getElementById("benefit1").value=convert_category_num(lst[0]); 
         document.getElementById("benefit2").value=0;
         document.getElementById("benefit3").value=0;
      }
      if(count==2){
         document.getElementById("benefit1_p").innerText='';
         document.getElementById("benefit2_p").innerText='';
         document.getElementById("benefit3_p").innerText='';
         document.getElementById("benefit1_p").innerText+=' '+lst[0];
         document.getElementById("benefit2_p").innerText+=' '+lst[1];
         document.getElementById("benefit1").value=convert_category_num(lst[0]);
         document.getElementById("benefit2").value=convert_category_num(lst[1]);
         document.getElementById("benefit3").value=0;
      }
      if(count==3){
         document.getElementById("benefit1_p").innerText='';
         document.getElementById("benefit2_p").innerText='';
         document.getElementById("benefit3_p").innerText='';
         document.getElementById("benefit1_p").innerText+=' '+lst[0];
         document.getElementById("benefit2_p").innerText+=' '+lst[1];
         document.getElementById("benefit3_p").innerText+=' '+lst[2];
         document.getElementById("benefit1").value=convert_category_num(lst[0]);
         document.getElementById("benefit2").value=convert_category_num(lst[1]);
         document.getElementById("benefit3").value=convert_category_num(lst[2]);
      }
      if(count>2){
          $(":checkbox:not(:checked)").attr("disabled","disabled");
       }else{
          $("input[name=benefit]:checkbox").removeAttr("disabled");
       }



}

function doublecheck(){
	var user_id =$("#user_id").val();
	
	var data = {user_id : user_id};
	$.ajax({
      //배포용
      url:"/bccard/idChk",
//		url:"/app/idChk",
		type:"post",
		dataType: "json",
		data: data,
		success: function(data){
			if(data ==1){
				document.getElementById("error_id").innerHTML=''
				document.getElementById("error_id").innerHTML="사용 중인 아이디입니다."
					$("#error_id").css("color","red")
				cnt++;
			}else if(data==3){
				document.getElementById("error_id").innerHTML=''
				document.getElementById("error_id").innerHTML="아이디를 입력하세요."
				$("#error_id").css("color","black")
			}else{
				document.getElementById("error_id").innerHTML=''
				document.getElementById("error_id").innerHTML="사용 가능한 아이디입니다."
					$("#error_id").css("color","blue")
				cnt++;
			}
		}
	})

}
