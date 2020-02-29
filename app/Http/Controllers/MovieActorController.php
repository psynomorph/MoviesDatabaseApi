<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Movie;
use App\Person;

/**
 * Controller for nested resource movie.actors
 */
class MovieActorController extends Controller
{
    /**
     * Add person to list of moovie actors
     *
     * @param int $movieId
     * @param Pesron $actor
     * @return \Illuminate\Http\Response
     */
    public function update(int $movieId, Person $actor)
    {
        $movie = Movie::find($movieId);
        $movie->actors()->save($actor);
        return response('', 200);
    }
}
