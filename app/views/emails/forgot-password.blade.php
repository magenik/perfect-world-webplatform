@extends('emails/layouts/default')

@section('content')
<p>Hello {{{ $user->first_name }}},</p>

<p>Please click on the following link to updated your password:</p>

<p><a href="{{{ $forgotPasswordUrl }}}">{{{ $forgotPasswordUrl }}}</a></p>

<p>Best regards,</p>

<p>@lang('general.site_name') Team</p>
@stop
