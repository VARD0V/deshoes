<!doctype html>
<html lang=ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{asset('assets/css/css.css')}}">
    <link rel="icon" href="{{asset('assets/images/ico.ico')}}">
</head>
<body>
<header>
    <div>
    </div>
    <nav>
        @auth
            <form method="POST" action="{{ route('logout') }}" style="display: inline;">
                @csrf
                <button type="submit">Выйти</button>
            </form>
        @else
            <a href="{{ route('login') }}">Войти</a>
        @endauth
            <a href="{{ route('products.index') }}">Товары</a>
    </nav>
</header>
<main>
    @yield('content')
</main>
<footer>
</footer>
</body>
</html>
