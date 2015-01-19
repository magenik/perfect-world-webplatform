<!DOCTYPE html>
<html>

<head>
    <title>Register | Swordsman Panel</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- global level css -->
    <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet" />
    <!-- end of global level css -->
    <!-- page level css -->
    <link href="{{ asset('assets/css/pages/login2.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/vendors/iCheck/skins/minimal/blue.css') }}" rel="stylesheet" />
    <!-- styles of the page ends-->
</head>

<body>
    <div class="container">
        <div class="row vertical-offset-100">
            <div class=" col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-4 col-lg-4 col-lg-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Sign Up</h3>
                    </div>
                    <div class="panel-body">
                        <!-- display all errors here -->
                        <div class="has-error">
                            {{ $errors->first('first_name', '<span class="help-block">:message</span>') }}
                            {{ $errors->first('last_name', '<span class="help-block">:message</span>') }}
                            {{ $errors->first('email', '<span class="help-block">:message</span>') }}
                            {{ $errors->first('email_confirm', '<span class="help-block">:message</span>') }}
                            {{ $errors->first('password', '<span class="help-block">:message</span>') }}
                            {{ $errors->first('password_confirm', '<span class="help-block">:message</span>') }}
                            {{ $errors->first('terms', '<span class="help-block">:message</span>') }}
                        </div>

                        <form action="{{ route('register2') }}" autocomplete="on" method="post" role="form">
                            <!-- CSRF Token -->
                            <input type="hidden" name="_token" value="{{ csrf_token() }}" />

                            <fieldset>
                                <div class="form-group input-group {{ $errors->first('first_name', 'has-error') }}">
                                    <div class="input-group-addon">
                                        <i class="livicon" data-name="user" data-size="18" data-c="#000" data-hc="#000" data-loop="true"></i>
                                    </div>
                                    <input class="form-control" placeholder="First Name" name="first_name" type="text" value="{{{ Input::old('first_name') }}}" />
                                </div>
                                <div class="form-group input-group {{ $errors->first('last_name', 'has-error') }}">
                                    <div class="input-group-addon">
                                        <i class="livicon" data-name="user" data-size="18" data-c="#000" data-hc="#000" data-loop="true"></i>
                                    </div>
                                    <input class="form-control" placeholder="Last Name" name="last_name" type="text"  value="{{{ Input::old('last_name') }}}" />
                                </div>
                                <div class="form-group input-group {{ $errors->first('email', 'has-error') }}">
                                    <div class="input-group-addon">
                                        <i class="livicon" data-name="mail" data-size="18" data-c="#000" data-hc="#000" data-loop="true"></i>
                                    </div>
                                    <input class="form-control" placeholder="E-Mail" name="email" type="email"  value="{{{ Input::old('email') }}}"  />
                                </div>
                                <div class="form-group input-group {{ $errors->first('email_confirm', 'has-error') }}">
                                    <div class="input-group-addon">
                                        <i class="livicon" data-name="mail" data-size="18" data-c="#000" data-hc="#000" data-loop="true"></i>
                                    </div>
                                    <input class="form-control" placeholder="Confirm E-Mail" name="email_confirm" type="email"  value="{{{ Input::old('email_confirm') }}}"  />
                                </div>
                                <div class="form-group input-group {{ $errors->first('password', 'has-error') }}">
                                    <div class="input-group-addon">
                                        <i class="livicon" data-name="key" data-size="18" data-c="#000" data-hc="#000" data-loop="true"></i>
                                    </div>
                                    <input class="form-control" placeholder="Password" name="password" type="password"  value="{{{ Input::old('password') }}}"  />
                                </div>
                                <div class="form-group input-group {{ $errors->first('password_confirm', 'has-error') }}">
                                    <div class="input-group-addon">
                                        <i class="livicon" data-name="key" data-size="18" data-c="#000" data-hc="#000" data-loop="true"></i>
                                    </div>
                                    <input class="form-control" placeholder="Confirm Password" name="password_confirm" type="password"  value="{{{ Input::old('password_confirm') }}}"  />
                                </div>
                                <div class="checkbox {{ $errors->first('terms', 'has-error') }}">
                                    <label>
                                        <input name="terms" type="checkbox" value="1" class="minimal-blue" {{{ Input::old('terms')?"checked='checked'":"" }}}>
                                        I agree for terms
                                    </label>
                                </div>
                                <input type="submit" value="Register" class="btn btn-lg btn-primary btn-block" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- global js -->
    <script src="{{ asset('assets/js/jquery-1.11.1.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/js/bootstrap.min.js') }}" type="text/javascript"></script>
    <!--livicons-->
    <script src="{{ asset('assets/vendors/livicons/minified/raphael-min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/vendors/livicons/minified/livicons-1.4.min.js') }}" type="text/javascript"></script>
    <!-- end of global js -->
    <!-- begining of page level js-->
    <script src="{{ asset('assets/js/TweenLite.min.js') }}"></script>
    <script src="{{ asset('assets/vendors/iCheck/icheck.js') }}" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $(document).mousemove(function(event) {
            TweenLite.to($('body'), .5, {css:{'background-position':parseInt(event.pageX/8) + "px "+parseInt(event.pageY/12)+"px, "+parseInt(event.pageX/15)+"px "+parseInt(event.pageY/15)+"px, "+parseInt(event.pageX/30)+"px "+parseInt(event.pageY/30)+"px"}});
        });

        //Flat red color scheme for iCheck
        $('input[type="checkbox"].minimal-blue').iCheck({
            checkboxClass: 'icheckbox_minimal-blue'
        });
    });
    </script>
    <!-- end of page level js-->
</body>
</html>