// LCD module connections
sbit LCD_RS at RD1_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD1_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// End LCD module connections

unsigned short ang[5];
long timer1;
long tmr1_high[5]={0xE2,0xE2,0xE2,0xE2,0xE2};
long tmr1_low[5]={0xB3,0xB3,0xB3,0xB3,0xB3};
bit trama_valida;
unsigned short i;
unsigned short fase;
unsigned char d1,d2,d3;

void interrupt(void){
    if(INTCON.T0IF==1){
        TMR0=99;
        TMR1L=0;
        TMR1H=tmr1_high[fase>>1];
        TMR1L=tmr1_low[fase>>1];
        PIE1.TMR1IE=1;
        PORTB=PORTB^(0b00000001<<(fase>>1));
        fase++;
        INTCON.T0IF=0;
    }
    if(PIR1.TMR1IF==1){
        PORTB=PORTB^(0b00000001<<(fase>>1));
        PIE1.TMR1IE=0;
        if(fase==9)
            fase=0;
        else
            fase++;
        PIR1.TMR1IF=0;
    }
    
}

void Config_iniciales(void){
    PORTB=0;
    TRISB=0;
    fase=0b00000000;
    INTCON.GIE=1;
    INTCON.PEIE=1;
    OPTION_REG=0b10000110;
    T1CON=1;
    INTCON.T0IE=1;
    PIR1.T0IF=1;
}

void main() {
     Config_iniciales();
     UART1_Init(2400);
     Lcd_Init();
     lcd_cmd(_LCD_CLEAR);
     lcd_cmd(_LCD_CURSOR_OFF);
     delay_ms(10);

     while(1){
         if((UART1_Data_Ready()==1)&&(UART1_Read()=='S')){
             i=0;
             do{
                 if(UART1_Data_Ready()==1){
                     ang[i]=UART1_Read();
                     i++;
                 }
             } while(i<5);
             while(UART1_Data_Ready()==0)
             ;
             if(UART1_Read()=='E')
                 trama_valida=1;
         }
         
         if (trama_valida==1){
             for(i=0;i<5;i++){
                 timer1=60535-(250*ang[i]/9);
                 tmr1_high[i]=timer1/256;
                 tmr1_low[i]=timer1%256;
             }
             for(i=0;i<5;i++){
                 d1=ang[i]/100;
                 d2=(ang[i]%100)/10;
                 d3=(ang[i]%100)%10;

                 Lcd_Chr(1+(i>2),1+4*i-11*(i>2),d1+48);
                 Lcd_Chr_Cp(d2+48);
                 Lcd_Chr_Cp(d3+48);
             }
         }

     }
}