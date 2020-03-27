$(function(){
    
    //로그인 깃발
    var joinFlag=false;

    //비밀번호 일치 로직
    $("#alert-success").hide(); //비밀번호 일치
    $("#alert-danger").hide(); //비밀번호 불일치

    //입력값 들어왔을 때 체크
    $("input").keyup(
        function(){ 
            var password1=$("#password1").val();
            var password2=$("#password2").val();
            if(password1 != "" || password2 != ""){ 
                if(password1 == password2){ 
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{ 
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }
            } 
        }
    );



    $("#id").blur(function(){
        // userIdCheck : 영문 대.소문자, 숫자 _,-만 입력 가능하고 5에서 20자리를 입력했는지 체크한다 
        // {}사이에는 n과 m을 입력하여 n과 m사이의 값을 입력했는지 체크한다. n만 입력했을 경우 n자리 수 만큼 입력했는지 체크한다.
        var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
        if(!userIdCheck.test($(this).val().trim())){
            // alert('아이디 부적합');
            joinFlag=false;
        }else{
            joinFlag=true;
        }
    });
    $("#password1").blur(function(){
        // passwdCheck : 패스워드 체크에서는 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자가 되는지 검사를 한다.
        var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
        if(!passwdCheck.test($(this).val().trim())){
            // alert('비밀번호 부적합');
            joinFlag=false;
        }
    });
    
    $("#name").blur(function(){
        // nameCheck : 2~6글자의 한글만 입력하였는지 검사
        var nameCheck = RegExp(/^[가-힣]{2,6}$/);
        if(!nameCheck.test($(this).val().trim())){
            // alert('이름 부적합');
            joinFlag=false;
        }
    });

    
    $("#email").blur(function(){
        // emailCheck : 이메일 형식에 맞게 썻는지 검사 ex)aa01@aa.aa
        var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
        if(!emailCheck.test($(this).val().trim())){
            // alert('이메일 부적합');
            joinFlag=false;
        }
    });




    

    

    
    
    // nickNameCheck : 한글과 영어, 숫자만 사용하였는지 검사
    // var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);

    // birthdayCheck : 생년월일을 형식에 맞게 썻는지 검사 19또는 20으로 시작하여 0~9까지의 수개 2개까지 하여 년도 그 뒤에 0이면1~9 1이면 1~2(1월부터 12월까지기 때문에) 이런식으로 검사를 해준다.
    // var birthdayCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);

    // phonNumberCheck : 01로 시작하여 그 다음은 0,1,7,9 중 하나와 매칭되는지 체크한뒤 7~8자리인지 검사한다. 
    // var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);







 
    if(joinFlag){
        return true;
    } else{
        return false;
    }
})