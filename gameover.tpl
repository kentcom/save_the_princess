<head>
  <title>KENTCOM-Game Over</title>
  <link href ="CSS/gameover.css" rel="stylesheet" type="text/css">
  <script>
    function deleteCookie() {
      document.cookie = "DoubleDip=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
      document.cookie = "flip_btn=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    }
  </script>
</head>
<body onload="deleteCookie();">
      <div class = "logo">
        <img src="Images\logo2.png">
      </div>

      <div class="buttonclass">
        <a href="gamepage" class ="btn btn-quit">Play Again and Save The Princess </a>
        <a href="main" class ="btn btn-startagain"> I am a Quitter </a>

    </div>
</body>
