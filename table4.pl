use strict;
my @file=glob("*vardit.strelka.overlap.TYPE.hg19.bed");
my %data;
my %gene;
my %sam;
foreach my $file(@file){
open F,$file;
my($sam)=split/.strelka/,$file;
while(<F>){
my @line=split/\s+/;
my $pos=$line[0].":".$line[1];
$gene{$pos}=$pos;
$sam{$sam}=$sam;
$data{$pos}{$sam}=$line[4];
}
}

my $sam=join("\t",sort keys %sam);
print "\t$sam\n";
foreach my $gene(sort keys %data){
print "$gene";
foreach my $sam(sort keys %sam){
if(defined $data{$gene}{$sam}){
print "\t$data{$gene}{$sam}";
}else{
print "\t_";
}
}
print "\n";
}




