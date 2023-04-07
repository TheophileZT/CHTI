	PRESERVE8
	THUMB   
		
	include	Driver/DriverJeuLaser.inc
	export timer_callback;
; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		
FlagCligno dcb 0
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		

timer_callback
	push {LR};
	ldr r3,=FlagCligno;
	mov r0,#1;
	mov r1,#1;
	ldrb r2, [r3];
	cmp r1, r2;
	beq equal;
;if FlagCligno==0
	str r1,[r3];
	bl GPIOB_Clear;
	b final;
;if FlagCligno==1
equal
	mov r1,#0;
	str r1,[r3];		
	bl GPIOB_Set;
	b final;
final	
	pop {PC};
	END	
