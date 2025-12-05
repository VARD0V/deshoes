@extends('layouts.layout')
@section('title', 'Каталог обуви')
@section('content')
    <h1>Каталог обуви</h1>

    {{-- Поиск только для админа и менеджера --}}
    @auth
        @if(auth()->user()->isAdmin() || auth()->user()->isManager())
            <form method="GET" action="{{ route('products.index') }}" id="searchForm">
                <input type="text"
                       name="search"
                       id="searchInput"
                       placeholder="Поиск товаров..."
                       value="{{ request('search', '') }}"
                       autocomplete="off"
                       oninput="this.form.submit()">
            </form>
        @endif
    @endauth

    <div class="container">
        @foreach($products as $product)
            @php
                $finalPrice = $product->price - ($product->price * $product->discount / 100);
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
                        <p>{{ $product->typeProduct->name ?? 'Нет категории' }} |</p>
                        <p>Описание товара: {{ $product->description }}</p>
                        <p>Производитель: {{ $product->manufacturer->name ?? 'Не указан' }}</p>
                        <p>Поставщик: {{ $product->supplier->name ?? 'Не указан' }}</p>

                        <p>
                            @if($product->discount > 0)
                                <span style="text-decoration: line-through; color: red;">
                                    {{ number_format($product->price, 0, ',', ' ') }} ₽
                                </span>
                                →
                                <span style="color: black; font-weight: bold;">
                                    {{ number_format($finalPrice, 0, ',', ' ') }} ₽
                                </span>
                            @else
                                {{ number_format($product->price, 0, ',', ' ') }} ₽
                            @endif
                        </p>

                        <p>Единица измерения: {{ $product->unit->name ?? 'Не указана' }}</p>
                        <p>Количество на складе: {{ $product->amount }}</p>
                    </div>
                    <div>
                        <p>{{ $product->discount }} %</p>
                    </div>
                </div>
            </a>
        @endforeach

        @if($products->isEmpty())
            <p>Товары не найдены</p>
        @endif
    </div>

    <script>
        // Простой JavaScript для авто-отправки формы
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            const searchForm = document.getElementById('searchForm');

            if (searchInput && searchForm) {
                let searchTimeout;

                searchInput.addEventListener('input', function() {
                    clearTimeout(searchTimeout);
                    searchTimeout = setTimeout(function() {
                        searchForm.submit();
                    }, 700);
                });

                searchInput.focus();
            }
        });
    </script>
@endsection
