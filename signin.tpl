<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <meta name="google-signin-client_id" content="237964107198-0q4lgvs8d4nto9ds060779kj03rod9fb.apps.googleusercontent.com">
    <script>
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            var id_token = googleUser.getAuthResponse().id_token;
            var jsondata = { "ID": id_token, "Name": profile.getName(), "ImageURL": profile.getImageUrl(), "Email": profile.getEmail() }
            $.ajax({
                url: '/googlesignin',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(jsondata),
                type: 'POST',
                success: function (response) {
                  window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                },
                error: function (error) {
                  window.location.replace("https://kentcom.pythonanywhere.com");
                }
            });
        }
    </script>
	<script>
		function checkLoginState() {
		  FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
                    $.ajax({
                        url: '/facebooksignin',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(response),
                        type: 'POST',
                        success: function (response) {
                          window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
                        },
                        error: function (error) {
                          window.location.replace("https://kentcom.pythonanywhere.com");
                        }
                    });
                } else {
                    window.location.replace("https://kentcom.pythonanywhere.com");
                }
		  });
		}
	</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" type="text/css" />
    <title>KENTCOM-Game Page</title>
    <link rel="stylesheet" type="text/css" href="CSS/gamepage.css">
</head>

<body>
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12&appId=232093524010854&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

    <header>
        <div class="row">
            <div class="logo">
                <img src="Images\logo2.png">
            </div>
            <ul class="main-nav">
                <li>
                    <a href="main">Home Page</a>
                </li>
            </ul>
        </div>
        <div class="container">
            <div class="widget center">
                <div class="blur"></div>
                <div class="text center">
                    <h3 class="">SAVE THE PRINCESS GAME LOGIN</h3>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-3">
                                <div class="g-signin2" data-onsuccess="onSignIn"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="fb-login-button" scope="public_profile,email" return_scopes="true" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-use-continue-as="true" onlogin="checkLoginState();"></div>
                                <div class="col-md-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
</body>