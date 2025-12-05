<!doctype html>
<html lang=ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{asset('assets/css/css.css')}}">
    <link rel="icon" href="{{asset('assets/images/icon.ico')}}">
</head>
<body>
<header>
    <div>
    </div>
    <nav>
        <img src="assets/images/logo.jpg" alt="logo" style="width: 100px">
        <div class="nav__buttons">
            @auth
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit">Выйти</button>
                </form>
                <div class="user-name">
                    {{ auth()->user()->fio }}
                </div>
            @else
                <a href="{{ route('login') }}">Войти</a>
            @endauth
            <a href="{{ route('products.index') }}">Товары</a>
        </div>
    </nav>
</header>
<main>
    @yield('content')
</main>
<footer>
</footer>
</body>
</html>
