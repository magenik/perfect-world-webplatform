@extends('user/layouts/default')

{{-- Page title --}}
@section('title')
Blank Page
@parent
@stop

{{-- page level styles --}}
@section('header_styles')
@stop


{{-- Page content --}}
@section('content')

<section class="content-header">
    <h1>Blank page</h1>
    <ol class="breadcrumb">
        <li>
            <a href="#">
                <i class="livicon" data-name="home" data-size="16" data-color="#000"></i>
                Dashboard
            </a>
        </li>
        <li>Pages</li>
        <li class="active">Blank page</li>
    </ol>
</section>
<section class="content">
</section>

@stop

{{-- page level scripts --}}
@section('footer_scripts')
@stop
