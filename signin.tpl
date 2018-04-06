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
                    window.location.replace("https://kentcom.pythonanywhere.com/");
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
    <script>
        // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
            console.log('statusChangeCallback');
            console.log(response);
            FB.login(function (response) {
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
                            window.location.replace("https://kentcom.pythonanywhere.com/");
                        }
                    });
                } else {
                    window.location.replace("https://kentcom.pythonanywhere.com/");
                }
            }, { scope: 'public_profile,email' });
        }

        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }

        window.fbAsyncInit = function () {
            FB.init({
                appId: '232093524010854',
                cookie: true,  // enable cookies to allow the server to access 
                // the session
                xfbml: true,  // parse social plugins on this page
                version: 'v2.8' // use graph api version 2.8
            });

            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });

        };

        // Load the SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        function testAPI() {
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me', function (response) {
                console.log('Successful login for: ' + response.name);
                document.getElementById('status').innerHTML =
                    'Thanks for logging in, ' + response.name + '!';
            });
        }
    </script>
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
                    <h1 class="">SAVE THE PRINCESS GAME</h1>
                    <p>Login</p>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-3">
                                <div class="g-signin2" data-onsuccess="onSignIn"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="fb-login-button" scope="public_profile,email" onclick="checkLoginState();" data-max-rows="1" data-size="medium"
                                    data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true"></div>
                                <div id="status">
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
</body>