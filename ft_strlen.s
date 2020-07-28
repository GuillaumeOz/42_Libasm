			global	_ft_strlen

			section	.text

_ft_strlen: xor		rax, rax ; mise a zero du compteur

count:		cmp 	byte [rdi + rax], 0 ;on compare a 0 le caractere
			jz		end ; fin
			inc		rax ; on incremente le compteur
			jmp		count

end:		ret
