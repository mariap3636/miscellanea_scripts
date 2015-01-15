#!/usr/bin/perl -w
use strict;
#use Set;

#use lib '/home/maria/perl/share/perl/5.14.2/';

use Set::Scalar;

my @comb_labels;
my @comb_labels_sorted;
our @setA;
our @setB;
our $cmp;
my $comb_labels;
my $F_out_analysis;
my $F_out_analysis1;
my $F_out_analysis2;
#my $FeatLine;
my %HASH_line;
my $orfKEY;

open(FILECONTENT1, "< $ARGV[0]");

while (!eof(FILECONTENT1))
{

my $line=<FILECONTENT1>;
chomp $line;

my $comb_labels;

$comb_labels = $line;

print $comb_labels,"\n";
push( @setA, $comb_labels );

$comb_labels="";

}


close FILECONTENT1;

open(FILECONTENT2, "< $ARGV[1]");

while (!eof(FILECONTENT2))
{

my $line=<FILECONTENT2>;
chomp $line;

my $comb_labels;

$comb_labels = $line;

print $comb_labels,"\n";
push( @setB, $comb_labels );

$comb_labels="";

}

close FILECONTENT2;

my $sizea = @setA;
    print "size of array A: $sizea.\n";

my $sizeb = @setB;
    print "size of array B: $sizeb.\n";


my $s1 = Set::Scalar->new(@setA);
my $s2 = Set::Scalar->new(@setB);
my $i;


my $ssize = $s1->size;  # The number of members.
 print "set1: $ssize\n";
my $ssize2 = $s2->size;  # The number of members. 
 print "set2: $ssize2\n";

  
$i = $s1->intersection($s2);
my $ssize3 = $i->size;
 print "setInt: $ssize3\n";

my $d1 = $s1->difference($s2);#$s1->difference($s2)
my $d2 = $s2->difference($s1);

my $ssize4 = $d1->size;
 print "diff1: $ssize4\n";
my $ssize5 = $d2->size;
 print "diff2: $ssize5\n";

#comparing
$cmp = $s1->compare($s2);

print "data set A is " .  $cmp . " versus data set B\n";

#outputting....
#$data = `date +%d-%m`;
$F_out_analysis = 'intersection-' . $ARGV[0] . '-' . $ARGV[1];
open(OUT, ">$F_out_analysis") || die "non posso aprire $F_out_analysis\n";

for my $el ($i->elements) {
    
    print OUT $el,"\n";
    
}



$F_out_analysis1 = 'onlyInA' . '_' . $ARGV[0] . '_against_' . $ARGV[1];
open(OUT1, ">$F_out_analysis1") || die "non posso aprire $F_out_analysis1\n";

for my $el1 ($d1->elements) {
    print "only in set A: $el1\n";
    print OUT1 $el1,"\n";
    
}

$F_out_analysis2 = 'onlyInB' . '_' . $ARGV[1] . 'against' . $ARGV[0];
open(OUT2, ">$F_out_analysis2") || die "non posso aprire $F_out_analysis2\n";

for my $el2 ($d2->elements) {
    
print "only in set B: $el2\n";    
print OUT2 $el2,"\n";
    
}
close OUT;
close OUT1;
close OUT2;













