<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Home</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

<link rel="stylesheet"  href="{{asset('css/blog-home.css')}}">
  <link rel="stylesheet"  href="{{asset('css/blog-post.css')}}">
  <link rel="stylesheet"  href="{{asset('css/app.css')}}">
  <link rel="stylesheet"  href="{{asset('css/sb-admin-2.css')}}">
  <link rel="stylesheet"  href="{{asset('css/landing.css')}}">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      {{-- <a class="navbar-brand" href="{{route('landing-page')}}"><img width="100px" src="{{asset('images/logo.png')}}"></a> --}}
      <div style="padding: 40px;"></div>
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
              <a class="nav-link" href="{{route('home')}}">Latest posts
                <span class="sr-only">(current)</span>
              </a>
            </li>

            <li class="nav-item">
                <div class="dropdown1">
                    <button class="dropbtn1 nav-link dropdown-toggle">Sedan</button>
                    <div class="dropdown-content1">
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
            <div  class="container-fluid">
                <div class="row no-gutters">
                  <div class="col-sm-4 fstcol ">
                    <article>
                  <center> <a class="navbar-brand" href="{{route('landing-page')}}">
                      <img class="logoimg mt-3" width="180px" src="{{asset('images/logo-placeholder.png')}}"> </a></center>
                        <h2 class="hdr ">Lorem Ipsum</h2>

                        <p style="font-size: 1.5em;
                        font-size: 1.5vw; color:#b1b6ba;">
                           Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                        </p>

                        <p class="sndp">
                           <q>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</q>
                        </p>
                        <center> <img class="separator" width="300px" src="{{asset('images/index2.png')}}"> </center>
                        <p style="text-align: center;"> Section 1.10.32</p>

                    </article>
                 </div>

                  <div class="col-sm-8 " style="background-image:url({{asset('images/691667.jpg')}}); height:900px; background-position: 20% 130%;">
                    {{-- <img  class="img-fluid"	 style="width:100%;" src="{{asset('images/691667.jpg')}}"> --}}
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
