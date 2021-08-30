@extends('components.admin-master')


@section('content')

<h1>Replies</h1>

@if(Session::has('reply.delete'))

    <div class="alert-danger" style="padding: 20px; margin-bottom:20px;">{{session('reply.delete')}}</div>

@endif


@if(count($replies) > 0 )


<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Replies</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Author</th>
              <th>Email</th>
              <th>Body</th>
              <th>Post</th>
              <th>Approve</th>
              <th>Delete</th>

            </tr>
          </thead>
          <tfoot>
            <tr>
                <th>Author</th>
                <th>Email</th>
                <th>Body</th>
                <th>Post</th>
                <th>Approve</th>
                <th>Delete</th>

            </tr>
          </tfoot>

         <tbody>

        @foreach($replies as $reply)
        <tr><td>{{$reply->author}}</td>
        <td>{{$reply->email}}</td>
        <td>{{$reply->body}}</td>
        <td><a href="{{route('post', $reply->comment->post_id)}}" >View post</a> </td>


            <td>
            @if($reply->is_active == 1)

            {!! Form::open(['method'=>'PATCH', 'action'=>['CommentRepliesController@update', $reply->id]]) !!}

            <input type="hidden" name="is_active" value="0">


            <div class="form-group">

                {!! Form::submit('Un-approve', ['class'=>'btn btn-primary'] ) !!}
            </div>

            {!! Form::close() !!}

            @else


            {!! Form::open(['method'=>'PATCH', 'action'=>['CommentRepliesController@update', $reply->id]]) !!}

            <input type="hidden" name="is_active" value="1">


            <div class="form-group">

                {!! Form::submit('Approve', ['class'=>'btn btn-primary'] ) !!}
            </div>


            {!! Form::close() !!}


            @endif


            </td>



        <td>
        <form method="POST" action="{{route('delete.reply', $reply->id)}}">
            @csrf
            @method('DELETE')

            <input type="submit" value="Delete" class="btn btn-danger">

        </form>
    </td>


    @endforeach
</tbody>


 </tbody>
</table>
</div>
</div>


<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
@else <div class="alert-info" style="padding: 10px 10px;">No replies</div>

@endif

@endsection


@section('scripts')

<script src="{{asset('vendor/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>

<!-- Page level custom scripts -->
<!--  <script src="{{asset('js/demo/datatables-demo.js')}}"></script> -->


@endsection

