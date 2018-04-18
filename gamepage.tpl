%count = 0
%count1 = rows1
%num = 11
%temp = 0
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" type="text/css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
                  window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                },
                error: function (error) {
                  window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
            });
        }
    </script>
</head>

<body>
  <header>
    <div class="row">
      <div class="logo">
        <img src="Images\logo2.png">
      </div>
      <ul class="main-nav">
        <li>
          <a href="main">HOME</a>
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
      <button type="button" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Even-Steven</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="button" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Flip</button>
      <br/>
      <br/>
      <button type="button" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Double Dip</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="button" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Surrender</button>
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
