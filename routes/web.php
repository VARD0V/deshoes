<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

Route::get('/', [AuthController::class, 'showLogin'])->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('login.submit');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::resource('/products', ProductController::class);

Route::middleware('auth')->group(function () {
    Route::get('/products/{product}', [ProductController::class, 'show'])->name('products.show');
});
