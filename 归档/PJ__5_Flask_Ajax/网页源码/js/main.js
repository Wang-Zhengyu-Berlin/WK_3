(function ($) {
    "use strict";

    /*==================================================================
    [ Focus Contact2 ]*/
    $('.input100').each(function () {
        $(this).on('blur', function () {
            if ($(this).val().trim() != "") {
                $(this).addClass('has-val');
            } else {
                $(this).removeClass('has-val');
            }
        })
    })

    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit', function () {
        var check = true;

        for (var i = 0; i < input.length; i++) {
            if (validate(input[i]) == false) {
                showValidate(input[i]);
                check = false;
            }
        }

        return check;
    });


    $('.validate-form .input100').each(function () {
        $(this).focus(function () {
            hideValidate(this);
        });
    });

    function validate(input) {
        if ($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if ($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        } else {
            if ($(input).val().trim() == '') {
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }


})(jQuery);


function login(){
    var NAME = document.getElementsByName('username')[0].value
    var PSWORD = document.getElementsByName('pass')[0].value
  
    $.ajax({
      url:"http://127.0.0.1:5000/login?NAME=" + NAME + "&PSWORD=" + PSWORD ,
      type:"get",
      async : false,
      dataType:"json",
      success: function(res){
        if(res.data == 1){
          alert('登录成功!');
          localStorage.setItem("username",NAME);
          window.location.href = './html/home.html';
          // window.location.href="www.baidu.com";
          window.event.returnValue=false
          $.ajax({
            url: "http://127.0.0.1:5000/ten_change?NAME=" + NAME,
            type: "get",
            async: false,
            dataType: "json",
            success: function (res) {
              console.log(res.data)
              localStorage.setItem("SCORES",res.data);
            },
            error: function (e) {
              console.log(e);
            }
          });
        }
        else{
          document.getElementsByName('username')[0].style.color='red';
          document.getElementsByName('pass')[0].style.color='red';
          alert("账号密码不匹配,请重新登录或注册!")
        }
  
          
      },
      error:function(e){
          console.log(e);
      }    
  });
  }
  
 
  
  function new_user(){
    var NAME = document.getElementsByName('username')[0].value
    var PSWORD = document.getElementsByName('pass')[0].value
    $.ajax({
      url:"http://127.0.0.1:5000/new_user?NAME=" + NAME + "&PSWORD=" + PSWORD,
      type:"get",
      async : false,
      dataType:"json",
      success: function(data){
          console.log(data)
          alert('注册成功,已为您登录!');
          window.location.href = 'home.html';
          localStorage.setItem("username",NAME);
  
          // window.location.href="www.baidu.com";
          window.event.returnValue=false
          $.ajax({
            url: "http://127.0.0.1:5000/ten_change?NAME=" + NAME,
            type: "get",
            async: false,
            dataType: "json",
            success: function (res) {
              console.log(res.data)
              localStorage.setItem("SCORES",res.data);
      
            },
            error: function (e) {
              console.log(e);
            }
          });
      },
      error:function(e){
          console.log(e);
      }    
  });
  }
  function if_name_not_replace(){
    var username_input = document.getElementsByName('username')[0].value
    console.log('Checking')
    console.log(username_input)
    $.ajax({
      url:"http://127.0.0.1:5000/if_name_not_replace?NAME=" + username_input,
      type:"get",
      async : false,
      dataType:"json",
      success: function(res){
          console.log(res)
          if(res.data == 1){
            document.getElementsByName('username')[0].style.color='red';
            alert("用户名重复,请重新输入")
            
          }
          else{
            document.getElementsByName('username')[0].style.color='#green'
            
  
          }
           
      },
      error:function(e){
          console.log(e);
      }
  });
  }