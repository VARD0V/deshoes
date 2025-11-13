<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'articul',
        'type_product',
        'unit',
        'price',
        'supplier',
        'manufacturer',
        'type_gender_shoes',
        'discount',
        'amount',
        'description',
        'photo'
    ];

    // Связи
    public function typeProduct()
    {
        return $this->belongsTo(TypeProduct::class, 'type_product');
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class, 'unit');
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class, 'supplier');
    }

    public function manufacturer()
    {
        return $this->belongsTo(Manufacturer::class, 'manufacturer');
    }

    public function genderShoe()
    {
        return $this->belongsTo(GenderShoe::class, 'type_gender_shoes');
    }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    // Аксессоры
    public function getFinalPriceAttribute()
    {
        return $this->price - ($this->price * $this->discount / 100);
    }

    public function getInStockAttribute()
    {
        return $this->amount > 0;
    }
}
