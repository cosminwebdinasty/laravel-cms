@extends('components.admin-master')

	@section('content')

	<h1>Create Post</h1>

    <br>
<form method="post" action="{{route('post.store')}}" enctype="multipart/form-data">
	@csrf

	<div class="form-group">

		<label for="title">Title</label>
		<input type="text" name="title" class="form-control" id="title" placeholder="Enter title" required>
		</div>

		<div style="border: 1px solid #d1d3e2; padding:20px; border-radius: 0.35rem;" class="form-group">

		<label for="post_image">Post Image</label>
		<input style="display:inline; width:20%;" class="form-control-file" type="file" name="post_image" class="form-control" id="post_iamge" >

            <select style="display:inline; width:30%;" class="form-control" name="category_id">
            <option value="">Select Category</option>

            @foreach ($categories as $category)
              <option value="{{ $category->id }}">{{ $category->name }}</option>
            @endforeach
          </select>
          </div>

		<div class="form-group">

		<label for="body">Description</label>
	    <textarea class="tinymce" name="body"  rows="16" cols="50"  id="body">
		</textarea>

		<br>

		<button type="submit" class="btn btn-primary" cols="30" rows="50"style="margin-bottom:100px;">Submit</button>

	@endsection
