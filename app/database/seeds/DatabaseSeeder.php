<?php

class DatabaseSeeder extends Seeder {

	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run()
	{
		Eloquent::unguard();

		$this->call('AdminSeeder');
		$this->command->info('Admin User created with username admin@admin.com and password : admin');
	}

}
