use Config::Parser;
use JSON::Fast;

class Config::Parser::json is Config::Parser {
    method read(Str $path --> Hash) {
        from-json(slurp($path));
    }

    method write( IO::Path:D $path, Hash $config --> Bool ) {
        $path.spurt( to-json $config );
        True;
    }
}