<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RencanaKegiatan extends Model
{
    use HasFactory;

    protected $fillable = [
        'program_id',
        'kegiatan_id',
        'kro_id',
        'ro_id',
        'komponen_id',
        'subkomponen_id',
        'kodeakun_id',
        'detailuraian_id',
        'pagu',
        'bulan',
        'bagsubag_id',
    ];

    public function program(): BelongsTo
    {
        return $this->belongsTo(Program::class);
    }
    
    public function kegiatan(): BelongsTo
    {
        return $this->belongsTo(Kegiatan::class);
    }
    
    public function kro(): BelongsTo
    {
        return $this->belongsTo(Kro::class);
    }

    public function ro(): BelongsTo
    {
        return $this->belongsTo(Ro::class);
    }

    public function komponen(): BelongsTo
    {
        return $this->belongsTo(Komponen::class);
    }
    
    public function subkomponen(): BelongsTo
    {
        return $this->belongsTo(Subkomponen::class);
    }

    public function kodeakun(): BelongsTo
    {
        return $this->belongsTo(Kodeakun::class);
    }

    public function detailuraian(): BelongsTo
    {
        return $this->belongsTo(Detailuraian::class);
    }

    public function bagsubag(): BelongsTo
    {
        return $this->belongsTo(Bagsubag::class);
    }
}
