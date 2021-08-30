<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\User;
use App\Category;
use App\Comment;
use App\CommentReply;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

use App\Photo;

use Carbon\Carbon;

class PostController extends Controller
{

	public function index(){

		 $posts = auth()->user()->posts()->paginate(4);  //Current user posts

         $comments = Comment::all();

		 return view('admin.posts.index', ['posts'=>$posts, 'comments'=>$comments]);
	}

	public function search(Request $request){

		$search = $request->input('search');

		 $posts = Post::query()
        ->where('title', 'LIKE', "%{$search}%")
        ->orWhere('body', 'LIKE', "%{$search}%")
        ->get();

		return view('search', compact('posts'));
	}

	public function show(Post $post){

        $scategories = Category::where('parent_id', 5)->get();

        $suvcategories = Category::where('parent_id', 6)->get();

        $ptcategories = Category::where('parent_id', 7)->get();
        $postsToday = Post::where('created_at', 'like', Carbon::now()->format('Y-m-d'). '%')->count();
        $usersToday = User::where('created_at', 'like', Carbon::now()->format('Y-m-d'). '%')->count();

        $categories = Category::all();

        $comments = Comment::where("post_id", "=", $post->id)->get();

		return view('blog-post', ['post' => $post, 'categories'=>$categories, 'comments'=>$comments, 'postsToday' => $postsToday, 'usersToday' => $usersToday , 'scategories'=>$scategories, 'suvcategories'=>$suvcategories, 'ptcategories'=>$ptcategories ]);

	}

	public function create(){

        $categories = Category::all();

		return view('admin.posts.create', compact('categories'));
	}

	public function store(){

		$this->authorize('create', Post::class);

		$inputs = request()->validate([

		'title' => 'required',
		'post_image' => 'file',
        'category_id' => 'required',
		'body' => 'required',

		]);

		 if(request('post_image')){


			 $inputs['post_image'] = request('post_image')->store('images', 'public');
			 }

		auth()->user()->posts()->create($inputs);

		session()->flash('postmessage','You created the post: ' .$inputs['title']);

		return redirect()->route('post.index');

	}

	public function edit(Post $post){

        $categories = Category::all();

		if(auth()->user()->can('view', $post))

		return view('admin.posts.edit', ['post'=>$post, 'categories'=>$categories]);

	}

	public function update(Post $post){

		$inputs = request()->validate([

		'title' => 'required',
		'post_image' => 'file',
        'category_id' => 'required',
		'body' => 'required',

		]);

		 if(request('post_image')){

					 $inputs['post_image'] = request('post_image')->store('images');
					 $post->post_image = $inputs['post_image'];
			 }

			$post->title = $inputs['title'];


            $post->category_id = $inputs['category_id'];

			$post->body = $inputs['body'];

			$this->authorize('update', $post);

			$post->save();

		session()->flash('postupdate','You updated the post: ' .$inputs['title']);

		return redirect()->route('post.index');
	}


    public function upload(Request $request){
        $fileName=$request->file('file')->getClientOriginalName();
        $path=$request->file('file')->storeAs('uploads', $fileName, 'public');
        return response()->json(['location'=>"/storage/$path"]);
    }

	public function destroy(Post $post){

	/* 	$this->authorize('delete', $post); */

		$post->delete();

		Session::flash('message', 'The post has been deleted');

		return back();

	}

    public function test($id){

        $post = Post::findOrFail($id);

        $comments = Comment::where("post_id", "=", $post->id)->get();

        return view('blog-post', compact('post', 'comments'));
    }

    public function categories($id){

        $postsToday = Post::where('created_at', 'like', Carbon::now()->format('Y-m-d'). '%')->count();
        $usersToday = User::where('created_at', 'like', Carbon::now()->format('Y-m-d'). '%')->count();

        $scategories = Category::where('parent_id', 5)->get();

        $suvcategories = Category::where('parent_id', 6)->get();

        $ptcategories = Category::where('parent_id', 7)->get();

        $category = Category::find($id);

            if($category->parent_id == 5)
            {
                $data = "Sedan";
            }
            elseif($category->parent_id == 6)
            {
             $data = "SUV";
            }
            else $data = "Pickup Truck";


        $posts = Post::where('category_id',$category->id)->get();

        return view('admin.posts.pages.categories', compact('posts', 'postsToday', 'usersToday', 'scategories', 'suvcategories', 'ptcategories', 'category', 'data'));



    }





}
