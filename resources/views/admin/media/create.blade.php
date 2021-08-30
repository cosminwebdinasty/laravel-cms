@extends('components.admin-master')

@section('styles')
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.8.0/dropzone.css">
@endsection

@section('content')

<h1>Upload Media</h1>


 {!! Form::open(['method'=>'POST', 'action'=>'MediaController@store', 'class'=>'dropzone'])  !!}


{!! Form::close() !!}


@endsection


@section('scripts')

   <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.8.0/min/dropzone.min.js"></script>

@endsection
