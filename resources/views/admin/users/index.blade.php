@extends('components.admin-master')

	@section('content')

	<h1>Users</h1>

	@if(session('userdel'))

		<div class="alert alert-danger"> {{session('userdel')}} </div>

		@endif

<br>
    </nav>

    <!-- End of Topbar -->

    <!-- Begin Page Content -->
    <div class="container-fluid">

	<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">All Users</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Id</th>
					  <th>Username</th>
                      <th>Avatar</th>
                      <th>Name</th>
                      <th>Registred At</th>
                      <th>Updated At</th>
					   <th>Delete</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                       <th>Id</th>
					  <th>Username</th>
                      <th>Avatar</th>
                      <th>Name</th>
                      <th>Registred At</th>
                      <th>Updated At</th>
					   <th>Delete</th>
                    </tr>
                  </tfoot>

				 <tbody>

				@foreach($users as $user)

				<tr>
					<td>{{$user->id}}</td>
					<td><a href="{{route('user.profile.show', $user->id)}}">{{$user->username}}</a></td>
					<td><img class="rounded-circle" width="50px" height="50px" src="{{asset('storage/' . $user->avatar)}}" alt=""></td>
					<td>{{$user->name}}</td>
					<td>{{$user->created_at->diffForHumans()}}</td>
					<td>{{$user->updated_at->diffForHumans()}}</td>
					<td>

					<form method="post" action="{{route('user.destroy', $user->id)}}">
                                    @csrf
                                    @method('DELETE')
                                    <button onClick="javascript:return confirm('Are you sure you want to delete the user?')" class="btn btn-danger">Delete</button>

                                </form>
					</td>

				</tr>

                @endforeach
            </tbody>


             </tbody>
           </table>
         </div>
       </div>

   </div>    </div></div>
   <!-- /.container-fluid -->

 </div>
 <!-- End of Main Content -->

   <div class="d-flex">
       <div class="mx-auto">
 {{$users->links()}}

@endsection


@section('scripts')

<script src="{{asset('vendor/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>

<!-- Page level custom scripts -->
<!--  <script src="{{asset('js/demo/datatables-demo.js')}}"></script> -->

@endsection


