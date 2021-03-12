function denglu() {
  var NAME = document.getElementsByName('username')[0].value
  var PSWORD = document.getElementsByName('password')[0].value
  $.ajax({
    url: "http://127.0.0.1:5000/denglu?NAME=" + NAME + "&PSWORD=" + PSWORD,
    type: "get",
    async: false,
    dataType: "json",
    success: function (res) {
      if (res.data == 1) {
        document.getElementsByName('username')[0].style.color = '#fff';
        document.getElementsByName('password')[0].style.color = '#fff';
        alert('登录成功!');
        localStorage.setItem("username", NAME);
        window.location.href = './html/homepage.html';
        // window.location.href="www.baidu.com";
        window.event.returnValue = false
        $.ajax({
          url: "http://127.0.0.1:5000/jiafen?NAME=" + NAME,
          type: "get",
          async: false,
          dataType: "json",
          success: function (res) {
            console.log(res.data)
            localStorage.setItem("SCORES", res.data);
          },
          error: function (e) {
            console.log(e);
          }
        });
      }
      else {
        document.getElementsByName('username')[0].style.color = 'red';

        alert("账号密码不匹配!")
      }


    },
    error: function (e) {
      console.log(e);
    }
  });
}





function regedit() {
  var NAME = document.getElementsByName('username')[0].value
  var PSWORD = document.getElementsByName('password')[0].value
  $.ajax({
    url: "http://127.0.0.1:5000/zhuce?NAME=" + NAME + "&PSWORD=" + PSWORD,
    type: "get",
    async: false,
    dataType: "json",
    success: function (data) {
      console.log(data)
      alert('注册成功!');
      window.location.href = 'homepage.html';
      localStorage.setItem("username", NAME);

      // window.location.href="www.baidu.com";
      window.event.returnValue = false
      $.ajax({
        url: "http://127.0.0.1:5000/jiafen?NAME=" + NAME,
        type: "get",
        async: false,
        dataType: "json",
        success: function (res) {
          console.log(res.data)
          localStorage.setItem("SCORES", res.data);

        },
        error: function (e) {
          console.log(e);
        }
      });
    },
    error: function (e) {
      console.log(e);
    }
  });
}

function jiaoyan() {
  var username_input = document.getElementsByName('username')[0].value
  console.log('Checking')
  console.log(username_input)
  $.ajax({
    url: "http://127.0.0.1:5000/panduanyonghuming?NAME=" + username_input,
    type: "get",
    async: false,
    dataType: "json",
    success: function (res) {
      console.log(res)
      if (res.data == 1) {
        document.getElementsByName('username')[0].style.color = 'red';
        alert("用户名重复,请重新输入")

      }
      else {
        document.getElementsByName('username')[0].style.color = '#fff'


      }

    },
    error: function (e) {
      console.log(e);
    }
  });
}