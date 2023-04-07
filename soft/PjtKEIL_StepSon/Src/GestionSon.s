	PRESERVE8
	THUMB   
		
	export callback_son;
	extern Son;	
; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		
sortieSon dcd 0
index dcd 0
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		

callback_son
	push{lr,r4};
	ldr r0, =index;
	ldr r4, [r0];
	ldr r1, =sortieSon;
	ldr r2, =Son;
	ldrsh r3, [r2, r4,lsl #1];
	add r4, #1;
	str r4, [r0];
	add r3, #32768;
	mov r0, #720;
	mul r3, r3, r0;
	lsr r3, #16;
	str r3, [r1];
	pop{pc,r4};
	END	