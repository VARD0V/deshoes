@extends('layouts.layout')
@section('title', 'Авторизация')
@section('content')
    <h2>Авторизация</h2>

    @if($errors->any())
        <div class="error">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif

    <form method="POST" action="{{ route('login.submit') }}">
        @csrf
        <div>
            <label>Логин:</label>
            <input type="email" name="email" value="{{ old('email') }}" required>
        </div>

        <div>
            <label>Пароль:</label>
            <input type="password" name="password" required>
        </div>

        <button type="submit">Войти</button>
    </form>
@endsection
