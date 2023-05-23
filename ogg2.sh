#! /bin/bash
#
#
#		Script para codificar uma pasta com arquivos m4a (itunes) em mp3 
#
#
#		Flavio
#
#

declare -rx SCRIPT=${0##*/}
declare -r T0="lista.txt"
declare -r TMP="tmp.tmp"
declare -i TOTAL
declare MUS
declare TRA
declare -i TOTLET
declare -i N
declare AB

#				Teste de sanidade
# 	verifica parametros
if [ $# -eq 0 ] ; then
		printf "%s \n\n" "***********************************************************************"
		printf "%s \n\n" "  USANDO bitrate de 128k !!! "
		printf "%s \n\n" "***********************************************************************"
		((AB=128000))
	else
		((AB="$1"))     # 	carrega o parametro
fi

#	abre o arquivo temporario para leitura escrita
	exec 4> $T0

# 	lista diretorio e filtra as .m4a escreve em temporario e fecha
	ls -1 *.ogg >&4-

#   conta total
	((TOTAL=` cat $T0 | wc -l `))

#	abre para leitura
	exec 5< $T0

#	looping de execução de musica
	((N=0))

	while  ((N++ < $TOTAL)) ; do 
# 	le linha inteira
			read -i text MUS <&5
		
		
# 	calcula novo nome
		# conta letras
			((TOTLET=${#MUS}))				

		# novo nome
			exec 6> $TMP
			printf "%s%s\n" "${MUS:0:TOTLET-3}" "mp3" >&6-
		# rele novo nome
			exec 6< $TMP
			read -i text TRA <&6-
		 
		# executa comando conversâo e copia metadados
#			`ffmpeg -i "$MUS" -y -ab $AB -map_meta_data outfile:infile rrr.mp3`
			`ffmpeg -i "$MUS" -y -ab $AB -map_metadata 0:s:0 rrr.mp3`
			
		# renomeia
			`mv rrr.mp3 "$TRA"`	

	done
#	cria diretorio para remoção
	`mkdir ogg`
#	move todos m4a para dentro 
	`mv *.ogg ogg/. `
#	move o script tambem
	`mv $SCRIPT ogg/. `
#	remove temporarios	
	`rm $T0`
	`rm $TMP`
	
	printf "%s \n\n" "***********************************************************************"
	printf "%s \n\n" " Arquivos recodificados !!!"
	printf "%s \n\n" "***********************************************************************"
exit 0






