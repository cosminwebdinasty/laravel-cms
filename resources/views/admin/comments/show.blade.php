@extends('components.admin-master')



@section('content')

<h1>Comments</h1>

@if(Session::has('comment.delete'))

    <div class="alert-danger" style="padding: 20px; margin-bottom:20px;">{{session('comment.delete')}}</div>

@endif


@if(count($comments) > 0 )


<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Roles</h6>
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

        @foreach($comments as $comment)
        <tr><td>{{$comment->author}}</td>
        <td>{{$comment->email}}</td>
        <td>{{$comment->body}}</td>
        <td><a href="{{route('post', $comment->post_id)}}" >View post</a> </td>

            <td>
            @if($comment->is_active == 1)

            {!! Form::open(['method'=>'PATCH', 'action'=>['CommentsController@update', $comment->id]]) !!}

            <input type="hidden" name="is_active" value="0">


            <div class="form-group">

                {!! Form::submit('Un-approve', ['class'=>'btn btn-primary'] ) !!}
            </div>

            {!! Form::close() !!}

            @else


            {!! Form::open(['method'=>'PATCH', 'action'=>['CommentsController@update', $comment->id]]) !!}

            <input type="hidden" name="is_active" value="1">


            <div class="form-group">

                {!! Form::submit('Approve', ['class'=>'btn btn-primary'] ) !!}
            </div>


            {!! Form::close() !!}


            @endif


            </td>



        <td>
        <form method="POST" action="{{route('delete.comment', $comment->id)}}">
            @csrf
            @method('DELETE')

            <input type="submit" value="Delete" class="btn btn-danger">


        </form>
    </td>


        @endforeach
    </tr>
    </tbody>
</table>


@else <div class="alert-info" style="padding: 10px 10px;">No comments</div>

@endif

@endsection

