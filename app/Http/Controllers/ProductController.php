<?php

namespace App\Http\Controllers;

use App\Models\GenderShoe;
use App\Models\Manufacturer;
use App\Models\Product;
use App\Models\Supplier;
use App\Models\TypeProduct;
use App\Models\Unit;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->get('search', '');
        $sort = $request->get('sort', '');
        $supplier_id = $request->get('supplier_id', '');

        $query = Product::with(['typeProduct', 'genderShoe', 'manufacturer', 'supplier', 'unit']);

        // Поиск
        if (!empty($search)) {
            $query->where(function($q) use ($search) {
                $q->where('articul', 'LIKE', "%{$search}%")
                    ->orWhere('description', 'LIKE', "%{$search}%")
                    ->orWhere('price', 'LIKE', "%{$search}%")
                    ->orWhere('discount', 'LIKE', "%{$search}%")
                    ->orWhere('amount', 'LIKE', "%{$search}%")
                    ->orWhereHas('typeProduct', function($q2) use ($search) {
                        $q2->where('name', 'LIKE', "%{$search}%");
                    })
                    ->orWhereHas('manufacturer', function($q2) use ($search) {
                        $q2->where('name', 'LIKE', "%{$search}%");
                    })
                    ->orWhereHas('supplier', function($q2) use ($search) {
                        $q2->where('name', 'LIKE', "%{$search}%");
                    })
                    ->orWhereHas('unit', function($q2) use ($search) {
                        $q2->where('name', 'LIKE', "%{$search}%");
                    })
                    ->orWhereHas('genderShoe', function($q2) use ($search) {
                        $q2->where('name', 'LIKE', "%{$search}%");
                    });
            });
        }

        // Фильтр по поставщику
        if (!empty($supplier_id)) {
            $query->where('supplier_id', $supplier_id);
        }

        // Сортировка
        if ($sort === 'amount_asc') {
            $query->orderBy('amount', 'asc');
        } elseif ($sort === 'amount_desc') {
            $query->orderBy('amount', 'desc');
        }

        $products = $query->get();

        // Получаем всех поставщиков для фильтра
        $suppliers = Supplier::all();

        return view('product.index', compact('products', 'search', 'sort', 'supplier_id', 'suppliers'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Загружаем продукт со всеми связанными данными
        $product = Product::with(['typeProduct', 'genderShoe', 'manufacturer', 'supplier', 'unit'])->find($id);
        return view('product.show', compact('product'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $product = Product::with(['typeProduct', 'genderShoe', 'manufacturer', 'supplier', 'unit'])
            ->findOrFail($id);
        // Получаем все данные для выпадающих списков
        $typeProducts = TypeProduct::all();
        $genderShoes = GenderShoe::all();
        $manufacturers = Manufacturer::all();
        $suppliers = Supplier::all();
        $units = Unit::all();
        return view('product.edit', compact('product', 'typeProducts', 'genderShoes', 'manufacturers', 'suppliers', 'units'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $product->update($request->all());
        return redirect()->route('products.show', $product->id);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        $product->delete();
        return redirect()->route('products.index');
    }
}
