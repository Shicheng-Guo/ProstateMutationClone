use strict;
use List::Uniq ':all';
my @file=glob("*vardict.strelka.overlap.vcf.gz.anno.vcf.hg19.bed");

my %data;
my %gene;
my %sam;

foreach my $file(@file){
open F,$file;
my($sam)=split/.vardict/,$file;
while(<F>){
my @line=split/\s+/;
$gene{$line[7]}=$line[7];
$sam{$sam}=$sam;
push @{$data{$line[7]}{$sam}},$line[4];
}
}

my $sam=join("\t",sort keys %sam);
print "\t$sam\n";
foreach my $gene(sort keys %gene){
print "$gene";
foreach my $sam(sort keys %sam){
my $type=join(";",uniq(@{$data{$gene}{$sam}}));
print "\t$type";
}
print "\n";
}

