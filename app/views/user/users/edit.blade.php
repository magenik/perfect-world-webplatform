@extends('user/layouts/default')

{{-- Page title --}}
@section('title')
Edit User
@parent
@stop

{{-- page level styles --}}
@section('header_styles')
<!--page level css -->
<link rel="stylesheet" href="{{ asset('assets/vendors/wizard/jquery-steps/css/wizard.css') }}">
<link rel="stylesheet" href="{{ asset('assets/vendors/wizard/jquery-steps/css/jquery.steps.css') }}">
<link href="{{ asset('assets/vendors/jasny-bootstrap/css/jasny-bootstrap.css') }}" rel="stylesheet" />
<!--end of page level css-->
@stop


{{-- Page content --}}
@section('content')
<section class="content-header">
    <h1>Edit user</h1>
    <ol class="breadcrumb">
        <li>
            <a href="index.html"> <i class="livicon" data-name="home" data-size="16" data-color="#000"></i>
                Dashboard
            </a>
        </li>
        <li>Users</li>
        <li class="active">Add New User</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"> <i class="livicon" data-name="users" data-size="16" data-c="#fff" data-hc="#fff" data-loop="true"></i>
                        Editing user : {{{ $user->first_name}}} {{{ $user->last_name}}}
                    </h3>
                    <span class="pull-right clickable">
                        <i class="glyphicon glyphicon-chevron-up"></i>
                    </span>
                </div>
                <div class="panel-body">

                    <!-- errors -->
                    <div class="has-error">
                        {{ $errors->first('first_name', '<span class="help-block">:message</span>') }}
                        {{ $errors->first('last_name', '<span class="help-block">:message</span>') }}
                        {{ $errors->first('email', '<span class="help-block">:message</span>') }}
                        {{ $errors->first('password', '<span class="help-block">:message</span>') }}
                        {{ $errors->first('password_confirm', '<span class="help-block">:message</span>') }}
                        {{ $errors->first('group', '<span class="help-block">:message</span>') }}
                    </div>

                    <!--main content-->
                    <div class="row">

                        <div class="col-md-12">

                            <!-- BEGIN FORM WIZARD WITH VALIDATION -->
                            <form class="form-wizard form-horizontal" action="" method="POST" id="wizard" enctype="multipart/form-data">
                                <!-- CSRF Token -->
                                <input type="hidden" name="_token" value="{{ csrf_token() }}" />

                                <!-- first tab -->
                                <h1>User Profile</h1>

                                <section>
                                
                                    <div class="form-group">
                                        <label for="first_name" class="col-sm-2 control-label">First Name *</label>
                                        <div class="col-sm-10">
                                            <input id="first_name" name="first_name" type="text" placeholder="First Name" class="form-control required" value="{{{ Input::old('first_name', $user->first_name) }}}" />
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <label for="last_name" class="col-sm-2 control-label">Last Name *</label>
                                        <div class="col-sm-10">
                                            <input id="last_name" name="last_name" type="text" placeholder="Last Name" class="form-control required" value="{{{ Input::old('last_name', $user->last_name) }}}" />
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">Email *</label>
                                        <div class="col-sm-10">
                                            <input id="email" name="email" placeholder="E-Mail" type="text" class="form-control required email" value="{{{ Input::old('email', $user->email) }}}" />
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <p class="text-warning">If you don't want to change password... please leave them empty</p>
                                        <label for="password" class="col-sm-2 control-label">Password *</label>
                                        <div class="col-sm-10">
                                            <input id="password" name="password" type="password" placeholder="Password" class="form-control" value="{{{ Input::old('password') }}}" />
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <label for="password_confirm" class="col-sm-2 control-label">Confirm Password *</label>
                                        <div class="col-sm-10">
                                            <input id="password_confirm" name="password_confirm" type="password" placeholder="Confirm Password " class="form-control" value="{{{ Input::old('password_confirm') }}}" />
                                        </div>
                                    </div>
                                    
                                    <p>(*) Mandatory</p>
                                
                                </section>

                                <!-- second tab -->
                                <h1>Bio</h1>

                                <section>

                                    

                                    <div class="form-group">
                                        <label for="dob" class="col-sm-2 control-label">Date of Birth</label>
                                        <div class="col-sm-10">
                                            <input id="dob" name="dob" type="text" class="form-control" data-mask="9999-99-99" value="{{{ Input::old('dob', $user->dob) }}}" placeholder="yyyy-mm-dd" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="pic" class="col-sm-2 control-label">Profile picture</label>
                                        <div class="col-sm-10">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 200px;">
                                                    @if($user->pic)
                                                        <img src="{{{ url('/').'/uploads/users/'.$user->pic }}}" alt="profile pic">
                                                    @else
                                                        <img src="http://placehold.it/200x200" alt="profile pic">
                                                    @endif
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 200px;"></div>
                                                <div>
                                                    <span class="btn btn-default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input id="pic" name="pic" type="file" class="form-control" />
                                                    </span>
                                                    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    

                                    

                                    <div class="form-group">
                                        <label for="bio" class="col-sm-2 control-label">Bio <small>(brief intro)</small></label>
                                        <div class="col-sm-10">
                                            <textarea name="bio" id="bio" class="form-control" rows="4">{{{ Input::old('bio', $user->bio) }}}</textarea>
                                        </div>
                                    </div>
                                
                                </section>

                                <!-- third tab -->
                                <h1>Address</h1>
                                <section>

                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">Gender</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" title="Select Gender..." name="gender">
                                                <option value="">Select</option>
                                                <option value="male" @if($user->gender === 'male') selected="selected" @endif >MALE</option>
                                                <option value="female" @if($user->gender === 'female') selected="selected" @endif >FEMALE</option>
                                                <option value="other" @if($user->gender === 'other') selected="selected" @endif >OTHER</option>

                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="country" class="col-sm-2 control-label">Country</label>
                                        <div class="col-sm-10">
                                            {{ Form::select('country', $countries,Input::old('country',$user->country),array('class' => 'form-control')) }}

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="state" class="col-sm-2 control-label">State</label>
                                        <div class="col-sm-10">
                                            <input id="state" name="state" type="text" class="form-control" value="{{{ Input::old('state', $user->state) }}}" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="city" class="col-sm-2 control-label">City</label>
                                        <div class="col-sm-10">
                                            <input id="city" name="city" type="text" class="form-control" value="{{{ Input::old('city', $user->city) }}}" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="address" class="col-sm-2 control-label">Address</label>
                                        <div class="col-sm-10">
                                            <input id="address" name="address" type="text" class="form-control" value="{{{ Input::old('address', $user->address) }}}" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="postal" class="col-sm-2 control-label">Postal/zip</label>
                                        <div class="col-sm-10">
                                            <input id="postal" name="postal" type="text" class="form-control" value="{{{ Input::old('postal', $user->postal) }}}" />
                                        </div>
                                    </div>
                                    
                                </section>

                                
                                <!-- fourth tab -->
                                <h1>User Group</h1>

                                <section>

                                    <p class="text-danger"><strong>Be careful with group selection, if you give admin access.. they can access admin section</strong></p>
                                    <div class="form-group">
                                        <label for="group" class="col-sm-2 control-label">Group *</label>
                                        <div class="col-sm-10">
                                            <select class="form-control " title="Select group..." name="groups[]" id="groups" required>
                                                <option value="">Select</option>
                                                @foreach($groups as $group)
                                                    <option value="{{{ $group->id }}}" {{ (array_key_exists($group->id, $userGroups) ? ' selected="selected"' : '') }}>{{ $group->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="activate" class="col-sm-2 control-label"> Activate User</label>
                                        <div class="col-sm-10">
                                            <input id="activate" name="activate" type="checkbox" class="pos-rel p-l-30" value="1" @if(Input::old('activate', $user->isActivated())) checked="checked" @endif  >
                                        </div>
                                        <span>If user is not activated, mail will be sent to user with activation link</span>
                                    </div>
                                    
                                
                                </section>
                            
                            </form>
                            <!-- END FORM WIZARD WITH VALIDATION --> 
                        </div>
                    </div>
                    <!--main content end--> 
                </div>
            </div>
        </div>
    </div>
    <!--row end-->
</section>
@stop

{{-- page level scripts --}}
@section('footer_scripts')
    <script type="text/javascript" src="{{ asset('assets/vendors/wizard/jquery-steps/js/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('assets/vendors/wizard/jquery-steps/js/jquery.steps.js') }}"></script>
    <script src="{{ asset('assets/vendors/jasny-bootstrap/js/jasny-bootstrap.js') }}"></script>
    <script src="{{ asset('assets/js/pages/add_user.js') }}"></script>
@stop