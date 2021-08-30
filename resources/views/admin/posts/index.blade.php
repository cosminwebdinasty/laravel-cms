@extends('components.admin-master')


@section('content')

	<h1>All posts</h1>


	@if(Session::has('message'))

		<div style="padding:10px 10px"; class="alert-danger">{{Session::get('message')}}</div>

		@elseif(Session::has('postupdate'))
	<div style="padding:10px 10px"; class="alert-success">{{Session::get('postupdate')}}</div>

	@elseif(Session::has('postmessage'))
	<div style="padding:10px 10px"; class="alert-success">{{Session::get('postmessage')}}</div>

	@endif
	<br>

	     </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Posts</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Id</th>
					  <th>Owner</th>
                      <th>Title</th>
                      <th>Image</th>
                      <th>Created At</th>
                      <th>Updated At</th>
                      <th>Comments</th>
					   <th>Delete</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Id</th>
					  <th>Owner</th>
                      <th>Title</th>
                      <th>Image</th>
                      <th>Created At</th>
                      <th>Updated At</th>
                      <th>Comments</th>
					  <th>Delete</th>

                    </tr>
                  </tfoot>

				 <tbody>

				 @foreach($posts as $post)


				 <tr>
					<td> {{$post->id}}</td>
					<td> {{$post->user->name}}</td>
					<td><a href="{{route('post.edit', $post->id)}}"> {{$post->title}}</td>

				 <td> <img height="40px" src="{{asset('storage/' . $post->post_image)}}" alt=""></td>

					<td> {{$post->created_at ->diffForHumans()}}</td>
					<td> {{$post->updated_at ->diffForHumans()}}</td>

                        <td><a href="{{route('comments.show', $post->id)}}">View comments</a></td>

					<td>

					@can('view', $post)

					<form method="post" action="{{route('post.destroy', $post->id)}}" enctype="multipart/form-data">

					   @csrf

					   @method('DELETE')

					   <button onClick="javascript:return confirm('Are you sure you want to delete the post?')" type="submit" class="btn btn-danger">Delete</button>

					   </form></td>
						@endcan
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

		<div class="d-flex">
			<div class="mx-auto">
	  {{$posts->links()}}
</div>
</div>
	@endsection

	@section('scripts')

	 <script src="{{asset('vendor/datatables/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>

  <!-- Page level custom scripts -->
  <!--  <script src="{{asset('js/demo/datatables-demo.js')}}"></script> -->

		@endsection
