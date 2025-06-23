<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Kodeakun extends Model
{
    use HasFactory;

    protected $fillable = [
        'subkomponen_id',
        'kode',
        'nama',
    ];

    public function subkomponen(): BelongsTo
    {
        return $this->belongsTo(Subkomponen::class);
    }
}
