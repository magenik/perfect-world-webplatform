<?php

use App\Models\User;

class AdminSeeder extends Seeder {

	public function run()
	{
		DB::table('users')->truncate(); // Using truncate function so all info will be cleared when re-seeding.
		DB::table('groups')->truncate();
		DB::table('users_groups')->truncate();

		Sentry::getUserProvider()->create(array(
			'email'       => 'admin@admin.com',
			'password'    => "admin",
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