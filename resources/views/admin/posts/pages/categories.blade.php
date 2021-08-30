@extends('components.home-master')


@section('content')

<h1 class="my-4" style="text-transform: uppercase;">{{$data}}</h1>

<!-- Blog Post -->

@if(count($posts) < 1)

<h1 class="my-4">No posts found</h1>

<h2><a href="/admin/posts/create">Add</a> posts in this category</h2>

@endif


@foreach($posts as $post)

<div class="card mb-4">
    <img class="card-img-top" src="{{asset('storage/' . $post->post_image)}}" alt="Card image cap">
    <div class="card-body">
        <h2 class="card-title">{{$post->title}}</h2>
        {{-- <p class="card-text">{{Str::limit($post->body, '50', '...')}}</p> --}}
        <a href="{{route('post',$post->id)}}" class="btn btn-primary">Citeste mai mult &rarr;</a>
    </div>
    <div class="card-footer text-muted">
        Posted on {{$post->created_at->diffForHumans() }}

    </div>
</div>

@endforeach

@if(count($posts) > 0)

<!-- Pagination -->
<ul class="pagination justify-content-center mb-4">
    <li class="page-item">
        <a class="page-link" href="#">&larr; Older</a>
    </li>
    <li class="page-item disabled">
        <a class="page-link" href="#">Newer &rarr;</a>
    </li>
</ul>

@endif


@endsection
