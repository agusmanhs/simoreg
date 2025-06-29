<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bagsubag extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'id',
        'kode',
        'nama',
    ];

}