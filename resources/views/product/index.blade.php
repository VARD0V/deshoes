@extends('layouts.layout')
@section('title', 'Каталог обуви')
@section('content')
    <h1>Каталог обуви</h1>

    @auth
        @if(auth()->user()->isAdmin() || auth()->user()->isManager())
            <form method="GET" action="{{ route('products.index') }}" id="filterForm" style="margin-bottom: 20px;">
                <div style="display: flex; gap: 10px; align-items: flex-end; flex-wrap: wrap;">
                    {{-- Поиск --}}
                    <div>
                        <input type="text"
                               name="search"
                               id="searchInput"
                               placeholder="Поиск..."
                               value="{{ request('search', '') }}"
                               autocomplete="off"
                               style="padding: 8px;">
                    </div>

                    {{-- Фильтр по поставщику --}}
                    <div>
                        <select name="supplier_id" onchange="this.form.submit()" style="padding: 8px;">
                            <option value="">Все поставщики</option>
                            @foreach($suppliers as $supplier)
                                <option value="{{ $supplier->id }}" {{ request('supplier_id') == $supplier->id ? 'selected' : '' }}>
                                    {{ $supplier->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    {{-- Сортировка --}}
                    <div>
                        <select name="sort" onchange="this.form.submit()" style="padding: 8px;">
                            <option value="">Без сортировки</option>
                            <option value="amount_asc" {{ request('sort') == 'amount_asc' ? 'selected' : '' }}>Количество ↑</option>
                            <option value="amount_desc" {{ request('sort') == 'amount_desc' ? 'selected' : '' }}>Количество ↓</option>
                        </select>
                    </div>
                </div>
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
            {{-- Кнопка удаления и редактирования только для администратора --}}
            @auth
                @if(auth()->user()->isAdmin())
                    <div style="display: flex">
                        <div>
                            <form action="{{ route('products.destroy', $product->id) }}" method="POST"
                                  onsubmit="return confirm('Вы уверены, что хотите удалить этот товар?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit">
                                    Удалить товар
                                </button>
                            </form>
                        </div>
                        <div>
                            <a class="btn" href="{{ route('products.edit', $product->id) }}">Редактировать товар</a>
                        </div>
                    </div>
                @endif
            @endauth
        @endforeach
        @if($products->isEmpty())
            <p>Товары не найдены</p>
        @endif
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            const filterForm = document.getElementById('filterForm');

            if (searchInput && filterForm) {
                let searchTimeout;
                searchInput.addEventListener('input', function() {
                    clearTimeout(searchTimeout);
                    searchTimeout = setTimeout(() => filterForm.submit(), 700);
                });
                searchInput.focus();
            }
        });
    </script>
@endsection
