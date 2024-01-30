$(document).ready(function () {
    $('.swiper-wrapper').slick({
        slidesToShow: 1,
        autoplay: true,
        autoplaySpeed: 3000,
        prevArrow: `<div class="swiper-button-prev"></div>`,
        nextArrow: `<div class="swiper-button-next"></div>`,
        fade: true,
        cssEase: 'linear',
        responsive: [
            {
                breakpoint: 1025,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: false,

                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: false,
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: false,
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]

    });
});




function openForm() {
    document.getElementById("myForm").style.display = "block";
}

function closeForm() {
    document.getElementById("myForm").style.display = "none";
}



/**
 * function to submit form asynchronus
 */
$(document).ready(function () {
    $('#btnlogin').click(function () {
        $.ajax({
            type: 'POST',
            url: '/SWP/login',
            data: {
                email: $('#loginemail').val(),
                password: $('#loginpassword').val()
            },
            datatype: 'text',
            success: function (responseText) {
                if (responseText === 'false') {
                    $('#loginprompt').text("Email or password is wrong!");
                } else {
                    $(location).attr('href', '/SWP/home');
                }
            },
            error: function (req, textStatus, errorThrown) {
                //this is going to happen when you send something different from a 200 OK HTTP
                alert('Ooops, something happened: ' + textStatus + ' ' + errorThrown);
            }
        });
    });
});

//variable to check if the ajax form is sending request
var isValidating = false;

/**
 * function to send request by ajax
 */
$(document).ready(function () {
    $('#btn-signup').click(function () {
        let email = $('input[name="email"]').val();
        let phone = $('input[name="phone"]').val();
        if (validateEmail(email) && validatePhone(phone) && $('#message').text() == "Matching" && $("#pwd").val().length != 0 && !isValidating && $("#password-result").val().length == 0) {
            isValidating = true;
            $.ajax({
                type: 'POST',
                url: '/SWP/register',
                data: {
                    email: $('input[name="email"]').val(),
                    name: $('input[name="name"]').val(),
                    address: $('input[name="address"]').val(),
                    phone: $('input[name="phone"]').val(),
                    sex: $('select[name="sex"]').val(),
                    password: $('input[name="password"]').val()
                },
                datatype: 'text',
                success: function (responseText) {
                    if (responseText === 'false') {
                        $('#email-result').text("Email address existed!");
                        isValidating = false;
                    } else {
                        isValidating = false;
                        $(location).attr('href', '/SWP/register?success=true');
                    }
                },
                error: function (req, textStatus, errorThrown) {
                    //this is going to happen when you send something different from a 200 OK HTTP
                    alert('Ooops, something happened: ' + textStatus + ' ' + errorThrown);
                }
            });
        }
    });
});


/**
 * function to validate the email
 * @param {type} email_id is the user input
 * @returns {Boolean} if the email are right or wrong format
 */
function validateEmail(email_id) {
    const regex_pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (regex_pattern.test(email_id)) {
        document.getElementById("email-result").innerHTML = '';
        return true;
    } else {
        document.getElementById("email-result").innerHTML = 'Email address invalid!';
        return false;
    }
}


/**
 * function to check the phone number inputted
 * @param {type} number user input
 * @returns {Boolean} check if the number is right or wrong format
 */
function validatePhone(number) {
    const regex_pattern = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;

    if (regex_pattern.test(number)) {
        document.getElementById("phone-result").innerHTML = '';
        return true;
    } else {
        document.getElementById("phone-result").innerHTML = 'Phone number invalid!';
        return false;
    }
}


/**
 * function to check whether the password and confirm passwrord are the same or not
 */
$('#pwd, #cpwd').on('keyup', function () {
    if ($('#pwd').val() == $('#cpwd').val()) {
        $('#message').html('Matching').css('color', 'green');
    } else if ($('#pwd').val() == "" || $('#cpwd').val() == "") {
        $('#message').html('Not Matching').css('color', 'red');
    } else {
        $('#message').html('Not Matching').css('color', 'red');
    }

});

/**
 * function to check the password inputted
 * @param {type} password user input
 * @returns {Boolean} check if the password is right or wrong format
 */
function validatePassword(password) {
    const regex_pattern = /^(?=.*\d)(?=.*[a-z])[0-9a-z]{8,}$/;

    if (regex_pattern.test(password)) {
        document.getElementById("password-result").innerHTML = '';
        return true;
    } else {
        document.getElementById("password-result").innerHTML = 'Password must have minimum 8 characters, at least 1 letter and 1 number';
        return false;
    }
}