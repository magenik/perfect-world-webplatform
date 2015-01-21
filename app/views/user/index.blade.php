@extends('user/layouts/default')

{{-- Page title --}}
@section('title')
Dashboard
@parent
@stop

{{-- page level styles --}}
@section('header_styles')
<!--page level css -->
<link href="{{ asset('assets/css/pages/timeline.css') }}" rel="stylesheet" />
<link href="{{ asset('assets/css/pages/timeline2.css') }}" rel="stylesheet" />
<!--end of page level css-->
@stop


{{-- Page content --}}
@section('content')
<section class="content-header">
    <!--section starts-->
    <h1>Welcome to your Swordsman Dashboard</h1>
    <ol class="breadcrumb">
        <li>
            <a href="index"> <i class="livicon" data-name="home" data-size="14" data-loop="true"></i>
                Home
            </a>
        </li>
        <li class="active">Timeline</li>
    </ol>
</section>
<!--section ends-->
<section class="content">
    <!--main content-->
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"> <i class="livicon" data-name="share" data-size="16" data-loop="true" data-c="#fff" data-hc="white"></i>
                        Timeline
                    </h3>
                    <span class="pull-right clickable">
                        <i class="glyphicon glyphicon-chevron-up"></i>
                    </span>
                </div>
                <div class="panel-body">
                    <!--timeline-->
                    <div class="row">
                        <ul class="timeline">
                            <li>
                                <div class="timeline-badge">
                                    <i class="livicon" data-name="hammer" data-c="#fff" data-hc="#fff" data-size="18" data-loop="true"></i>
                                </div>
                                <div class="timeline-panel" style="display:inline-block;">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Version 1.0 Dev</h4>
                                        <p>
                                            <small class="text-muted">
                                                <i class="livicon" data-name="bell" data-c="#f89a14" data-hc="#f89a14" data-size="18" data-loop="true"></i>
                                                This file is from Revision 15
                                            </small>
                                        </p>
                                    </div>
                                    <div class="timeline-body">
                                        <p>
                                            The project is under developpement so please be patient for having a stable version of it.<br>
                                            Thank you for your patience.<br>
                                            Magenik
                                        </p>
                                    </div><hr>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                                                <i class="glyphicon glyphicon-cog"></i>
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a href="http://forum.ragezone.com/f868/perfect-world-swordsman-webplatform-1047863/" target="_blank">Ragezone</a>
                                                </li>
                                                <li>
                                                    <a href="https://github.com/magenik/perfect-world-webplatform" target="_blank">Git Repo</a>
                                                </li>
                                                <li>
                                                    <a href="https://code.google.com/p/tortoisegit/wiki/Download" target="_blank">TortoiseGit Client</a>
                                                </li>
                                                <li class="divider"></li>
                                                <li>
                                                    <a href="https://www.swordsmaneu.com/" target="_blank">Live Web</a>
                                                </li>
                                            </ul>
                                        </div>
                                    <a href="https://github.com/magenik/perfect-world-webplatform/blob/master/README.md"  target="_blank" class="pull-right">Read more</a>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-badge danger">
                                    <i class="livicon" data-name="trophy" data-c="#fff" data-hc="#fff" data-size="18" data-loop="true"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Supported game server : </h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>This platform will support almost all Perfect World's Game.</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="timeline-badge info">
                                    <i class="livicon" data-name="user" data-c="#fff" data-hc="#fff" data-size="18" data-loop="true"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Developpers / Team</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>
                                            The project leader : Magenik.
                                            anyone who want to join just contact me on skype : Magenik
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-badge  ">
                                    <i class="livicon" data-name="home" data-c="#fff" data-hc="#fff" data-size="18" data-loop="true"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Perfect World Framework Project</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>
                                            19/01/2015 Start of the Project.
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--timeline ends-->
            </div>
        </div>
    </div>
    <!--main content ends-->
</section>
@stop

{{-- page level scripts --}}
@section('footer_scripts')
<!-- begining of page level js -->
<script type="text/javascript">
$(document).ready(function() {
    var my_posts = $("[rel=tooltip]");

    var size = $(window).width();
    for (i = 0; i < my_posts.length; i++) {
        the_post = $(my_posts[i]);

        if (the_post.hasClass('invert') && size >= 767) {
            the_post.tooltip({
                placement: 'left'
            });
            the_post.css("cursor", "pointer");
        } else {
            the_post.tooltip({
                placement: 'rigth'
            });
            the_post.css("cursor", "pointer");
        }
    }
});
</script>
@stop