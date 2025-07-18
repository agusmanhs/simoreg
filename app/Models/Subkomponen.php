<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Subkomponen extends Model
{
    use HasFactory;

    protected $fillable = [
        'komponen_id',
        'kode',
        'nama',
    ];

    public function komponen(): BelongsTo
    {
        return $this->belongsTo(Komponen::class);
    }

    public function kodeakuns()
    {
        return $this->hasMany(Kodeakun::class, 'subkomponen_id');
    }
}
