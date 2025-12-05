<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->get('search', '');

        $query = Product::with(['typeProduct', 'genderShoe', 'manufacturer', 'supplier', 'unit']);

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

        $products = $query->get();

        return view('product.index', compact('products', 'search'));
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
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        //
    }
}
