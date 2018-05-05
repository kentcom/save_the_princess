//disable keys
$(document).keydown(function (e) {
    e.preventDefault();
});

function flip() {
    var btn = document.getElementById("flip");
    document.cookie = "flip_btn=false";
    var x = getCookie("flip_btn");
    $.ajax({
        url: '/flipbutton',
        contentType: "application/json; charset=utf-8",
        type: 'POST',
        success: function (response) {
            window.location.replace("https://kentcom.pythonanywhere.com/gamepage");
            btn.disabled = true;
        }
    });
}

function checkflip() {
    var btn = document.getElementById("flip");
    if (getCookie("flip_btn")) {
        btn.disabled = true;
    }
}

function checkDouble() {
    var btn = document.getElementById("DoubleDip");
    if (getCookie("DoubleDip")) {
        btn.disabled = true;
    }
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
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

function Surrender() {
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

function homebutton() {
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