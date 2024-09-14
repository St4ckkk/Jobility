<?php

namespace Core\Middleware;

class Middleware
{
    //TODO: STUDY THIS LINE OF CODE
    public const MAP = [
        'authenticated' => Authenticated::class,
        // 'guest' => Guest::class
    ];

    public static function resolve($key)
    {

        if (!$key) {
            return;
        }
        $middleware = static::MAP[$key] ?? false;

        if(!$middleware) {
            throw new \Exception("No matching middleware found '{$key}'.");
        }

        (new $middleware)->handle();
    }
}