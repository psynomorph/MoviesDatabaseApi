<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Person;

/**
 * Person resource controller
 */
class PersonController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $person = new Person;
        $person->fill($request->input());
        $person->save();
        return response()->json($person, 201);
    }
}
