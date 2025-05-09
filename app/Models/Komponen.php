<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Komponen extends Model
{
    use HasFactory;

    protected $fillable = [
        'ro_id',
        'kode',
        'nama',
    ];

    public function ro(): BelongsTo
    {
        return $this->belongsTo(Ro::class);
    }
}
