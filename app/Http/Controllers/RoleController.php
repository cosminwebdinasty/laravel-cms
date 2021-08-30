<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use App\Permission;
use Illuminate\Support\Str;

class RoleController extends Controller
{


	public function index(){

		return view('admin.roles.index', [

		'roles'=> Role::all(),
		'permissionss'=> Permission::all(),

		]);

	}


	public function store(){

		request()->validate([

		'name'=>['required']

		]);

		Role::create([

			'name'=>Str::ucfirst(request('name')),
			'slug' =>Str::slug(Str::lower(request('name')), $separator='-')
		]);

		return back();
	}


	public function edit(Role $role){

		return view('admin.roles.edit', [
		'role'=>$role,
		'permissions'=> Permission::all(),

		]);
	}


	public function update(Role $role){

		$role->name = Str::ucfirst(request('name'));
		$role->slug = Str::slug(Str::lower(request('name')), $separator='-');


		if($role->isDirty('name')){

			session()->flash('roleupdate', 'Role Updated: '. request('name'));
			$role->save();
		} else{


			session()->flash('roleupdate', 'Nothing has been updated');
			$role->save();
		}

		return back();

	}

	public function attach_permission (Role $role){

		$role->permissions()->attach(request('permission'));

		return back();
	}

	public function detach_permission (Role $role){

		$role->permissions()->detach(request('permission'));

		return back();
	}

	public function destroy(Role $role){

		$role->delete();

		session()->flash('roledel', 'Deleted Role ' . $role->name);

		return back();
	}

}
