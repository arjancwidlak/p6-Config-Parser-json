#! /usr/bin/env raku

use Test;
use lib "lib";

use Config;
use Config::Parser::json;
use File::Temp;

plan 4;

my $config = Config.new();

$config.=read({
    first => [
        a => "a",
        c => "c"
    ]
});

my ($filename, $fh) = tempfile;

ok $config.write($filename.IO, Config::Parser::json), "Write succeeded";

is slurp("t/files/write.json"), slurp($filename), "Written config is correct";

ok $config.write($filename.IO, Config::Parser::json), "Write over non-empty file";

is slurp("t/files/write.json"), slurp($filename), "Written config is still correct";

done-testing;
