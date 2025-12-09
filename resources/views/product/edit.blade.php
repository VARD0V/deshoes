@extends('layouts.layout')
@section('title', 'Редактирование товара')
@section('content')
    <h1>Редактирование товара</h1>

    @if($errors->any())
        <div>
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    @if(session('success'))
        <div>
            {{ session('success') }}
        </div>
    @endif

    <form method="POST" action="{{ route('products.update', $product->id) }}">
        @csrf
        @method('PUT')

        <div>
            <label>Артикул:</label>
            <input type="text" name="articul" value="{{ old('articul', $product->articul) }}" required>
        </div>

        <div>
            <label>Описание:</label>
            <input type="text" style="width: 400px" name="description" value="{{ old('description', $product->description) }}" required>
        </div>

        <div>
            <label>Цена (₽):</label>
            <input type="number" name="price" value="{{ old('price', $product->price) }}" min="0" step="0.01" required>
        </div>

        <div>
            <label>Скидка (%):</label>
            <input type="number" name="discount" value="{{ old('discount', $product->discount) }}" min="0" max="100" step="0.01">
        </div>

        <div>
            <label>Количество на складе:</label>
            <input type="number" name="amount" value="{{ old('amount', $product->amount) }}" min="0" required>
        </div>

        <div>
            <label>Фото (имя файла):</label>
            <input type="text" name="photo" value="{{ old('photo', $product->photo) }}" placeholder="Например: 1.jpg">
        </div>

        <div>
            <label>Категория:</label>
            <select name="type_product_id" required>
                <option value="">-- Выберите категорию --</option>
                @foreach($typeProducts as $type)
                    <option value="{{ $type->id }}" {{ old('type_product_id', $product->type_product_id) == $type->id ? 'selected' : '' }}>
                        {{ $type->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div>
            <label>Тип обуви:</label>
            <select name="gender_shoe_id" required>
                <option value="">-- Выберите тип --</option>
                @foreach($genderShoes as $gender)
                    <option value="{{ $gender->id }}" {{ old('gender_shoe_id', $product->gender_shoe_id) == $gender->id ? 'selected' : '' }}>
                        {{ $gender->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div>
            <label>Производитель:</label>
            <select name="manufacturer_id" required>
                <option value="">-- Выберите производителя --</option>
                @foreach($manufacturers as $manufacturer)
                    <option value="{{ $manufacturer->id }}" {{ old('manufacturer_id', $product->manufacturer_id) == $manufacturer->id ? 'selected' : '' }}>
                        {{ $manufacturer->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div>
            <label>Поставщик:</label>
            <select name="supplier_id" required>
                <option value="">-- Выберите поставщика --</option>
                @foreach($suppliers as $supplier)
                    <option value="{{ $supplier->id }}" {{ old('supplier_id', $product->supplier_id) == $supplier->id ? 'selected' : '' }}>
                        {{ $supplier->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div>
            <label>Единица измерения:</label>
            <select name="unit_id" required>
                <option value="">-- Выберите единицу измерения --</option>
                @foreach($units as $unit)
                    <option value="{{ $unit->id }}" {{ old('unit_id', $product->unit_id) == $unit->id ? 'selected' : '' }}>
                        {{ $unit->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div>
            <button class="btn" type="submit">Сохранить изменения</button>
            <a class="btn" href="{{ route('products.show', $product->id) }}">Отмена</a>
        </div>
    </form>
@endsection
