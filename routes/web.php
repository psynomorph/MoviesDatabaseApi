<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::resource('movies', 'MovieController')->only([
    'show', 'index'
])->middleware('auth:api');

Route::resource('persons', 'PersonController')->only([
    'index', 'store'
])->middleware('auth:api');

Route::resource('movies.actors', 'MovieActorController')->only([
    'update'
])->middleware('auth:api');

Route::get('/', function() {
    return view('index');
});
