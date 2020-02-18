#
#/*
# * ----------------------------------------------------------------------------
# * "THE BEER-WARE LICENSE" (Revision 42):
# * <ted.elmenheim@gmail.com> wrote this file. As long as you retain this notice you
# * can do whatever you want with this stuff. If we meet some day, and you think
# * this stuff is worth it, you can buy me a beer in return Ted Elmenheim.
# * ----------------------------------------------------------------------------
# */
# Version 1.4S - Modified by SUF <suf@freemail.hu>
#   Separated PU and PD commands, removed retension
#   Using M280 P0 instead of G1 Z as default. It is for RC Servo instead for Stepper
#
# Version 1.3
#  Changes:
#	Added support for Z Retention between movement
#	Corrected progress bar
#
#
#Usage:
# Load script
#	1. Save the script to "C:\temp\Convert-HpglToGcode.ps1"
#	2. Open powershell and navigate to "C:\temp" (cd C:\temp)
#	3. Paste the following in the powershell window ". .\Convert-HpglToGcode.ps1"
#	4. Run the command below 
#		eg. 'Convert-HpglToGcode -Source "C:\Temp\InputFile.hpgl" -Destination "C:\Temp\OutputFile.gcode"'
# Minimum req: 
#	Convert-HpglToGcode -Source "C:\Temp\InputFile.hpgl" -Destination "C:\Temp\OutputFile.gcode"
#
# Optional switches:
#	#HPGL units per mm, default is 40.2
#	-HpglUnitsPerMM "40.2"
#	#Set printer/cnc speed
#	-Speed "500.0"
#	#home all axis
#	-HomeAxis "X Y Z"
#	#Retention / Lift Z between movement
#	-Retention "1.5"
#	#Generate Circles - HPGL "AA"
#	-GenerateCircles N/No/HellNo!
#

param(
    [Parameter(Mandatory=$true)][string]$Source,
    [Parameter(Mandatory=$true)][string]$Destination,
    $HpglUnitsPerMM,
    $Speed,
    $HomeAxis,
    $PenUp,
    $PenDown,
    $GenerateCircles
)



#Function Hpgl2Gcode($Source,$Destination,$HpglUnitsPerMM,$Speed,$HomeAxis,$PenUp,$PenDown,$GenerateCircles){

    $ProcessCount = (Get-Content $Source).count
    $i = 1

    $credits = ";
    ; ----------------------------------------------------------------------------
    ; 'THE BEER-WARE LICENSE' (Revision 42):
    ; <ted.elmenheim@gmail.com> wrote this file. As long as you retain this notice you
    ; can do whatever you want with this stuff. If we meet some day, and you think
    ; this stuff is worth it, you can buy me a beer in return Ted Elmenheim
    ; ----------------------------------------------------------------------------
    ;
    ; Created with Convert-HpglToGcode"
    $credits | Out-File $Destination -Encoding UTF8

	IF(!$HpglUnitsPerMM){$HpglUnitsPerMM = "40.2"}
	IF($Speed){
		$Speed = [String]$Speed
		$Speed = "F$($Speed).0"
	}	
	IF(!$Speed){$Speed = "F500.0"}
#	IF(!$Retention){$Retention = "1.5"}
    IF(!$PenUp){$PenUp = "M280 P0 S50"}
    IF(!$PenDown){$PenDown = "M280 P0 S0"}
	
	"G21" | Out-File $Destination -Encoding UTF8 -Append

	IF($HomeAxis){
		"G28 $HomeAxis" | Out-File $Destination -Encoding UTF8 -Append
	}ELSE{
		"G28 X Y" | Out-File $Destination -Encoding UTF8 -Append	
	}
#	"G1 Z$Retention $Speed" | Out-File $Destination -Encoding UTF8 -Append	
	$PenUp | Out-File $Destination -Encoding UTF8 -Append	

    Get-Content $Source | foreach{

	    $ProcessPercent = ($ProcessCount*100)
	    Write-Progress -Activity "Processing file..." -status "Processing row $i / $ProcessCount" -PercentComplete $($i/$ProcessCount*100)
	    $i++
	
	    IF($_ -eq "PD;"){
	
    #		"G1 Z0.0 $Speed" | Out-File $Destination -Encoding UTF8 -Append
		    $PenDown | Out-File $Destination -Encoding UTF8 -Append
	    }
	    IF($_ -match "PU; SP 0; PA 0,0;"){
	
    #		"G1 Z$Retention F500.0" | Out-File $Destination -Encoding UTF8 -Append
		    $PenUp | Out-File $Destination -Encoding UTF8 -Append
		    "G28 X Y F500.0" | Out-File $Destination -Encoding UTF8 -Append
	    }ELSEIF($_ -eq "PU;"){
	
    #		"G1 Z$Retention $Speed" | Out-File $Destination -Encoding UTF8 -Append
		    $PenUp | Out-File $Destination -Encoding UTF8 -Append
	    }ELSEIF($_ -match "AA"){
	
		    IF(!$GenerateCircles){
		    #Generate ARC/Circle
		    $SourceCode = ($_).replace("AA ","")
		    $SourceCode = ($SourceCode).replace(";","")
		    $SourceCode = $SourceCode -Split ","
		    #$X = "{0:N2}" -f $($SourceCode[0] / $HpglUnitsPerMM)
		    #	$X = $X.replace(",",".");
		    $Y = "{0:N2}" -f $($SourceCode[1] / $HpglUnitsPerMM)
			    $Y = $Y.replace(",",".");
		    $Radius = [decimal]$Y/2
		    #Write-Host "G2 X$X Y$Y $Speed"
		    "G2 X$X Y$Y I$Radius J0 $Speed" | Out-File $Destination -Encoding UTF8 -Append
		    }
	    }ELSEIF($_ -match "PA"){
		    $SourceCode = ($_).replace("PA ","")
		    $SourceCode = ($SourceCode).replace(";","")
		    $SourceCode = $SourceCode -Split ","
		    $X = "{0:N2}" -f $($SourceCode[0] / $HpglUnitsPerMM)
			    $X = $X.replace(",",".");
		    $Y = "{0:N2}" -f $($SourceCode[1] / $HpglUnitsPerMM)
			    $Y = $Y.replace(",",".");


		    #Write-Host "G1 X$X Y$Y $Speed"
		    "G1 X$X Y$Y $Speed" | Out-File $Destination -Encoding UTF8 -Append
	    }
    }	
#}
