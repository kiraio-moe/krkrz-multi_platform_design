use File::Copy 'move';

while( glob("*.tjs") ) {
	my $inname = $_;
	my $outname = $inname;
	$outname =~ s/\.tjs/\.json/;
	print "tjs2json $inname $outname\n";
	system( "tjs2json $inname $outname" );
}

print "apijsontohtml *.json\n";
system( "apijsontohtml *.json 吉里吉里Zマルチプラットフォーム版APIリファレンス" );

while( glob("*.html") ) {
	my $inname = $_;
	my $outname = "..\\docs\\apiref";
	move $inname, $outname;
}

while( glob("*.json") ) {
	print "delete ".$_."\n";
	unlink $_;
}
