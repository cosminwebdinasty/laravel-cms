@extends('components.admin-master')


@section('content')


	<h1>Edit Permission: {{$permission->name}}</h1>


@if(session()->has('permissionupdate'))
			<div class="alert alert-info">
			{{session('permissionupdate')}}
		</div>
	@endif



	<div class="col-sm-6">

	<form method="post"  action="{{route('permissions.update', $permission->id)}}">

		@csrf
		@method('PUT')
	<div class="form-group">

			<label for="name">Name</label>
			<input class="form-control" type="text" name="name" id="name" value="{{$permission->name}}"></div>
			<br><button class="btn btn-primary" type="submit">Update</button>
	</form>



@endsection
