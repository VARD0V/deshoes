@extends('layouts.layout')
@section('title', 'Каталог обуви')
@section('content')
    <h1>Каталог обуви</h1>
    <div class="container">
        @foreach($products as $product)
            <div class="card">
                <div>
                    @if($product->photo && file_exists(public_path('/assets/images/' . $product->photo)))
                        <img class="card__photo" src="/assets/images/{{ $product->photo }}" alt="{{ $product->description }}">
                    @else
                        <img class="card__photo" src="/assets/images/picture.png" alt="Заглушка">
                    @endif
                </div>
                <div class="card__description">
                    <p>{{ $product->typeProduct->name}} |</p>
                    <p>Описание товара:{{ $product->description }}</p>
                    <p>Производитель:{{ $product->manufacturer->name}}</p>
                    <p>Поставщик{{ $product->supplier->name}}</p>
                    <p>Цена:{{number_format($product->price, 0, ',', ' ')}} ₽</p>
                    <p>Единица измерения:{{ $product->unit->name}}</p>
                    <p>Количество на складе:{{ $product->amount}}</p>
                </div>
                <div>
                    <p>{{ $product->discount }} %</p>
                </div>
            </div>
        @endforeach
    </div>
@endsection
