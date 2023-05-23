# ogg_mp3
#
#			Script montado para transcodificar audio padrão ogg para mp3 por lote 
#		fazendo uso do ffmpeg via linha de comando
#
#  arquivo original criado em 03/2015

bash script convert ogg to mp3 !!!

uso :

1 - copie para uma pasta todos os .ogg que deseja transcodificar

2 - copie para dentro desta pasta ogg_to_mp3.sh e certifique que tem permisão de execução rwx

3 - parametro opcional após o comando, a taxa de bits por segundo, deve ser escrita sem abreviações
		
		192k ==>> 192000
		256k ==>> 256000
		128k ==>> 128000 ( default, no paramters)
	
	
ex: $ ./ogg_to_mp3.sh 128000 

			será gerado um arquivo temporário com lista de todas musicas .ogg
			
			serão todos transcodificados para mp3 com bitrate pedido
			
			será criada uma subpasta ogg onde serão movidos todos os arquivos originais
			
			temporarios serão apagados ! 

			termina com " Arquivos recodificados !!!"


