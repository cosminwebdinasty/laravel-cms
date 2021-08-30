@extends('components.admin-master')

@section('content')
<h1>Roles</h1>

@if(session()->has('roledel'))
			<div class="alert alert-danger">
			{{session('roledel')}}
		</div>
	@endif
    <br>
	<div class="row">

		<div class="col-sm-2">

		<form method="post" action="{{route('roles.store')}}">
			@csrf

			<div class="form-group">
			<label for="name">Name</label>
			<input type="text" name="name" id="name" class="form-control

			@error('name') is-invalid @enderror">

			<div> @error('name')
					<span><strong>{{$message}}</strong></span>

				@enderror

			</div>

			</div>
		<button type="subbmit" class="btn btn-primary btn-block">Create role</button>

		</form>

		</div>

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
                      <th>Id</th>
					  <th>Name</th>
                      <th>Slug</th>
					   <th>Delete</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Id</th>
					  <th>Name</th>
                      <th>Slug</th>
					   <th>Delete</th>
                    </tr>
                  </tfoot>

				 <tbody>

				@foreach($roles as $role)

				<tr>

				<td>{{$role->id}}</td>
				<td><a href="{{route('roles.edit', $role->id)}}">{{$role->name}}</a></td>
				<td>{{$role->slug}}</td>
				<td>
				<form method="post" action="{{route('roles.destroy', $role->id)}}">

				@csrf
				@method('DELETE')

				<button onClick="javascript:return confirm('Are you sure you want to delete the role?')" type="submit" class="btn btn-danger">Delete</button>

				</form>   </td>
				</tr>

                @endforeach
            </tbody>

             </tbody>
           </table>
         </div>
       </div>

   </div>    </div>
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
