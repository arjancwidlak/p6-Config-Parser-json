use Config::Parser;
use JSON::Fast;

class Config::Parser::json is Config::Parser {
    method read(Str $path --> Hash) {
        from-json(slurp($path));
    }

    method write( Str $path, Hash $config --> Bool ) {
        $path.IO.spurt( to-json $config );
        True;
    }
}