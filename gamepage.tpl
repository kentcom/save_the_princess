%count = 0
%count1 = rows1
%num = 11
%temp = 0
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" type="text/css" href="CSS/gamepage.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <!-- Alerts JS -->
  <script src="https://unpkg.com/sweetalert2@7.19.0/dist/sweetalert2.all.js"></script>

  <script src="JS/gamepage.js"></script>
  <script>
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
  <title>KENTCOM-Game Page</title>
</head>

<body onload="checkflip(); checkDouble();">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          &nbsp;
        </div>
      </div>
      <div class="row align-items-center">
        <div class="col-md-2">
          <img src="Images\logo2.png" class="logo" alt="Kentcom Logo" >
        </div>
        <div class="col-md-8">
        </div>
        <div class="col-md-1">
          <ul class="main-nav">
            <li>
              <a href="javascript:homebutton()" class="btn btn-primary btn-md active" role="button" aria-pressed="true">HOME</a>
            </li>
          </ul>
        </div>
        <div class="col-md-1">
        </div>
      </div>
      <div class="row text-center">
        <div class="col-md-12">
          <h2 class="text-color-white"> SAVE THE PRINCESS GAME </h2>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          &nbsp;
        </div>
      </div>
      <div class="row">
        <div class="col-md-1">
          <label for="Adv" style="font-size:25px;">Adv </label>
        </div>
        <div class="col-md-7">
          <div class="row">
            <div class="col-md-12">
              <label for="Question" class="text-color-white" style="font-size:25px;">QUESTION </label>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <textarea disabled rows="7" style="width: 100%; resize: none; font-size:25px;">{{question}}</textarea>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              &nbsp;
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <label for="Options" class="text-color-white" style="font-size:25px;">CLICK ON THE CORRECT OPTION </label>
            </div>
          </div>
          <div class="row align-items-center">
            <div class="col-md-6">
              <input type="button" id="option_A" value="{{options[0]}}" onclick="validateAnswer(this)" class="btn btn-success btn-lg btn-block my-2 font-weight-bold" style="font-size: 25px;">
            </div>
            <div class="col-md-6">
              <input type="button" id="option_B" value="{{options[1]}}" onclick="validateAnswer(this)" class="btn btn-success btn-lg btn-block my-2 font-weight-bold" style="font-size: 25px;">
            </div>
          </div>
          <div class="row align-items-center">
            <div class="col-md-6">
              <input type="button" id="option_C" value="{{options[2]}}" onclick="validateAnswer(this)" class="btn btn-success btn-lg btn-block my-2 font-weight-bold" style="font-size: 25px;">
            </div>
            <div class="col-md-6">
              <input type="button" id="option_D" value="{{options[3]}}" onclick="validateAnswer(this)" class="btn btn-success btn-lg btn-block my-2 font-weight-bold" style="font-size: 25px;">
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="row text-center">
            <div class="col-md-12">
              <label for="Lifelines" class="text-color-white" style="font-size:25px;">LIFELINES</label>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <button type="button" id="EvenSteven" onclick="EvenSteven()" class="btn btn-danger btn-block my-2">Even-Steven</button>
            </div>
            <div class="col-sm-6">
              <button type="button" id="flip" onclick="flip()" class="btn btn-danger btn-block my-2">Flip</button>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <button type="button" id="DoubleDip" onclick="DoubleDip()" class="btn btn-danger btn-block my-2">Double Dip</button>
            </div>
            <div class="col-sm-6">
              <button type="button" id="Surrender" onclick="Surrender()" class="btn btn-danger btn-block my-2">Surrender</button>
            </div>
          </div>
          <div class="row text-center">
            <div class="col-md-12">
              <label for="Lifelines" class="text-color-white" style="font-size:20px;">YOUR CURRENT LEVEL</label>
            </div>
          </div>
          %while count<10:
              %count = count+1
              %num=num-1
              %temp = 10 - count1
              %if count< temp:
                <div class="row text-center">
                  <div class="col-md-12">
                    <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level{{num}}</button>
                  </div>
                </div>
              %else:
              <div class="row text-center">
                <div class="col-md-12">
                  <button type="button" class="btn btn-outline-primary" style="background-color: #0000ff;color: #ffff; width:90px">Level{{num}}</button>
                </div>
              </div>
              %end
            %end
        </div>
        <div class="col-md-1">
          <label for="Adv" style="font-size:25px;">Adv </label>
        </div>
      </div>
    </div>
</body>