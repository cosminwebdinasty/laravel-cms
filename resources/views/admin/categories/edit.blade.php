@extends('components.admin-master')


@section('content')

<h1>Edit category</h1>

<div class="col-sm-6">

    <form method="post" action="{{route('category.update', $category->id)}}">
        @csrf
        @method('POST')


    <div class="form-group">

        <label for="name">Name</label>
        <input type="text" value="{{$category->name}}" name="name" id="name" class="form-control

        @error('name') is-invalid @enderror"> </div>


        <div> @error('name')
                <span><strong>{{$message}}</strong></span>

            @enderror

        </div>

        <div class="form-group">
            <select class="form-control" name="parent_id">
            <option value="">Select Parent Category</option>

            @foreach ($allCategories as $parent)
              <option value="{{ $parent->id }}">{{ $parent->name }}</option>
            @endforeach
          </select>
          </div>


        <br><button class="btn btn-primary" type="submit">Update</button>
</form>


</div>
@endsection



@section('scripts')

<script src="{{asset('vendor/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>

<!-- Page level custom scripts -->
<!--  <script src="{{asset('js/demo/datatables-demo.js')}}"></script> -->



@endsection
