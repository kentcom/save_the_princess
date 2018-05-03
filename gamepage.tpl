%count = 0
%count1 = rows1
%num = 11
%temp = 0
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" type="text/css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <!-- Alerts JS -->
  <script src="https://unpkg.com/sweetalert2@7.19.0/dist/sweetalert2.all.js"></script>

  <!-- disable keys -->
  <script type='text/javascript'>
    $(document).keydown(function(e){
      e.preventDefault();
    });
  </script>
  <title>KENTCOM-Game Page</title>
  <link rel="stylesheet" type="text/css" href="CSS/gamepage.css">
  <style type="text/css">
    textarea {
      width: 260%;
      height: 99%;
      background-color: white;
      font-size: 1.5em;
      font-weight: bold;
      font-color: solid black;
      font-family: Verdana, Arial, Helvetica, sans-serif;
      border: 1px solid black;
      padding: 10px;
    }

    .butn {
      background-color: #4CAF50;
      /* Green */
      border: none;
      color: white;
      padding: 10px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-family: Verdana, Arial, Helvetica, sans-serif;
      font-size: 1.6em;
      font-weight: bold;
      width: 400px;
      height: 80px;
    }

    .lvls {
      background-color: #4CAF50;
      /* Green */
      border: none;
      color: white;
      padding: 10px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-family: Verdana, Arial, Helvetica, sans-serif;
      font-size: 1.5em;
      font-weight: bold;
      width: 200px;
      height: 50px;
    }
  </style>

  <script>
        function flip()
        {
            var btn = document.getElementById("flip");
            document.cookie = "flip_btn=false";     
            var x = getCookie("flip_btn");
           // var jsondata = { "": "" }
            $.ajax({
                url: '/flipbutton',
                contentType: "application/json; charset=utf-8",
              //  data: JSON.stringify(jsondata),
                type: 'POST',
                success: function (response) {
                  window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                  btn.disabled = true;
                }
                      });
                      
        }
        function checkflip()
        {
          var btn = document.getElementById("flip");
              if(getCookie("flip_btn"))
            {
              btn.disabled = true;
              
            }
            
        }

        function checkDouble()
        {
          var btn = document.getElementById("DoubleDip");
              if(getCookie("DoubleDip"))
            {
              btn.disabled = true;
              
            }
            
        }
        
        function getCookie(cname) {
          var name = cname + "=";
          var ca = document.cookie.split(';');
          for(var i = 0; i < ca.length; i++) {
              var c = ca[i];
              while (c.charAt(0) == ' ') {
                  c = c.substring(1);
              }
              if (c.indexOf(name) == 0) {
                  return c.substring(name.length, c.length);
              }
          }
          return "";
}

        function Surrender()
        {
            var btn = document.getElementById("Surrender");
            swal({
                  title: "Are you sure?",
                  text: "You will not be able to recover the process in the game!",
                  type: "warning",
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  confirmButtonText: 'Continue',
                  animation: "slide-from-top",
                  dangerMode: true,
                }).then((result) => {
                  if (result.value) {
                    window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                  }
                });
            
        }
        function DoubleDip()
        {
          

          var btn = document.getElementById("DoubleDip");
          document.cookie = "DoubleDip=false";
          var x = getCookie("DoubleDip");
          btn.disabled = true;
          
          var OId1 = document.getElementById("option_A");
          var OId2 = document.getElementById("option_B");
          var OId3 = document.getElementById("option_C");
          var OId4 = document.getElementById("option_D");
          
          var i = 0;

          var AOId1 = document.getElementById("option_A").value;
          var AOId2 = document.getElementById("option_B").value;
          var AOId3 = document.getElementById("option_C").value;
          var AOId4 = document.getElementById("option_D").value;
          if(i<2)
          {
            
              document.getElementById("option_A").onclick = function() {
              
              if("{{correctOption}}" == AOId1 && i<3)
              {
                 i=i+1;
                validateAnswer(OId1);
              }
              else
              {
                i=i+1;
                SweetAlert("Wrong Answer!! One more choice left");
                if(i==2)
                {
                  window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
              }
          }

          document.getElementById("option_B").onclick = function() {
              
              if("{{correctOption}}" == AOId2 && i<3)
              {
                 i=i+1;
                validateAnswer(OId2);
              }
              else
              {
                i=i+1;
                SweetAlert("Wrong Answer!! One more choice left");
                if(i==2)
                {
                  window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
              }
          }

          document.getElementById("option_C").onclick = function() {
              
              if("{{correctOption}}" == AOId3 && i<3)
              {
                 i=i+1;
                validateAnswer(OId3);
              }
              else
              {
                i=i+1;
                SweetAlert("Wrong Answer!! One more choice left");
                if(i==2)
                {
                  window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
              }
          }

           document.getElementById("option_D").onclick = function() {
              
              if("{{correctOption}}" == AOId4 && i<3)
              {
                 i=i+1;
                validateAnswer(OId4);
              }
              else
              {
                i=i+1;
                SweetAlert("Wrong Answer!! One more choice left");
                if(i==2)
                {
                  window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
              }
          }
          }
          else
          {
            window.location.replace("https://kentcom.pythonanywhere.com/gameover");
          }
          
          
         /* alert(AOId2);
          alert(AOId3);
          alert(AOId4);*/

        }
        function homebutton()
        {
          
          swal({
          title: "Are you sure?",
          text: "You will not be able to recover the process in the game!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          confirmButtonText: 'Continue',
          animation: "slide-from-top",
          dangerMode: true,
        }).then((result) => {
          if (result.value) {
            window.location.replace("https://kentcom.pythonanywhere.com/gameover");
          }
        });
        }
        function validateAnswer(elem) {
			      var selectedID = elem.id;
            var selectedAnswer = document.getElementById(selectedID).value;
            var jsondata = { "selectedAnswer": selectedAnswer }
            $.ajax({
                url: '/gamepage',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(jsondata),
                type: 'POST',
                success: function (response) {
                  swal({
                      title: 'Correct!!',
                      allowOutsideClick: false,
                      allowEscapeKey: false,
                      type: 'success',
                      showCancelButton: false,
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: 'Continue'
                    }).then((result) => {
                      if (result.value) {
                        if({{rows1}}==1)
                        {
                          
                          swal({
                                  title: "Hooraayy!!!!",
                                  text: "You have completed 2 levels",
                                  allowOutsideClick: false,
                                  allowEscapeKey: false,
                                  showCancelButton: false,
                                  confirmButtonColor: '#3085d6',
                                  confirmButtonText: 'Continue',
                                  animation: "slide-from-top",
                                  dangerMode: true,
                                }).then((result) => {
                                  if (result.value) {
                                    window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                                  }
                                });
                        }
                          else if({{rows1}}==3)
                        {
                          
                          swal({
                                  title: "Bravo!!!!",
                                  text: "It is going to be exciting now onwards!! You have completed 4 Levels",
                                  allowOutsideClick: false,
                                  allowEscapeKey: false,
                                  showCancelButton: false,
                                  confirmButtonColor: '#3085d6',
                                  confirmButtonText: 'Continue',
                                  animation: "slide-from-top",
                                  dangerMode: true,
                                }).then((result) => {
                                  if (result.value) {
                                    window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                                  }
                                });
                        }
                        else if({{rows1}}==5)
                        {
                          
                          swal({
                                  title: "WARRIOR TO DEMON:",
                                  text: "I will save my Princess, I shall die trying to save my kingdom's pride!!",
                                  allowOutsideClick: false,
                                  allowEscapeKey: false,
                                  showCancelButton: false,
                                  confirmButtonColor: '#3085d6',
                                  confirmButtonText: 'Continue',
                                  animation: "slide-from-top",
                                  dangerMode: true,
                                }).then((result) => {
                                  if (result.value) {
                                    window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                                  }
                                });
                        }
                        
                        else if({{rows1}}==7)
                        {
                          
                          swal({
                                  title: "WARRRIOR TO DEMON:",
                                  text: "You cannot defeat my kingdom, I will make my King Proud!!",
                                  allowOutsideClick: false,
                                  allowEscapeKey: false,
                                  showCancelButton: false,
                                  confirmButtonColor: '#3085d6',
                                  confirmButtonText: 'Continue',
                                  animation: "slide-from-top",
                                  dangerMode: true,
                                }).then((result) => {
                                  if (result.value) {
                                    window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                                  }
                                });
                        }
                        else if({{rows1}}==8)
                        {
                          
                          swal({
                                  title: "DEMON......!!!!",
                                  text: "You are smart indeed, this next question is everything I have..!!",
                                  allowOutsideClick: false,
                                  allowEscapeKey: false,
                                  showCancelButton: false,
                                  confirmButtonColor: '#3085d6',
                                  confirmButtonText: 'Continue',
                                  animation: "slide-from-top",
                                  dangerMode: true,
                                }).then((result) => {
                                  if (result.value) {
                                    window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                                  }
                                });
                        }
                        else if({{rows1}}>9)
                        {
                          window.location.replace("https://kentcom.pythonanywhere.com/congrats");
                        }
                        else
                        {
                        window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                        }
                      }
                    })
                },
                error: function (error) {
                  swal({
                      title: 'Wrong Answer...!!',
                      allowOutsideClick: false,
                      allowEscapeKey: false,
                      type: 'error',
                      showCancelButton: false,
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: 'Continue'
                    }).then((result) => {
                      if (result.value) {
                        window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                      }
                    })
                }
            });
        }
    </script>
</head>

<body onload="checkflip(); checkDouble()">
  <header>
    <div class="row">
      <div class="logo">
        <img src="Images\logo2.png">
      </div>
      <ul class="main-nav">
        <li>
          <a href="javascript:homebutton()" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">HOME</a>
        </li>
      </ul>
    </div>
    <div class="title">
      <h2> SAVE THE PRINCESS GAME</H2>
    </div>

    <div class="container">
      <div class="row">
        <div class="label">
          <label for="Question" style="font-size:25px;">QUESTION </label>
          <!--<input type="text" style="width:30px;" name="qno"maxlength="2"/>-->
          <br>
          <textarea disabled rows="5" cols="20">{{question}}</textarea>
          <br>
          <label for="Options" style="font-size:25px;">CLICK ON THE CORRECT OPTION </label>
        </div>
      </div>
    </div>
    <div class="button1">
      <input type="button" id="option_A" value="{{options[0]}}" onclick="validateAnswer(this)" class="butn btn-outline-primary">
    </div>
    <div class="button2">
      <input type="button" id="option_B" value="{{options[1]}}" onclick="validateAnswer(this)" class="butn btn-outline-primary">
    </div>
    <div class="button3">
      <input type="button" id="option_C" value="{{options[2]}}" onclick="validateAnswer(this)" class="butn btn-outline-primary">
    </div>
    <div class="button4">
      <input type="button" id="option_D" value="{{options[3]}}" onclick="validateAnswer(this)" class="butn btn-outline-primary">
    </div>
    <br>
    <br>

    <!--<div class="hint">
       <label for="hint">Hint: </label><br>
       <textarea rows="1" cols = "100"></textarea>
     </div>-->
    <div class="lifelines">
      <div class="label">
        <label for="Lifelines" style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LIFE LINES</label>
      </div>
      <br/>
      <br/>
      <br/>
      <button type="button" id="EvenSteven" onclick="EvenSteven()" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Even-Steven</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="button" id="flip" onclick="flip()" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Flip</button>
      <br/>
      <br/>
      <button type="button" id="DoubleDip" onclick="DoubleDip()" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Double Dip</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="button" id="Surrender" onclick="Surrender()" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Surrender</button>
      <div class="label">
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <label for="Lifelines" style="font-size:20px;">YOUR CURRENT LEVEL</label>
      </div>
    </div>
    <div class="levels">
      %while count<10:
        <div>
        %count = count+1
        %num=num-1
        %temp = 10 - count1
        %if count< temp:
           <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level{{num}}</button><br/>

        %else:
            <div>
            <button type="button" class="btn btn-outline-primary" style="background-color: #0000ff;color: #ffff; width:90px">Level{{num}}</button><br/>
            <div>
         </div>
      %end
      </div>
</body>