<!DOCTYPE html>
<html>
  <!-- This page is displayed when someone clicks a valid 'reset password' link.
       Users should feel free to add to this page (i.e. branding or security widgets)
       but should be sure not to delete any of the form inputs or the javascript from the
       template file. This javascript is what adds the necessary values to authenticate
       this session with Parse.
       The query params 'username' and 'app' hold the friendly names for your current user and
       your app. You should feel free to incorporate their values to make the page more personal.
       If you are missing form parameters in your POST, Parse will navigate back to this page and
       add an 'error' query parameter.
  -->
  <head>
  <title>Password Reset</title>
  <style type='text/css'>
    h1 {
      display: block;
      font: inherit;
      font-size: 30px;
      font-weight: 600;
      height: 30px;
      line-height: 30px;
      margin: 45px 0px 45px 0px;
      padding: 0px 8px 0px 8px;
    }

    .error {
      color: red;
      padding: 0px 8px 0px 8px;
      margin: -25px 0px -20px 0px;
    }

    body {
      font-family: 'Open Sans', 'Helvetica Neue', Helvetica;
      color: #0067AB;
      margin: 15px 99px 0px 98px;
    }

    label {
      color: #666666;
    }
    form {
      margin: 0px 0px 45px 0px;
      padding: 0px 8px 0px 8px;
    }
    form > * {
      display: block;
      margin-top: 25px;
      margin-bottom: 7px;
    }

    button {
      font-size: 22px;
      color: white;
      background: #0067AB;
      -moz-border-radius: 5px;
      -webkit-border-radius: 5px;
      -o-border-radius: 5px;
      -ms-border-radius: 5px;
      -khtml-border-radius: 5px;
      border-radius: 5px;
      background-image: -webkit-gradient(linear,50% 0,50% 100%,color-stop(0%,#0070BA),color-stop(100%,#00558C));
      background-image: -webkit-linear-gradient(#0070BA,#00558C);
      background-image: -moz-linear-gradient(#0070BA,#00558C);
      background-image: -o-linear-gradient(#0070BA,#00558C);
      background-image: -ms-linear-gradient(#0070BA,#00558C);
      background-image: linear-gradient(#0070BA,#00558C);
      -moz-box-shadow: inset 0 1px 0 0 #0076c4;
      -webkit-box-shadow: inset 0 1px 0 0 #0076c4;
      -o-box-shadow: inset 0 1px 0 0 #0076c4;
      box-shadow: inset 0 1px 0 0 #0076c4;
      border: 1px solid #005E9C;
      padding: 10px 14px;
      cursor: pointer;
      outline: none;
      display: block;
      font-family: "Helvetica Neue",Helvetica;

      -webkit-box-align: center;
      text-align: center;
      box-sizing: border-box;
      letter-spacing: normal;
      word-spacing: normal;
      line-height: normal;
      text-transform: none;
      text-indent: 0px;
      text-shadow: none;
    }

    button:hover {
      background-image: -webkit-gradient(linear,50% 0,50% 100%,color-stop(0%,#0079CA),color-stop(100%,#005E9C));
      background-image: -webkit-linear-gradient(#0079CA,#005E9C);
      background-image: -moz-linear-gradient(#0079CA,#005E9C);
      background-image: -o-linear-gradient(#0079CA,#005E9C);
      background-image: -ms-linear-gradient(#0079CA,#005E9C);
      background-image: linear-gradient(#0079CA,#005E9C);
      -moz-box-shadow: inset 0 0 0 0 #0076c4;
      -webkit-box-shadow: inset 0 0 0 0 #0076c4;
      -o-box-shadow: inset 0 0 0 0 #0076c4;
      box-shadow: inset 0 0 0 0 #0076c4;
    }

    button:active {
      background-image: -webkit-gradient(linear,50% 0,50% 100%,color-stop(0%,#00395E),color-stop(100%,#005891));
      background-image: -webkit-linear-gradient(#00395E,#005891);
      background-image: -moz-linear-gradient(#00395E,#005891);
      background-image: -o-linear-gradient(#00395E,#005891);
      background-image: -ms-linear-gradient(#00395E,#005891);
      background-image: linear-gradient(#00395E,#005891);
    }

    input {
      color: black;
      cursor: auto;
      display: inline-block;
      font-family: 'Helvetica Neue', Helvetica;
      font-size: 25px;
      height: 30px;
      letter-spacing: normal;
      line-height: normal;
      margin: 2px 0px 2px 0px;
      padding: 5px;
      text-transform: none;
      vertical-align: baseline;
      width: 500px;
      word-spacing: 0px; 
    }

  </style>
</head>
<body>
  <h1>Reset Your Password<span id='app'></span></h1>
  <noscript>We apologize, but resetting your password requires javascript</noscript>
  <div class='error' id='error'></div>
  <form id='form' action='Admin/resetPassword' method='POST'>
    <label>New Password for <span id='username_label'></span></label>
    <input name="new_password" type="password" required/>    
    <input name="username" id="username" type="hidden" />
    <input name="email" id="email" type="hidden" />
    <button>Change Password</button>
  </form>
<script type="text/javascript" src="./js/jquery-1.11.2.min.js"></script>
<script language='javascript' type='text/javascript'>
  
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

var email = getUrlParameter('email');
var username = getUrlParameter('username');
$('#username_label').text(username);
$('#username').val(username);
$('#email').val(email);

</script>
</body>
