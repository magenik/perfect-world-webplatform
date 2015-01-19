<?php

class SwoController extends BaseController {

	/**
	* Crop Demo
	*/
	public function crop_demo()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$targ_w = $targ_h = 150;
			$jpeg_quality = 99;

			$src = base_path().'/public/assets/img/cropping-image.jpg';
		//dd($src);
			$img_r = imagecreatefromjpeg($src);

			$dst_r = ImageCreateTrueColor( $targ_w, $targ_h );

			imagecopyresampled($dst_r,$img_r,0,0,intval($_POST['x']),intval($_POST['y']), $targ_w,$targ_h, intval($_POST['w']),intval($_POST['h']));

			header('Content-type: image/jpeg');
			imagejpeg($dst_r,null,$jpeg_quality);

			exit;
		}
	}

	/**
     * Message bag.
     *
     * @var Illuminate\Support\MessageBag
     */
    protected $messageBag = null;

    /**
     * Initializer.
     *
     * @return void
     */
    public function __construct()
    {
        // CSRF Protection
        $this->beforeFilter('csrf', array('on' => 'post'));

        //
        $this->messageBag = new Illuminate\Support\MessageBag;
    }

    public function showHome()
    {
    	if(Sentry::check())
			return View::make('user/index');
		else
			return Redirect::to('user/signin')->with('error', 'You must be logged in!');
    }

    public function showView($name=null)
    {

    	if(View::exists('user/'.$name))
		{
			if(Sentry::check())
				return View::make('user/'.$name);
			else
				return Redirect::to('user/signin')->with('error', 'You must be logged in!');
		}
		else
		{
			return View::make('user/404');
		}
    }


}