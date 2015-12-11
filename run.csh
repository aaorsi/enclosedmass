#!/bin/tcsh
#$ -S
#$ -cwd

# Script to run enclosedmass
#
#

set GadgetDir = './'
set NSubVol   = 512
set Central = 'Masivos'
set LBox = '500.0'
set CellSize = '100.0'
set LogBins = '1.0'
set RMin = '-1.0'
set RMax = '2.0' 		

# RMin and RMax are only relevant if LogBins = 1

#foreach snap ('25' '29' '17')
	set snap = $1
#foreach snap ('17' '20' '25' '29')

	set snapshot  = '0'$snap
	set GadgetFile = $GadgetDir'Galout'

	if ($Central == 'MenosMasivos') then
		set CentralFile = '10porcientoMasMasivos'
	else if ($Central == 'Masivos') then
		set CentralFile = '10porcientoMenosMasivos'
	endif

#	set OutFile = 'qso_dm_'$snap'.'$part
	set OutFile = $Central'out'

#	set OutFile = 'rg_dm_Uber_mar14_'$snap

	echo $GadgetFile $CentralFile $OutFile $LBox $CellSize  $LogBins $RMin $RMax
	./enclosedmass $GadgetFile $CentralFile $OutFile $LBox $CellSize $LogBins $RMin $RMax
