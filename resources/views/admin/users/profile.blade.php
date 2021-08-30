@extends('components.admin-master')


@section('content')

		<h1>User profile for <span style="color:#2447ac;">{{auth()->user()->name}} </span></h1>

		<div class="row">

			<div class="col-sm-6">

	<form method="post" action="{{route('user.profile.update', $user->id)}}" enctype="multipart/form-data">
	@csrf
	@method('PUT')

	<div style="padding-top:20px; padding-bottom:10px;">

    <img width="50px" height="50px" class="img-profile rounded-circle" src="{{asset('storage/' . $user->avatar)}}">

</div>

	<div class="form-group">

		<input type="file" name="avatar">
	</div>

	<div class="form-group">

		<label for="title">Username</label>
		<input type="text" name="username" class="form-control" id="username" value="{{$user->username}}" >

	@error('username')
	<div class="alert alert-danger">{{$message}}</div>
	@enderror

	</div>

		<div class="form-group">

		<label for="title">Name</label>
		<input type="text" name="name" class="form-control" id="name" value="{{$user->name}}" >

		@error('name')
	<div class="alert alert-danger">{{$message}}</div>
	@enderror
		</div>

		<div class="form-group">

		<label for="title">Email</label>
		<input type="text" name="email" class="form-control" id="email" value="{{$user->email}}" >

	@error('email')
	<div class="alert alert-danger">{{$message}}</div>
	@enderror
		</div>

			<div class="form-group">

		<label for="title">Password</label>
		<input type="password" name="password" class="form-control" id="password"  >
		@error('password')
	<div class="alert alert-danger">{{$message}}</div>
	@enderror

		</div>

					<div class="form-group">

		<label for="title">Confirm password</label>
		<input type="password" name="password_confirmation" class="form-control" id="password_confirmation"  >

		@error('passwprd_confirm')
	<div class="alert alert-danger">{{$message}}</div>
	@enderror

		</div>

			 <button class="btn btn-primary" type="submit">Update</button>

			</div>
			</div>
<br>
	<div class="row">

		<div class="col-sm-12">

		<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Roles</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
					<th>Options</th>
                      <th>Id</th>
					  <th>Name</th>
                      <th>Slug</th>
                      <th>Attach</th>
                      <th>Detach</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
					<th>Options</th>
                       <th>Id</th>
					  <th>Name</th>
                      <th>Slug</th>
                      <th>Attach</th>
                      <th>Detach</th>
                    </tr>
                  </tfoot>

				 <tbody>

					@foreach($roles as $role)

					<tr>
					<td><input type="checkbox"

						@foreach($user->roles as $user_role)

							@if($user_role->slug == $role->slug)
								checked

							@endif

						@endforeach

					></td>
					<td>{{$role->id}}</td>
					<td>{{$role->name}}</td>
					<td>{{$role->slug}}</td>
					<td>

					<form method="post" action="{{route('user.role.attach', $user)}}">
						@method('PUT')
						@csrf

					<input type="hidden" name="role" value="{{$role->id}}">

					<button type="submit" class="btn btn-primary"

					@if($user->roles->contains($role))

						disabled

					@endif

					>Attach</button>
					</form>

					</td>

					<td>
					<form method="post" action="{{route('user.role.detach', $user)}}">
						@method('PUT')
						@csrf

					<input type="hidden" name="role" value="{{$role->id}}">

					<button class="btn btn-danger" type="submit"


					@if(!$user->roles->contains($role))

						disabled

					@endif

					>Detach</button>
					</form></td>

					</tr>
                    @endforeach
                </tbody>

                 </tbody>
               </table>
             </div>
           </div>

       </div>
       <!-- /.container-fluid -->

     </div>
     <!-- End of Main Content -->
    @endsection


    @section('scripts')

    <script src="{{asset('vendor/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>

    <!-- Page level custom scripts -->
    <!--  <script src="{{asset('js/demo/datatables-demo.js')}}"></script> -->

    @endsection
