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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/eric/fpga/mojo-base-project-master/src/cpu/control/control.v";
static unsigned int ng1[] = {0U, 4294967295U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {65280U, 0U};
static int ng4[] = {1, 0};
static int ng5[] = {0, 0};
static unsigned int ng6[] = {65281U, 0U};
static unsigned int ng7[] = {65282U, 0U};
static unsigned int ng8[] = {65285U, 0U};
static unsigned int ng9[] = {65283U, 0U};
static unsigned int ng10[] = {65284U, 0U};
static unsigned int ng11[] = {65286U, 0U};
static unsigned int ng12[] = {65287U, 0U};
static unsigned int ng13[] = {65288U, 0U};
static unsigned int ng14[] = {62U, 0U};
static unsigned int ng15[] = {65289U, 0U};
static unsigned int ng16[] = {65290U, 0U};
static unsigned int ng17[] = {65291U, 0U};



static void Cont_44_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;

LAB0:    t1 = (t0 + 8576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 7504);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t22 = *((unsigned int *)t4);
    t23 = (~(t22));
    t24 = *((unsigned int *)t14);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t26, 8);

LAB16:    t27 = (t0 + 9752);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memset(t31, 0, 8);
    t32 = 65535U;
    t33 = t32;
    t34 = (t3 + 4);
    t35 = *((unsigned int *)t3);
    t32 = (t32 & t35);
    t36 = *((unsigned int *)t34);
    t33 = (t33 & t36);
    t37 = (t31 + 4);
    t38 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t38 | t32);
    t39 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t39 | t33);
    xsi_driver_vfirst_trans(t27, 0, 15);
    t40 = (t0 + 9640);
    *((int *)t40) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 6704);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t21, t20, 8);
    goto LAB9;

LAB10:    t26 = ((char*)((ng1)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t21, 32, t26, 32);
    goto LAB16;

LAB14:    memcpy(t3, t21, 8);
    goto LAB16;

}

static void Cont_45_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 8824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 9816);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 65535U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 15);

LAB1:    return;
}

static void Always_66_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 9072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 9656);
    *((int *)t2) = 1;
    t3 = (t0 + 9104);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(66, ng0);

LAB5:    xsi_set_current_line(67, ng0);
    t4 = (t0 + 4064U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(70, ng0);

LAB10:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 7184);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7024);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 16, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(67, ng0);

LAB9:    xsi_set_current_line(68, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 7024);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 16, 0LL);
    goto LAB8;

}

static void Always_75_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    int t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 9320U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 9672);
    *((int *)t2) = 1;
    t3 = (t0 + 9352);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(75, ng0);

LAB5:    xsi_set_current_line(76, ng0);
    t4 = (t0 + 7024);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 7184);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 16);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 7024);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t5, 16);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng16)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng17)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 16, t2, 16);
    if (t8 == 1)
        goto LAB29;

LAB30:
LAB31:    goto LAB2;

LAB7:    xsi_set_current_line(78, ng0);

LAB32:    xsi_set_current_line(79, ng0);
    t6 = ((char*)((ng4)));
    t7 = (t0 + 6224);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 1, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 6384);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 6064);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5904);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4944);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5104);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5264);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5424);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5584);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5744);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 7504);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB9:    xsi_set_current_line(92, ng0);

LAB33:    xsi_set_current_line(93, ng0);
    t3 = (t0 + 4544U);
    t5 = *((char **)t3);
    t3 = (t0 + 6704);
    xsi_vlogvar_wait_assign_value(t3, t5, 0, 0, 16, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 7504);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5104);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB11:    xsi_set_current_line(98, ng0);

LAB34:    xsi_set_current_line(99, ng0);
    t3 = ((char*)((ng5)));
    t5 = (t0 + 5104);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 7504);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB13:    xsi_set_current_line(103, ng0);

LAB35:    xsi_set_current_line(104, ng0);
    t3 = ((char*)((ng5)));
    t5 = (t0 + 6384);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4944);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5744);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB15:    xsi_set_current_line(109, ng0);

LAB36:    xsi_set_current_line(110, ng0);
    t3 = ((char*)((ng5)));
    t5 = (t0 + 5744);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5584);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4944);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5104);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 7344);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 16, 0LL);
    goto LAB31;

LAB17:    xsi_set_current_line(116, ng0);

LAB37:    xsi_set_current_line(117, ng0);
    t3 = ((char*)((ng5)));
    t5 = (t0 + 6064);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5904);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 6384);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4944);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5104);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5264);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5424);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5584);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5744);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 7504);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB19:    xsi_set_current_line(130, ng0);

LAB38:    xsi_set_current_line(131, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 6384);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB21:    xsi_set_current_line(135, ng0);

LAB39:    xsi_set_current_line(136, ng0);
    t3 = (t0 + 4384U);
    t5 = *((char **)t3);
    t3 = (t0 + 6544);
    xsi_vlogvar_wait_assign_value(t3, t5, 0, 0, 8, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB23:    xsi_set_current_line(139, ng0);

LAB40:    xsi_set_current_line(140, ng0);
    t3 = (t0 + 6544);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);

LAB41:    t7 = ((char*)((ng14)));
    t9 = xsi_vlog_unsigned_case_compare(t6, 8, t7, 8);
    if (t9 == 1)
        goto LAB42;

LAB43:
LAB45:
LAB44:    xsi_set_current_line(147, ng0);

LAB48:    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 7344);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);

LAB46:    goto LAB31;

LAB25:    xsi_set_current_line(153, ng0);

LAB49:    xsi_set_current_line(154, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 4944);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6384);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5584);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5744);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB27:    xsi_set_current_line(160, ng0);

LAB50:    xsi_set_current_line(161, ng0);
    t3 = (t0 + 7664);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);

LAB51:    t10 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t7, 4, t10, 4);
    if (t9 == 1)
        goto LAB52;

LAB53:
LAB54:    goto LAB31;

LAB29:    xsi_set_current_line(168, ng0);

LAB56:    xsi_set_current_line(169, ng0);
    t3 = ((char*)((ng5)));
    t5 = (t0 + 5904);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(170, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 7344);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(171, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB31;

LAB42:    xsi_set_current_line(141, ng0);

LAB47:    xsi_set_current_line(142, ng0);
    t10 = ((char*)((ng2)));
    t11 = (t0 + 7664);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 4, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 7344);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB46;

LAB52:    xsi_set_current_line(162, ng0);

LAB55:    xsi_set_current_line(163, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 5904);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 7184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB54;

}


extern void work_m_16706742817193566433_3037777339_init()
{
	static char *pe[] = {(void *)Cont_44_0,(void *)Cont_45_1,(void *)Always_66_2,(void *)Always_75_3};
	xsi_register_didat("work_m_16706742817193566433_3037777339", "isim/test_control_tb_isim_beh.exe.sim/work/m_16706742817193566433_3037777339.didat");
	xsi_register_executes(pe);
}
