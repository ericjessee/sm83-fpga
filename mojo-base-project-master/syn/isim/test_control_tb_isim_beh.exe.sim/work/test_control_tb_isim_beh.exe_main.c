/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_04284627112054182733_1851106481_init();
    xilinxcorelib_ver_m_04284627112054182733_1571443074_init();
    xilinxcorelib_ver_m_18166792875774041790_2559047490_init();
    xilinxcorelib_ver_m_15357890051310224500_3124462025_init();
    xilinxcorelib_ver_m_10066368518302646626_2455508610_init();
    work_m_13486228919492782400_1774216237_init();
    work_m_16706742817193566433_3037777339_init();
    work_m_02555203588403626243_0305591545_init();
    work_m_08919708444367760573_3266031325_init();
    work_m_11461024254789866571_0551568267_init();
    work_m_05806934500349056378_2361642427_init();
    work_m_17981156727495967113_3942994796_init();
    work_m_02555203588403626243_1161643236_init();
    work_m_02555203588403626243_1546024357_init();
    work_m_00227616257001083088_4260226045_init();
    work_m_11333166642648714891_0878861151_init();
    work_m_02555203588403626243_2798230831_init();
    work_m_05806934500349056378_3878631100_init();
    work_m_01316471087338820606_1794535669_init();
    work_m_11794494776536109037_3726311701_init();
    work_m_01927686278155321948_1589344259_init();
    work_m_15892849697051228447_3705239652_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_15892849697051228447_3705239652");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
