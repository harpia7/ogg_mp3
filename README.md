#ogg_mp3
#		Writed script to transcode all ogg audio to mp3 in the folder
#   making use of ffmpeg via command line
#
#       original file created on 03/2015
#

bash script converts all ogg in folder to mp3!!!


use:

1 - copy to a folder all the .wav files you want to transcode

2 - copy into this folder ogg_to_mp3.sh and make sure it has rwx execute permission

3 - optional parameter after the command, the bit rate per second, must be written without abbreviations

		192k ==>> 192000
		256k ==>> 256000
		128k ==>> 128000 (default, no parameters)

ex: $ ./ogg_to_mp3.sh 128000

		a temporary file will be generated with a list of all .wav songs
		
		they will all be transcoded to mp3 with requested bitrate
		
		a wav subfolder will be created where all the original files will be moved
		
		will be temporarily shut down!
		
		ends with "Arquivos Recodificados !!!"
	
