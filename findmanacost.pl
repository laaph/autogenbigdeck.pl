#!/usr/bin/perl -w

sub loadMWScards {
    $filename = shift;
    open(FILE, $filename) or die $!;
    @cards = <FILE>;
    close FILE;


    for ($i = 0; $i < scalar(@cards); $i++) {
	if($cards[$i] =~ m(\/\/)) {
	    unshift(@a, $i);
	}
    }
    
    if($cards[$i] !~ m/\w/) {
	unshift(@a, $i);
    }

    foreach $r (@a) {
	delete $cards[$r];
    }
    return @cards;
}

@cards = loadMWScards("gold.mwDeck");

foreach(@cards) {
    next unless /\d\s+\[\w+\]\s+(.+)/;
    $r = $1;
    $r =~ s/\(.*\)//;  # To remove parenthesis and the stuff inside them
    $r =~ s#/# // #;  # Future maintainers please forgive me - to turn Boom/Bust into Boom // Bust
    $r =~ s/\s+$//;  # Fucking line endings

#    print("[$r]\n");
    unshift(@names, $r);
}


$filename = "All Sets-2011-02-04.txt";

open(FILE, $filename) or die $!;

while(1) {
    $a = <FILE>;
    $b = <FILE>;
    $c = <FILE>;

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
	
    while(1) {
	$z = <FILE>;
	if($z !~ /\S/) { last; }
	last if eof;
    }
}

foreach $a (@names) {
    print("$castingcost{$a} [$a] - $typeofcard{$a}\n");
}
   


close FILE;


# It would be easier if the cards were sorted...
