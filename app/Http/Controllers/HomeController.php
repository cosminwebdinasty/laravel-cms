<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use App\Category;
use Illuminate\Http\Request;
use App\Post;
use App\User;
use Illuminate\Pagination\Paginator;

use Illuminate\Support\Str;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $scategories = Category::where('parent_id', 5)->get();

        $suvcategories = Category::where('parent_id', 6)->get();

        $ptcategories = Category::where('parent_id', 7)->get();

        $postsToday = Post::where('created_at', 'like', Carbon::now()->format('Y-m-d'). '%')->count();
        $usersToday = User::where('created_at', 'like', Carbon::now()->format('Y-m-d'). '%')->count();

		/* $posts = Post::all(); */
        $posts = Post::paginate(3);

        $categories = Category::get();
        return view('home', ['posts' => $posts, 'categories' => $categories, 'postsToday' => $postsToday, 'usersToday' => $usersToday, 'scategories'=>$scategories, 'suvcategories'=>$suvcategories, 'ptcategories'=>$ptcategories]);
    }


    public function home(){

        $scategories = Category::where('parent_id', 5)->get();

        $suvcategories = Category::where('parent_id', 6)->get();

        $ptcategories = Category::where('parent_id', 7)->get();

        return view('components.landing-page',  compact('scategories', 'suvcategories', 'ptcategories'));
    }

}
