@extends('layouts.layout')
@section('title', 'Каталог обуви')
@section('content')
    <h1>Каталог обуви</h1>
    <div class="container">
        @foreach($products as $product)
            <div class="element">

            </div>
            <div>{{ $product->description }}</div>
            <div>{{ $product->typeProduct->name  }}</div>
            <div>{{ $product->genderShoe->name ?? 'Не указан' }}</div>
            <div>{{ $product->manufacturer->name ?? 'Не указан' }}</div>
            <div>{{ $product->unit->name ?? 'Не указан' }}</div>
            <div>{{ number_format($product->price, 0, ',', ' ') }} ₽</div>
        @endforeach
    </div>
@endsection
