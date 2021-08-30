<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Http\Controllers\AdminCategoriesController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\MediaController;

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

Auth::routes();

Route::get('/', 'HomeController@home')->name('landing-page');

 Route::get('/home', 'HomeController@index')->name('home');

Route::get('/post/{post}', 'PostController@show')->name('post');


Route::middleware('auth')->group(function(){

Route::get('/admin', 'AdminController@index')->name('admin.index');






Route::get('/posts/{id}','PostController@categories')->name('category');








Route::get('/admin/posts/', 'PostController@index')->name('post.index');
Route::get('/admin/posts/create', 'PostController@create')->name('post.create');



Route::post('/upload', 'PostController@upload');



Route::post('/admin/posts', 'PostController@store')->name('post.store');
Route::delete('/admin/posts/{post}/destroy', 'PostController@destroy')->name('post.destroy');
Route::get('/admin/posts/{post}/edit', 'PostController@edit')->name('post.edit');
Route::post('/admin/posts/{post}/update', 'PostController@update')->name('post.update');

Route::put('admin/users/{user}/update','UserController@update')->name('user.profile.update');
Route::get('admin/users', 'UserController@index')->name('users.index');
Route::delete('admin/users/{user}/destroy', 'UserController@destroy')->name('user.destroy');


Route::get('/search', 'PostController@search')->name('search');


Route::resource('admin/categories', 'AdminCategoriesController');
Route::delete('admin/categories/{category}', 'AdminCategoriesController@destroy')->name('category.destroy');
Route::post('admin/categories', 'AdminCategoriesController@store')->name('category.store');
Route::post('admin/categories/{category}/edit', 'AdminCategoriesController@update')->name('category.update');

Route::resource('admin/media', 'MediaController');
Route::delete('admin/media/{photo}', 'MediaController@destroy')->name('photo.destroy');

Route::resource('admin/comments', 'CommentsController');

Route::resource('admin/comment/replies', 'CommentRepliesController');

Route::delete('admin/comments/{comment}', 'CommentsController@destroy')->name('delete.comment');

Route::get('/admin/posts/{post}', 'PostController@test')->name('testmethod');

Route::get('admin/comment/replies', 'CommentRepliesController@index')->name('replies');

Route::delete('admin/comment/replies/{reply}/destroy', 'CommentRepliesController@destroy')->name('delete.reply');


});


Route::middleware(['role:admin', 'auth'])->group(function(){

Route::get('admin/users', 'UserController@index')->name('users.index');
Route::put('/users/{user}/attach', 'UserController@attach')->name('user.role.attach');
Route::put('/users/{user}/detach', 'UserController@detach')->name('user.role.detach');

Route::get('/roles', 'RoleController@index')->name('roles.index');
Route::post('/roles', 'RoleController@store')->name('roles.store');
Route::delete('/roles/{role}/destroy', 'RoleController@destroy')->name('roles.destroy');
Route::get('/roles/{role}/edit', 'RoleController@edit')->name('roles.edit');
Route::put('/roles/{role}/update', 'RoleController@update')->name('roles.update');
Route::put('/roles/{role}/attach', 'RoleController@attach_permission')->name('role.permission.attach');
Route::put('/roles/{role}/detach', 'RoleController@detach_permission')->name('role.permission.detach');

Route::get('/permissions', 'PermissionController@index')->name('permissions.index');
Route::post('/permissions', 'PermissionController@store')->name('permissions.store');
Route::delete('/permissions/{permission}/destroy', 'PermissionController@destroy')->name('permissions.destroy');
Route::get('/permissions/{permission}/edit', 'PermissionController@edit')->name('permissions.edit');
Route::put('/permissions/{permission}/update', 'PermissionController@update')->name('permissions.update');

});


Route::middleware(['can:view,user'])->group(function(){

	Route::get('admin/users/{user}/profile','UserController@show')->name('user.profile.show');
});


Route::group(['middleware'=>'auth'], function(){

    Route::post('comment/reply', 'CommentRepliesController@createReply');

});
