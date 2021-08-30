<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Media extends Model
{
    //
    protected $fillable = ['id', 'file'];

    public function users(){

		return $this->belongsToMany(User::class);
	}
}
