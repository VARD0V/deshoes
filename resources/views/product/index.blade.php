@extends('layouts.layout')
@section('title', 'Каталог обуви')
@section('content')
    <h1>Каталог обуви</h1>
    <div class="container">
        @foreach($products as $product)
            @php
                // Рассчитываем итоговую цену
                $finalPrice = $product->price - ($product->price * $product->discount / 100);
                // Определяем цвет фона
                $backgroundColor = '';
                if ($product->discount > 15) {
                    $backgroundColor = 'background-color: #2E8B57;';
                }
                if ($product->amount <= 0) {
                    $backgroundColor = 'background-color: #E0F7FA;';
                }
            @endphp
            <a href="{{ route('products.show', $product->id) }}">
                <div class="card" style="{{ $backgroundColor }}">
                    <div>
                        @if($product->photo)
                            <img class="card__photo" src="/assets/images/{{ $product->photo }}" alt="{{ $product->description }}">
                        @else
                            <img class="card__photo" src="/assets/images/picture.png" alt="Заглушка">
                        @endif
                    </div>
                    <div class="card__description">
                        <p>{{ $product->typeProduct->name}} |</p>
                        <p>Описание товара: {{ $product->description }}</p>
                        <p>Производитель: {{ $product->manufacturer->name}}</p>
                        <p>Поставщик: {{ $product->supplier->name}}</p>

                        <p>
                            @if($product->discount > 0)
                                <span style="text-decoration: line-through; color: red;">
                                    {{ number_format($product->price, 0, ',', ' ') }} ₽
                                </span>
                                <span style="color: black; font-weight: bold;">
                                    {{ number_format($finalPrice, 0, ',', ' ') }} ₽
                                </span>
                            @else
                                {{ number_format($product->price, 0, ',', ' ') }} ₽
                            @endif
                        </p>

                        <p>Единица измерения: {{ $product->unit->name}}</p>
                        <p>Количество на складе: {{ $product->amount }}</p>
                    </div>
                    <div>
                        <p>{{ $product->discount }} %</p>
                    </div>
                </div>
            </a>
        @endforeach
    </div>
@endsection
