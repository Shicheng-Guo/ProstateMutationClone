use strict;
my @file=glob("*anno.vcf.hg19.anno.bed");
my %data;
my %gene;
my %sam;
foreach my $file(@file){
open F,$file;
my($sam)=split/.strelka/,$file;
while(<F>){
chomp;
my @line=split/\s+/;
$gene{$line[4]}=$line[4];
$sam{$sam}=$sam;
$data{$line[4]}{$sam}++;
}
}

my $sam=join("\t",sort keys %sam);
print "\t$sam\n";
foreach my $gene(sort keys %data){
print "$gene";
foreach my $sam(sort keys %sam){
if(defined $data{$gene}{$sam}){
#print "\t$data{$gene}{$sam}";
print "\t1";
}else{
print "\t0";
}
}
print "\n";
}




