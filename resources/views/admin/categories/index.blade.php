@extends('components.admin-master')



@section('content')


<h1>Categories</h1>


@if(session()->has('catdel'))
			<div class="alert alert-danger">
			{{session('catdel')}}
		</div>
	@endif


    @if(session()->has('catupdate'))
			<div class="alert alert-info">
			{{session('catupdate')}}
		</div>
	@endif

<br>

<div class="row">
<div class="col-sm-3">


    <form action="{{ route('category.store') }}" method="POST">
        @csrf

        <div class="form-group">
          <select class="form-control" name="parent_id">
            <option value="">Select Parent Category</option>

            @foreach ($categories as $category)
              <option value="{{ $category->id }}">{{ $category->name }}</option>
            @endforeach
          </select>
        </div>

        <div class="form-group">
          <input type="text" name="name" class="form-control" value="{{ old('name') }}" placeholder="Category Name" required>
        </div>

        <div class="form-group">
          <button type="submit" class="btn btn-primary">Create</button>
        </div>
      </form>


    </div>

    <div class="col-sm-7">

    <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Categories</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Id</th>
                  <th>Name</th>
                  <th>Created At</th>
                   <th>Updated At</th>
                   <th>Delete</th>

                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Id</th>
                  <th>Name</th>
                   <th>Created At</th>
                   <th>Updated At</th>
                   <th>Delete</th>

                </tr>
              </tfoot>

             <tbody>

            @foreach($categories as $category)

            <tr>

            <td>{{$category->id}}</td>
           <td><a href="{{route('categories.edit', $category->id)}}">{{$category->name}}</a></td>

                <td>{{$category->created_at->diffForHumans()}}</td>
                <td>{{$category->updated_at->diffForHumans()}}</td>

            <td>
             <form method="post" action="{{route('category.destroy', $category->id)}}">

            @csrf
            @method('DELETE')


            <button onClick="javascript:return confirm('Are you sure you want to delete the category?')" type="submit" class="btn btn-danger">Delete</button>


            </form>   </td>


            </tr>

            @endforeach
        </tbody>


       </table>
     </div></div>
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
