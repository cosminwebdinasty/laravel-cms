<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Photo;
use App\Media;
use App\Page;

class MediaController extends Controller
{
    public function index(){
        $photos = Photo::all();
        return view('admin.media.index', compact('photos'));
    }

    public function create(){
        return view('admin.media.create');
    }

    public function store(Request $request){

        $file = $request->file('file');
        $file->store('images', 'public');
        $name = time() .$file->getClientOriginalName();
        $file->move('images', $name);
        Photo::create(['file'=>$name]);
    }

    public function destroy($id){

        $photo = Photo::findOrFail($id);
		$photo->delete();
        session()->flash('photodelete', 'Media has been deleted ' .$photo->file);
        return back();
    }
}
