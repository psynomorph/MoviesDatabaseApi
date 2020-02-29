<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use stdClass;

/**
 * Movie model
 */
class Movie extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'movies';

    /**
     * Disable timestamp fields
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Get director of this movie
     */
    public function director()
    {
        return $this
            ->belongsTo('App\Person', 'director_id');
    }

    /**
     * Get actors of this movie
     */
    public function actors()
    {
        return $this->belongsToMany('App\Person', 'movie_to_actor');
    }

    /**
     * Cast field values to correct types
     */
    protected $casts = [
        'id' => 'integer',
        'rating' => 'float',
    ];

    /**
     * Hide director id and pivot info
     */
    protected $hidden = [
        'director_id',
        'pivot'
    ];

    /**
     * Override Model::toArray method
     * Replace null director property on empty object
     *
     * @return array
     */
    public function toArray()
    {
        $data = parent::toArray();
        if (!$data['director'])
        {
            $data['director'] = new stdClass;
        }
        return $data;
    }
}
