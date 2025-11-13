<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'role_id',
        'fio',
        'email',
        'password',
    ];
    public function role()
    {
        return $this->belongsTo(Role::class);
    }
    public function orders()
    {
        return $this->hasMany(Order::class);
    }
    public function isAdmin()
    {
        return $this->role_id === 1;
    }
    public function isManager()
    {
        return $this->role_id === 2;
    }
    public function isClient()
    {
        return $this->role_id === 3;
    }
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
        ];
    }
}
