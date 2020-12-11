module win_check(
    input [11:0] col1,
    input [11:0] col2,
    input [11:0] col3,
    input [11:0] col4,
    input [11:0] col5,
    input [11:0] col6,
    input [11:0] col7,
    input clk,
    output [1:0]win
    );
    wire [1:0] win_c [68:0];
    reg [1:0] m_ [41:0];
    always @ (*) begin
        m_[0] = col1[1:0];
        m_[1] = col1[3:2];
        m_[2] = col1[5:4];
        m_[3] = col1[7:6];
        m_[4] = col1[9:8];
        m_[5] = col1[11:10];
        m_[6] = col2[1:0];
        m_[7] = col2[3:2];
        m_[8] = col2[5:4];
        m_[9] = col2[7:6];
        m_[10] = col2[9:8];
        m_[11] = col2[11:10];
        m_[12] = col3[1:0];
        m_[13] = col3[3:2];
        m_[14] = col3[5:4];
        m_[15] = col3[7:6];
        m_[16] = col3[9:8];
        m_[17] = col3[11:10];
        m_[18] = col4[1:0];
        m_[19] = col4[3:2];
        m_[20] = col4[5:4];
        m_[21] = col4[7:6];
        m_[22] = col4[9:8];
        m_[23] = col4[11:10];
        m_[24] = col5[1:0];
        m_[25] = col5[3:2];
        m_[26] = col5[5:4];
        m_[27] = col5[7:6];
        m_[28] = col5[9:8];
        m_[29] = col5[11:10];
        m_[30] = col6[1:0];
        m_[31] = col6[3:2];
        m_[32] = col6[5:4];
        m_[33] = col6[7:6];
        m_[34] = col6[9:8];
        m_[35] = col6[11:10];
        m_[36] = col7[1:0];
        m_[37] = col7[3:2];
        m_[38] = col7[5:4];
        m_[39] = col7[7:6];
        m_[40] = col7[9:8];
        m_[41] = col7[11:10];
    end
    //check columns
    cell_check m0(m_[0], m_[1], m_[2], m_[3], win_c[0]);
    cell_check m1(m_[1], m_[2], m_[3], m_[4], win_c[1]);
    cell_check m2(m_[2], m_[3], m_[4], m_[5], win_c[2]);
    cell_check m3(m_[6], m_[7], m_[8], m_[9], win_c[3]);
    cell_check m4(m_[7], m_[8], m_[9], m_[10], win_c[4]);
    cell_check m5(m_[8], m_[9], m_[10], m_[11], win_c[5]);
    cell_check m6(m_[12], m_[13], m_[14], m_[15], win_c[6]);
    cell_check m7(m_[13], m_[14], m_[15], m_[16], win_c[7]);
    cell_check m8(m_[14], m_[15], m_[16], m_[17], win_c[8]);
    cell_check m9(m_[18], m_[19], m_[20], m_[21], win_c[9]);
    cell_check m10(m_[19], m_[20], m_[21], m_[22], win_c[10]);
    cell_check m11(m_[20], m_[21], m_[22], m_[23], win_c[11]);
    cell_check m12(m_[24], m_[25], m_[26], m_[27], win_c[12]);
    cell_check m13(m_[25], m_[26], m_[27], m_[28], win_c[13]);
    cell_check m14(m_[26], m_[27], m_[28], m_[29], win_c[14]);
    cell_check m15(m_[30], m_[31], m_[32], m_[33], win_c[15]);
    cell_check m16(m_[31], m_[32], m_[33], m_[34], win_c[16]);
    cell_check m17(m_[32], m_[33], m_[34], m_[35], win_c[17]);
    cell_check m18(m_[36], m_[37], m_[38], m_[39], win_c[18]);
    cell_check m19(m_[37], m_[38], m_[39], m_[40], win_c[19]);
    cell_check m20(m_[38], m_[39], m_[40], m_[41], win_c[20]);
    
    //check rows
    cell_check m21(m_[0], m_[6], m_[12], m_[18], win_c[21]);
    cell_check m22(m_[6], m_[12], m_[18], m_[24], win_c[22]);
    cell_check m23(m_[12], m_[18], m_[24], m_[30], win_c[23]);
    cell_check m24(m_[18], m_[24], m_[30], m_[36], win_c[24]);//
    cell_check m25(m_[1], m_[7], m_[13], m_[19], win_c[25]);
    cell_check m26(m_[7], m_[13], m_[19], m_[25], win_c[26]);
    cell_check m27(m_[13], m_[19], m_[25], m_[31], win_c[27]);
    cell_check m28(m_[19], m_[25], m_[31], m_[37], win_c[28]);//
    cell_check m29(m_[2], m_[8], m_[14], m_[20], win_c[29]);
    cell_check m30(m_[8], m_[14], m_[20], m_[26], win_c[30]);
    cell_check m31(m_[14], m_[20], m_[26], m_[32], win_c[31]);
    cell_check m32(m_[20], m_[26], m_[23], m_[38], win_c[32]);//
    cell_check m33(m_[3], m_[9], m_[15], m_[21], win_c[33]);
    cell_check m34(m_[9], m_[15], m_[21], m_[27], win_c[34]);
    cell_check m35(m_[15], m_[21], m_[27], m_[33], win_c[35]);
    cell_check m36(m_[21], m_[27], m_[33], m_[39], win_c[36]);//
    cell_check m37(m_[4], m_[10], m_[16], m_[22], win_c[37]);
    cell_check m38(m_[10], m_[16], m_[22], m_[28], win_c[38]);
    cell_check m39(m_[16], m_[22], m_[28], m_[34], win_c[39]);
    cell_check m40(m_[22], m_[28], m_[34], m_[40], win_c[40]);//
    cell_check m41(m_[5], m_[11], m_[17], m_[23], win_c[41]);
    cell_check m42(m_[11], m_[17], m_[23], m_[29], win_c[42]);
    cell_check m43(m_[17], m_[23], m_[29], m_[35], win_c[43]);
    cell_check m44(m_[23], m_[29], m_[35], m_[41], win_c[44]);
    
    //check diagnols
    cell_check m45(m_[2], m_[9], m_[16], m_[23], win_c[45]);
    cell_check m46(m_[1], m_[8], m_[15], m_[22], win_c[46]);
    cell_check m47(m_[8], m_[15], m_[22], m_[29], win_c[47]);
    cell_check m48(m_[0], m_[7], m_[14], m_[21], win_c[48]);
    cell_check m49(m_[7], m_[14], m_[21], m_[28], win_c[49]);
    cell_check m50(m_[14], m_[21], m_[28], m_[35], win_c[50]);
    cell_check m51(m_[6], m_[13], m_[20], m_[27], win_c[51]);
    cell_check m52(m_[13], m_[20], m_[27], m_[34], win_c[52]);
    cell_check m53(m_[20], m_[27], m_[34], m_[41], win_c[53]);
    cell_check m54(m_[12], m_[19], m_[26], m_[33], win_c[54]);
    cell_check m55(m_[19], m_[26], m_[33], m_[40], win_c[55]);
    cell_check m56(m_[18], m_[25], m_[32], m_[39], win_c[56]);//
    cell_check m57(m_[3], m_[8], m_[13], m_[18], win_c[57]);
    cell_check m58(m_[4], m_[9], m_[14], m_[19], win_c[58]);
    cell_check m59(m_[9], m_[14], m_[19], m_[24], win_c[59]);
    cell_check m60(m_[5], m_[10], m_[15], m_[20], win_c[60]);
    cell_check m61(m_[10], m_[15], m_[20], m_[25], win_c[61]);
    cell_check m62(m_[15], m_[20], m_[25], m_[30], win_c[62]);
    cell_check m63(m_[11], m_[16], m_[21], m_[26], win_c[63]);
    cell_check m64(m_[16], m_[21], m_[26], m_[31], win_c[64]);
    cell_check m65(m_[21], m_[26], m_[31], m_[36], win_c[65]);
    cell_check m66(m_[17], m_[22], m_[27], m_[32], win_c[66]);
    cell_check m67(m_[22], m_[27], m_[32], m_[37], win_c[67]);
    cell_check m68(m_[23], m_[28], m_[33], m_[38], win_c[68]);
    
    assign win[0] = win_c[0][0] || 
                    win_c[1][0] || 
                    win_c[2][0] || 
                    win_c[3][0] || 
                    win_c[4][0] || 
                    win_c[5][0] || 
                    win_c[6][0] || 
                    win_c[7][0] || 
                    win_c[8][0] || 
                    win_c[9][0] || 
                    win_c[10][0] || 
                    win_c[11][0] || 
                    win_c[12][0] || 
                    win_c[13][0] || 
                    win_c[14][0] || 
                    win_c[15][0] || 
                    win_c[16][0] || 
                    win_c[17][0] || 
                    win_c[18][0] || 
                    win_c[19][0] || 
                    win_c[20][0] || 
                    win_c[21][0] || 
                    win_c[22][0] || 
                    win_c[23][0] || 
                    win_c[24][0] || 
                    win_c[25][0] || 
                    win_c[26][0] || 
                    win_c[27][0] || 
                    win_c[28][0] || 
                    win_c[29][0] || 
                    win_c[30][0] || 
                    win_c[31][0] || 
                    win_c[32][0] || 
                    win_c[33][0] || 
                    win_c[34][0] || 
                    win_c[35][0] || 
                    win_c[36][0] || 
                    win_c[37][0] || 
                    win_c[38][0] || 
                    win_c[39][0] || 
                    win_c[40][0] || 
                    win_c[41][0] || 
                    win_c[42][0] || 
                    win_c[43][0] || 
                    win_c[44][0] || 
                    win_c[45][0] || 
                    win_c[46][0] || 
                    win_c[47][0] || 
                    win_c[48][0] || 
                    win_c[49][0] || 
                    win_c[50][0] || 
                    win_c[51][0] || 
                    win_c[52][0] || 
                    win_c[53][0] || 
                    win_c[54][0] || 
                    win_c[55][0] || 
                    win_c[56][0] || 
                    win_c[57][0] || 
                    win_c[58][0] || 
                    win_c[59][0] || 
                    win_c[60][0] || 
                    win_c[61][0] || 
                    win_c[62][0] || 
                    win_c[63][0] || 
                    win_c[64][0] || 
                    win_c[65][0] || 
                    win_c[66][0] || 
                    win_c[67][0] || 
                    win_c[68][0];
    assign win[1] = win_c[0][1] || 
                    win_c[1][1] || 
                    win_c[2][1] || 
                    win_c[3][1] || 
                    win_c[4][1] || 
                    win_c[5][1] || 
                    win_c[6][1] || 
                    win_c[7][1] || 
                    win_c[8][1] || 
                    win_c[9][1] || 
                    win_c[10][1] || 
                    win_c[11][1] || 
                    win_c[12][1] || 
                    win_c[13][1] || 
                    win_c[14][1] || 
                    win_c[15][1] || 
                    win_c[16][1] || 
                    win_c[17][1] || 
                    win_c[18][1] || 
                    win_c[19][1] || 
                    win_c[20][1] || 
                    win_c[21][1] || 
                    win_c[22][1] || 
                    win_c[23][1] || 
                    win_c[24][1] || 
                    win_c[25][1] || 
                    win_c[26][1] || 
                    win_c[27][1] || 
                    win_c[28][1] || 
                    win_c[29][1] || 
                    win_c[30][1] || 
                    win_c[31][1] || 
                    win_c[32][1] || 
                    win_c[33][1] || 
                    win_c[34][1] || 
                    win_c[35][1] || 
                    win_c[36][1] || 
                    win_c[37][1] || 
                    win_c[38][1] || 
                    win_c[39][1] || 
                    win_c[40][1] || 
                    win_c[41][1] || 
                    win_c[42][1] || 
                    win_c[43][1] || 
                    win_c[44][1] || 
                    win_c[45][1] || 
                    win_c[46][1] || 
                    win_c[47][1] || 
                    win_c[48][1] || 
                    win_c[49][1] || 
                    win_c[50][1] || 
                    win_c[51][1] || 
                    win_c[52][1] || 
                    win_c[53][1] || 
                    win_c[54][1] || 
                    win_c[55][1] || 
                    win_c[56][1] || 
                    win_c[57][1] || 
                    win_c[58][1] || 
                    win_c[59][1] || 
                    win_c[60][1] || 
                    win_c[61][1] || 
                    win_c[62][1] || 
                    win_c[63][1] || 
                    win_c[64][1] || 
                    win_c[65][1] || 
                    win_c[66][1] || 
                    win_c[67][1] || 
                    win_c[68][1];
endmodule