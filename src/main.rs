#![no_std]
#![no_main]

use panic_halt as _;
use panic_halt as _;
use cortex_m_rt::entry;
use iwrl64xx_pac::Peripherals;
use cortex_m::asm::nop;


#[entry]
fn main() -> ! {
    let peripherals = Peripherals::take().unwrap();
    peripherals.top_io_mux.iocfgkick0().write(|w| unsafe { w.bits(0x83E70B13) });
    peripherals.top_io_mux.iocfgkick1().write(|w| unsafe { w.bits(0x95A4F1E0) });
    peripherals.top_io_mux.padav_cfg_reg().write(|w| {w.pi().bit(true)});
    peripherals.top_io_mux.iocfgkick1().write(|w| unsafe { w.bits(0) });
    peripherals.top_io_mux.iocfgkick0().write(|w| unsafe { w.bits(0) });

    peripherals.top_gio.giogcr().write(|w|  w.reset().bit(true) );
    peripherals.top_gio.giodira().write(|w| unsafe { w.bits(0x1 << 5) });

    let mut is_on = false;
    loop {
        for _ in 0..200_000 {
            nop();
        }
        is_on = !is_on;
        if is_on {
            peripherals.top_gio.gioseta().write(|w| unsafe { w.bits(0x1 << 5) });
        } else {
            peripherals.top_gio.gioclra().write(|w| unsafe { w.bits(0x1 << 5) });
        }
    }
}