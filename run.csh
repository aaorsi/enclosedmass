#!/bin/tcsh
#$ -S
#$ -cwd

# Script to run enclosedmass
#
#

set GadgetDir = '/gpfs/data/Millgas/data/dm/500/'
set NSubVol   = 512

set iv0 = $2
set iv1 = $3
set part = $4
set Central = $5

echo 'Computing DM environments for '$Central 

set LBox = 500.0
set CellSize = 100.0
set LogBins = 1
set RMin = -1
#set RMax = '1.39794'	#  log_10(25.0)
#set RMax = '1.69897' 	#  log_10(50.0)
set RMax = '2.0' 		#  log_10(100.0)

# RMin and RMax are only relevant if LogBins = 1

#foreach snap ('25' '29' '17')
	set snap = $1
#foreach snap ('17' '20' '25' '29')

	set snapshot  = '0'$snap
	set GadgetFile = $GadgetDir'/snapdir_'$snapshot'/500_dm_'$snapshot

	if ($Central == 'rg') then
		set CentralFile = '/data/rw16/aaorsi/AGNOverdensities/data/radio_cat_iz'$snap
	else if ($Central == 'qso') then
		set CentralFile = '/data/rw16/aaorsi/AGNOverdensities/data/QSO_cat_iz'$snap
	endif

#	set OutFile = 'qso_dm_'$snap'.'$part
	set OutFile = $Central'_dm_'$snap'.'$part

#	set OutFile = 'rg_dm_Uber_mar14_'$snap

	echo $GadgetFile $CentralFile $OutFile $LBox $CellSize $NSubVol $LogBins $RMin $RMax
#	./enclosedmass $GadgetFile $CentralFile $OutFile $LBox $CellSize $NSubVol \
#	$LogBins $RMin $RMax

	./enclosedmass $GadgetFile $CentralFile $OutFile $LBox $CellSize $iv0 $iv1 \
	$LogBins $RMin $RMax
