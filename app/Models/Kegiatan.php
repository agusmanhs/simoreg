<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Kegiatan extends Model
{
    use HasFactory;
    // protected $table = 'roles';
    protected $fillable = [
        'id',
        'program_id',
        'kode',
        'nama',
    ];

    public function program(): BelongsTo
    {
        return $this->belongsTo(Program::class);
    }
}
