<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * Person model
 */
class Person extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'persons';

    /**
     * Disable timestamp fields
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Get all movies with this actor
     */
    public function movies()
    {
        return $this->belongsToMany('App\Movie')
            ->as('movie_to_actor');
    }

    /**
     * Get all moview directed by this person
    */
    public function directedMovies()
    {
        $this->hasMany('App\Movie', 'director_id');
    }

    /**
     * Cast types
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
    ];

    /**
     * Hide pivot property
     *
     * @var array
     */
    protected $hidden = [
        'pivot'
    ];

    /**
     * Fillable fields
     *
     * @var array
     */
    protected $fillable = [
        'name', 'gender'
    ];
}
