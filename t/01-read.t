#! /usr/bin/env raku

use Test;
use lib "lib";

use Config;
use Config::Parser::json;
use File::Temp;

plan 4;

my $config = Config.new();

ok $config.read("t/files/config.json"), "File reading throws no error";

subtest "Contents match" => {
    plan 2;
    is $config.get("first"), "a", "Got first";
    is $config.get("second"), {a => "a",c => "c"}, "Got second";
};

ok $config.read("t/files/merge.json"), "File merging throws no error";

subtest "Contents match after merging" => {
    plan 3;
    is $config.get("first"), "a", "Got first";
    is $config.get("between"), "b", "Got between";
    is $config.get("second"), {a => "a",c => "c"}, "Got second";
}

done-testing;
