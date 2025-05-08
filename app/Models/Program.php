<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Program extends Model
{
    use HasFactory;
    // protected $table = 'roles';
    protected $fillable = [
        'id',
        'kode',
        'nama',
    ];

    public function kegiatan(): HasMany
    {
        return $this->hasMany(Kegiatan::class);
    }
}
