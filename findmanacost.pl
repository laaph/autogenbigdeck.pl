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

@cards = loadMWScards("green.mwDeck");

foreach(@cards) {
    next unless /\d\s+\[\w+\]\s+(.+)/;
    $r = $1;
    $r =~ s/\(.*\)//;  # To remove parenthesis
    $r =~ s/\s+$//;  # Fucking line endings

#    print("[$r]\n");
    unshift(@names, $r);
}


$filename = "All Sets-2011-02-04.txt";

open(FILE, $filename) or die $!;

while(1) {
    $a = <FILE>;
    $b = <FILE>;
    
#    if(($a == undef) or ($b == undef)) { last; }
    last if eof;
    $a =~ s/\s+$//;
    $b =~ s/\s+$//;

#    print("Hi -- $b $a\n");

#    if($b =~ /G/) {
    $cc{$a} = $b;
#	print("$b $a\n");
#    }
	
    while(1) {
	$z = <FILE>;
#	print($z);
	if($z !~ /\S/) { last; }
	last if eof;
#	if($z == undef)     { last; }
#	print("ignored = $z");
    }
}

foreach $a (@names) {
    print("$cc{$a} [$a]\n");
}
   


close FILE;


# It would be easier if the cards were sorted...
