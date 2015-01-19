<?php

use App\Models\User;

class AdminSeeder extends Seeder {

	public function run()
	{
		DB::table('users')->truncate(); // Using truncate function so all info will be cleared when re-seeding.
		DB::table('groups')->truncate();
		DB::table('users_groups')->truncate();

		$last_id = DB::table('users')->max('id'); //get last inserted record's user id value
        $new_id = $last_id + 16;

        $Salt_md5 = md5(('admin')+('123456'));
        $Salt = "0x".$Salt_md5;

		Sentry::getUserProvider()->create(array(
			'id'          => $new_id,
            'passwd'      => $Salt,
			'email'       => 'admin@admin.com',
			'password'    => "123456",
			'first_name'  => 'Admin',
			'last_name'   => 'Admin',
			'name'        => 'admin',
			'activated'   => 1,
		));

		Sentry::getGroupProvider()->create(array(
			'name'        => 'Admin',
			'permissions' => array('admin' => 1),
		));

		Sentry::getGroupProvider()->create(array(
			'name'        => 'User',
			'permissions' => array('admin' => 0),
		));

		// Assign user permissions
		$adminUser  = Sentry::getUserProvider()->findByLogin('admin@admin.com');
		$adminGroup = Sentry::getGroupProvider()->findByName('Admin');
		$adminUser->addGroup($adminGroup);
	}

}