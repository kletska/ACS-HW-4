







global Random
global file_read_string
global file_read_int
global InTrain
global InRndTrain
global OptimalTimeTrain
global OutTrain
global InShip
global InRndShip
global OptimalTimeShip
global OutShip
global InPlain
global InRndPlain
global OptimalTimePlain
global OutPlain
global InTransport
global InRndTransport
global OutTransport
global OptimalTimeTransport
global Init
global Clear
global In
global InRnd
global Out
global StraightSelectionSort
global errMessage1
global errMessage2
global errMessage3
global main

extern srand                                            
extern time                                             
extern fclose                                           
extern fopen                                            
extern printf                                           
extern puts                                             
extern feof                                             
extern fwrite                                           
extern strcmp                                           
extern fprintf                                          
extern free                                             
extern atoi                                             
extern __stack_chk_fail                                 
extern strcpy                                           
extern malloc                                           
extern fgetc                                            
extern rand                                             
                            


SECTION .text                             

Random: 
        push    rbp                                     
        mov     rbp, rsp                                
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1374389535                    
        shr     rdx, 32                                 
        sar     edx, 5                                  
        mov     ecx, eax                                
        sar     ecx, 31                                 
        sub     edx, ecx                                
        imul    ecx, edx, 100                           
        sub     eax, ecx                                
        mov     edx, eax                                
        lea     eax, [rdx+1H]                           
        pop     rbp                                     
        ret                                             


file_read_string:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 144                                
        mov     qword [rbp-88H], rdi                    


        mov     rax, qword [fs:abs 28H]                 
        mov     qword [rbp-8H], rax                     
        xor     eax, eax                                
        mov     qword [rbp-70H], 0                      
        mov     qword [rbp-68H], 0                      
        mov     qword [rbp-60H], 0                      
        mov     qword [rbp-58H], 0                      
        mov     qword [rbp-50H], 0                      
        mov     qword [rbp-48H], 0                      
        mov     qword [rbp-40H], 0                      
        mov     qword [rbp-38H], 0                      
        mov     qword [rbp-30H], 0                      
        mov     qword [rbp-28H], 0                      
        mov     qword [rbp-20H], 0                      
        mov     qword [rbp-18H], 0                      
        mov     dword [rbp-10H], 0                      
        mov     dword [rbp-80H], 0                      
        mov     rax, qword [rbp-88H]                    
        mov     rdi, rax                                
        call    fgetc                                   
        mov     dword [rbp-7CH], eax                    
        jmp     ?_003                                   

?_001:  cmp     dword [rbp-7CH], 10                     
        jz      ?_002                                   
        cmp     dword [rbp-7CH], 32                     
        jz      ?_002                                   
        mov     eax, dword [rbp-80H]                    
        lea     edx, [rax+1H]                           
        mov     dword [rbp-80H], edx                    
        mov     edx, dword [rbp-7CH]                    
        cdqe                                            
        mov     byte [rbp+rax-70H], dl                  
?_002:  mov     rax, qword [rbp-88H]                    
        mov     rdi, rax                                
        call    fgetc                                   
        mov     dword [rbp-7CH], eax                    
?_003:  cmp     dword [rbp-7CH], 10                     
        jz      ?_004                                   
        cmp     dword [rbp-7CH], 32                     
        jnz     ?_005                                   
?_004:  cmp     dword [rbp-80H], 0                      
        jnz     ?_006                                   
?_005:  cmp     dword [rbp-7CH], -1                     
        jnz     ?_001                                   
?_006:  mov     eax, dword [rbp-80H]                    
        lea     edx, [rax+1H]                           
        mov     dword [rbp-80H], edx                    
        cdqe                                            
        mov     byte [rbp+rax-70H], 0                   
        mov     eax, dword [rbp-80H]                    
        cdqe                                            
        mov     rdi, rax                                
        call    malloc                                  
        mov     qword [rbp-78H], rax                    
        lea     rdx, [rbp-70H]                          
        mov     rax, qword [rbp-78H]                    
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcpy                                  
        mov     rax, qword [rbp-78H]                    
        mov     rdx, qword [rbp-8H]                     


        sub     rdx, qword [fs:abs 28H]                 
        jz      ?_007                                   
        call    __stack_chk_fail                        
?_007:  leave                                           
        ret                                             


file_read_int:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     rax, qword [rbp-18H]                    
        mov     rdi, rax                                
        call    file_read_string                        
        mov     qword [rbp-8H], rax                     
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    atoi                                    
        mov     dword [rbp-0CH], eax                    
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    free                                    
        mov     eax, dword [rbp-0CH]                    
        leave                                           
        ret                                             


InTrain:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-10H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx], eax                        
        mov     rax, qword [rbp-10H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+4H], eax                     
        mov     rax, qword [rbp-10H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+8H], eax                     
        nop                                             
        leave                                           
        ret                                             


InRndTrain:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx], eax                        
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+4H], eax                     
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+8H], eax                     
        nop                                             
        leave                                           
        ret                                             


OptimalTimeTrain:
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+4H]                     
        pxor    xmm0, xmm0                              
        cvtsi2sd xmm0, eax                              
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        pxor    xmm1, xmm1                              
        cvtsi2sd xmm1, eax                              
        divsd   xmm0, xmm1                              
        movq    rax, xmm0                               
        movq    xmm0, rax                               
        pop     rbp                                     
        ret                                             


OutTrain:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     esi, dword [rax+8H]                     
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+4H]                     
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-10H]                    
        mov     r8d, esi                                
        lea     rsi, [rel ?_050]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    OptimalTimeTrain                        
        movq    rax, xmm0                               
        mov     rdx, qword [rbp-10H]                    
        movq    xmm0, rax                               
        lea     rax, [rel ?_051]                        
        mov     rsi, rax                                
        mov     rdi, rdx                                
        mov     eax, 1                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


InShip: 
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     qword [rbp-20H], rsi                    
        mov     rax, qword [rbp-20H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-18H]                    
        mov     dword [rdx], eax                        
        mov     rax, qword [rbp-20H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-18H]                    
        mov     dword [rdx+4H], eax                     
        mov     rax, qword [rbp-20H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-18H]                    
        mov     dword [rdx+8H], eax                     
        mov     rax, qword [rbp-20H]                    
        mov     rdi, rax                                
        call    file_read_string                        
        mov     qword [rbp-8H], rax                     
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rel ?_052]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_008                                   
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax+0CH], 0                      
        jmp     ?_011                                   

?_008:  mov     rax, qword [rbp-8H]                     
        lea     rdx, [rel ?_053]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_009                                   
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax+0CH], 1                      
        jmp     ?_011                                   

?_009:  mov     rax, qword [rbp-8H]                     
        lea     rdx, [rel ?_054]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_010                                   
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax+0CH], 2                      
        jmp     ?_011                                   

?_010:  mov     rax, qword [rbp-18H]                    
        mov     dword [rax+0CH], 3                      
?_011:  mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    free                                    
        nop                                             
        leave                                           
        ret                                             


InRndShip:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx], eax                        
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+4H], eax                     
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+8H], eax                     
        mov     eax, 0                                  
        call    Random                                  
        mov     edx, eax                                
        movsxd  rax, edx                                
        imul    rax, rax, 1431655766                    
        shr     rax, 32                                 
        mov     ecx, edx                                
        sar     ecx, 31                                 
        sub     eax, ecx                                
        mov     ecx, eax                                
        add     ecx, ecx                                
        add     ecx, eax                                
        mov     eax, edx                                
        sub     eax, ecx                                
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+0CH], eax                    
        nop                                             
        leave                                           
        ret                                             


OptimalTimeShip:
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+4H]                     
        pxor    xmm0, xmm0                              
        cvtsi2sd xmm0, eax                              
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        pxor    xmm1, xmm1                              
        cvtsi2sd xmm1, eax                              
        divsd   xmm0, xmm1                              
        movq    rax, xmm0                               
        movq    xmm0, rax                               
        pop     rbp                                     
        ret                                             


OutShip:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     esi, dword [rax+8H]                     
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+4H]                     
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-10H]                    
        mov     r8d, esi                                
        lea     rsi, [rel ?_055]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+0CH]                    
        test    eax, eax                                
        jnz     ?_012                                   
        mov     rax, qword [rbp-10H]                    
        mov     rcx, rax                                
        mov     edx, 19                                 
        mov     esi, 1                                  
        lea     rax, [rel ?_056]                        
        mov     rdi, rax                                
        call    fwrite                                  
        jmp     ?_014                                   

?_012:  mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+0CH]                    
        cmp     eax, 1                                  
        jnz     ?_013                                   
        mov     rax, qword [rbp-10H]                    
        mov     rcx, rax                                
        mov     edx, 17                                 
        mov     esi, 1                                  
        lea     rax, [rel ?_057]                        
        mov     rdi, rax                                
        call    fwrite                                  
        jmp     ?_014                                   

?_013:  mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+0CH]                    
        cmp     eax, 2                                  
        jnz     ?_014                                   
        mov     rax, qword [rbp-10H]                    
        mov     rcx, rax                                
        mov     edx, 20                                 
        mov     esi, 1                                  
        lea     rax, [rel ?_058]                        
        mov     rdi, rax                                
        call    fwrite                                  
?_014:  mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    OptimalTimeShip                         
        movq    rax, xmm0                               
        mov     rdx, qword [rbp-10H]                    
        movq    xmm0, rax                               
        lea     rax, [rel ?_051]                        
        mov     rsi, rax                                
        mov     rdi, rdx                                
        mov     eax, 1                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


InPlain:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-10H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx], eax                        
        mov     rax, qword [rbp-10H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+4H], eax                     
        mov     rax, qword [rbp-10H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+8H], eax                     
        mov     rax, qword [rbp-10H]                    
        mov     rdi, rax                                
        call    file_read_int                           
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+0CH], eax                    
        nop                                             
        leave                                           
        ret                                             


InRndPlain:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx], eax                        
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+4H], eax                     
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+8H], eax                     
        mov     eax, 0                                  
        call    Random                                  
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+0CH], eax                    
        nop                                             
        leave                                           
        ret                                             


OptimalTimePlain:
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+8H]                     
        pxor    xmm0, xmm0                              
        cvtsi2sd xmm0, eax                              
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        pxor    xmm1, xmm1                              
        cvtsi2sd xmm1, eax                              
        divsd   xmm0, xmm1                              
        movq    rax, xmm0                               
        movq    xmm0, rax                               
        pop     rbp                                     
        ret                                             


OutPlain:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    OptimalTimePlain                        
        movq    rax, xmm0                               
        mov     rdx, qword [rbp-8H]                     
        mov     r8d, dword [rdx+0CH]                    
        mov     rdx, qword [rbp-8H]                     
        mov     esi, dword [rdx+8H]                     
        mov     rdx, qword [rbp-8H]                     
        mov     ecx, dword [rdx+4H]                     
        mov     rdx, qword [rbp-8H]                     
        mov     edx, dword [rdx]                        
        mov     rdi, qword [rbp-10H]                    
        movq    xmm0, rax                               
        mov     r9d, r8d                                
        mov     r8d, esi                                
        lea     rax, [rel ?_059]                        
        mov     rsi, rax                                
        mov     eax, 1                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


InTransport:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     edi, 20                                 
        call    malloc                                  
        mov     qword [rbp-10H], rax                    
        mov     rax, qword [rbp-18H]                    
        mov     rdi, rax                                
        call    file_read_string                        
        mov     qword [rbp-8H], rax                     
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rel ?_060]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_015                                   
        mov     rax, qword [rbp-10H]                    
        mov     dword [rax], 0                          
        mov     rax, qword [rbp-10H]                    
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-18H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    InPlain                                 
        jmp     ?_018                                   

?_015:  mov     rax, qword [rbp-8H]                     
        lea     rdx, [rel ?_061]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_016                                   
        mov     rax, qword [rbp-10H]                    
        mov     dword [rax], 1                          
        mov     rax, qword [rbp-10H]                    
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-18H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    InTrain                                 
        jmp     ?_018                                   

?_016:  mov     rax, qword [rbp-8H]                     
        lea     rdx, [rel ?_062]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_017                                   
        mov     rax, qword [rbp-10H]                    
        mov     dword [rax], 2                          
        mov     rax, qword [rbp-10H]                    
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-18H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    InShip                                  
        mov     rax, qword [rbp-10H]                    
        mov     eax, dword [rax+10H]                    
        cmp     eax, 3                                  
        jnz     ?_018                                   
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    free                                    
        mov     eax, 0                                  
        jmp     ?_019                                   

?_017:  mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    free                                    
        mov     eax, 0                                  
        jmp     ?_019                                   

?_018:  mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    free                                    
        mov     rax, qword [rbp-10H]                    
?_019:  leave                                           
        ret                                             


InRndTransport:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     edi, 20                                 
        call    malloc                                  
        mov     qword [rbp-8H], rax                     
        mov     eax, 0                                  
        call    Random                                  
        mov     edx, eax                                
        movsxd  rax, edx                                
        imul    rax, rax, 1431655766                    
        shr     rax, 32                                 
        mov     ecx, edx                                
        sar     ecx, 31                                 
        sub     eax, ecx                                
        mov     ecx, eax                                
        add     ecx, ecx                                
        add     ecx, eax                                
        mov     eax, edx                                
        sub     eax, ecx                                
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx], eax                        
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        movsxd  rax, edx                                
        imul    rax, rax, 1431655766                    
        shr     rax, 32                                 
        mov     ecx, edx                                
        sar     ecx, 31                                 
        sub     eax, ecx                                
        mov     ecx, eax                                
        add     ecx, ecx                                
        add     ecx, eax                                
        mov     eax, edx                                
        sub     eax, ecx                                
        test    eax, eax                                
        jnz     ?_020                                   
        mov     rax, qword [rbp-8H]                     
        add     rax, 4                                  
        mov     rdi, rax                                
        call    InRndPlain                              
        jmp     ?_022                                   

?_020:  mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        movsxd  rax, edx                                
        imul    rax, rax, 1431655766                    
        shr     rax, 32                                 
        mov     ecx, edx                                
        sar     ecx, 31                                 
        sub     eax, ecx                                
        mov     ecx, eax                                
        add     ecx, ecx                                
        add     ecx, eax                                
        mov     eax, edx                                
        sub     eax, ecx                                
        cmp     eax, 1                                  
        jnz     ?_021                                   
        mov     rax, qword [rbp-8H]                     
        add     rax, 4                                  
        mov     rdi, rax                                
        call    InRndTrain                              
        jmp     ?_022                                   

?_021:  mov     rax, qword [rbp-8H]                     
        add     rax, 4                                  
        mov     rdi, rax                                
        call    InRndShip                               
?_022:  mov     rax, qword [rbp-8H]                     
        leave                                           
        ret                                             


OutTransport:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        test    eax, eax                                
        jnz     ?_023                                   
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    OutPlain                                
        jmp     ?_025                                   

?_023:  mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     eax, 1                                  
        jnz     ?_024                                   
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    OutTrain                                
        jmp     ?_025                                   

?_024:  mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    OutShip                                 
?_025:  nop                                             
        leave                                           
        ret                                             


OptimalTimeTransport:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 8                                  
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        test    eax, eax                                
        jnz     ?_026                                   
        mov     rax, qword [rbp-8H]                     
        add     rax, 4                                  
        mov     rdi, rax                                
        call    OptimalTimePlain                        
        movq    rax, xmm0                               
        jmp     ?_028                                   

?_026:  mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     eax, 1                                  
        jnz     ?_027                                   
        mov     rax, qword [rbp-8H]                     
        add     rax, 4                                  
        mov     rdi, rax                                
        call    OptimalTimeTrain                        
        movq    rax, xmm0                               
        jmp     ?_028                                   

?_027:  mov     rax, qword [rbp-8H]                     
        add     rax, 4                                  
        mov     rdi, rax                                
        call    OptimalTimeShip                         
        movq    rax, xmm0                               
?_028:  movq    xmm0, rax                               
        leave                                           
        ret                                             


Init:   
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     dword [rax], 0                          
        nop                                             
        pop     rbp                                     
        ret                                             


Clear:  
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     dword [rbp-4H], 0                       
        jmp     ?_030                                   

?_029:  mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rbp-4H]                     
        movsxd  rdx, edx                                
        mov     rax, qword [rax+rdx*8+8H]               
        mov     rdi, rax                                
        call    free                                    
        add     dword [rbp-4H], 1                       
?_030:  mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax]                        
        cmp     dword [rbp-4H], eax                     
        jl      ?_029                                   
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax], 0                          
        nop                                             
        leave                                           
        ret                                             


In:     
        push    rbp                                     
        mov     rbp, rsp                                
        push    rbx                                     
        sub     rsp, 24                                 
        mov     qword [rbp-18H], rdi                    
        mov     qword [rbp-20H], rsi                    
        jmp     ?_032                                   

?_031:  mov     rax, qword [rbp-18H]                    
        mov     ebx, dword [rax]                        
        mov     rax, qword [rbp-20H]                    
        mov     rdi, rax                                
        call    InTransport                             
        mov     rdx, qword [rbp-18H]                    
        movsxd  rcx, ebx                                
        mov     qword [rdx+rcx*8+8H], rax               
        mov     rax, qword [rbp-18H]                    
        movsxd  rdx, ebx                                
        mov     rax, qword [rax+rdx*8+8H]               
        test    rax, rax                                
        jz      ?_032                                   
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax]                        
        lea     edx, [rax+1H]                           
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax], edx                        
?_032:  mov     rax, qword [rbp-20H]                    
        mov     rdi, rax                                
        call    feof                                    
        test    eax, eax                                
        jz      ?_031                                   
        nop                                             
        nop                                             
        mov     rbx, qword [rbp-8H]                     
        leave                                           
        ret                                             


InRnd:  
        push    rbp                                     
        mov     rbp, rsp                                
        push    rbx                                     
        sub     rsp, 24                                 
        mov     qword [rbp-18H], rdi                    
        mov     dword [rbp-1CH], esi                    
        jmp     ?_034                                   

?_033:  mov     rax, qword [rbp-18H]                    
        mov     ebx, dword [rax]                        
        mov     eax, 0                                  
        call    InRndTransport                          
        mov     rdx, qword [rbp-18H]                    
        movsxd  rcx, ebx                                
        mov     qword [rdx+rcx*8+8H], rax               
        mov     rax, qword [rbp-18H]                    
        movsxd  rdx, ebx                                
        mov     rax, qword [rax+rdx*8+8H]               
        test    rax, rax                                
        jz      ?_034                                   
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax]                        
        lea     edx, [rax+1H]                           
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax], edx                        
?_034:  mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax]                        
        cmp     dword [rbp-1CH], eax                    
        jg      ?_033                                   
        nop                                             
        nop                                             
        mov     rbx, qword [rbp-8H]                     
        leave                                           
        ret                                             


Out:    
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     qword [rbp-20H], rsi                    
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-20H]                    
        lea     rcx, [rel ?_063]                        
        mov     rsi, rcx                                
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     dword [rbp-4H], 0                       
        jmp     ?_036                                   

?_035:  mov     edx, dword [rbp-4H]                     
        mov     rax, qword [rbp-20H]                    
        lea     rcx, [rel ?_064]                        
        mov     rsi, rcx                                
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rbp-4H]                     
        movsxd  rdx, edx                                
        mov     rax, qword [rax+rdx*8+8H]               
        mov     rdx, qword [rbp-20H]                    
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    OutTransport                            
        add     dword [rbp-4H], 1                       
?_036:  mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax]                        
        cmp     dword [rbp-4H], eax                     
        jl      ?_035                                   
        nop                                             
        nop                                             
        leave                                           
        ret                                             


StraightSelectionSort:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 48                                 
        mov     qword [rbp-28H], rdi                    
        mov     dword [rbp-14H], 0                      
        jmp     ?_041                                   

?_037:  mov     eax, dword [rbp-14H]                    
        mov     dword [rbp-10H], eax                    
        mov     eax, dword [rbp-14H]                    
        mov     dword [rbp-0CH], eax                    
        jmp     ?_040                                   

?_038:  mov     rax, qword [rbp-28H]                    
        mov     edx, dword [rbp-0CH]                    
        movsxd  rdx, edx                                
        mov     rax, qword [rax+rdx*8+8H]               
        mov     rdi, rax                                
        call    OptimalTimeTransport                    
        movsd   qword [rbp-30H], xmm0                   
        mov     rax, qword [rbp-28H]                    
        mov     edx, dword [rbp-10H]                    
        movsxd  rdx, edx                                
        mov     rax, qword [rax+rdx*8+8H]               
        mov     rdi, rax                                
        call    OptimalTimeTransport                    
        movq    rax, xmm0                               
        movq    xmm1, rax                               
        comisd  xmm1, qword [rbp-30H]                   
        jbe     ?_039                                   
        mov     eax, dword [rbp-0CH]                    
        mov     dword [rbp-10H], eax                    
?_039:  add     dword [rbp-0CH], 1                      
?_040:  mov     rax, qword [rbp-28H]                    
        mov     eax, dword [rax]                        
        cmp     dword [rbp-0CH], eax                    
        jl      ?_038                                   
        mov     rax, qword [rbp-28H]                    
        mov     edx, dword [rbp-14H]                    
        movsxd  rdx, edx                                
        mov     rax, qword [rax+rdx*8+8H]               
        mov     qword [rbp-8H], rax                     
        mov     rax, qword [rbp-28H]                    
        mov     edx, dword [rbp-10H]                    
        movsxd  rdx, edx                                
        mov     rcx, qword [rax+rdx*8+8H]               
        mov     rax, qword [rbp-28H]                    
        mov     edx, dword [rbp-14H]                    
        movsxd  rdx, edx                                
        mov     qword [rax+rdx*8+8H], rcx               
        mov     rax, qword [rbp-28H]                    
        mov     edx, dword [rbp-10H]                    
        movsxd  rdx, edx                                
        mov     rcx, qword [rbp-8H]                     
        mov     qword [rax+rdx*8+8H], rcx               
        add     dword [rbp-14H], 1                      
?_041:  mov     rax, qword [rbp-28H]                    
        mov     eax, dword [rax]                        
        cmp     dword [rbp-14H], eax                    
        jl      ?_037                                   
        nop                                             
        nop                                             
        leave                                           
        ret                                             


errMessage1:
        push    rbp                                     
        mov     rbp, rsp                                
        lea     rax, [rel ?_065]                        
        mov     rdi, rax                                
        call    puts                                    
        nop                                             
        pop     rbp                                     
        ret                                             


errMessage2:
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     dword [rbp-4H], edi                     
        mov     eax, dword [rbp-4H]                     
        mov     esi, eax                                
        lea     rax, [rel ?_066]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    printf                                  
        nop                                             
        leave                                           
        ret                                             


errMessage3:
        push    rbp                                     
        mov     rbp, rsp                                
        lea     rax, [rel ?_067]                        
        mov     rdi, rax                                
        call    puts                                    
        nop                                             
        pop     rbp                                     
        ret                                             


main:   
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 80064                              
        mov     dword [rbp-138B4H], edi                 
        mov     qword [rbp-138C0H], rsi                 


        mov     rax, qword [fs:abs 28H]                 
        mov     qword [rbp-8H], rax                     
        xor     eax, eax                                
        cmp     dword [rbp-138B4H], 5                   
        jz      ?_042                                   
        mov     eax, 0                                  
        call    errMessage1                             
        mov     eax, 1                                  
        jmp     ?_048                                   

?_042:  lea     rax, [rel ?_068]                        
        mov     rdi, rax                                
        call    puts                                    
        lea     rax, [rbp-13890H]                       
        mov     rdi, rax                                
        call    Init                                    
        mov     rax, qword [rbp-138C0H]                 
        add     rax, 8                                  
        mov     rax, qword [rax]                        
        lea     rdx, [rel ?_069]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_043                                   
        mov     rax, qword [rbp-138C0H]                 
        add     rax, 16                                 
        mov     rax, qword [rax]                        
        lea     rdx, [rel ?_070]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-138A8H], rax                 
        mov     rdx, qword [rbp-138A8H]                 
        lea     rax, [rbp-13890H]                       
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    In                                      
        mov     rax, qword [rbp-138A8H]                 
        mov     rdi, rax                                
        call    fclose                                  
        jmp     ?_047                                   

?_043:  mov     rax, qword [rbp-138C0H]                 
        add     rax, 8                                  
        mov     rax, qword [rax]                        
        lea     rdx, [rel ?_071]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_046                                   
        mov     rax, qword [rbp-138C0H]                 
        add     rax, 16                                 
        mov     rax, qword [rax]                        
        mov     rdi, rax                                
        call    atoi                                    
        mov     dword [rbp-138ACH], eax                 
        cmp     dword [rbp-138ACH], 0                   
        jle     ?_044                                   
        cmp     dword [rbp-138ACH], 10000               
        jle     ?_045                                   
?_044:  mov     eax, dword [rbp-138ACH]                 
        mov     edi, eax                                
        call    errMessage2                             
        mov     eax, 3                                  
        jmp     ?_048                                   

?_045:  mov     edi, 0                                  
        call    time                                    
        mov     edi, eax                                
        call    srand                                   
        mov     edx, dword [rbp-138ACH]                 
        lea     rax, [rbp-13890H]                       
        mov     esi, edx                                
        mov     rdi, rax                                
        call    InRnd                                   
        jmp     ?_047                                   

?_046:  mov     eax, 0                                  
        call    errMessage3                             
        mov     eax, 2                                  
        jmp     ?_048                                   

?_047:  mov     rax, qword [rbp-138C0H]                 
        add     rax, 24                                 
        mov     rax, qword [rax]                        
        lea     rdx, [rel ?_072]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-138A0H], rax                 
        mov     rax, qword [rbp-138A0H]                 
        mov     rcx, rax                                
        mov     edx, 18                                 
        mov     esi, 1                                  
        lea     rax, [rel ?_073]                        
        mov     rdi, rax                                
        call    fwrite                                  
        mov     rdx, qword [rbp-138A0H]                 
        lea     rax, [rbp-13890H]                       
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    Out                                     
        mov     rax, qword [rbp-138C0H]                 
        add     rax, 32                                 
        mov     rax, qword [rax]                        
        lea     rdx, [rel ?_072]                        
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-13898H], rax                 
        mov     rax, qword [rbp-13898H]                 
        mov     rcx, rax                                
        mov     edx, 18                                 
        mov     esi, 1                                  
        lea     rax, [rel ?_074]                        
        mov     rdi, rax                                
        call    fwrite                                  
        lea     rax, [rbp-13890H]                       
        mov     rdi, rax                                
        call    StraightSelectionSort                   
        mov     rdx, qword [rbp-13898H]                 
        lea     rax, [rbp-13890H]                       
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    Out                                     
        lea     rax, [rbp-13890H]                       
        mov     rdi, rax                                
        call    Clear                                   
        lea     rax, [rel ?_075]                        
        mov     rdi, rax                                
        call    puts                                    
        mov     rax, qword [rbp-138A0H]                 
        mov     rdi, rax                                
        call    fclose                                  
        mov     rax, qword [rbp-13898H]                 
        mov     rdi, rax                                
        call    fclose                                  
        mov     eax, 0                                  
?_048:  mov     rdx, qword [rbp-8H]                     


        sub     rdx, qword [fs:abs 28H]                 
        jz      ?_049                                   
        call    __stack_chk_fail                        
?_049:  leave                                           
        ret                                             



SECTION .data                           


SECTION .bss                            


SECTION .rodata                         

?_050:                                                  
        db 49H, 74H, 20H, 69H, 73H, 20H, 74H, 72H       
        db 61H, 69H, 6EH, 3AH, 20H, 73H, 70H, 65H       
        db 65H, 64H, 20H, 3DH, 20H, 25H, 64H, 2CH       
        db 20H, 64H, 69H, 73H, 74H, 61H, 6EH, 63H       
        db 65H, 20H, 3DH, 20H, 25H, 64H, 2CH, 20H       
        db 63H, 61H, 72H, 73H, 20H, 63H, 6FH, 75H       
        db 6EH, 74H, 65H, 72H, 20H, 3DH, 20H, 25H       
        db 64H, 2EH, 20H, 00H                           

?_051:                                                  
        db 4FH, 70H, 74H, 69H, 6DH, 61H, 6CH, 20H       
        db 74H, 69H, 6DH, 65H, 20H, 3DH, 20H, 25H       
        db 6CH, 66H, 2EH, 0AH, 00H                      

?_052:                                                  
        db 6CH, 69H, 6EH, 65H, 72H, 00H                 

?_053:                                                  
        db 74H, 75H, 67H, 00H                           

?_054:                                                  
        db 74H, 61H, 6EH, 6BH, 65H, 72H, 00H, 00H       
        db 00H, 00H, 00H, 00H, 00H                      

?_055:                                                  
        db 49H, 74H, 20H, 69H, 73H, 20H, 73H, 68H       
        db 69H, 70H, 3AH, 20H, 73H, 70H, 65H, 65H       
        db 64H, 20H, 3DH, 20H, 25H, 64H, 2CH, 20H       
        db 64H, 69H, 73H, 74H, 61H, 6EH, 63H, 65H       
        db 20H, 3DH, 20H, 25H, 64H, 2CH, 20H, 64H       
        db 69H, 73H, 70H, 6CH, 61H, 63H, 65H, 20H       
        db 3DH, 20H, 25H, 64H, 2CH, 20H, 00H            

?_056:                                                  
        db 73H, 68H, 69H, 70H, 20H, 6BH, 69H, 6EH       
        db 64H, 20H, 3DH, 20H, 6CH, 69H, 6EH, 65H       
        db 72H, 2EH, 20H, 00H                           

?_057:                                                  
        db 73H, 68H, 69H, 70H, 20H, 6BH, 69H, 6EH       
        db 64H, 20H, 3DH, 20H, 74H, 75H, 67H, 2EH       
        db 20H, 00H                                     

?_058:                                                  
        db 73H, 68H, 69H, 70H, 20H, 6BH, 69H, 6EH       
        db 64H, 20H, 3DH, 20H, 74H, 61H, 6EH, 6BH       
        db 65H, 72H, 2EH, 20H, 00H, 00H, 00H, 00H       
        db 00H, 00H, 00H                                

?_059:                                                  
        db 49H, 74H, 20H, 69H, 73H, 20H, 70H, 6CH       
        db 61H, 69H, 6EH, 3AH, 20H, 73H, 70H, 65H       
        db 65H, 64H, 20H, 3DH, 20H, 25H, 64H, 2CH       
        db 20H, 64H, 69H, 73H, 74H, 61H, 6EH, 63H       
        db 65H, 20H, 3DH, 20H, 25H, 64H, 2CH, 20H       
        db 66H, 6CH, 79H, 20H, 64H, 69H, 73H, 74H       
        db 61H, 6EH, 63H, 65H, 20H, 3DH, 20H, 25H       
        db 64H, 2CH, 20H, 6CH, 69H, 66H, 74H, 69H       
        db 6EH, 67H, 20H, 63H, 61H, 70H, 61H, 63H       
        db 69H, 74H, 79H, 20H, 3DH, 20H, 25H, 64H       
        db 2EH, 20H, 4FH, 70H, 74H, 69H, 6DH, 61H       
        db 6CH, 20H, 74H, 69H, 6DH, 65H, 20H, 3DH       
        db 20H, 25H, 6CH, 66H, 2EH, 0AH, 00H            

?_060:                                                  
        db 70H, 6CH, 61H, 69H, 6EH, 00H                 

?_061:                                                  
        db 74H, 72H, 61H, 69H, 6EH, 00H                 

?_062:                                                  
        db 73H, 68H, 69H, 70H, 00H                      

?_063:                                                  
        db 43H, 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H       
        db 72H, 20H, 63H, 6FH, 6EH, 74H, 61H, 69H       
        db 6EH, 73H, 20H, 25H, 64H, 20H, 65H, 6CH       
        db 65H, 6DH, 65H, 6EH, 74H, 73H, 2EH, 0AH       
        db 00H                                          

?_064:                                                  
        db 25H, 64H, 3AH, 20H, 00H, 00H, 00H            

?_065:                                                  
        db 69H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       
        db 74H, 20H, 63H, 6FH, 6DH, 6DH, 61H, 6EH       
        db 64H, 20H, 6CH, 69H, 6EH, 65H, 21H, 0AH       
        db 20H, 20H, 57H, 61H, 69H, 74H, 65H, 64H       
        db 3AH, 0AH, 20H, 20H, 20H, 20H, 20H, 63H       
        db 6FH, 6DH, 6DH, 61H, 6EH, 64H, 20H, 2DH       
        db 66H, 20H, 69H, 6EH, 66H, 69H, 6CH, 65H       
        db 20H, 6FH, 75H, 74H, 66H, 69H, 6CH, 65H       
        db 30H, 31H, 20H, 6FH, 75H, 74H, 66H, 69H       
        db 6CH, 65H, 30H, 32H, 0AH, 20H, 20H, 4FH       
        db 72H, 3AH, 0AH, 20H, 20H, 20H, 20H, 20H       
        db 63H, 6FH, 6DH, 6DH, 61H, 6EH, 64H, 20H       
        db 2DH, 6EH, 20H, 6EH, 75H, 6DH, 62H, 65H       
        db 72H, 20H, 6FH, 75H, 74H, 66H, 69H, 6CH       
        db 65H, 30H, 31H, 20H, 6FH, 75H, 74H, 66H       
        db 69H, 6CH, 65H, 30H, 32H, 00H, 00H, 00H       

?_066:                                                  
        db 69H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       
        db 74H, 20H, 6EH, 75H, 6DH, 65H, 72H, 20H       
        db 6FH, 66H, 20H, 66H, 69H, 67H, 75H, 72H       
        db 65H, 73H, 20H, 3DH, 20H, 25H, 64H, 2EH       
        db 20H, 53H, 65H, 74H, 20H, 30H, 20H, 3CH       
        db 20H, 6EH, 75H, 6DH, 62H, 65H, 72H, 20H       
        db 3CH, 3DH, 20H, 31H, 30H, 30H, 30H, 30H       
        db 0AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       

?_067:                                                  
        db 69H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       
        db 74H, 20H, 71H, 75H, 61H, 6CH, 69H, 66H       
        db 69H, 65H, 72H, 20H, 76H, 61H, 6CH, 75H       
        db 65H, 21H, 0AH, 20H, 20H, 57H, 61H, 69H       
        db 74H, 65H, 64H, 3AH, 0AH, 20H, 20H, 20H       
        db 20H, 20H, 63H, 6FH, 6DH, 6DH, 61H, 6EH       
        db 64H, 20H, 2DH, 66H, 20H, 69H, 6EH, 66H       
        db 69H, 6CH, 65H, 20H, 6FH, 75H, 74H, 66H       
        db 69H, 6CH, 65H, 30H, 31H, 20H, 6FH, 75H       
        db 74H, 66H, 69H, 6CH, 65H, 30H, 32H, 0AH       
        db 20H, 20H, 4FH, 72H, 3AH, 0AH, 20H, 20H       
        db 20H, 20H, 20H, 63H, 6FH, 6DH, 6DH, 61H       
        db 6EH, 64H, 20H, 2DH, 6EH, 20H, 6EH, 75H       
        db 6DH, 62H, 65H, 72H, 20H, 6FH, 75H, 74H       
        db 66H, 69H, 6CH, 65H, 30H, 31H, 20H, 6FH       
        db 75H, 74H, 66H, 69H, 6CH, 65H, 30H, 32H       
        db 00H                                          

?_068:                                                  
        db 53H, 74H, 61H, 72H, 74H, 00H                 

?_069:                                                  
        db 2DH, 66H, 00H                                

?_070:                                                  
        db 72H, 00H                                     

?_071:                                                  
        db 2DH, 6EH, 00H                                

?_072:                                                  
        db 77H, 00H                                     

?_073:                                                  
        db 46H, 69H, 6CH, 6CH, 65H, 64H, 20H, 63H       
        db 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H, 72H       
        db 3AH, 0AH, 00H                                

?_074:                                                  
        db 53H, 6FH, 72H, 74H, 65H, 64H, 20H, 63H       
        db 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H, 72H       
        db 3AH, 0AH, 00H                                

?_075:                                                  
        db 53H, 74H, 6FH, 70H, 00H                      


