<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Product extends Model
{
    protected $fillable = [
        'articul',
        'type_product_id',
        'unit_id',
        'price',
        'supplier_id',
        'manufacturer_id',
        'gender_shoe_id',
        'discount',
        'amount',
        'description',
        'photo'
    ];

    public function typeProduct()
    {
        return $this->belongsTo(TypeProduct::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function manufacturer()
    {
        return $this->belongsTo(Manufacturer::class);
    }

    public function genderShoe()
    {
        return $this->belongsTo(GenderShoe::class);
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
