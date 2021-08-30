@extends('components.admin-master')


@section('content')

	<h1>Edit Role: {{$role->name}}</h1>

	@if(session()->has('roleupdate'))
			<div class="alert alert-info">
			{{session('roleupdate')}}
		</div>
	@endif

	<div class="col-sm-6">

	<form method="post"  action="{{route('roles.update',$role->id)}}">

		@csrf
		@method('PUT')
	<div class="form-group">

			<label for="name">Name</label>
			<input class="form-control" type="text" name="name" id="name" value="{{$role->name}}">
			<br><button class="btn btn-primary" type="submit">Update</button>
	</form></div>
	</div>

	<div class="col-sm-12">

		@if($permissions->isNotEmpty())

		<div class="col-sm-7">

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

				@foreach($permissions as $permission)

				<tr>

				<td><input type="checkbox"

				@foreach($role->permissions as $role_permission)

				@if($role_permission->slug == $permission->slug)

				checked
				@endif
				@endforeach

				>

				</td>
				<td>{{$permission->id}}</td>
				<td><a href="{{route('roles.edit', $permission->id)}}">{{$permission->name}}</a></td>
				<td>{{$permission->slug}}</td>
				<td>
				<form method="post" action="{{route('role.permission.attach', $role)}}">

				@csrf
				@method('PUT')


				<input type="hidden" name="permission" value="{{$permission->id}}">

				<button type="submit" class="btn btn-primary"

				@if($role->permissions->contains($permission))
				disabled
				@endif

				>Attach</button>


				</form>   </td>


				<td>
				<form method="post" action="{{route('role.permission.detach', $role)}}">

				@csrf
				@method('PUT')


				<input type="hidden" name="permission" value="{{$permission->id}}">

				<button type="submit" class="btn btn-danger"

				@if(!$role->permissions->contains($permission))
				disabled
				@endif

				>Detach</button>


				</form>   </td>

				</tr>
				@endforeach
			</tbody>


        </tbody>
      </table>
    </div>
  </div>
@endif
</div></div>
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
