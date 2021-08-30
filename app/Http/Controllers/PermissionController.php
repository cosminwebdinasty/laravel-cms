<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Permission;

class PermissionController extends Controller
{
	public function index(){

		return view('admin.permissions.index',[

		'permissions'=>Permission::all()

		]);
	}


	public function store(){

		request()->validate([

		'name'=>['required']

		]);

		Permission::create([

			'name'=>Str::ucfirst(request('name')),
			'slug' =>Str::slug(Str::lower(request('name')), $separator='-')

		]);

		return back();
	}


	public function edit(Permission $permission){

		return view('admin.permissions.edit', ['permission'=>$permission]);

	}


	public function update(Permission $permission){

		$permission->name = Str::ucfirst(request('name'));
		$permission->slug = Str::slug(Str::lower(request('name')), $separator='-');

		if($permission->isDirty('name')){

			session()->flash('permissionupdate', 'Permission Updated: '. request('name'));
			$permission->save();
		} else{

			session()->flash('permissionupdate', 'Nothing has been updated');
			$permission->save();
		}return back();

	}

	public function destroy(Permission $permission){

		$permission->delete();

		session()->flash('permissiondelete','Permission '.$permission->name. ' was deleted');

		return back();

	}

}
