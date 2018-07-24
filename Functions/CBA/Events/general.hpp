// Required functions pulled from script_macros_common.hpp


#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
#define QUOTE(var1) #var1

#define GVAR(var1) DOUBLES(CBAP,var1)
#define EGVAR(var1,var2) TRIPLES(CBAP,var1,var2)
#define QGVAR(var1) QUOTE(GVAR(var1))
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
#define QQGVAR(var1) QUOTE(QGVAR(var1))
#define QQEGVAR(var1,var2) QUOTE(QEGVAR(var1,var2))

#define FUNC(var1) TRIPLES(CBAP,fnc,var1)
#define QFUNC(var1) QUOTE(FUNC(var1))

#define INC(var) var = (var) + 1

#define IS_ADMIN_LOGGED serverCommandAvailable "#shutdown"
#define IS_ADMIN serverCommandAvailable "#kick"


#define PFORMAT_1(MESSAGE,A) \
    format ['%1: A=%2', MESSAGE, RETNIL(A)]

#define PFORMAT_2(MESSAGE,A,B) \
    format ['%1: A=%2, B=%3', MESSAGE, RETNIL(A), RETNIL(B)]

#define PFORMAT_3(MESSAGE,A,B,C) \
    format ['%1: A=%2, B=%3, C=%4', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C)]

#define PFORMAT_4(MESSAGE,A,B,C,D) \
    format ['%1: A=%2, B=%3, C=%4, D=%5', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D)]

#define PFORMAT_5(MESSAGE,A,B,C,D,E) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E)]

#define PFORMAT_6(MESSAGE,A,B,C,D,E,F) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F)]

#define PFORMAT_7(MESSAGE,A,B,C,D,E,F,G) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G)]

#define PFORMAT_8(MESSAGE,A,B,C,D,E,F,G,H) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8, H=%9', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G), RETNIL(H)]

#define PFORMAT_9(MESSAGE,A,B,C,D,E,F,G,H,I) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8, H=%9, I=%10', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G), RETNIL(H), RETNIL(I)]
