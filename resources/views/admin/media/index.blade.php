@extends('components.admin-master')


@section('content')

<h1>Media</h1>


@if(session()->has('photodelete'))
			<div class="alert alert-danger">
			{{session('photodelete')}}
		</div>
	@endif


@if($photos)


<div class="table-responsive">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
      <thead>
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Created At</th>
           <th>Delete</th>

        </tr>
      </thead>
      <tfoot>
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Created At</th>
          <th>Delete</th>

        </tr>
      </tfoot>
                @foreach ($photos as $photo)


     <tbody>
        <tr>
            <td>{{$photo->id}}</td>

             <td> <img class="mr-2"   onerror="this.src='{{asset('images/file2.png')}}'" height="40px" src="{{asset('images/' .$photo->file)}}">



               <a target="_blank" href='{{asset('images/' .$photo->file)}}'>{{substr($photo->file, 10)}}</a></p></td>


            <td>{{$photo->created_at ? $photo->created_at->diffForHumans() : 'no_date'}}</td>


                        <td>
                    {!! Form::open(['method'=>'DELETE', 'action'=>['MediaController@destroy', $photo->id]]) !!}

                    {!! Form::submit('Delete', ['class'=>'btn btn-danger']) !!}


                    {!! Form::close() !!}</td>

        </tr>

       @endforeach
    </tbody>


</tbody>
</table>
</div>


<!-- /.container-fluid -->


<!-- End of Main Content -->


@endif

@endsection
