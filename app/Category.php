<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['id', 'parent_id', 'name'];


    public function users(){

    return $this->belongsToMany(User::class);

    }

    public function posts()
   {
    return $this->hasMany(Post::class);
   }


   public function children()
   {
     return $this->hasMany('App\Category', 'parent_id');
   }
}
