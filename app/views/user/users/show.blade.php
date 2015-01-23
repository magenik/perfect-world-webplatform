@extends('user/layouts/default')

{{-- Page title --}}
@section('title')
View User Details
@parent
@stop

{{-- page level styles --}}
@section('header_styles')
<!--page level css -->
<link href="{{ asset('assets/vendors/jasny-bootstrap/css/jasny-bootstrap.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ asset('assets/vendors/x-editable/css/bootstrap-editable.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ asset('assets/css/pages/user_profile.css') }}" rel="stylesheet" type="text/css"/>
<!--end of page level css-->
@stop


{{-- Page content --}}
@section('content')
<section class="content-header">
    <h1>View User</h1>
    <ol class="breadcrumb">
        <li>
            <a href="index"> <i class="livicon" data-name="home" data-size="16" data-color="#000"></i>
                Dashboard
            </a>
        </li>
        <li>Users</li>
        <li class="active">View User</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <ul class="nav  nav-tabs ">
                <li class="active">
                    <a href="#tab1" data-toggle="tab"> <i class="livicon" data-name="user" data-size="16" data-c="#000" data-hc="#000" data-loop="true"></i>
                        User Profile
                    </a>
                </li>
                <li>
                    <a href="#tab2" data-toggle="tab">
                        <i class="livicon" data-name="key" data-size="16" data-loop="true" data-c="#000" data-hc="#000"></i>
                        Change Password
                    </a>
                </li>
            </ul>
            <div  class="tab-content mar-top">
                <div id="tab1" class="tab-pane fade active in">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        @lang('users/title.user_profile')
                                    </h3>

                                </div>
                                <div class="panel-body">
                                    <div class="col-md-4">
                                        <h4 class="text-primary"> Profile Pic</h4>
                                        <div class="img-file"> 
                                            @if($user->pic)
                                                <img src="{{{ url('/').'/uploads/users/'.$user->pic }}}" alt="profile pic" class="img-max">
                                            @else
                                                <img src="http://placehold.it/200x200" alt="profile pic">
                                            @endif   
                                        </div>
                                        <hr>
                                        <div>
                                            <h4 class="text-primary">Bio</h4>
                                            <div>{{{ $user->bio}}}</div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <form method="post" action="#">

                                                <table class="table table-bordered table-striped" id="users">

                                                    <tr>
                                                        <td>@lang('users/title.name')</td>
                                                        <td>
                                                            {{ $user->name }}
                                                        </td>

                                                    </tr>
    
                                                    <tr>
                                                        <td>@lang('users/title.first_name')</td>
                                                        <td>
                                                            {{ $user->first_name }}
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.last_name')</td>
                                                        <td>
                                                            {{ $user->last_name }}
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.email')</td>
                                                        <td>
                                                            {{ $user->email }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            @lang('users/title.gender')
                                                        </td>
                                                        <td>
                                                                {{ $user->gender }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.dob')</td>
                                                        <td>
                                                                {{ $user->dob }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.country')</td>
                                                        <td>
                                                            {{ $user->country }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.state')</td>
                                                        <td>
                                                            {{ $user->state }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.city')</td>
                                                        <td>
                                                            {{ $user->city }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.address')</td>
                                                        <td>
                                                            {{ $user->address }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.postal')</td>
                                                        <td>
                                                            {{ $user->postal }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.status')</td>
                                                        <td>
                                                            @if($user->activated)
                                                                Activated
                                                            @else
                                                                Pending
                                                            @endif
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>@lang('users/title.created_at')</td>
                                                        <td>
                                                            {{{ $user->created_at->diffForHumans() }}}
                                                        </td>
                                                    </tr> 
                                                </table>
                                            </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab2" class="tab-pane fade">
                    <div class="row">
                        <div class="col-md-12 pd-top">
                            <form action="#" class="form-horizontal">
                                <!-- CSRF Token -->
                                <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                                
                                <div class="tab-pane  m-t" id="pass">
 
       
          <div class="form-group">
            <label for="ipt" class=" control-label col-md-4"> {{ Lang::get('core.newpassword'); }} </label>
            <div class="col-md-8">
            <input name="password" type="password" id="password" class="form-control input-sm" value="" /> 
             </div> 
          </div>  
          
          <div class="form-group">
            <label for="ipt" class=" control-label col-md-4"> {{ Lang::get('core.conewpassword'); }}  </label>
            <div class="col-md-8">
            <input name="password_confirmation" type="password" id="password_confirmation" class="form-control input-sm" value="" />  
             </div> 
          </div>    
         
        
          <div class="form-group">
            <label for="ipt" class=" control-label col-md-4">&nbsp;</label>
            <div class="col-md-8">
                <button class="btn btn-danger" type="submit"> {{ Lang::get('core.sb_savechanges'); }} </button>
             </div> 
          </div>   
      </div>
                                
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@stop

{{-- page level scripts --}}
@section('footer_scripts')
<!-- Bootstrap WYSIHTML5 -->
<script  src="{{ asset('assets/vendors/jasny-bootstrap/js/jasny-bootstrap.js') }}" type="text/javascript"></script>
@stop