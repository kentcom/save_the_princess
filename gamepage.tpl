<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" type= "text/css"/>
  <title>KENTCOM-Game Page</title>
<link rel="stylesheet" type="text/css" href="CSS/gamepage.css">
<style type="text/css">
textarea {
 width: 1100px;
 height: 250px;
 background-color: white;
 font-size: 1.5em;
 font-weight: bold;
 font-color: solid black;
 font-family: Verdana, Arial, Helvetica, sans-serif;
 border: 1px solid black;
 padding: 10px;
}
.butn {
    background-color: #4CAF50; /* Green */
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
    background-color: #4CAF50; /* Green */
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
</head>
<body>
  <header>
    <div class = "row">
      <div class = "logo">
        <img src="Images\logo2.png">
      </div>
      <ul class ="main-nav">
        <li><a href="main">HOME</a></li>
            </ul>
    </div>
    <div class = "title">
      <h2> SAVE THE PRINCESS GAME</H2>
    </div>

    <div class = "container">
      %for row in questions:   
      <div class = "label">
        <label for="Question" style="font-size:25px;">QUESTION </label>
        <!--<input type="text" style="width:30px;" name="qno"maxlength="2"/>-->
        <br>
        
        <textarea disabled>{{row[0]}}</textarea>
        <br><br>
        <label for="Options" style="font-size:25px;">CLICK ON THE CORRECT OPTION </label>
    </div>
      %end
     
      <div class="button1">
        <button type="button" class="butn btn-outline-primary" >{{options[0]}}</button></div>
      <div class="button2">
        <button type="button" class="butn btn-outline-primary">{{options[1]}}</button></div>
      <div class="button3">
        <button type="button" class="butn btn-outline-primary">{{options[2]}}</button></div>
      <div class = "button4">
        <button type="button" class="butn btn-outline-primary">{{options[3]}}</button></div>
      <br><br>
      
     <!--<div class="hint">
       <label for="hint">Hint: </label><br>
       <textarea rows="1" cols = "100"></textarea>
     </div>-->
     <div class = "lifelines">
       <button type="button" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Even-Steven</button>
       <button type="button" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Flip</button>
       <button type="button" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Double Dip</button>
       <button type="button" class="btn btn-outline-primary" style="background-color: #9A5280;color: #ffff; width:120px;height:50px">Surrender</button></div>
       <div class="levels">
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level10</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level9</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level8</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level7</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level6</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level5</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level4</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level3</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level2</button><br>
         <button type="button" class="btn btn-outline-primary" style="background-color: #004250;color: #ffff; width:90px">Level1</button>
       </div>
</body>
