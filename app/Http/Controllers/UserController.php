<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\User;
use App\Post;
use App\Role;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{

	public function index(){

	$users = User::all();

    $users = auth()->user()->paginate(8);

	return view('admin.users.index', ['users'=>$users]);

}

	public function show(User $user){

		return view('admin.users.profile', [
		'user'=>$user,
		'roles'=>Role::all(),
		]);
	}

	public function attach(User $user){

		$user->roles()->attach(request('role'));
		return back();
	}

	public function detach(User $user){

		$user->roles()->detach(request('role'));
		return back();
	}

	public function update(User $user){

		$inputs= request()->validate([

			'username'=>['required', 'string', 'max:255'],
			'name'=>['required', 'string', 'max:255'],
			'email'=>['required', 'email', 'max:255'],
			'avatar'=>['file'],
            'password'=> ['required', 'min:8', 'max:255', 'confirmed']

		]);

		if(request('avatar')){

			$inputs['avatar'] = request('avatar')->store('images');

		}
		$user->update($inputs);

		return back();

	}

 public function destroy(User $user){

        $user->delete();

        session()->flash('userdel', 'User ' . $user->name .' ('.  $user->username  .') has been deleted');

        return back();

    }

}
