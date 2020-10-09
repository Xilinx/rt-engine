###### conv1 start ######
LOAD 0000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 9 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 224 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 1  channel_offset 11 prelu_shift_p 0
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 0
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 14336
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 28672
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 43008
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 57344
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 71680
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 86016
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 100352
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 114688
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 129024
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 143360
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 157696
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 172032
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 186368
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 200704
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 215040
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 229376
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 243712
LOAD 0000 0100 mode 1 bank_addr 1 bank_id 0 jump_read 32 jump_write 2 length 7 channel 21 reg_id 3 ddr_addr 256
CONV 0001 0000 pad_left 0 pad_top 3 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
LOAD 0000 0100 mode 1 bank_addr 15 bank_id 0 jump_read 32 jump_write 2 length 7 channel 21 reg_id 3 ddr_addr 3840
CONV 0001 0000 pad_left 0 pad_top 3 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 0 bank_addr_out 1 bank_addr_weights 15 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 1 valid_pixel_parallel 8 prelu_shift_n 0
LOAD 0000 0100 mode 1 bank_addr 29 bank_id 0 jump_read 32 jump_write 2 length 7 channel 21 reg_id 3 ddr_addr 7424
CONV 0001 0000 pad_left 0 pad_top 3 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 0 bank_addr_out 2 bank_addr_weights 29 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 2 valid_pixel_parallel 8 prelu_shift_n 0
LOAD 0000 0100 mode 1 bank_addr 43 bank_id 0 jump_read 32 jump_write 2 length 7 channel 21 reg_id 3 ddr_addr 11008
CONV 0001 1000 pad_left 0 pad_top 3 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 0 bank_addr_out 3 bank_addr_weights 43 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 3 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 9 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 224 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4  channel_offset 11 prelu_shift_p 0
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 258048
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 272384
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 286720
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 301056
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 315392
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 329728
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 344064
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 358400
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 372736
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 387072
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 401408
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 415744
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 430080
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 444416
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 458752
LOAD 0000 0100 mode 0 bank_addr 896 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 473088
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 448 bank_addr_out 448 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 487424
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 501760
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 516096
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 530432
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 544768
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 559104
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 573440
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 587776
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 602112
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 616448
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 630784
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 645120
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 659456
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 673792
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 688128
LOAD 0000 0100 mode 0 bank_addr 1344 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 702464
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 896 bank_addr_out 896 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 448 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0100 0100 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 448 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 716800
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 731136
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 745472
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 759808
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 774144
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 788480
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 802816
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 817152
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 831488
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 845824
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 860160
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 874496
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 888832
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 903168
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 917504
LOAD 0000 0100 mode 0 bank_addr 1792 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 931840
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 1344 bank_addr_out 1344 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 896 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 896 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 946176
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 960512
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 974848
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 989184
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1003520
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1017856
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1032192
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1046528
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1060864
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1075200
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1089536
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1103872
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1118208
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1132544
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1146880
LOAD 0000 0100 mode 0 bank_addr 2240 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1161216
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 1792 bank_addr_out 1792 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1344 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0100 0100 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1344 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1175552
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1189888
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1204224
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1218560
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1232896
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1247232
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1261568
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1275904
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1290240
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1304576
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1318912
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1333248
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1347584
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1361920
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1376256
LOAD 0000 0100 mode 0 bank_addr 2688 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1390592
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 2240 bank_addr_out 2240 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1404928
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1419264
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1433600
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1447936
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1462272
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1476608
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1490944
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1505280
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1519616
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1533952
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1548288
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1562624
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1576960
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1591296
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1605632
LOAD 0000 0100 mode 0 bank_addr 3136 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1619968
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 2688 bank_addr_out 2688 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2240 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0100 0100 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2240 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1634304
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1648640
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1662976
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1677312
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1691648
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1705984
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1720320
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1734656
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1748992
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1763328
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1777664
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1792000
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1806336
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1820672
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1835008
LOAD 0000 0100 mode 0 bank_addr 3584 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1849344
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 3136 bank_addr_out 3136 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2688 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2688 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1863680
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1878016
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1892352
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1906688
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1921024
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1935360
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1949696
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1964032
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1978368
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1992704
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2007040
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2021376
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2035712
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2050048
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2064384
LOAD 0000 0100 mode 0 bank_addr 4032 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2078720
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 3584 bank_addr_out 3584 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3136 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0100 0100 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3136 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2093056
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2107392
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2121728
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2136064
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2150400
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2164736
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2179072
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2193408
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2207744
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2222080
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2236416
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2250752
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2265088
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2279424
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2293760
LOAD 0000 0100 mode 0 bank_addr 4480 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2308096
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 4032 bank_addr_out 4032 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2322432
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2336768
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2351104
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2365440
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2379776
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2394112
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2408448
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2422784
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2437120
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2451456
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2465792
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2480128
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2494464
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2508800
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2523136
LOAD 0000 0100 mode 0 bank_addr 4928 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2537472
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 4480 bank_addr_out 4480 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4032 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0100 0100 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4032 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2551808
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2566144
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2580480
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2594816
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2609152
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2623488
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2637824
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2652160
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2666496
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2680832
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2695168
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2709504
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2723840
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2738176
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2752512
LOAD 0000 0100 mode 0 bank_addr 5376 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2766848
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 4928 bank_addr_out 4928 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4480 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4480 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2781184
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2795520
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2809856
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2824192
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2838528
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2852864
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2867200
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2881536
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2895872
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2910208
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2924544
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2938880
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2953216
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2967552
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2981888
LOAD 0000 0100 mode 0 bank_addr 5824 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2996224
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 5376 bank_addr_out 5376 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4928 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0100 0100 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4928 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 3
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 2 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3010560
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3024896
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 3 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3039232
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3053568
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 4 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3067904
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3082240
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 5 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3096576
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3110912
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 6 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3125248
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3139584
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 7 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3153920
LOAD 0000 0000 mode 0 bank_addr 6272 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3168256
LOAD 0000 0000 mode 0 bank_addr 6496 bank_id 0 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3182592
LOAD 0000 0100 mode 0 bank_addr 6272 bank_id 1 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3196928
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 4 bank_id_in 0 bank_id_out 8 bank_addr_in 5824 bank_addr_out 5824 bank_addr_weights 1 bank_addr_bias 0 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5824 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0100 pad_top 0 pad_bottom 1 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5824 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 3
###### conv1 end ######
###### res2a_branch1 start ######
LOAD 0000 0000 mode 1 bank_addr 197 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 14592
LOAD 0000 0100 mode 1 bank_addr 201 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 15616
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 201 bank_addr_bias 197 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 224 bank_addr_out 896 bank_addr_weights 201 bank_addr_bias 197 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 448 bank_addr_out 1792 bank_addr_weights 201 bank_addr_bias 197 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 672 bank_addr_out 2688 bank_addr_weights 201 bank_addr_bias 197 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 201 bank_addr_bias 197 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 1120 bank_addr_out 4480 bank_addr_weights 201 bank_addr_bias 197 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 1344 bank_addr_out 5376 bank_addr_weights 201 bank_addr_bias 197 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
###### res2a_branch1 end ######
###### res2a_branch2a start ######
LOAD 0000 0000 mode 1 bank_addr 265 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 32000
LOAD 0000 0100 mode 1 bank_addr 266 bank_id 0 jump_read 64 jump_write 4 length 4 channel 64 reg_id 3 ddr_addr 32256
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 266 bank_addr_bias 265 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 224 bank_addr_out 224 bank_addr_weights 266 bank_addr_bias 265 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 448 bank_addr_out 448 bank_addr_weights 266 bank_addr_bias 265 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 672 bank_addr_out 672 bank_addr_weights 266 bank_addr_bias 265 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 896 bank_addr_weights 266 bank_addr_bias 265 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1120 bank_addr_out 1120 bank_addr_weights 266 bank_addr_bias 265 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1344 bank_addr_out 1344 bank_addr_weights 266 bank_addr_bias 265 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
###### res2a_branch2a end ######
###### res2a_branch2b start ######
LOAD 0000 0000 mode 1 bank_addr 282 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 36352
LOAD 0000 0100 mode 1 bank_addr 283 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 36608
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 7 bank_id_out 16 bank_addr_in 7964 bank_addr_out 0 bank_addr_weights 283 bank_addr_bias 282 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 7 bank_id_out 16 bank_addr_in 8188 bank_addr_out 224 bank_addr_weights 283 bank_addr_bias 282 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 7 bank_id_out 16 bank_addr_in 220 bank_addr_out 448 bank_addr_weights 283 bank_addr_bias 282 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 7 bank_id_out 16 bank_addr_in 444 bank_addr_out 672 bank_addr_weights 283 bank_addr_bias 282 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 7 bank_id_out 16 bank_addr_in 668 bank_addr_out 896 bank_addr_weights 283 bank_addr_bias 282 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 7 bank_id_out 16 bank_addr_in 892 bank_addr_out 1120 bank_addr_weights 283 bank_addr_bias 282 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 7 bank_id_out 16 bank_addr_in 1116 bank_addr_out 1344 bank_addr_weights 283 bank_addr_bias 282 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
###### res2a_branch2b end ######
###### res2a_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 427 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 73472
LOAD 0000 0100 mode 1 bank_addr 431 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 74496
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 431 bank_addr_bias 427 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 224 bank_addr_out 896 bank_addr_weights 431 bank_addr_bias 427 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 14 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 448 bank_addr_out 1792 bank_addr_weights 431 bank_addr_bias 427 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 8 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 10 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 12 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 14 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 672 bank_addr_out 2688 bank_addr_weights 431 bank_addr_bias 427 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 8 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 10 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 12 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 6 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 14 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 431 bank_addr_bias 427 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 0 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 8 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 2 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 10 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 4 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 12 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 6 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 14 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1120 bank_addr_out 4480 bank_addr_weights 431 bank_addr_bias 427 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 0 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 8 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 2 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 10 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 4 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 12 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 6 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 14 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1344 bank_addr_out 5376 bank_addr_weights 431 bank_addr_bias 427 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 0 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 8 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 2 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 10 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 4 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 12 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 6 shift_read 2 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 1 bank_id_out 14 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res2a_branch2c end ######
###### res2b_branch2a start ######
LOAD 0000 0000 mode 1 bank_addr 495 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 90880
LOAD 0000 0100 mode 1 bank_addr 496 bank_id 0 jump_read 256 jump_write 16 length 4 channel 256 reg_id 3 ddr_addr 91136
###### res2b_branch2b start ######
LOAD 0000 0000 mode 1 bank_addr 560 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 107520
LOAD 0000 0100 mode 1 bank_addr 561 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 107776
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 496 bank_addr_bias 495 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 496 bank_addr_bias 495 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3868 bank_addr_out 2048 bank_addr_weights 561 bank_addr_bias 560 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 496 bank_addr_bias 495 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4092 bank_addr_out 2272 bank_addr_weights 561 bank_addr_bias 560 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 496 bank_addr_bias 495 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 220 bank_addr_out 2496 bank_addr_weights 561 bank_addr_bias 560 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 3584 bank_addr_out 896 bank_addr_weights 496 bank_addr_bias 495 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 444 bank_addr_out 2720 bank_addr_weights 561 bank_addr_bias 560 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 4480 bank_addr_out 1120 bank_addr_weights 496 bank_addr_bias 495 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 668 bank_addr_out 2944 bank_addr_weights 561 bank_addr_bias 560 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 5376 bank_addr_out 1344 bank_addr_weights 496 bank_addr_bias 495 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 892 bank_addr_out 3168 bank_addr_weights 561 bank_addr_bias 560 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1116 bank_addr_out 3392 bank_addr_weights 561 bank_addr_bias 560 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
###### res2b_branch2b end ######
###### res2b_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 705 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 144640
LOAD 0000 0100 mode 1 bank_addr 709 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 145664
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 5 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 709 bank_addr_bias 705 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 709 bank_addr_bias 705 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2496 bank_addr_out 1792 bank_addr_weights 709 bank_addr_bias 705 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2720 bank_addr_out 2688 bank_addr_weights 709 bank_addr_bias 705 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2944 bank_addr_out 3584 bank_addr_weights 709 bank_addr_bias 705 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3168 bank_addr_out 4480 bank_addr_weights 709 bank_addr_bias 705 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3392 bank_addr_out 5376 bank_addr_weights 709 bank_addr_bias 705 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res2b_branch2c end ######
###### res2c_branch2a start ######
LOAD 0000 0000 mode 1 bank_addr 773 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 162048
LOAD 0000 0100 mode 1 bank_addr 774 bank_id 0 jump_read 256 jump_write 16 length 4 channel 256 reg_id 3 ddr_addr 162304
###### res2c_branch2b start ######
LOAD 0000 0000 mode 1 bank_addr 838 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 178688
LOAD 0000 0100 mode 1 bank_addr 839 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 178944
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 774 bank_addr_bias 773 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 774 bank_addr_bias 773 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3868 bank_addr_out 2048 bank_addr_weights 839 bank_addr_bias 838 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 774 bank_addr_bias 773 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4092 bank_addr_out 2272 bank_addr_weights 839 bank_addr_bias 838 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 774 bank_addr_bias 773 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 220 bank_addr_out 2496 bank_addr_weights 839 bank_addr_bias 838 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 3584 bank_addr_out 896 bank_addr_weights 774 bank_addr_bias 773 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 444 bank_addr_out 2720 bank_addr_weights 839 bank_addr_bias 838 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 4480 bank_addr_out 1120 bank_addr_weights 774 bank_addr_bias 773 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 668 bank_addr_out 2944 bank_addr_weights 839 bank_addr_bias 838 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 5376 bank_addr_out 1344 bank_addr_weights 774 bank_addr_bias 773 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 892 bank_addr_out 3168 bank_addr_weights 839 bank_addr_bias 838 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1116 bank_addr_out 3392 bank_addr_weights 839 bank_addr_bias 838 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
###### res2c_branch2b end ######
###### res2c_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 983 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 215808
LOAD 0000 0100 mode 1 bank_addr 987 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 216832
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 5 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 987 bank_addr_bias 983 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 17 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 19 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 987 bank_addr_bias 983 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 21 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 23 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2496 bank_addr_out 1792 bank_addr_weights 987 bank_addr_bias 983 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 17 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 19 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2720 bank_addr_out 2688 bank_addr_weights 987 bank_addr_bias 983 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 21 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 23 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2944 bank_addr_out 3584 bank_addr_weights 987 bank_addr_bias 983 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 17 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 19 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3168 bank_addr_out 4480 bank_addr_weights 987 bank_addr_bias 983 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 21 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4480
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 23 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3392 bank_addr_out 5376 bank_addr_weights 987 bank_addr_bias 983 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 17 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 5376
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 19 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
###### res2c_branch2c end ######
###### res3a_branch1 start ######
LOAD 0000 0000 mode 1 bank_addr 1051 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 233216
LOAD 0000 0100 mode 1 bank_addr 1059 bank_id 0 jump_read 256 jump_write 16 length 32 channel 256 reg_id 3 ddr_addr 235264
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 2 act_type 0 jump_write 32 jump_write_endl 896 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 32  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 1059 bank_addr_bias 1051 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 896 bank_addr_weights 1059 bank_addr_bias 1051 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1792 bank_addr_out 1792 bank_addr_weights 1059 bank_addr_bias 1051 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2688 bank_addr_out 2688 bank_addr_weights 1059 bank_addr_bias 1051 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
###### res3a_branch1 end ######
###### res3a_branch2a start ######
LOAD 0000 0000 mode 1 bank_addr 1571 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 366336
LOAD 0000 0100 mode 1 bank_addr 1573 bank_id 0 jump_read 256 jump_write 16 length 8 channel 256 reg_id 3 ddr_addr 366848
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 8 jump_write_endl 224 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 1573 bank_addr_bias 1571 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 1573 bank_addr_bias 1571 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 1573 bank_addr_bias 1571 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 1573 bank_addr_bias 1571 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
###### res3a_branch2a end ######
###### res3a_branch2b start ######
LOAD 0000 0000 mode 1 bank_addr 1701 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 399616
LOAD 0000 0100 mode 1 bank_addr 1703 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 400128
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 15 bank_id_out 8 bank_addr_in 7960 bank_addr_out 2048 bank_addr_weights 1703 bank_addr_bias 1701 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 15 bank_id_out 8 bank_addr_in 8184 bank_addr_out 2272 bank_addr_weights 1703 bank_addr_bias 1701 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 15 bank_id_out 8 bank_addr_in 216 bank_addr_out 2496 bank_addr_weights 1703 bank_addr_bias 1701 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 15 bank_id_out 8 bank_addr_in 440 bank_addr_out 2720 bank_addr_weights 1703 bank_addr_bias 1701 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
###### res3a_branch2b end ######
###### res3a_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 2279 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 547584
LOAD 0000 0100 mode 1 bank_addr 2287 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 549632
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2048 bank_addr_out 4096 bank_addr_weights 2287 bank_addr_bias 2279 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2272 bank_addr_out 4992 bank_addr_weights 2287 bank_addr_bias 2279 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4992
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4992
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4992
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 4992
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2496 bank_addr_out 5888 bank_addr_weights 2287 bank_addr_bias 2279 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 5888
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 5888
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 5888
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 5888
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2720 bank_addr_out 6784 bank_addr_weights 2287 bank_addr_bias 2279 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 6784
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 6784
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res3a_branch2c end ######
###### res3b_branch2a start ######
LOAD 0000 0000 mode 1 bank_addr 2543 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 615168
LOAD 0000 0100 mode 1 bank_addr 2545 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 615680
###### res3b_branch2b start ######
LOAD 0000 0000 mode 1 bank_addr 2801 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 681216
LOAD 0000 0100 mode 1 bank_addr 2803 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 681728
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 2545 bank_addr_bias 2543 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 2545 bank_addr_bias 2543 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3864 bank_addr_out 2048 bank_addr_weights 2803 bank_addr_bias 2801 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 2545 bank_addr_bias 2543 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4088 bank_addr_out 2272 bank_addr_weights 2803 bank_addr_bias 2801 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 2545 bank_addr_bias 2543 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 216 bank_addr_out 2496 bank_addr_weights 2803 bank_addr_bias 2801 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 440 bank_addr_out 2720 bank_addr_weights 2803 bank_addr_bias 2801 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
###### res3b_branch2b end ######
###### res3b_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 3379 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 829184
LOAD 0000 0100 mode 1 bank_addr 3387 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 831232
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 3387 bank_addr_bias 3379 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 3387 bank_addr_bias 3379 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2496 bank_addr_out 1792 bank_addr_weights 3387 bank_addr_bias 3379 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2720 bank_addr_out 2688 bank_addr_weights 3387 bank_addr_bias 3379 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res3b_branch2c end ######
###### res3c_branch2a start ######
LOAD 0000 0000 mode 1 bank_addr 3643 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 896768
LOAD 0000 0100 mode 1 bank_addr 3645 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 897280
###### res3c_branch2b start ######
LOAD 0000 0000 mode 1 bank_addr 3901 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 962816
LOAD 0000 0100 mode 1 bank_addr 3903 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 963328
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 3645 bank_addr_bias 3643 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 3645 bank_addr_bias 3643 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3864 bank_addr_out 2048 bank_addr_weights 3903 bank_addr_bias 3901 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 3645 bank_addr_bias 3643 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4088 bank_addr_out 2272 bank_addr_weights 3903 bank_addr_bias 3901 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 3645 bank_addr_bias 3643 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 216 bank_addr_out 2496 bank_addr_weights 3903 bank_addr_bias 3901 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 440 bank_addr_out 2720 bank_addr_weights 3903 bank_addr_bias 3901 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
###### res3c_branch2b end ######
###### res3c_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 4479 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 1110784
LOAD 0000 0100 mode 1 bank_addr 4487 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 1112832
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 4487 bank_addr_bias 4479 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 4487 bank_addr_bias 4479 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2496 bank_addr_out 1792 bank_addr_weights 4487 bank_addr_bias 4479 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 12 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 14 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2720 bank_addr_out 2688 bank_addr_weights 4487 bank_addr_bias 4479 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 8 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 32 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 1 bank_id_out 10 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res3c_branch2c end ######
###### res3d_branch2a start ######
LOAD 0000 0000 mode 1 bank_addr 4743 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1178368
LOAD 0000 0100 mode 1 bank_addr 4745 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 1178880
###### res3d_branch2b start ######
LOAD 0000 0000 mode 1 bank_addr 5001 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1244416
LOAD 0000 0100 mode 1 bank_addr 5003 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 1244928
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 4745 bank_addr_bias 4743 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 4745 bank_addr_bias 4743 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3864 bank_addr_out 2048 bank_addr_weights 5003 bank_addr_bias 5001 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 4745 bank_addr_bias 4743 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4088 bank_addr_out 2272 bank_addr_weights 5003 bank_addr_bias 5001 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 4745 bank_addr_bias 4743 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 216 bank_addr_out 2496 bank_addr_weights 5003 bank_addr_bias 5001 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 440 bank_addr_out 2720 bank_addr_weights 5003 bank_addr_bias 5001 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
###### res3d_branch2b end ######
###### res3d_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 5579 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 1392384
LOAD 0000 0100 mode 1 bank_addr 5587 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 1394432
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 5587 bank_addr_bias 5579 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 16 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 17 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 18 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 19 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 5587 bank_addr_bias 5579 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 20 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 21 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 22 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 23 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2496 bank_addr_out 1792 bank_addr_weights 5587 bank_addr_bias 5579 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 16 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 17 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 18 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 19 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2720 bank_addr_out 2688 bank_addr_weights 5587 bank_addr_bias 5579 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 20 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 2688
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 21 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
###### res3d_branch2c end ######
###### res4a_branch2a start ######
LOAD 0000 0000 mode 1 bank_addr 5843 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 1988352
LOAD 0000 0100 mode 1 bank_addr 5847 bank_id 0 jump_read 512 jump_write 32 length 16 channel 512 reg_id 3 ddr_addr 1989376
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 16 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 5847 bank_addr_bias 5843 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 5847 bank_addr_bias 5843 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4a_branch2a end ######
###### res4a_branch2b start ######
LOAD 0100 0000 mode 1 bank_addr 6359 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 2120448
LOAD 0000 0100 mode 1 bank_addr 6363 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 2121472
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 15 bank_id_out 8 bank_addr_in 7952 bank_addr_out 2048 bank_addr_weights 6363 bank_addr_bias 6359 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 15 bank_id_out 8 bank_addr_in 8176 bank_addr_out 2272 bank_addr_weights 6363 bank_addr_bias 6359 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4a_branch2b end ######
###### res4a_branch2c start ######
LOAD 0100 0000 mode 1 bank_addr 475 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 2711296
LOAD 0000 0100 mode 1 bank_addr 491 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 2715392
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2048 bank_addr_out 4096 bank_addr_weights 491 bank_addr_bias 475 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2272 bank_addr_out 4992 bank_addr_weights 491 bank_addr_bias 475 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4a_branch2c end ######
###### res4a_branch1 start ######
LOAD 0100 0000 mode 1 bank_addr 1515 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 1459968
LOAD 0000 0100 mode 1 bank_addr 1531 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 1464064
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 2 act_type 0 jump_write 64 jump_write_endl 896 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 1531 bank_addr_bias 1515 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 896 bank_addr_weights 1531 bank_addr_bias 1515 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 4992
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 4992
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 4992
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res4a_branch1 end ######
###### res4b_branch2a start ######
LOAD 0100 0000 mode 1 bank_addr 3579 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 2977536
LOAD 0000 0100 mode 1 bank_addr 3583 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 2978560
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 3583 bank_addr_bias 3579 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 3583 bank_addr_bias 3579 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4b_branch2a end ######
###### res4b_branch2b start ######
LOAD 0100 0000 mode 1 bank_addr 4607 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 3240704
LOAD 0000 0100 mode 1 bank_addr 4611 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 3241728
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3856 bank_addr_out 2048 bank_addr_weights 4611 bank_addr_bias 4607 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 4080 bank_addr_out 2272 bank_addr_weights 4611 bank_addr_bias 4607 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4b_branch2b end ######
###### res4b_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 6915 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 3831552
LOAD 0000 0100 mode 1 bank_addr 6931 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 3835648
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 6931 bank_addr_bias 6915 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 6931 bank_addr_bias 6915 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res4b_branch2c end ######
###### res4c_branch2a start ######
LOAD 0100 0000 mode 1 bank_addr 7955 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 4097792
LOAD 0000 0100 mode 1 bank_addr 7959 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 4098816
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 7959 bank_addr_bias 7955 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 7959 bank_addr_bias 7955 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4c_branch2a end ######
###### res4c_branch2b start ######
LOAD 0100 0000 mode 1 bank_addr 791 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 4360960
LOAD 0000 0100 mode 1 bank_addr 795 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 4361984
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3856 bank_addr_out 2048 bank_addr_weights 795 bank_addr_bias 791 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 4080 bank_addr_out 2272 bank_addr_weights 795 bank_addr_bias 791 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4c_branch2b end ######
###### res4c_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 3099 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 4951808
LOAD 0100 0100 mode 1 bank_addr 3115 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 4955904
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 3115 bank_addr_bias 3099 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 3115 bank_addr_bias 3099 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res4c_branch2c end ######
###### res4d_branch2a start ######
LOAD 0100 0000 mode 1 bank_addr 4139 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 5218048
LOAD 0000 0100 mode 1 bank_addr 4143 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 5219072
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 4143 bank_addr_bias 4139 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 4143 bank_addr_bias 4139 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4d_branch2a end ######
###### res4d_branch2b start ######
LOAD 0100 0000 mode 1 bank_addr 5167 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 5481216
LOAD 0000 0100 mode 1 bank_addr 5171 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 5482240
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3856 bank_addr_out 2048 bank_addr_weights 5171 bank_addr_bias 5167 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 4080 bank_addr_out 2272 bank_addr_weights 5171 bank_addr_bias 5167 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4d_branch2b end ######
###### res4d_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 7475 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 6072064
LOAD 0100 0100 mode 1 bank_addr 7491 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 6076160
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 7491 bank_addr_bias 7475 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 7491 bank_addr_bias 7475 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res4d_branch2c end ######
###### res4e_branch2a start ######
LOAD 0100 0000 mode 1 bank_addr 323 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 6338304
LOAD 0000 0100 mode 1 bank_addr 327 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 6339328
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 327 bank_addr_bias 323 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 327 bank_addr_bias 323 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4e_branch2a end ######
###### res4e_branch2b start ######
LOAD 0100 0000 mode 1 bank_addr 1351 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 6601472
LOAD 0000 0100 mode 1 bank_addr 1355 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 6602496
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3856 bank_addr_out 2048 bank_addr_weights 1355 bank_addr_bias 1351 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 4080 bank_addr_out 2272 bank_addr_weights 1355 bank_addr_bias 1351 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4e_branch2b end ######
###### res4e_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 3659 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 7192320
LOAD 0100 0100 mode 1 bank_addr 3675 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 7196416
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 3675 bank_addr_bias 3659 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 3675 bank_addr_bias 3659 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 8 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 10 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 64 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 1 bank_id_out 12 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res4e_branch2c end ######
###### res4f_branch2a start ######
LOAD 0100 0000 mode 1 bank_addr 4699 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 7458560
LOAD 0000 0100 mode 1 bank_addr 4703 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 7459584
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 4703 bank_addr_bias 4699 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 1000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 4703 bank_addr_bias 4699 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4f_branch2a end ######
###### res4f_branch2b start ######
LOAD 0100 0000 mode 1 bank_addr 5727 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 7721728
LOAD 0000 0100 mode 1 bank_addr 5731 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 7722752
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16  channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3856 bank_addr_out 2048 bank_addr_weights 5731 bank_addr_bias 5727 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 4080 bank_addr_out 2272 bank_addr_weights 5731 bank_addr_bias 5727 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
###### res4f_branch2b end ######
###### res4f_branch2c start ######
LOAD 0000 0000 mode 1 bank_addr 8035 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 8312576
LOAD 0100 0100 mode 1 bank_addr 8051 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 8316672
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64  channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 8051 bank_addr_bias 8035 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 16 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
LOAD 0100 0000 mode 1 bank_addr 883 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 10684160
LOAD 0000 0100 mode 1 bank_addr 891 bank_id 0 jump_read 1024 jump_write 64 length 32 channel 1024 reg_id 3 ddr_addr 10686208
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 17 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 18 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 19 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 8  channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 896 bank_addr_weights 8051 bank_addr_bias 8035 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 2939 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 11210496
LOAD 0000 0100 mode 1 bank_addr 2941 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 11212544
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 21 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 904 bank_addr_weights 8179 bank_addr_bias 8037 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 5245 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 11211008
LOAD 0000 0100 mode 1 bank_addr 5247 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 11802368
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 904
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 904
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 8 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 904
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 904
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 21 bank_addr_out 8 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 904
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 904
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 8 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 912 bank_addr_weights 115 bank_addr_bias 8039 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 912
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 912
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 912
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 912
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 21 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 912
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 912
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 920 bank_addr_weights 243 bank_addr_bias 8041 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 920
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 920
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 24 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 920
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 920
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 21 bank_addr_out 24 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 920
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 920
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 24 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 928 bank_addr_weights 371 bank_addr_bias 8043 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 928
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 928
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 928
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 928
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 21 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 928
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 928
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 936 bank_addr_weights 499 bank_addr_bias 8045 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 936
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 936
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 40 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 936
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 936
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 21 bank_addr_out 40 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 936
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 936
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 40 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 944 bank_addr_weights 627 bank_addr_bias 8047 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 944
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 944
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 944
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 944
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 21 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 944
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 944
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2272 bank_addr_out 952 bank_addr_weights 755 bank_addr_bias 8049 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 952
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 952
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 56 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 952
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 952
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 21 bank_addr_out 56 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 952
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 952
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 56 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 8 shift_write 33 shift_write_prelu_n 0 stride_out 2 stride_offset_out 0
###### res4f_branch2c end ######
###### res5a_branch2a start ######
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 2 act_type 1 jump_write 32 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 32  channel_offset 0 prelu_shift_p 0
CONV 1001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 891 bank_addr_bias 883 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
###### res5a_branch2a end ######
###### res5a_branch2b start ######
LOAD 0100 0000 mode 1 bank_addr 7551 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 11211520
LOAD 0000 0100 mode 1 bank_addr 7553 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 12392192
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 15 bank_id_out 8 bank_addr_in 7936 bank_addr_out 2048 bank_addr_weights 2941 bank_addr_bias 2939 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 15 bank_id_out 8 bank_addr_in 7936 bank_addr_out 2056 bank_addr_weights 5247 bank_addr_bias 5245 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 1665 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 11212032
LOAD 0000 0100 mode 1 bank_addr 1667 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 12982016
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 15 bank_id_out 8 bank_addr_in 7936 bank_addr_out 2064 bank_addr_weights 7553 bank_addr_bias 7551 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 15 bank_id_out 8 bank_addr_in 7936 bank_addr_out 2072 bank_addr_weights 1667 bank_addr_bias 1665 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
###### res5a_branch2b end ######
###### res5a_branch2c start ######
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 64  channel_offset 0 prelu_shift_p 0
LOAD 0100 0000 mode 1 bank_addr 3971 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 13571840
LOAD 0000 0100 mode 1 bank_addr 3987 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 13580032
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2048 bank_addr_out 4096 bank_addr_weights 3987 bank_addr_bias 3971 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 6035 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 13575936
LOAD 0000 0100 mode 1 bank_addr 6051 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 14104320
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2048 bank_addr_out 4160 bank_addr_weights 6051 bank_addr_bias 6035 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
###### res5a_branch2c end ######
###### res5a_branch1 start ######
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 2 act_type 0 jump_write 128 jump_write_endl 896 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 32 channel_offset 0 prelu_shift_p 0
LOAD 0100 0000 mode 1 bank_addr 8099 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 8578816
LOAD 0000 0100 mode 1 bank_addr 8107 bank_id 0 jump_read 1024 jump_write 64 length 32 channel 1024 reg_id 3 ddr_addr 8587008
CONV 0001 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 8107 bank_addr_bias 8099 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
LOAD 0100 0000 mode 1 bank_addr 1963 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 8580864
LOAD 0000 0100 mode 1 bank_addr 1971 bank_id 0 jump_read 1024 jump_write 64 length 32 channel 1024 reg_id 3 ddr_addr 9111296
LOAD 0100 0000 mode 1 bank_addr 4019 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 8582912
LOAD 0000 0100 mode 1 bank_addr 4027 bank_id 0 jump_read 1024 jump_write 64 length 32 channel 1024 reg_id 3 ddr_addr 9635584
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4096
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0001 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 32 bank_addr_weights 1971 bank_addr_bias 1963 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4128
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4128
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4128
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4128
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
LOAD 0100 0000 mode 1 bank_addr 6075 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 8584960
LOAD 0000 0100 mode 1 bank_addr 6083 bank_id 0 jump_read 1024 jump_write 64 length 32 channel 1024 reg_id 3 ddr_addr 10159872
CONV 0001 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 64 bank_addr_weights 4027 bank_addr_bias 4019 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4160
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4160
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4160
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4160
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 2 act_type 0 jump_write 128 jump_write_endl 896 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 96 bank_addr_weights 6083 bank_addr_bias 6075 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 8131 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 14628608
LOAD 0000 0100 mode 1 bank_addr 8135 bank_id 0 jump_read 2048 jump_write 128 length 16 channel 2048 reg_id 3 ddr_addr 14630656
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4192
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4192
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4192
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4192
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 100 bank_addr_weights 6339 bank_addr_bias 6076 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 1991 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 14629632
LOAD 0000 0100 mode 1 bank_addr 1995 bank_id 0 jump_read 2048 jump_write 128 length 16 channel 2048 reg_id 3 ddr_addr 15154944
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 100
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4196
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 100 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 100
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4196
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 100 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 100
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4196
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 100 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 100
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4196
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 100 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 104 bank_addr_weights 6595 bank_addr_bias 6077 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 104
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4200
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 104 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 104
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4200
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 104 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 104
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4200
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 104 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 104
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4200
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 104 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 108 bank_addr_weights 6851 bank_addr_bias 6078 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 108
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4204
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 108 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 108
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4204
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 108 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 108
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4204
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 108 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 108
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4204
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 108 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 112 bank_addr_weights 7107 bank_addr_bias 6079 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4208
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4208
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4208
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4208
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 116 bank_addr_weights 7363 bank_addr_bias 6080 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 116
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4212
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 116 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 116
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4212
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 116 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 116
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4212
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 116 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 116
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4212
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 116 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 120 bank_addr_weights 7619 bank_addr_bias 6081 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 120
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4216
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 120 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 120
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4216
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 120 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 120
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4216
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 120 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 120
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4216
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 120 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 124 bank_addr_weights 7875 bank_addr_bias 6082 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 124
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4220
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 124 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 124
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4220
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 124 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 124
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4220
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 124 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 1 id 0 bank_addr_in 124
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 128 jump_read_endl 1 id 1 bank_addr_in 4220
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 124 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res5a_branch1 end ######
###### res5b_branch2a start ######
LOAD 0100 0000 mode 1 bank_addr 4043 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 15679232
LOAD 0000 0100 mode 1 bank_addr 4045 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 15681280
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 8135 bank_addr_bias 8131 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 16 bank_addr_weights 1995 bank_addr_bias 1991 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
###### res5b_branch2a end ######
###### res5b_branch2b start ######
LOAD 0100 0000 mode 1 bank_addr 6349 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 15679744
LOAD 0000 0100 mode 1 bank_addr 6351 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 16271104
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3840 bank_addr_out 2048 bank_addr_weights 4045 bank_addr_bias 4043 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3840 bank_addr_out 2056 bank_addr_weights 6351 bank_addr_bias 6349 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 463 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 15680256
LOAD 0000 0100 mode 1 bank_addr 465 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 16860928
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3840 bank_addr_out 2064 bank_addr_weights 465 bank_addr_bias 463 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 2769 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 15680768
LOAD 0000 0100 mode 1 bank_addr 2771 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 17450752
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3840 bank_addr_out 2072 bank_addr_weights 2771 bank_addr_bias 2769 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
###### res5b_branch2b end ######
###### res5b_branch2c start ######
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
LOAD 0100 0000 mode 1 bank_addr 5075 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 18040576
LOAD 0000 0100 mode 1 bank_addr 5091 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 18048768
LOAD 0100 0000 mode 1 bank_addr 7139 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 18044672
LOAD 0000 0100 mode 1 bank_addr 7155 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 18573056
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 5091 bank_addr_bias 5075 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 16 bank_addr_weights 5603 bank_addr_bias 5079 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 1011 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 19097344
LOAD 0000 0100 mode 1 bank_addr 1015 bank_id 0 jump_read 2048 jump_write 128 length 16 channel 2048 reg_id 3 ddr_addr 19099392
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 16
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 16
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 16
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 16
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 16
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 16
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 16
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 16
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 32 bank_addr_weights 6115 bank_addr_bias 5083 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 32
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 32
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 32
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 32
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 48 bank_addr_weights 6627 bank_addr_bias 5087 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 48
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 48
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 48
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 48
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 48
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 48
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 48
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 48
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 64 bank_addr_weights 7155 bank_addr_bias 7139 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 64
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 64
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 64
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 64
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
LOAD 0100 0000 mode 1 bank_addr 3063 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 19098368
LOAD 0000 0100 mode 1 bank_addr 3067 bank_id 0 jump_read 2048 jump_write 128 length 16 channel 2048 reg_id 3 ddr_addr 19623680
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 80 bank_addr_weights 7667 bank_addr_bias 7143 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 80
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 80
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 80 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 80
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 80
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 80 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 80
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 80
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 80 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 80
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 80
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 80 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 96 bank_addr_weights 8179 bank_addr_bias 7147 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 96
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 96
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 96
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 96
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 112 bank_addr_weights 499 bank_addr_bias 7151 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 112
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 112
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 112
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 112
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res5b_branch2c end ######
###### res5c_branch2a start ######
LOAD 0100 0000 mode 1 bank_addr 5115 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 20147968
LOAD 0000 0100 mode 1 bank_addr 5117 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 20150016
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 1015 bank_addr_bias 1011 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 16 bank_addr_weights 3067 bank_addr_bias 3063 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
###### res5c_branch2a end ######
###### res5c_branch2b start ######
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3840 bank_addr_out 2048 bank_addr_weights 5117 bank_addr_bias 5115 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 7421 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 20148480
LOAD 0000 0100 mode 1 bank_addr 7423 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 20739840
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3840 bank_addr_out 2056 bank_addr_weights 7423 bank_addr_bias 7421 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 1535 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 20148992
LOAD 0000 0100 mode 1 bank_addr 1537 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 21329664
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3840 bank_addr_out 2064 bank_addr_weights 1537 bank_addr_bias 1535 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0000 mode 1 bank_addr 3841 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 20149504
LOAD 0000 0100 mode 1 bank_addr 3843 bank_id 0 jump_read 512 jump_write 32 length 72 channel 512 reg_id 3 ddr_addr 21919488
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3840 bank_addr_out 2072 bank_addr_weights 3843 bank_addr_bias 3841 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
###### res5c_branch2b end ######
###### res5c_branch2c start ######
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
LOAD 0100 0000 mode 1 bank_addr 6147 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 22509312
LOAD 0000 0100 mode 1 bank_addr 6163 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 22517504
LOAD 0100 0000 mode 1 bank_addr 19 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 22513408
LOAD 0000 0100 mode 1 bank_addr 35 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 23041792
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 0 bank_addr_weights 6163 bank_addr_bias 6147 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 0 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
LOAD 0000 0000 mode 1 bank_addr 2083 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 23566080
LOAD 0000 0100 mode 1 bank_addr 2084 bank_id 0 jump_read 16 jump_write 1 length 49 channel 16 reg_id 3 ddr_addr 23566336
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 16 bank_addr_weights 6675 bank_addr_bias 6151 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 16
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 16
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 16
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 16
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 16
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 16
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 16
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 16
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 16 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 32 bank_addr_weights 7187 bank_addr_bias 6155 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 32
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 32
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 32
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 32
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 32
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 32 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
LOAD 0000 0000 mode 1 bank_addr 2133 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 23578880
LOAD 0000 0000 mode 1 bank_addr 2149 bank_id 0 jump_read 2048 jump_write 128 length 8 channel 2048 reg_id 3 ddr_addr 23582976
LOAD 0100 0000 mode 1 bank_addr 3173 bank_id 0 jump_read 2048 jump_write 128 length 8 channel 2048 reg_id 3 ddr_addr 23845120
LOAD 0000 0000 mode 1 bank_addr 4197 bank_id 0 jump_read 2048 jump_write 128 length 8 channel 2048 reg_id 3 ddr_addr 24107264
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 48 bank_addr_weights 7699 bank_addr_bias 6159 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 48
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 48
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 48
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 48
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 48
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 48
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 48
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 48
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 48 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 64 bank_addr_weights 35 bank_addr_bias 19 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 64
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 64
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 64
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 64
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 64
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 64 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 80 bank_addr_weights 547 bank_addr_bias 23 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0100 0100 mode 1 bank_addr 5221 bank_id 0 jump_read 2048 jump_write 128 length 8 channel 2048 reg_id 3 ddr_addr 24369408
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 80
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 80
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 80 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 80
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 80
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 80 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 80
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 80
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 80 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 80
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 80
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 80 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 96 bank_addr_weights 1059 bank_addr_bias 27 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 96
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 96
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 96
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 96
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 96
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 96 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 0000 1001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2048 bank_addr_out 112 bank_addr_weights 1571 bank_addr_bias 31 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
LOAD 0000 0000 mode 1 bank_addr 6245 bank_id 0 jump_read 2048 jump_write 128 length 8 channel 2048 reg_id 3 ddr_addr 24631552
LOAD 0100 0000 mode 1 bank_addr 7269 bank_id 0 jump_read 2048 jump_write 128 length 8 channel 2048 reg_id 3 ddr_addr 24893696
LOAD 0000 0000 mode 1 bank_addr 101 bank_id 0 jump_read 2048 jump_write 128 length 8 channel 2048 reg_id 3 ddr_addr 25155840
LOAD 0000 0100 mode 1 bank_addr 1125 bank_id 0 jump_read 2048 jump_write 128 length 7 channel 2048 reg_id 3 ddr_addr 25417984
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 112
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 8 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 112
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 10 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 112
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 12 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 112
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 112
ELEW 0000 0100 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 1 bank_id_out 14 bank_addr_out 112 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
###### res5c_branch2c end ######
###### pool5 start ######
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 9 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 128 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 2 stride_out 1 channel_group_in 1 channel_group_out 1 channel_offset 0 prelu_shift_p 0
CONV 1001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 1 bank_addr_out 1 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 2 bank_addr_out 2 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 3 bank_addr_out 3 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 4 bank_addr_out 4 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 5 bank_addr_out 5 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 6 bank_addr_out 6 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 7 bank_addr_out 7 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 8 bank_addr_out 8 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 9 bank_addr_out 9 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 10 bank_addr_out 10 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 11 bank_addr_out 11 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 12 bank_addr_out 12 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 13 bank_addr_out 13 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 14 bank_addr_out 14 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 15 bank_addr_out 15 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 16 bank_addr_out 16 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 17 bank_addr_out 17 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 18 bank_addr_out 18 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 19 bank_addr_out 19 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 20 bank_addr_out 20 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 21 bank_addr_out 21 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 22 bank_addr_out 22 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 23 bank_addr_out 23 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 24 bank_addr_out 24 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 25 bank_addr_out 25 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 26 bank_addr_out 26 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 27 bank_addr_out 27 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 28 bank_addr_out 28 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 29 bank_addr_out 29 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 30 bank_addr_out 30 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 31 bank_addr_out 31 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 32 bank_addr_out 32 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 33 bank_addr_out 33 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 34 bank_addr_out 34 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 35 bank_addr_out 35 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 36 bank_addr_out 36 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 37 bank_addr_out 37 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 38 bank_addr_out 38 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 39 bank_addr_out 39 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 40 bank_addr_out 40 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 41 bank_addr_out 41 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 42 bank_addr_out 42 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 43 bank_addr_out 43 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 44 bank_addr_out 44 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 45 bank_addr_out 45 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 46 bank_addr_out 46 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 47 bank_addr_out 47 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 48 bank_addr_out 48 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 49 bank_addr_out 49 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 50 bank_addr_out 50 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 51 bank_addr_out 51 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 52 bank_addr_out 52 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 53 bank_addr_out 53 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 54 bank_addr_out 54 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 55 bank_addr_out 55 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 56 bank_addr_out 56 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 57 bank_addr_out 57 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 58 bank_addr_out 58 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 59 bank_addr_out 59 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 60 bank_addr_out 60 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 61 bank_addr_out 61 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 62 bank_addr_out 62 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 63 bank_addr_out 63 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 64 bank_addr_out 64 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 65 bank_addr_out 65 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 66 bank_addr_out 66 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 67 bank_addr_out 67 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 68 bank_addr_out 68 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 69 bank_addr_out 69 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 70 bank_addr_out 70 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 71 bank_addr_out 71 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 72 bank_addr_out 72 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 73 bank_addr_out 73 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 74 bank_addr_out 74 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 75 bank_addr_out 75 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 76 bank_addr_out 76 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 77 bank_addr_out 77 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 78 bank_addr_out 78 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 79 bank_addr_out 79 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 80 bank_addr_out 80 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 81 bank_addr_out 81 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 82 bank_addr_out 82 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 83 bank_addr_out 83 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 84 bank_addr_out 84 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 85 bank_addr_out 85 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 86 bank_addr_out 86 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 87 bank_addr_out 87 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 88 bank_addr_out 88 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 89 bank_addr_out 89 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 90 bank_addr_out 90 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 91 bank_addr_out 91 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 92 bank_addr_out 92 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 93 bank_addr_out 93 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 94 bank_addr_out 94 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 95 bank_addr_out 95 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 96 bank_addr_out 96 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 97 bank_addr_out 97 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 98 bank_addr_out 98 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 99 bank_addr_out 99 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 100 bank_addr_out 100 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 101 bank_addr_out 101 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 102 bank_addr_out 102 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 103 bank_addr_out 103 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 104 bank_addr_out 104 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 105 bank_addr_out 105 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 106 bank_addr_out 106 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 107 bank_addr_out 107 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 108 bank_addr_out 108 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 109 bank_addr_out 109 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 110 bank_addr_out 110 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 111 bank_addr_out 111 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 112 bank_addr_out 112 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 113 bank_addr_out 113 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 114 bank_addr_out 114 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 115 bank_addr_out 115 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 116 bank_addr_out 116 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 117 bank_addr_out 117 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 118 bank_addr_out 118 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 119 bank_addr_out 119 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 120 bank_addr_out 120 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 121 bank_addr_out 121 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 122 bank_addr_out 122 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 123 bank_addr_out 123 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 124 bank_addr_out 124 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 125 bank_addr_out 125 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 126 bank_addr_out 126 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 127 bank_addr_out 127 bank_addr_weights 2084 bank_addr_bias 2083 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
###### pool5 end ######
###### fc1000 start ######
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 10 stride_w 1 stride_h 1 act_type 0 jump_write 63 jump_write_endl 63 jump_read 128 jump_read_endl 128 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 2149 bank_addr_bias 2133 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 10 stride_w 1 stride_h 1 act_type 0 jump_write 63 jump_write_endl 63 jump_read 128 jump_read_endl 128 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 31 channel_offset 0 prelu_shift_p 0
CONV 0001 0010 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 32 bank_addr_weights 6245 bank_addr_bias 2141 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
###### fc1000 end ######
SAVE 0100 0010 mode 0 bank_addr 0 bank_id 0 jump_write 1024 jump_read 63 length 1 channel 1000 reg_id 1 ddr_addr 0
END 0010 0000
DUMP 0000 0000 fm 0 w 0 th 0 ddr 1 postfix end
