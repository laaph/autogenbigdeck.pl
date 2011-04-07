#!/usr/bin/perl -w

package CardDB;

use strict;

our %castingcost;
our %typeofcard;
our %powertoughness;

BEGIN {
    
    my $filename = "All Sets-2011-02-04.txt";
    
    open(FILE, $filename) or die $!;
    
    while(1) {
	my $a = <FILE>;
	my $b = <FILE>;
	my $c = <FILE>;
	
	last if eof;
	$a =~ s/\s+$//;
	$b =~ s/\s+$//;
	$c =~ s/\s+$//;
	
	$castingcost{$a} = $b;
	$typeofcard{$a}  = $c;
	
	if(($castingcost{$a} =~ m/Land/i)    or
	   ($castingcost{$a} =~ m/Instant/i) or
	   ($castingcost{$a} =~ m/Sorcery/i)) {
	    
	    $castingcost{$a} = "nil";
	    $typeofcard{$a}  = $b;
	}
	
	if($typeofcard{$a} =~ m/Creature/i) {
	    my $d = <FILE>;
	    $d =~ s/\s+$//;
	    $powertoughness{$a} = $d;
	} else {
	    $powertoughness{$a} = "nil";
	}
	
	while(1) {
	    # I am not adding the parsing of the text fields yet, although
	    # that can be done fairly easily as well.
	    my $z = <FILE>;
	    if($z !~ /\S/) { last; }
	    last if eof;
	}
    }
}
