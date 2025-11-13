<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'amount',
        'date_order',
        'date_delivery',
        'point',
        'user_id',
        'code',
        'status_id'
    ];

    protected $casts = [
        'date_order' => 'date',
        'date_delivery' => 'date',
    ];

    // Связи
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function point()
    {
        return $this->belongsTo(Point::class, 'point');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function status()
    {
        return $this->belongsTo(Status::class);
    }

    // Аксессоры
    public function getTotalPriceAttribute()
    {
        return $this->amount * $this->product->final_price;
    }

    public function getIsCompletedAttribute()
    {
        return $this->status_id === 1; // 1 = Завершен
    }
}
