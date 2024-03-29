// This file is Copyright (c) 2020 Florent Kermarrec <florent@enjoy-digital.fr>
// License: BSD

#include <csr.h>
#include <soc.h>
#include <irq_vex.h>
#include <user_uart.h>
#include <defs.h>

extern int uart_read();
extern char uart_read_char();
extern char uart_write_char();
extern int uart_write();

void isr(void);

#ifdef CONFIG_CPU_HAS_INTERRUPT

#ifdef USER_PROJ_IRQ0_EN
uint32_t counter = 0xFFFF0000;
#endif

void isr(void)
{

#ifndef USER_PROJ_IRQ0_EN

    irq_setmask(0);


#else
    uint32_t irqs = irq_pending() & irq_getmask();
    int buf[64];
    int i=0;
    if ( irqs & (1 << USER_IRQ_0_INTERRUPT)) {
        user_irq_0_ev_pending_write(1); //Clear Interrupt Pending Event

        int ex_times = reg_rx_data_num;
        for (i=0 ; i < ex_times ; i++){
            buf[i] = uart_read();
            uart_write(buf[i]);
        }
        // buf[0] = uart_read();
        // buf[1] = uart_read();
        // uart_write(buf[0]);
        // uart_write(buf[1]);       

    }
#endif

    return;

}

#else

void isr(void){};

#endif
