$(function(){
    
    //로그인 깃발
    var joinFlag=false;
    
    //경고창 숨기기
    $("#alert-idSuccess").hide();
    $("#alert-idDanger").hide();
    $("#alert-pwSuccess").hide();
    $("#alert-pwDanger").hide();
    $("#alert-pwSameSuccess").hide();
    $("#alert-pwSameDanger").hide();
    $("#alert-nameSuccess").hide();
    $("#alert-nameDanger").hide();
    $("#alert-emailSuccess").hide();
    $("#alert-emailDanger").hide();
    
    //아이디 유효값 체크
    $("#id").blur(function(){
        // userIdCheck : 영문 대.소문자, 숫자 _,-만 입력 가능하고 5에서 20자리를 입력했는지 체크한다 
        // {}사이에는 n과 m을 입력하여 n과 m사이의 값을 입력했는지 체크한다. n만 입력했을 경우 n자리 수 만큼 입력했는지 체크한다.
        var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
        if(!$(this).val().trim()==""){            
            if(!userIdCheck.test($(this).val().trim())){
                $("#alert-idSuccess").hide();
                $("#alert-idDanger").show();
                $("#submit").attr("disabled", "disabled");
                joinFlag=false;
            }else if(userIdCheck.test($(this).val().trim())){
                $("#alert-idSuccess").show();
                $("#alert-idDanger").hide();
                $("#submit").removeAttr("disabled");
                joinFlag=true;
            } 
        }else{
            $("#alert-idSuccess").hide();
            $("#alert-idDanger").hide();
            $("#submit").attr("disabled", "disabled");
        }
    });
    
    //비밀번호 유효값 체크
    $("#password1").blur(function(){
        // passwdCheck : 패스워드 체크에서는 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자가 되는지 검사를 한다.
        var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
        if(!$(this).val().trim()==""){            
            if(!passwdCheck.test($(this).val().trim())){
                $("#alert-pwSuccess").hide();
                $("#alert-pwDanger").show();
                $("#submit").attr("disabled", "disabled");
                joinFlag=false;
            }else if(passwdCheck.test($(this).val().trim())){
                $("#alert-pwSuccess").show();
                $("#alert-pwDanger").hide();
                $("#submit").removeAttr("disabled");
                joinFlag=true;
            } 
        } else{
            $("#alert-pwSuccess").hide();
            $("#alert-pwDanger").hide();
            $("#submit").attr("disabled", "disabled");
        }
    });

    //비밀번호 일치 로직
    //입력값 들어왔을 때 비밀번호 동일한지 체크
    $("#password2").blur(function(){ 
        var password1=$("#password1").val().trim();
        var password2=$("#password2").val().trim();
        if(password1 != "" || password2 != ""){ 
            if(!(password1 == password2)){ 
                $("#alert-pwSameSuccess").hide();
                $("#alert-pwSameDanger").show();
                $("#submit").attr("disabled", "disabled");
                joinFlag=false;
            }else { 
                $("#alert-pwSameSuccess").show();
                $("#alert-pwSameDanger").hide();
                $("#submit").removeAttr("disabled");
                joinFlag=true;
            }
        }  else {
            $("#alert-pwSameSuccess").hide();
            $("#alert-pwSameDanger").hide();
            $("#submit").removeAttr("disabled");
            joinFlag=false;
        }
    });
    //이름 유효값 체크
    $("#name").blur(function(){
        // nameCheck : 2~6글자의 한글만 입력하였는지 검사
        var nameCheck = RegExp(/^[가-힣]{2,6}$/);
        if(!$(this).val().trim()==""){            
            if(!nameCheck.test($(this).val().trim())){
                $("#alert-nameSuccess").hide();
                $("#alert-nameDanger").show();
                $("#submit").attr("disabled", "disabled");
                joinFlag=false;
            }else if(nameCheck.test($(this).val().trim())){
                $("#alert-nameSuccess").show();
                $("#alert-nameDanger").hide();
                $("#submit").removeAttr("disabled");
                joinFlag=true;
            } 
        }else{
            $("#alert-nameSuccess").hide();
            $("#alert-nameDanger").hide();
            $("#submit").attr("disabled", "disabled");
            joinFlag=false;
        }
    });
    //이메일 유효값 체크
    $("#email").blur(function(){
        // emailCheck : 이메일 형식에 맞게 썻는지 검사 ex)aa01@aa.aa
        var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
        if(!$(this).val().trim()==""){            
            if(!emailCheck.test($(this).val().trim())){
                $("#alert-emailSuccess").hide();
                $("#alert-emailDanger").show();
                $("#submit").attr("disabled", "disabled");
                joinFlag=false;
            }else if(emailCheck.test($(this).val().trim())){
                $("#alert-emailSuccess").show();
                $("#alert-emailDanger").hide();
                $("#submit").removeAttr("disabled");
                joinFlag=true;
            }             
        }else{            
            $("#alert-emailSuccess").hide();
            $("#alert-emailDanger").hide();
            $("#submit").attr("disabled", "disabled");
            joinFlag=false;
        }
    });
                
    // nickNameCheck : 한글과 영어, 숫자만 사용하였는지 검사
    // var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
    // birthdayCheck : 생년월일을 형식에 맞게 썻는지 검사 19또는 20으로 시작하여 0~9까지의 수개 2개까지 하여 년도 그 뒤에 0이면1~9 1이면 1~2(1월부터 12월까지기 때문에) 이런식으로 검사를 해준다.
    // var birthdayCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
    // phonNumberCheck : 01로 시작하여 그 다음은 0,1,7,9 중 하나와 매칭되는지 체크한뒤 7~8자리인지 검사한다. 
    // var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);

    //회원가입 폼 전송 제어
    return joinFlag;



})


//비밀번호변경 리사이징
function funcResizeTo(){
    window.resizeTo(iWidth,iHeight);
}


//비밀번호변경 검증
function pass_modify(form){
    var val_pass = form.password.value.match(/^[A-Za-z0-9\`~!@#$%^&*|\\\'\";:\/?\<\>\,\.\[\]\{\}\+\-\=\_]+$/);
    val_pass = val_pass.toString();

    //alert(val_pass+" , "+val_pass.length);
    if ( form.old_password.value == "")
    {
        alert("기존 비밀번호를 입력해 주세요.");
        form.password.focus();
        return false;
    }

    if ( form.password.value == "")
    {
        alert("비밀번호를 입력해 주세요.");
        form.password.focus();
        return false;
    }
    else if ( val_pass.length <= 7 || val_pass.length > 20 )
    {
        alert("비밀번호는 8~20자로 사용 가능하며, 영문, 숫자, 특수문자 모두 가능합니다.");
        form.password.value ="";
        form.password.focus();
        return false;
    }

    if ( form.repassword.value == "")
    {
        alert("비밀번호확인란을 입력해 주세요.");
        form.repassword.focus();
        return false;
    }
    else if( form.password.value != form.repassword.value)
    {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.")
        form.password.value ="";
        form.repassword.value ="";
        form.password.focus();
        return false;
    }

    if(!is_same_word(val_pass)){
        alert("동일한 단어를 세 번 이상 연달아 사용할 수 없습니다.");
        form.password.focus();
        return false;
    }

    if(!mixed_pass(val_pass)){
        alert("반드시 숫자, 특수문자, 영문중 두 가지 이상 사용해야 합니다.");
        form.password.focus();
        return false;
    }

    return true;
    // form.submit();
}

//같은문자 세번 반복
function is_same_word(value){
    var bool_is_same_word = true;
    var t = "";
    var c = 0;
    for(var i=0; i<value.length; i++){
        var v = value.charAt(i);
        if( t == v ){
            ++c;
        }else{
            c = 0;
        }
        t = v;

        if(c >= 2){ // 3회이상 불가
            bool_is_same_word= false;
            break;
        }
    }

    return bool_is_same_word;
}


//특수문자, 알파벳 , 숫자 2조합 이상
function mixed_pass(value){
    var num = value.search(/[0-9]/g);
    var eng = value.search(/[a-z]/ig);
    var spe = value.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
    var is_ok =true;
    if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
        is_ok = false;
    }
    return is_ok;
}

//한글체크
function hangul_chk(id){//{{{
    var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
    for (i=0; i< id.length; i++) {
        id_check = id.charAt(i);
        for ( j = 0 ;  j < str.length ; j++) {
            if (id_check == str.charAt(j)) break;
            if (j+1 == str.length) {
                return;
            }
        }
    }
    return true;
}//}}}


/*javascript onload*/
function addOnload(func) {
    var initOnLoad = window.onload;
    if(typeof initOnLoad == 'function') {
    window.onload = function() {
        initOnLoad();
        func();
    }
    }
    else {
    window.onload = func;
    }
}
function func_1st() {
}
function func_2nd() {
}
addOnload(func_1st);
addOnload(func_2nd);

/*checkbox select all*/
function check_class_toggle(){
    document.getElementById("classSelect").checked=!document.getElementById("classSelect").checked;
    for(var i=0;i<document.frm1.length;i++){
        document.frm1.elements[i].checked=!document.frm1.elements[i].checked; 
    }
}
