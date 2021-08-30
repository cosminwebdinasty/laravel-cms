<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Post;
use App\Category;
use App\Comment;
use App\CommentReply;
use App\Permission;
use App\User;
use Carbon\Carbon;
use App\Role;

use App\Media;


use App\Photo;


class AdminController extends Controller
{
    //

	public function index(){

        $postsToday = Post::where('created_at', 'like', Carbon::now()->format('Y-m-d'). '%')->count();
        $usersToday = User::where('created_at', 'like', Carbon::now()->format('Y-m-d'). '%')->count();

        $filesCount = Photo::count();


        $postCount = Post::count();
        $categoryCount = Category::count();
        $commentsCount = Comment::count();
        $repliesCount = CommentReply::count();


        $usersCount = User::count();
        $rolesCount = Role::count();

        $photosCount = Photo::count();

	return view('admin.index', compact('postCount', 'categoryCount', 'commentsCount', 'repliesCount', 'usersCount', 'rolesCount', 'photosCount',

        'postsToday', 'usersToday', 'filesCount'


));
	}
}
