				global		_ft_strdup
				extern		_malloc
				extern		___error
				extern		_ft_strlen
				extern		_ft_strcpy

				section		.text

_ft_strdup:		push		rbx ; permettra d'alignerla stack

length:			call		_ft_strlen ; strlen dans rax
				inc			rax ; on rajoute 1 a rax


memory_alloc:	mov			rbx, rdi ; on met str1 dans rbx qui n'est pas affecte par malloc
				mov			rdi, rax ; countstrlen + 1 va etre l'argument de malloc
				call		_malloc ; stack deja alignee grace au push
				or			rax, rax ; on compare rax a zero, recherche error malloc
				jz			error ; erreur de malloc si flag zero

duplicate:		mov			rsi, rbx ;on remet le str1 dansd rsi
				mov			rdi, rax ;on met dest dans rdi
				call		_ft_strcpy ;

end:			mov			rdi, rsi ; notre str1 revient a sa place (const char*)
				pop			rbx ; on recupere rbx
				ret

error:			call		___error ; on recupere pointeur sur errno
				mov			byte[rax], 12 ; code erreur renvoye par errno si malloc echoue
				xor			rax, rax ; rax a 0 pour renvoyer null
				jmp			end
