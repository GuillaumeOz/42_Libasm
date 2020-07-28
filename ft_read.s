			global 		_ft_read
			extern		___error

			section		.text

_ft_read:	mov 		rax, 0x2000003
			syscall
			jc error 	;if error, flag c up
			ret

error:		push		rbp ;on sauvegarde rbp avant  de s'en servir
			mov			bpl, al ; on met errno dans rbp
			call		___error ; pas besoin d'aligner la stack, on a fait un push
			mov			byte [rax], bpl ; l'appel a error pointe l'adresse de errno, on met sa valeur
			mov			rax, -1 ; on renvoie le code d'erreur -1
			pop			rbp ; on recupere rbp
			ret
