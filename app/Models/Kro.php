<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Kro extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'kegiatan_id',
        'kode',
        'nama',
    ];

    public function kegiatan(): BelongsTo
    {
        return $this->belongsTo(Kegiatan::class);
    }

    public function ros()
    {
        return $this->hasMany(Ro::class, 'kro_id');
    }
    
}
