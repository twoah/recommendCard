function loadQuery(){
    console.log("perform.js load");
    var oScript = document.createElement("script");
    oScript.type = "text/javascript";
    oScript.charset = "utf-8";
    oScript.src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js";
    document.getElementsByTagName("head")[0].appendChild(oScript);
}
$(document).ready(function(){  
    $("#search_btn").on("click",function(){
        console.log("search_btn clicked");
        var card_name = document.getElementById("select_card").value;
        var select_month = document.getElementById("select_month").value;
        var select_year = document.getElementById("select_year").value;
        var selectData={
            "card_name":card_name,
            "select_month":select_month,
            "select_year":select_year
        }
        var formData = $("#select_form").serialize();
        console.log(selectData);
        loadQuery();
        $.ajax({
            url:'/bccard/perform_month',
            //배포용
            //url:'/app/perform_month', 
            type:'POST',
            data:selectData,
            datatype:JSON,
            timeout:1000,
            success:function(result){
                $("#user_perform_div").html(result);
            },
            complete:function(result){
                console.log(selectData);
            }
        })
    });
})