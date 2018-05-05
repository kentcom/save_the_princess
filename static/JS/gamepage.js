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

function DoubleDip() {
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
    if (i < 2) {
        document.getElementById("option_A").onclick = function () {
            if ("{{correctOption}}" == AOId1 && i < 3) {
                i = i + 1;
                validateAnswer(OId1);
            }
            else {
                i = i + 1;
                SweetAlert("Wrong Answer!! One more choice left");
                if (i == 2) {
                    window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
            }
        }

        document.getElementById("option_B").onclick = function () {
            if ("{{correctOption}}" == AOId2 && i < 3) {
                i = i + 1;
                validateAnswer(OId2);
            }
            else {
                i = i + 1;
                SweetAlert("Wrong Answer!! One more choice left");
                if (i == 2) {
                    window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
            }
        }

        document.getElementById("option_C").onclick = function () {
            if ("{{correctOption}}" == AOId3 && i < 3) {
                i = i + 1;
                validateAnswer(OId3);
            }
            else {
                i = i + 1;
                SweetAlert("Wrong Answer!! One more choice left");
                if (i == 2) {
                    window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
            }
        }

        document.getElementById("option_D").onclick = function () {
            if ("{{correctOption}}" == AOId4 && i < 3) {
                i = i + 1;
                validateAnswer(OId4);
            }
            else {
                i = i + 1;
                SweetAlert("Wrong Answer!! One more choice left");
                if (i == 2) {
                    window.location.replace("https://kentcom.pythonanywhere.com/gameover");
                }
            }
        }
    }
    else {
        window.location.replace("https://kentcom.pythonanywhere.com/gameover");
    }
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