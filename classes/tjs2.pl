use File::Copy 'move';

while( glob("*.tjs") ) {
	my $inname = $_;
	my $outname = $inname;
	$outname =~ s/\.tjs/\.json/;
	print "mono tjs2json.exe $inname $outname\n";
	system( "mono tjs2json.exe $inname $outname" );
}

print "mono apijsontohtml.exe *.json\n";
system( "mono apijsontohtml.exe '*'.json 'KiriKiri Z Multi-Platform API Reference'" );

while( glob("*.html") ) {
	my $inname = $_;
	my $outname = "../docs/apiref";
	move $inname, $outname;
}

while( glob("*.json") ) {
	print "delete ".$_."\n";
	unlink $_;
}
