	PRESERVE8
	THUMB   
		
	include	Driver/DriverJeuLaser.inc
	export callback_son;
	export start_son;
	export sortieSon;
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
	push{lr,r4,r5};
	ldr r0, =index;
	ldr r4, [r0];
	mov r5, #5512;
	cmp r4,r5;
	bgt fin;
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
	mov r0,r3;
	bl PWM_Set_Value_TIM3_Ch3;
fin
	pop{pc,r4,r5};
		
start_son
	push{lr};
	ldr r0, =index;
	mov r1, #0;
	str r1, [r0];
	pop{pc};
	END