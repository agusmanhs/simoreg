<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Ro extends Model
{
    use HasFactory;

    protected $fillable = [
        'kro_id',
        'kode',
        'nama',
    ];

    public function kro(): BelongsTo
    {
        return $this->belongsTo(Kro::class);
    }

    public function komponens()
    {
        return $this->hasMany(Komponen::class, 'ro_id');
    }
}
