<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Detailuraian extends Model
{
    use HasFactory;

    protected $fillable = [
        'kodeakun_id',
        'kode',
        'nama',
        'pagu',
        'bagsubag_id',
    ];

    public function kodeakun(): BelongsTo
    {
        return $this->belongsTo(Kodeakun::class);
    }

    public function bagsubag(): BelongsTo
    {
        return $this->belongsTo(Bagsubag::class);
    }

}
