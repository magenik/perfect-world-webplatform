<?php 


class GroupsController extends SwoController
{
    /**
     * Show a list of all the groups.
     *
     * @return View
     */
    public function getIndex()
    {
        // Grab all the groups
        $groups = Sentry::getGroupProvider()->createModel()->paginate();

        // Show the page
        return View::make('user/groups/index', compact('groups'));
    }

    /**
     * Group create.
     *
     * @return View
     */
    public function getCreate()
    {
        // Show the page
        return View::make('user/groups/create');
    }

    /**
     * Group create form processing.
     *
     * @return Redirect
     */
    public function postCreate()
    {
        // Declare the rules for the form validation
        $rules = array(
            'name' => 'required',
        );

        // Create a new validator instance from our validation rules
        $validator = Validator::make(Input::all(), $rules);

        // If validation fails, we'll exit the operation now.
        if ($validator->fails()) {
            // Ooops.. something went wrong
            return Redirect::back()->withInput()->withErrors($validator);
        }

        try {
            // Get the inputs, with some exceptions
            $inputs = Input::except('_token');

            // Was the group created?
            if ($group = Sentry::getGroupProvider()->create($inputs)) {
                // Redirect to the new group page
                return Redirect::route('update/group', $group->id)->with('success', Lang::get('groups/message.success.create'));
            }

            // Redirect to the new group page
            return Redirect::route('create/group')->with('error', Lang::get('groups/message.error.create'));
        } catch (Cartalyst\Sentry\Groups\NameRequiredException $e) {
            $error = 'group_name_required';
        } catch (Cartalyst\Sentry\Groups\GroupExistsException $e) {
            $error = 'group_exists';
        }

        // Redirect to the group create page
        return Redirect::route('create/group')->withInput()->with('error', Lang::get('groups/message.'.$error));
    }

    /**
     * Group update.
     *
     * @param  int  $id
     * @return View
     */
    public function getEdit($id = null)
    {


        
        try {
            // Get the group information
            $group = Sentry::findGroupById($id);

        } catch (Cartalyst\Sentry\Groups\GroupNotFoundException $e) {
            // Redirect to the groups management page
            return Redirect::route('groups')->with('error', Lang::get('groups/message.group_not_found', compact('id')));
        }

        // Show the page
        return View::make('admin/groups/edit', compact('group'));
    }

    /**
     * Group update form processing page.
     *
     * @param  int      $id
     * @return Redirect
     */
    public function postEdit($id = null)
    {
        try {
            // Get the group information
            $group = Sentry::getGroupProvider()->findById($id);
        } catch (GroupNotFoundException $e) {
            // Redirect to the groups management page
            return Rediret::route('groups')->with('error', Lang::get('groups/message.group_not_found', compact('id')));
        }

        // Declare the rules for the form validation
        $rules = array(
            'name' => 'required',
        );

        // Create a new validator instance from our validation rules
        $validator = Validator::make(Input::all(), $rules);

        // If validation fails, we'll exit the operation now.
        if ($validator->fails()) {
            // Ooops.. something went wrong
            return Redirect::back()->withInput()->withErrors($validator);
        }

        try {
            // Update the group data
            $group->name        = Input::get('name');

            // Was the group updated?
            if ($group->save()) {
                // Redirect to the group page
                return Redirect::route('update/group', $id)->with('success', Lang::get('groups/message.success.update'));
            } else {
                // Redirect to the group page
                return Redirect::route('update/group', $id)->with('error', Lang::get('groups/message.error.update'));
            }
        } catch (Cartalyst\Sentry\Groups\NameRequiredException $e) {
            echo 'Name field is required';
        } catch (Cartalyst\Sentry\Groups\GroupExistsException $e)
        {
            return Redirect::route('update/group', $id)->with('error', Lang::get('groups/message.error.group_exists'));
        } catch (Cartalyst\Sentry\Groups\GroupNotFoundException $e)
        {
            echo 'Group was not found.';
        }
    }

    /**
     * Delete confirmation for the given group.
     *
     * @param  int      $id
     * @return View
     */
    public function getModalDelete($id = null)
    {
        $model = 'groups';
        $confirm_route = $error = null;
        try {
            // Get group information
            $group = Sentry::getGroupProvider()->findById($id);


            $confirm_route =  URL::action('delete/group', array('id'=>$group->id));
            return View::make('admin/layouts/modal_confirmation', compact('error', 'model', 'confirm_route'));
        } catch (GroupNotFoundException $e) {

            $error = Lang::get('admin/groups/message.group_not_found', compact('id'));
            return View::make('admin/layouts/modal_confirmation', compact('error', 'model', 'confirm_route'));
        }
    }

    /**
     * Delete the given group.
     *
     * @param  int      $id
     * @return Redirect
     */
    public function getDelete($id = null)
    {
        try {
            // Get group information
            $group = Sentry::getGroupProvider()->findById($id);

            // Delete the group
            $group->delete();

            // Redirect to the group management page
            return Redirect::route('groups')->with('success', Lang::get('admin/groups/message.success.delete'));
        } catch (GroupNotFoundException $e) {
            // Redirect to the group management page
            return Redirect::route('groups')->with('error', Lang::get('admin/groups/message.group_not_found', compact('id')));
        }
    }

}
