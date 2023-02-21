<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Http;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


// Constants for search
define('MAX_ARGUMENT_LENGTH', getenv('MAX_ARGUMENT_LENGTH', 50));

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::post('marvel_query', function(Request $request) {
    $data = $request->json()->all();

    // Get sanitized search criteria
    $character_name = urlencode(mb_substr($data['character_name'], 0, MAX_ARGUMENT_LENGTH));

    // This should be extracted into a function for calling Marvel APIs.
    $timestamp = microtime();
    $pub_key = getenv('MARVEL_PUB_API_KEY', '');
    $pvt_key = getenv('MARVEL_PVT_API_KEY', '');

    $api_hash = md5($timestamp . $pvt_key . $pub_key);

    $query_url = 'http://gateway.marvel.com/v1/public/characters?nameStartsWith=' . $character_name
        . '&ts=' . $timestamp . '&apikey=' . $pub_key . '&hash=' . $api_hash;
    $query_response = Http::get($query_url)->json();


    return response()->json([
        'results' => $query_response['data']['results'],
    ], 200);
});
