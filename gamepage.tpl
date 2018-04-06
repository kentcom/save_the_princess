<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" type= "text/css"/>
  <title>KENTCOM-Game Page</title>
<link rel="stylesheet" type="text/css" href="CSS/gamepage.css">
</head>
<body>
  <header>
    <div class = "row">
      <div class = "logo">
        <img src="Images\logo2.png">
      </div>
      <ul class ="main-nav">
        <li><a href="main">Home Page</a></li>
            </ul>
    </div>
    <div class = "title">
      <h2> SAVE THE PRINCESS GAME</H2>
    </div>

    <div class = "container">
      %for row in rows:
         
      <div class = "label">
        <label for="Question">QUESTION </label>
        <!--<input type="text" style="width:30px;" name="qno"maxlength="2"/>-->
        <br>
        <textarea rows="5" cols = "100">{{row[0]}}</textarea>
    </div>
      
      <div class="button1">
        <button type="button" class="btn btn-outline-primary">{{row[1][0]}}</button></div>
      <div class="button2">
        <button type="button" class="btn btn-outline-primary">{{row[1][1]}}</button></div>
      <div class="button3">
        <button type="button" class="btn btn-outline-primary">{{row[1][2]}}</button></div>
      <div class = "button4">
        <button type="button" class="btn btn-outline-primary">{{row[1][3]}}</button>
      </div><br><br>
      %end
     <!--<div class="hint">
       <label for="hint">Hint: </label><br>
       <textarea rows="1" cols = "100"></textarea>
     </div>-->
     <div class = "lifelines">
       <button type="button" class="btn btn-outline-primary">Even-Steven</button>
       <button type="button" class="btn btn-outline-primary">Flip</button>
       <button type="button" class="btn btn-outline-primary">Double Dip</button>
       <button type="button" class="btn btn-outline-primary">Surrender</button></div>
       <div class="levels">
         <button type="button" class="btn btn-outline-primary">Level10</button><br>
         <button type="button" class="btn btn-outline-primary">Level9</button><br>
         <button type="button" class="btn btn-outline-primary">Level8</button><br>
         <button type="button" class="btn btn-outline-primary">Level7</button><br>
         <button type="button" class="btn btn-outline-primary">Level6</button><br>
         <button type="button" class="btn btn-outline-primary">Level5</button><br>
         <button type="button" class="btn btn-outline-primary">Level4</button><br>
         <button type="button" class="btn btn-outline-primary">Level3</button><br>
         <button type="button" class="btn btn-outline-primary">Level2</button><br>
         <button type="button" class="btn btn-outline-primary">Level1</button>
       </div>
</body>
