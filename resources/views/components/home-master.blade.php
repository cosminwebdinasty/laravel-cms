<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Cars</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

<link rel="stylesheet"  href="{{asset('css/blog-home.css')}}">
  <link rel="stylesheet"  href="{{asset('css/blog-post.css')}}">
  <link rel="stylesheet"  href="{{asset('css/app.css')}}">
  <link href="{{asset('vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="{{route('landing-page')}}"><img width="140px" src="{{asset('images/logo-placeholder.png')}}"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="{{route('landing-page')}}">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{route('home')}}">Latest Posts
              <span class="sr-only">(current)</span>
            </a>
          </li>

          <li class="nav-item">
            <div class="dropdown1">
                <button class="dropbtn1 nav-link dropdown-toggle">Sedan</button>
                <div class="dropdown-content1" style="width:280px;">

                    @foreach ($scategories as $category)
                        <a style="" href="/posts/{{$category->id}}">{{$category->name}}</a>
                    @endforeach

                </div>
              </div>
        </li>

        <li class="nav-item">

            <div class="dropdown1">
                <button class="dropbtn1 nav-link dropdown-toggle">SUV</button>
                <div class="dropdown-content1">
                    @foreach ($suvcategories as $category)
                    <a style="" href="/posts/{{$category->id}}">{{$category->name}}</a>
                @endforeach
                </div>
              </div>
          </li>

          <li class="nav-item">

            <div class="dropdown1">
                <button class="dropbtn1 nav-link dropdown-toggle">Pickup Truck</button>
                <div class="dropdown-content1">
                    @foreach ($ptcategories as $category)
                    <a style="" href="/posts/{{$category->id}}">{{$category->name}}</a>
                @endforeach
                </div>
              </div>
          </li>



		  @if(Auth::check())

		   <li class="nav-item">
            <a class="nav-link" href="{{route('admin.index')}}">Admin</a>
          </li>

		  @else
			    <li class="nav-item">
            <a class="nav-link" href="{{'/login'}}">Login</a>
          </li>

		  <li class="nav-item">
            <a class="nav-link" href="{{'/register'}}">Register</a>
          </li>

		    @endif

        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

			{{-- @yield('content') --}}
            @yield('content')

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">


		  <form method="post" action="{{route('search')}}" enctype="multipart/form-data">
		  @csrf
		  @method('GET')

            <div class="input-group">
              <input type="text" name="search" class="form-control" placeholder="Search posts...">
              <span class="input-group-btn">
                <button style="background-color:#7f0615; border-color:#7f0615;" class="btn btn-secondary ml-1" type="submit"><i class="fas fa-search fa-sm"></i></button>
              </span>
			  </form>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">

              <div class="col-lg-12 pl-5">
                {{-- <ul class="list-unstyled mb-0">
                    @foreach($categories as $category)
                  <li>
                    <a href="{{route('categories.edit', $category->id)}}">{{$category->name}}</a>
                  </li>
                  @endforeach
                </ul> --}}

                <p style="margin-bottom: 0px;"><a href="{{route('categories.edit', 5)}}" style="pointer-events: none;">Sedan</a></p>

                <ul style="list-style-type: none;">
                    @foreach ($scategories as $category)
                    <li><a style="" href="/posts/{{$category->id}}">{{$category->name}}</a></li>
                @endforeach
                </ul>

                <p style="margin-bottom: 0px;"><a href="{{route('categories.edit', 6)}}" style="pointer-events: none;">SUV</a></p>

                <ul style="list-style-type: none;">
                    @foreach ($suvcategories as $category)
                    <li><a style="" href="/posts/{{$category->id}}">{{$category->name}}</a></li>
                @endforeach

                </ul>

                <p style="margin-bottom: 0px;"><a href="{{route('categories.edit', 7)}}" style="pointer-events: none;">Pickup Truck</a></p>

                <ul style="list-style-type: none;">
                @foreach ($ptcategories as $category)
                    <li><a style="" href="/posts/{{$category->id}}">{{$category->name}}</a></li>
                @endforeach
                </ul>



              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Posts added today</h5>
          <div class="card-body">
             Number of posts: <strong style="margin-left:8px; font-size:16px;">{{$postsToday}} </strong><br>
             New users:   <strong style="margin-left:8px; font-size:16px;">{{$usersToday}} </strong>
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 2021</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
