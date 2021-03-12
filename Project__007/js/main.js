function yhdl(){
  var yhm = document.getElementsByName('username')[0].value
  var mm = document.getElementsByName('passwd')[0].value

  $.ajax({
    url:"http://127.0.0.1:5000/yhdl?yhm=" + yhm + "&mm=" + mm ,
    type:"get",
    async : false,
    dataType:"json",
    success: function(res){
      if(res.data == 1){
        document.getElementsByName('username')[0].style.color='#000';
        document.getElementsByName('passwd')[0].style.color='#000';
        alert('登录成功!');
        localStorage.setItem("username",yhm);

        window.location.href = '../index.html';
        window.event.returnValue=false
        $.ajax({
          url: "http://127.0.0.1:5000/jf?yhm=" + yhm,
          type: "get",
          async: false,
          dataType: "json",
          success: function (res) {
            console.log(res.data)
            localStorage.setItem("jifen",res.data);
            
    
          },
          error: function (e) {
            console.log(e);
          }
        });
      }
      else{
        document.getElementsByName('username')[0].style.color='red';
        document.getElementsByName('passwd')[0].style.color='red';
        alert("账号密码不匹配,请重新登录或注册!")
      }

        
    },
    error:function(e){
        console.log(e);
    }    
});
}


function zhuce(){
  var yhm = document.getElementsByName('username')[0].value
  var mm = document.getElementsByName('passwd')[0].value
  $.ajax({
    url:"http://127.0.0.1:5000/yhzc?yhm=" + yhm + "&mm=" + mm,
    type:"get",
    async : false,
    dataType:"json",
    success: function(data){
        console.log(data)
        window.location.href = '../index.html';
        localStorage.setItem("username",yhm);
        window.event.returnValue=false
        $.ajax({
          url: "http://127.0.0.1:5000/jf?yhm=" + yhm,
          type: "get",
          async: false,
          dataType: "json",
          success: function (res) {
            console.log(res.data)
            localStorage.setItem("jifen",res.data);
    
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
function queren(){
  var yhm = document.getElementsByName('username')[0].value
  console.log('Checking')
  console.log(yhm)
  $.ajax({
    url:"http://127.0.0.1:5000/yhmpd?yhm=" + yhm,
    type:"get",
    async : false,
    dataType:"json",
    success: function(res){
        console.log(res)
        if(res.data == 1){
          document.getElementsByName('username')[0].style.color='red';
          alert("用户名重复")
        }
        else{
          document.getElementsByName('username')[0].style.color='#000'
          

        }
         
    },
    error:function(e){
        console.log(e);
    }
});
}