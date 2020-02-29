<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Movie;
use stdClass;

/**
 * Movie resource controller
 */
class MovieController extends Controller
{
    /**
     * Display a listing of movies.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()
            ->json(Movie::with(['actors', 'director'])->get());
    }

    /**
     * Display the specified movie.
     *
     * @param  \App\Movie  $movie
     * @return \Illuminate\Http\Response
     */
    public function show(Movie $movie)
    {
        $movie->load('director');
        $movie->load('actors');
        return response()
            ->json($movie->makeHidden(['director_id', 'actors.pivot']));
    }
}
