<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GenderShoe extends Model
{
    use HasFactory;

    protected $table = 'gender_shoes';
    protected $fillable = ['name'];

    public function products()
    {
        return $this->hasMany(Product::class, 'type_gender_shoes');
    }
}
