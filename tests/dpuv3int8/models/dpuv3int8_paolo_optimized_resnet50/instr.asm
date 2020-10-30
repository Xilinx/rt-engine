####### bracket #######
## BEGING 0000 0000 
####### bracket #######
####### input #######
# SOMBODY IS A LAZY BOY   ... missing code for
# input
# Memory_Access(input=-1, parameters=-1, output=-1)
# {212: <bound method BasicCode.gen_fm_par_fm of <SC.HwAbstraction.code_class.BasicCode object at 0x7f7f85227810>>, 232: <bound method BasicCode.gen_fm_ddr_fm of <SC.HwAbstraction.code_class.BasicCode object at 0x7f7f85227810>>, 333: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f7f85227810>>, 332: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f7f85227810>>, 313: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f7f85227810>>, 312: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f7f85227810>>, 213: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f7f85227810>>, 233: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f7f85227810>>}
####### input #######
####### resnet_v1_50/pool1/MaxPool #######
#### Parameters resnet_v1_50/pool1/MaxPool start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 32 jump_write 2 length 28 channel 21 reg_id 3 ddr_addr 0
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/pool1/MaxPool end ######
#### Parameters resnet_v1_50/pool1/MaxPool start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0001 mode 1 bank_addr 56 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 14336
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/pool1/MaxPool end ######
#### resnet_v1_50/pool1/MaxPool OUTPUT SPLIT by h total 15 ####
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 3, 'pad_bottom': 4, 'sync_type': 4}  #### 
##### IN input ddr TensorShapes(batch=4, width=112, height=224, channel=21) (0, 12545) ######
##### TMP resnet_v1_50/conv1/Conv2D fm TensorShapes(batch=4, width=112, height=112, channel=64) (0, 0) ######
##### OUT resnet_v1_50/pool1/MaxPool TensorShapes(batch=4, width=56, height=56, channel=64) (0) (16, 0) Absolute 2 0x0 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 9 parts (counting pading)#####
#### START -3-0 END 6-6 #####
### R  b_id  9 b_add  224 K =   0 (h_0) ->  H_9  ###
LOAD 0001 0000 mode 0 bank_addr 224 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 0
### R  b_id 10 b_add    0 K =   1 (h_1) ->  H_2  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 14336
### R  b_id 10 b_add  224 K =   2 (h_2) ->  H_10  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 28672
### R  b_id 11 b_add    0 K =   3 (h_3) ->  H_3  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 43008
### R  b_id 11 b_add  224 K =   4 (h_4) ->  H_11  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 57344
### R  b_id 12 b_add    0 K =   5 (h_5) ->  H_4  ###
LOAD 0000 0100 mode 0 bank_addr 0 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 71680
#### Load Reshape 6 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  2xCONV(resnet_v1_50/conv1/Conv2D) + 0xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,3)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 3, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 0}  #### 
##### IN input (8, 0) TensorShapes(batch=4, width=112, height=9, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 0) TensorShapes(batch=4, width=112, height=2, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 3 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add  224 K =   0 (h_6) ->  H_12  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 86016
### R  b_id 13 b_add    0 K =   1 (h_7) ->  H_5  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 100352
### R  b_id 13 b_add  224 K =   2 (h_8) ->  H_13  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 114688
### R  b_id 14 b_add    0 K =   3 (h_9) ->  H_6  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 129024
### R  b_id 14 b_add  224 K =   4 (h_10) ->  H_14  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 143360
### R  b_id 15 b_add    0 K =   5 (h_11) ->  H_7  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 157696
### R  b_id 15 b_add  224 K =   6 (h_12) ->  H_15  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 172032
### R  b_id  8 b_add  448 K =   7 (h_13) ->  H_16  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 186368
### R  b_id  8 b_add  672 K =   8 (h_14) ->  H_24  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 200704
### R  b_id  9 b_add  448 K =   9 (h_15) ->  H_17  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 215040
### R  b_id  9 b_add  672 K =  10 (h_16) ->  H_25  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 229376
### R  b_id 10 b_add  448 K =  11 (h_17) ->  H_18  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 243712
### R  b_id 10 b_add  672 K =  12 (h_18) ->  H_26  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 258048
### R  b_id 11 b_add  448 K =  13 (h_19) ->  H_19  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 272384
### R  b_id 11 b_add  672 K =  14 (h_20) ->  H_27  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 286720
### R  b_id 12 b_add  448 K =  15 (h_21) ->  H_20  ###
LOAD 0000 0100 mode 0 bank_addr 448 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 301056
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 1}  #### 
##### IN input (10, 0) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 0) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 0) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (16, 0) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add  672 K =   0 (h_22) ->  H_28  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 315392
### R  b_id 13 b_add  448 K =   1 (h_23) ->  H_21  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 329728
### R  b_id 13 b_add  672 K =   2 (h_24) ->  H_29  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 344064
### R  b_id 14 b_add  448 K =   3 (h_25) ->  H_22  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 358400
### R  b_id 14 b_add  672 K =   4 (h_26) ->  H_30  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 372736
### R  b_id 15 b_add  448 K =   5 (h_27) ->  H_23  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 387072
### R  b_id 15 b_add  672 K =   6 (h_28) ->  H_31  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 401408
### R  b_id  8 b_add  896 K =   7 (h_29) ->  H_32  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 415744
### R  b_id  8 b_add 1120 K =   8 (h_30) ->  H_40  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 430080
### R  b_id  9 b_add  896 K =   9 (h_31) ->  H_33  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 444416
### R  b_id  9 b_add 1120 K =  10 (h_32) ->  H_41  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 458752
### R  b_id 10 b_add  896 K =  11 (h_33) ->  H_34  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 473088
### R  b_id 10 b_add 1120 K =  12 (h_34) ->  H_42  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 487424
### R  b_id 11 b_add  896 K =  13 (h_35) ->  H_35  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 501760
### R  b_id 11 b_add 1120 K =  14 (h_36) ->  H_43  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 516096
### R  b_id 12 b_add  896 K =  15 (h_37) ->  H_36  ###
LOAD 0000 0100 mode 0 bank_addr 896 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 530432
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 2}  #### 
##### IN input (10, 448) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 448) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 448 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 448) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (20, 0) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 448 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 448 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 1120 K =   0 (h_38) ->  H_44  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 544768
### R  b_id 13 b_add  896 K =   1 (h_39) ->  H_37  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 559104
### R  b_id 13 b_add 1120 K =   2 (h_40) ->  H_45  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 573440
### R  b_id 14 b_add  896 K =   3 (h_41) ->  H_38  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 587776
### R  b_id 14 b_add 1120 K =   4 (h_42) ->  H_46  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 602112
### R  b_id 15 b_add  896 K =   5 (h_43) ->  H_39  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 616448
### R  b_id 15 b_add 1120 K =   6 (h_44) ->  H_47  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 630784
### R  b_id  8 b_add 1344 K =   7 (h_45) ->  H_48  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 645120
### R  b_id  8 b_add 1568 K =   8 (h_46) ->  H_56  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 659456
### R  b_id  9 b_add 1344 K =   9 (h_47) ->  H_49  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 673792
### R  b_id  9 b_add 1568 K =  10 (h_48) ->  H_57  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 688128
### R  b_id 10 b_add 1344 K =  11 (h_49) ->  H_50  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 702464
### R  b_id 10 b_add 1568 K =  12 (h_50) ->  H_58  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 716800
### R  b_id 11 b_add 1344 K =  13 (h_51) ->  H_51  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 731136
### R  b_id 11 b_add 1568 K =  14 (h_52) ->  H_59  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 745472
### R  b_id 12 b_add 1344 K =  15 (h_53) ->  H_52  ###
LOAD 0000 0100 mode 0 bank_addr 1344 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 759808
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 3}  #### 
##### IN input (10, 896) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 896) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 896 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 896) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (16, 224) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 896 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 896 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 1568 K =   0 (h_54) ->  H_60  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 774144
### R  b_id 13 b_add 1344 K =   1 (h_55) ->  H_53  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 788480
### R  b_id 13 b_add 1568 K =   2 (h_56) ->  H_61  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 802816
### R  b_id 14 b_add 1344 K =   3 (h_57) ->  H_54  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 817152
### R  b_id 14 b_add 1568 K =   4 (h_58) ->  H_62  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 831488
### R  b_id 15 b_add 1344 K =   5 (h_59) ->  H_55  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 845824
### R  b_id 15 b_add 1568 K =   6 (h_60) ->  H_63  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 860160
### R  b_id  8 b_add 1792 K =   7 (h_61) ->  H_64  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 874496
### R  b_id  8 b_add 2016 K =   8 (h_62) ->  H_72  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 888832
### R  b_id  9 b_add 1792 K =   9 (h_63) ->  H_65  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 903168
### R  b_id  9 b_add 2016 K =  10 (h_64) ->  H_73  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 917504
### R  b_id 10 b_add 1792 K =  11 (h_65) ->  H_66  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 931840
### R  b_id 10 b_add 2016 K =  12 (h_66) ->  H_74  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 946176
### R  b_id 11 b_add 1792 K =  13 (h_67) ->  H_67  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 960512
### R  b_id 11 b_add 2016 K =  14 (h_68) ->  H_75  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 974848
### R  b_id 12 b_add 1792 K =  15 (h_69) ->  H_68  ###
LOAD 0000 0100 mode 0 bank_addr 1792 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 989184
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 4}  #### 
##### IN input (10, 1344) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 1344) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 1344 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 1344) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (20, 224) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1344 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1344 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 4 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 5 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 2016 K =   0 (h_70) ->  H_76  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1003520
### R  b_id 13 b_add 1792 K =   1 (h_71) ->  H_69  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1017856
### R  b_id 13 b_add 2016 K =   2 (h_72) ->  H_77  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1032192
### R  b_id 14 b_add 1792 K =   3 (h_73) ->  H_70  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1046528
### R  b_id 14 b_add 2016 K =   4 (h_74) ->  H_78  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1060864
### R  b_id 15 b_add 1792 K =   5 (h_75) ->  H_71  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1075200
### R  b_id 15 b_add 2016 K =   6 (h_76) ->  H_79  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1089536
### R  b_id  8 b_add 2240 K =   7 (h_77) ->  H_80  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1103872
### R  b_id  8 b_add 2464 K =   8 (h_78) ->  H_88  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1118208
### R  b_id  9 b_add 2240 K =   9 (h_79) ->  H_81  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1132544
### R  b_id  9 b_add 2464 K =  10 (h_80) ->  H_89  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1146880
### R  b_id 10 b_add 2240 K =  11 (h_81) ->  H_82  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1161216
### R  b_id 10 b_add 2464 K =  12 (h_82) ->  H_90  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1175552
### R  b_id 11 b_add 2240 K =  13 (h_83) ->  H_83  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1189888
### R  b_id 11 b_add 2464 K =  14 (h_84) ->  H_91  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1204224
### R  b_id 12 b_add 2240 K =  15 (h_85) ->  H_84  ###
LOAD 0000 0100 mode 0 bank_addr 2240 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1218560
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 5}  #### 
##### IN input (10, 1792) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 1792) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 1792 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 1792) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (16, 448) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 5 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 6 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 2464 K =   0 (h_86) ->  H_92  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1232896
### R  b_id 13 b_add 2240 K =   1 (h_87) ->  H_85  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1247232
### R  b_id 13 b_add 2464 K =   2 (h_88) ->  H_93  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1261568
### R  b_id 14 b_add 2240 K =   3 (h_89) ->  H_86  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1275904
### R  b_id 14 b_add 2464 K =   4 (h_90) ->  H_94  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1290240
### R  b_id 15 b_add 2240 K =   5 (h_91) ->  H_87  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1304576
### R  b_id 15 b_add 2464 K =   6 (h_92) ->  H_95  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1318912
### R  b_id  8 b_add 2688 K =   7 (h_93) ->  H_96  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1333248
### R  b_id  8 b_add 2912 K =   8 (h_94) ->  H_104  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1347584
### R  b_id  9 b_add 2688 K =   9 (h_95) ->  H_97  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1361920
### R  b_id  9 b_add 2912 K =  10 (h_96) ->  H_105  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1376256
### R  b_id 10 b_add 2688 K =  11 (h_97) ->  H_98  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1390592
### R  b_id 10 b_add 2912 K =  12 (h_98) ->  H_106  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1404928
### R  b_id 11 b_add 2688 K =  13 (h_99) ->  H_99  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1419264
### R  b_id 11 b_add 2912 K =  14 (h_100) ->  H_107  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1433600
### R  b_id 12 b_add 2688 K =  15 (h_101) ->  H_100  ###
LOAD 0000 0100 mode 0 bank_addr 2688 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1447936
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 6}  #### 
##### IN input (10, 2240) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 2240) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 2240 bank_addr_out 2240 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 2240) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (20, 448) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2240 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2240 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 6 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 7 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 2912 K =   0 (h_102) ->  H_108  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1462272
### R  b_id 13 b_add 2688 K =   1 (h_103) ->  H_101  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1476608
### R  b_id 13 b_add 2912 K =   2 (h_104) ->  H_109  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1490944
### R  b_id 14 b_add 2688 K =   3 (h_105) ->  H_102  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1505280
### R  b_id 14 b_add 2912 K =   4 (h_106) ->  H_110  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1519616
### R  b_id 15 b_add 2688 K =   5 (h_107) ->  H_103  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1533952
### R  b_id 15 b_add 2912 K =   6 (h_108) ->  H_111  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1548288
### R  b_id  8 b_add 3136 K =   7 (h_109) ->  H_112  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1562624
### R  b_id  8 b_add 3360 K =   8 (h_110) ->  H_120  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1576960
### R  b_id  9 b_add 3136 K =   9 (h_111) ->  H_113  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1591296
### R  b_id  9 b_add 3360 K =  10 (h_112) ->  H_121  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1605632
### R  b_id 10 b_add 3136 K =  11 (h_113) ->  H_114  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1619968
### R  b_id 10 b_add 3360 K =  12 (h_114) ->  H_122  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1634304
### R  b_id 11 b_add 3136 K =  13 (h_115) ->  H_115  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1648640
### R  b_id 11 b_add 3360 K =  14 (h_116) ->  H_123  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1662976
### R  b_id 12 b_add 3136 K =  15 (h_117) ->  H_116  ###
LOAD 0000 0100 mode 0 bank_addr 3136 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1677312
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 7}  #### 
##### IN input (10, 2688) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 2688) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 2688 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 2688) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (16, 672) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2688 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2688 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 7 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 8 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 3360 K =   0 (h_118) ->  H_124  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1691648
### R  b_id 13 b_add 3136 K =   1 (h_119) ->  H_117  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1705984
### R  b_id 13 b_add 3360 K =   2 (h_120) ->  H_125  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1720320
### R  b_id 14 b_add 3136 K =   3 (h_121) ->  H_118  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1734656
### R  b_id 14 b_add 3360 K =   4 (h_122) ->  H_126  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1748992
### R  b_id 15 b_add 3136 K =   5 (h_123) ->  H_119  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1763328
### R  b_id 15 b_add 3360 K =   6 (h_124) ->  H_127  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1777664
### R  b_id  8 b_add 3584 K =   7 (h_125) ->  H_128  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1792000
### R  b_id  8 b_add 3808 K =   8 (h_126) ->  H_136  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1806336
### R  b_id  9 b_add 3584 K =   9 (h_127) ->  H_129  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1820672
### R  b_id  9 b_add 3808 K =  10 (h_128) ->  H_137  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1835008
### R  b_id 10 b_add 3584 K =  11 (h_129) ->  H_130  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1849344
### R  b_id 10 b_add 3808 K =  12 (h_130) ->  H_138  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1863680
### R  b_id 11 b_add 3584 K =  13 (h_131) ->  H_131  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1878016
### R  b_id 11 b_add 3808 K =  14 (h_132) ->  H_139  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1892352
### R  b_id 12 b_add 3584 K =  15 (h_133) ->  H_132  ###
LOAD 0000 0100 mode 0 bank_addr 3584 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1906688
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 8}  #### 
##### IN input (10, 3136) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 3136) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 3136 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 3136) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (20, 672) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3136 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3136 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 8 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 9 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 3808 K =   0 (h_134) ->  H_140  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1921024
### R  b_id 13 b_add 3584 K =   1 (h_135) ->  H_133  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1935360
### R  b_id 13 b_add 3808 K =   2 (h_136) ->  H_141  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1949696
### R  b_id 14 b_add 3584 K =   3 (h_137) ->  H_134  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1964032
### R  b_id 14 b_add 3808 K =   4 (h_138) ->  H_142  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1978368
### R  b_id 15 b_add 3584 K =   5 (h_139) ->  H_135  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 1992704
### R  b_id 15 b_add 3808 K =   6 (h_140) ->  H_143  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2007040
### R  b_id  8 b_add 4032 K =   7 (h_141) ->  H_144  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2021376
### R  b_id  8 b_add 4256 K =   8 (h_142) ->  H_152  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2035712
### R  b_id  9 b_add 4032 K =   9 (h_143) ->  H_145  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2050048
### R  b_id  9 b_add 4256 K =  10 (h_144) ->  H_153  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2064384
### R  b_id 10 b_add 4032 K =  11 (h_145) ->  H_146  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2078720
### R  b_id 10 b_add 4256 K =  12 (h_146) ->  H_154  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2093056
### R  b_id 11 b_add 4032 K =  13 (h_147) ->  H_147  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2107392
### R  b_id 11 b_add 4256 K =  14 (h_148) ->  H_155  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2121728
### R  b_id 12 b_add 4032 K =  15 (h_149) ->  H_148  ###
LOAD 0000 0100 mode 0 bank_addr 4032 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2136064
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 9}  #### 
##### IN input (10, 3584) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 3584) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 3584 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 3584) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (16, 896) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 9 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 10 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 4256 K =   0 (h_150) ->  H_156  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2150400
### R  b_id 13 b_add 4032 K =   1 (h_151) ->  H_149  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2164736
### R  b_id 13 b_add 4256 K =   2 (h_152) ->  H_157  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2179072
### R  b_id 14 b_add 4032 K =   3 (h_153) ->  H_150  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2193408
### R  b_id 14 b_add 4256 K =   4 (h_154) ->  H_158  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2207744
### R  b_id 15 b_add 4032 K =   5 (h_155) ->  H_151  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2222080
### R  b_id 15 b_add 4256 K =   6 (h_156) ->  H_159  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2236416
### R  b_id  8 b_add 4480 K =   7 (h_157) ->  H_160  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2250752
### R  b_id  8 b_add 4704 K =   8 (h_158) ->  H_168  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2265088
### R  b_id  9 b_add 4480 K =   9 (h_159) ->  H_161  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2279424
### R  b_id  9 b_add 4704 K =  10 (h_160) ->  H_169  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2293760
### R  b_id 10 b_add 4480 K =  11 (h_161) ->  H_162  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2308096
### R  b_id 10 b_add 4704 K =  12 (h_162) ->  H_170  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2322432
### R  b_id 11 b_add 4480 K =  13 (h_163) ->  H_163  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2336768
### R  b_id 11 b_add 4704 K =  14 (h_164) ->  H_171  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2351104
### R  b_id 12 b_add 4480 K =  15 (h_165) ->  H_164  ###
LOAD 0000 0100 mode 0 bank_addr 4480 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2365440
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 10}  #### 
##### IN input (10, 4032) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 4032) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 4032 bank_addr_out 4032 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 4032) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (20, 896) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4032 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4032 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 10 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 11 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 4704 K =   0 (h_166) ->  H_172  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2379776
### R  b_id 13 b_add 4480 K =   1 (h_167) ->  H_165  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2394112
### R  b_id 13 b_add 4704 K =   2 (h_168) ->  H_173  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2408448
### R  b_id 14 b_add 4480 K =   3 (h_169) ->  H_166  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2422784
### R  b_id 14 b_add 4704 K =   4 (h_170) ->  H_174  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2437120
### R  b_id 15 b_add 4480 K =   5 (h_171) ->  H_167  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2451456
### R  b_id 15 b_add 4704 K =   6 (h_172) ->  H_175  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2465792
### R  b_id  8 b_add 4928 K =   7 (h_173) ->  H_176  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2480128
### R  b_id  8 b_add 5152 K =   8 (h_174) ->  H_184  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2494464
### R  b_id  9 b_add 4928 K =   9 (h_175) ->  H_177  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2508800
### R  b_id  9 b_add 5152 K =  10 (h_176) ->  H_185  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2523136
### R  b_id 10 b_add 4928 K =  11 (h_177) ->  H_178  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2537472
### R  b_id 10 b_add 5152 K =  12 (h_178) ->  H_186  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2551808
### R  b_id 11 b_add 4928 K =  13 (h_179) ->  H_179  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2566144
### R  b_id 11 b_add 5152 K =  14 (h_180) ->  H_187  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2580480
### R  b_id 12 b_add 4928 K =  15 (h_181) ->  H_180  ###
LOAD 0000 0100 mode 0 bank_addr 4928 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2594816
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 11}  #### 
##### IN input (10, 4480) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 4480) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 4480 bank_addr_out 4480 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 4480) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (16, 1120) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4480 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4480 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 11 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 12 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 5152 K =   0 (h_182) ->  H_188  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2609152
### R  b_id 13 b_add 4928 K =   1 (h_183) ->  H_181  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2623488
### R  b_id 13 b_add 5152 K =   2 (h_184) ->  H_189  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2637824
### R  b_id 14 b_add 4928 K =   3 (h_185) ->  H_182  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2652160
### R  b_id 14 b_add 5152 K =   4 (h_186) ->  H_190  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2666496
### R  b_id 15 b_add 4928 K =   5 (h_187) ->  H_183  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2680832
### R  b_id 15 b_add 5152 K =   6 (h_188) ->  H_191  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2695168
### R  b_id  8 b_add 5376 K =   7 (h_189) ->  H_192  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2709504
### R  b_id  8 b_add 5600 K =   8 (h_190) ->  H_200  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2723840
### R  b_id  9 b_add 5376 K =   9 (h_191) ->  H_193  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2738176
### R  b_id  9 b_add 5600 K =  10 (h_192) ->  H_201  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2752512
### R  b_id 10 b_add 5376 K =  11 (h_193) ->  H_194  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2766848
### R  b_id 10 b_add 5600 K =  12 (h_194) ->  H_202  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2781184
### R  b_id 11 b_add 5376 K =  13 (h_195) ->  H_195  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2795520
### R  b_id 11 b_add 5600 K =  14 (h_196) ->  H_203  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2809856
### R  b_id 12 b_add 5376 K =  15 (h_197) ->  H_196  ###
LOAD 0000 0100 mode 0 bank_addr 5376 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2824192
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 12}  #### 
##### IN input (10, 4928) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 4928) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 4928 bank_addr_out 4928 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 4928) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (20, 1120) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4928 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4928 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 12 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 13 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 12 b_add 5600 K =   0 (h_198) ->  H_204  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2838528
### R  b_id 13 b_add 5376 K =   1 (h_199) ->  H_197  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2852864
### R  b_id 13 b_add 5600 K =   2 (h_200) ->  H_205  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2867200
### R  b_id 14 b_add 5376 K =   3 (h_201) ->  H_198  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2881536
### R  b_id 14 b_add 5600 K =   4 (h_202) ->  H_206  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2895872
### R  b_id 15 b_add 5376 K =   5 (h_203) ->  H_199  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2910208
### R  b_id 15 b_add 5600 K =   6 (h_204) ->  H_207  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2924544
### R  b_id  8 b_add 5824 K =   7 (h_205) ->  H_208  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2938880
### R  b_id  8 b_add 6048 K =   8 (h_206) ->  H_216  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2953216
### R  b_id  9 b_add 5824 K =   9 (h_207) ->  H_209  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2967552
### R  b_id  9 b_add 6048 K =  10 (h_208) ->  H_217  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2981888
### R  b_id 10 b_add 5824 K =  11 (h_209) ->  H_210  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 2996224
### R  b_id 10 b_add 6048 K =  12 (h_210) ->  H_218  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 10 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3010560
### R  b_id 11 b_add 5824 K =  13 (h_211) ->  H_211  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3024896
### R  b_id 11 b_add 6048 K =  14 (h_212) ->  H_219  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 11 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3039232
### R  b_id 12 b_add 5824 K =  15 (h_213) ->  H_212  ###
LOAD 0000 0100 mode 0 bank_addr 5824 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3053568
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  8xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 15, '_iteration_': 13}  #### 
##### IN input (10, 5376) TensorShapes(batch=4, width=112, height=16, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 5376) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 10 bank_id_out 2 bank_addr_in 5376 bank_addr_out 5376 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN input (0, 5376) TensorShapes(batch=4, width=112, height=8, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (16, 1344) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 13 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 14 ##
#### Inputs resnet_v1_50/pool1/MaxPool for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 10 parts (counting pading)#####
#### START 0-0 END 10-10 #####
### R  b_id 12 b_add 6048 K =   0 (h_214) ->  H_220  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 12 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3067904
### R  b_id 13 b_add 5824 K =   1 (h_215) ->  H_213  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3082240
### R  b_id 13 b_add 6048 K =   2 (h_216) ->  H_221  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 13 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3096576
### R  b_id 14 b_add 5824 K =   3 (h_217) ->  H_214  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3110912
### R  b_id 14 b_add 6048 K =   4 (h_218) ->  H_222  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 14 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3125248
### R  b_id 15 b_add 5824 K =   5 (h_219) ->  H_215  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3139584
### R  b_id 15 b_add 6048 K =   6 (h_220) ->  H_223  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 15 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3153920
### R  b_id  8 b_add 6272 K =   7 (h_221) ->  H_224  ###
LOAD 0000 0000 mode 0 bank_addr 6272 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3168256
### R  b_id  8 b_add 6496 K =   8 (h_222) ->  H_232  ###
LOAD 0000 0000 mode 0 bank_addr 6496 bank_id 8 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3182592
### R  b_id  9 b_add 6272 K =   9 (h_223) ->  H_225  ###
LOAD 0000 0100 mode 0 bank_addr 6272 bank_id 9 jump_read 32 jump_write 2 length 112 channel 21 reg_id 0 ddr_addr 3196928
#### Load Reshape 10 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/pool1/MaxPool for input end ######
#####  6xCONV(resnet_v1_50/conv1/Conv2D) + 4xPOOL(resnet_v1_50/pool1/MaxPool) ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (1,2, 1,7 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 7], 'stride': [1, 2], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=1, height=7, channel=0), 'stride_width': 1, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=1, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 4, 'sync_type': 4, '_iterations_': 15, '_iteration_': 14}  #### 
##### IN input (10, 5824) TensorShapes(batch=4, width=112, height=10, channel=21)  ->
##### OUT resnet_v1_50/conv1/Conv2D (2, 5824) TensorShapes(batch=4, width=112, height=6, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 7 shift_cut 8 stride_w 1 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 2 jump_read_endl 224 wgt_jump_read_endl 14 stride_out 1 channel_group_in 2 channel_group_out 4 channel_offset 11 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 4 bank_id_in 10 bank_id_out 2 bank_addr_in 5824 bank_addr_out 5824 bank_addr_weights 0 bank_addr_bias 56 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 1, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 1, 'sync_type': 8}  #### 
##### IN input (0, 5824) TensorShapes(batch=4, width=112, height=6, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (20, 1344) TensorShapes(batch=4, width=56, height=4, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5824 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0001 pad_top 0 pad_bottom 1 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5824 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
#####  CONV(resnet_v1_50/conv1/Conv2D) +POOL(resnet_v1_50/pool1/MaxPool) ######
## End DDR-to_DDR SPLIT by h 14 ##
####### resnet_v1_50/pool1/MaxPool #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 4 channel 64 reg_id 3 ddr_addr 16384
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 16 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 20480
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 17 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 22528
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 161 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 59392
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/pool1/MaxPool (16, 0) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D (16, 1568) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 0001 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 0 bank_addr_out 1568 bank_addr_weights 0 bank_addr_bias 16 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 224 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 16 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 448 bank_addr_out 2016 bank_addr_weights 0 bank_addr_bias 16 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 672 bank_addr_out 2240 bank_addr_weights 0 bank_addr_bias 16 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 896 bank_addr_out 2464 bank_addr_weights 0 bank_addr_bias 16 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1120 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 16 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1344 bank_addr_out 2912 bank_addr_weights 0 bank_addr_bias 16 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 162 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 61440
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 226 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 77824
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D (16, 1568) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D (0, 0) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 0 bank_addr_in 1340 bank_addr_out 0 bank_addr_weights 17 bank_addr_bias 161 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 0 bank_addr_in 1564 bank_addr_out 224 bank_addr_weights 17 bank_addr_bias 161 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 0 bank_addr_in 1788 bank_addr_out 448 bank_addr_weights 17 bank_addr_bias 161 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 0 bank_addr_in 2012 bank_addr_out 672 bank_addr_weights 17 bank_addr_bias 161 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 0 bank_addr_in 2236 bank_addr_out 896 bank_addr_weights 17 bank_addr_bias 161 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 0 bank_addr_in 2460 bank_addr_out 1120 bank_addr_weights 17 bank_addr_bias 161 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 0 bank_addr_in 2684 bank_addr_out 1344 bank_addr_weights 17 bank_addr_bias 161 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 230 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 79872
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 294 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 96256
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D (0, 0) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (0, 1568) TensorShapes(batch=4, width=56, height=56, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 5 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 0 bank_addr_in 0 bank_addr_out 1568 bank_addr_weights 162 bank_addr_bias 226 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 0 bank_addr_in 224 bank_addr_out 2464 bank_addr_weights 162 bank_addr_bias 226 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 0 bank_addr_in 448 bank_addr_out 3360 bank_addr_weights 162 bank_addr_bias 226 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 0 bank_addr_in 672 bank_addr_out 4256 bank_addr_weights 162 bank_addr_bias 226 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 0 bank_addr_in 896 bank_addr_out 5152 bank_addr_weights 162 bank_addr_bias 226 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 0 bank_addr_in 1120 bank_addr_out 6048 bank_addr_weights 162 bank_addr_bias 226 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 0 bank_addr_in 1344 bank_addr_out 6944 bank_addr_weights 162 bank_addr_bias 226 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 298 bank_id 0 jump_read 256 jump_write 16 length 4 channel 256 reg_id 3 ddr_addr 98304
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 362 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 114688
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block1/unit_1/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block1/unit_1/bottleneck_v1/add OUTPUT SPLIT by h total 8 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=56, height=56, channel=256) (0, 1568) ######
##### IN resnet_v1_50/pool1/MaxPool fm TensorShapes(batch=4, width=56, height=56, channel=64) (16, 0) ######
##### TMP resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D fm TensorShapes(batch=4, width=56, height=56, channel=256) (8, 0) ######
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add TensorShapes(batch=4, width=56, height=56, channel=256) (0) (0, 1568) Absolute 2 0x188000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) + 2xELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 0}  #### 
##### IN resnet_v1_50/pool1/MaxPool (16, 0) TensorShapes(batch=4, width=56, height=2, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (8, 0) TensorShapes(batch=4, width=56, height=2, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 230 bank_addr_bias 294 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (0, 1568) TensorShapes(batch=4, width=56, height=2, channel=256)  
##### IN  resnet_v1_50/pool1/MaxPool (8, 0) TensorShapes(batch=4, width=56, height=2, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (0, 1568) TensorShapes(batch=4, width=56, height=2, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1568
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 1568 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 1}  #### 
##### IN resnet_v1_50/pool1/MaxPool (18, 0) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (10, 0) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 230 bank_addr_bias 294 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (2, 1568) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/pool1/MaxPool (10, 0) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 1568) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1568
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 1568 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1568
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 1568 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1568
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 1568 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2464
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 2464 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  8xCONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 2}  #### 
##### IN resnet_v1_50/pool1/MaxPool (18, 224) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (10, 896) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 224 bank_addr_out 896 bank_addr_weights 230 bank_addr_bias 294 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (2, 2464) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/pool1/MaxPool (10, 896) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 2464) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2464
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 2464 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2464
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 2464 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2464
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 2464 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3360
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 3360 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#####  8xCONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 3}  #### 
##### IN resnet_v1_50/pool1/MaxPool (18, 448) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (10, 1792) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 448 bank_addr_out 1792 bank_addr_weights 230 bank_addr_bias 294 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (2, 3360) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/pool1/MaxPool (10, 1792) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 3360) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3360
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 3360 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3360
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 3360 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3360
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 3360 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4256
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 4256 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#####  8xCONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 4}  #### 
##### IN resnet_v1_50/pool1/MaxPool (18, 672) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (10, 2688) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 672 bank_addr_out 2688 bank_addr_weights 230 bank_addr_bias 294 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (2, 4256) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/pool1/MaxPool (10, 2688) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 4256) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4256
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 4256 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4256
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 4256 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4256
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 4256 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5152
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 5152 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 4 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 5 ##
#####  8xCONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 5}  #### 
##### IN resnet_v1_50/pool1/MaxPool (18, 896) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (10, 3584) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 230 bank_addr_bias 294 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (2, 5152) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/pool1/MaxPool (10, 3584) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 5152) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5152
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 5152 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5152
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 5152 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5152
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 5152 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6048
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 6048 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 5 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 6 ##
#####  8xCONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 6}  #### 
##### IN resnet_v1_50/pool1/MaxPool (18, 1120) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (10, 4480) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 1120 bank_addr_out 4480 bank_addr_weights 230 bank_addr_bias 294 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (2, 6048) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/pool1/MaxPool (10, 4480) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 6048) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6048
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 6048 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6048
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 6048 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6048
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 6048 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6944
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 6944 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 6 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 7 ##
#####  6xCONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) + 6xELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 3, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 7}  #### 
##### IN resnet_v1_50/pool1/MaxPool (18, 1344) TensorShapes(batch=4, width=56, height=6, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (10, 5376) TensorShapes(batch=4, width=56, height=6, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 1344 bank_addr_out 5376 bank_addr_weights 230 bank_addr_bias 294 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (2, 6944) TensorShapes(batch=4, width=56, height=6, channel=256)  
##### IN  resnet_v1_50/pool1/MaxPool (10, 5376) TensorShapes(batch=4, width=56, height=6, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 6944) TensorShapes(batch=4, width=56, height=6, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6944
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 6944 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6944
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 6944 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6944
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0101 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 6944 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block1/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 7 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/add #######
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 363 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 116736
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 507 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 153600
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_1/bottleneck_v1/add (0, 1568) TensorShapes(batch=4, width=56, height=56, channel=256)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 1568 bank_addr_out 0 bank_addr_weights 298 bank_addr_bias 362 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 2464 bank_addr_out 224 bank_addr_weights 298 bank_addr_bias 362 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 3360 bank_addr_out 448 bank_addr_weights 298 bank_addr_bias 362 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 4256 bank_addr_out 672 bank_addr_weights 298 bank_addr_bias 362 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 5152 bank_addr_out 896 bank_addr_weights 298 bank_addr_bias 362 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 6048 bank_addr_out 1120 bank_addr_weights 298 bank_addr_bias 362 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 6944 bank_addr_out 1344 bank_addr_weights 298 bank_addr_bias 362 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 508 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 155648
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 572 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 172032
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (16, 1568) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3868 bank_addr_out 1568 bank_addr_weights 363 bank_addr_bias 507 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4092 bank_addr_out 1792 bank_addr_weights 363 bank_addr_bias 507 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 220 bank_addr_out 2016 bank_addr_weights 363 bank_addr_bias 507 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 444 bank_addr_out 2240 bank_addr_weights 363 bank_addr_bias 507 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 668 bank_addr_out 2464 bank_addr_weights 363 bank_addr_bias 507 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 892 bank_addr_out 2688 bank_addr_weights 363 bank_addr_bias 507 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1116 bank_addr_out 2912 bank_addr_weights 363 bank_addr_bias 507 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block1/unit_2/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 576 bank_id 0 jump_read 256 jump_write 16 length 4 channel 256 reg_id 3 ddr_addr 174080
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 640 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 190464
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block1/unit_2/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block1/unit_2/bottleneck_v1/add OUTPUT SPLIT by h total 8 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_1/bottleneck_v1/add fm TensorShapes(batch=4, width=56, height=56, channel=256) (0, 1568) ######
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=56, height=56, channel=64) (16, 1568) ######
##### TMP resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=56, height=56, channel=256) (8, 0) ######
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add TensorShapes(batch=4, width=56, height=56, channel=256) (0) (0, 1568) Absolute 2 0x188000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (16, 1568) TensorShapes(batch=4, width=56, height=2, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (8, 0) TensorShapes(batch=4, width=56, height=2, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 1568 bank_addr_out 0 bank_addr_weights 508 bank_addr_bias 572 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (0, 1568) TensorShapes(batch=4, width=56, height=2, channel=256)  
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (8, 0) TensorShapes(batch=4, width=56, height=2, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 1568) TensorShapes(batch=4, width=56, height=2, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1568
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 1568 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (18, 1568) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (10, 0) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 1568 bank_addr_out 0 bank_addr_weights 508 bank_addr_bias 572 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 1568) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (10, 0) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 1568) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1568
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 1568 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1568
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 1568 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1568
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 1568 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2464
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 2464 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  8xCONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (18, 1792) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (10, 896) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 1792 bank_addr_out 896 bank_addr_weights 508 bank_addr_bias 572 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 2464) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (10, 896) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 2464) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2464
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 2464 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2464
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 2464 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2464
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 2464 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3360
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 3360 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#####  8xCONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 3}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (18, 2016) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (10, 1792) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 2016 bank_addr_out 1792 bank_addr_weights 508 bank_addr_bias 572 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 3360) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (10, 1792) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 3360) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3360
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 3360 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3360
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 3360 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3360
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 3360 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4256
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 4256 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#####  8xCONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 4}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (18, 2240) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (10, 2688) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 2240 bank_addr_out 2688 bank_addr_weights 508 bank_addr_bias 572 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 4256) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (10, 2688) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 4256) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4256
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 4256 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4256
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 4256 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4256
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 4256 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5152
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 5152 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 4 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 5 ##
#####  8xCONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 5}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (18, 2464) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (10, 3584) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 2464 bank_addr_out 3584 bank_addr_weights 508 bank_addr_bias 572 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 5152) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (10, 3584) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 5152) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5152
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 5152 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5152
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 5152 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5152
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 5152 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6048
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 6048 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 5 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 6 ##
#####  8xCONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 6}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (18, 2688) TensorShapes(batch=4, width=56, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (10, 4480) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 2688 bank_addr_out 4480 bank_addr_weights 508 bank_addr_bias 572 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 6048) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (10, 4480) TensorShapes(batch=4, width=56, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 6048) TensorShapes(batch=4, width=56, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6048
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 6048 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6048
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 6048 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6048
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 6048 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6944
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 6944 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 6 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 7 ##
#####  6xCONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) + 6xELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 8, '_iteration_': 7}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (18, 2912) TensorShapes(batch=4, width=56, height=6, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (10, 5376) TensorShapes(batch=4, width=56, height=6, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 10 bank_addr_in 2912 bank_addr_out 5376 bank_addr_weights 508 bank_addr_bias 572 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (2, 6944) TensorShapes(batch=4, width=56, height=6, channel=256)  
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (10, 5376) TensorShapes(batch=4, width=56, height=6, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 6944) TensorShapes(batch=4, width=56, height=6, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6944
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 6944 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6944
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 6944 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 6944
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 1000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 6944 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 7 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block1/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool #######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [1, 1], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 1568) TensorShapes(batch=4, width=56, height=56, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (16, 0) TensorShapes(batch=4, width=28, height=28, channel=256) #### 
POOL 1000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1568 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1568 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1568 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1568 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2464 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2464 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2464 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2464 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 23 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3360 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3360 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3360 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3360 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4256 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4256 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4256 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4256 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 23 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5152 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5152 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5152 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5152 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 6048 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 6048 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 6048 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 6048 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 23 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 6944 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 6944 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 6944 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0101 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 6944 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 19 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 641 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 192512
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 785 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 229376
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 1568) TensorShapes(batch=4, width=56, height=56, channel=256)
#####  -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D (16, 1792) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 1568 bank_addr_out 1792 bank_addr_weights 576 bank_addr_bias 640 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 2464 bank_addr_out 2016 bank_addr_weights 576 bank_addr_bias 640 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 3360 bank_addr_out 2240 bank_addr_weights 576 bank_addr_bias 640 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 4256 bank_addr_out 2464 bank_addr_weights 576 bank_addr_bias 640 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 5152 bank_addr_out 2688 bank_addr_weights 576 bank_addr_bias 640 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 6048 bank_addr_out 2912 bank_addr_weights 576 bank_addr_bias 640 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 6944 bank_addr_out 3136 bank_addr_weights 576 bank_addr_bias 640 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 786 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 231424
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 850 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 247808
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (2,2) -> 7x (CONV S(1,2) + 4xELT SAMPLE (2,1)) #### 
#### Weigth Name resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D_weight Parameter True	Space 294912 bits, BitePerPixel 8 Fraction 8 Start 1312768 End 1607680	Specifier 0 Layout 1 Time 142 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=64, width=3, height=3, channel=64) 
##### Bias Name resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D_bias Parameter True	Space 2048 bits, BitePerPixel 32 Fraction 5 Start 1607680 End 1609728	Specifier 0 Layout 1 Time 143 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=1, width=1, height=1, channel=64) 
###### PM size 16777216 
#### ATT {'overrideshape': True, 'quant_out_signed': True, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'stride': [2, 2], 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'pad_mode': 'VALID', 'fix_point': 4, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 15, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
#####IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D (16, 1792) TensorShapes(batch=4, width=56, height=56, channel=64) ->  TEMP temp_for_sample (16, 3808) TensorShapes(batch=1, width=28, height=8, channel=64) -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (16, 3360) TensorShapes(batch=4, width=28, height=28, channel=64) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 2 stride_h 1 act_type 1 jump_write 4 jump_write_endl 112 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4 channel_offset 0 prelu_shift_p 0
###### VHi 28672 VHt 14336 VHo 14336 ######
CONV 0100 1000 pad_left 1 pad_top 1 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1564 bank_addr_out 3808 bank_addr_weights 641 bank_addr_bias 785 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 16 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 17 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 18 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 19 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1788 bank_addr_out 3808 bank_addr_weights 641 bank_addr_bias 785 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 20 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 21 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 22 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 23 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2012 bank_addr_out 3808 bank_addr_weights 641 bank_addr_bias 785 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 16 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 17 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 18 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 19 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2236 bank_addr_out 3808 bank_addr_weights 641 bank_addr_bias 785 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 20 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 21 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 22 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 23 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2460 bank_addr_out 3808 bank_addr_weights 641 bank_addr_bias 785 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 16 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 17 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 18 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 19 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2684 bank_addr_out 3808 bank_addr_weights 641 bank_addr_bias 785 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 20 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 21 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 22 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 23 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 2908 bank_addr_out 3808 bank_addr_weights 641 bank_addr_bias 785 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 16 bank_addr_out 3696 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 17 bank_addr_out 3696 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 18 bank_addr_out 3696 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0101 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 19 bank_addr_out 3696 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 854 bank_id 0 jump_read 256 jump_write 16 length 8 channel 256 reg_id 3 ddr_addr 249856
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 982 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 282624
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block1/unit_3/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block1/unit_3/bottleneck_v1/add OUTPUT SPLIT by h total 5 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool fm TensorShapes(batch=4, width=28, height=28, channel=256) (16, 0) ######
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=28, height=28, channel=64) (16, 3360) ######
##### TMP resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=28, height=28, channel=256) (0, 0) ######
##### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/add TensorShapes(batch=4, width=28, height=28, channel=256) (0) (16, 0) Absolute 2 0x0 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (16, 3360) TensorShapes(batch=4, width=28, height=2, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=28, height=2, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 448 jump_read 4 jump_read_endl 112 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3360 bank_addr_out 0 bank_addr_weights 786 bank_addr_bias 850 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (16, 0) TensorShapes(batch=4, width=28, height=2, channel=256)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (0, 0) TensorShapes(batch=4, width=28, height=2, channel=256)  
##### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=28, height=2, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (18, 3360) TensorShapes(batch=4, width=28, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D (2, 0) TensorShapes(batch=4, width=28, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 448 jump_read 4 jump_read_endl 112 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 3360 bank_addr_out 0 bank_addr_weights 786 bank_addr_bias 850 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (18, 0) TensorShapes(batch=4, width=28, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (2, 0) TensorShapes(batch=4, width=28, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/add (18, 0) TensorShapes(batch=4, width=28, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 448
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 448 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  8xCONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (18, 3472) TensorShapes(batch=4, width=28, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D (2, 448) TensorShapes(batch=4, width=28, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 448 jump_read 4 jump_read_endl 112 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 3472 bank_addr_out 448 bank_addr_weights 786 bank_addr_bias 850 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (18, 448) TensorShapes(batch=4, width=28, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (2, 448) TensorShapes(batch=4, width=28, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/add (18, 448) TensorShapes(batch=4, width=28, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 448
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 448 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 448
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 448 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 448
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 448 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#####  8xCONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 3}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (18, 3584) TensorShapes(batch=4, width=28, height=8, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D (2, 896) TensorShapes(batch=4, width=28, height=8, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 448 jump_read 4 jump_read_endl 112 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 3584 bank_addr_out 896 bank_addr_weights 786 bank_addr_bias 850 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (18, 896) TensorShapes(batch=4, width=28, height=8, channel=256)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (2, 896) TensorShapes(batch=4, width=28, height=8, channel=256)  
##### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/add (18, 896) TensorShapes(batch=4, width=28, height=8, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 1344
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 1344 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#####  2xCONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 4}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (18, 3696) TensorShapes(batch=4, width=28, height=2, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D (2, 1344) TensorShapes(batch=4, width=28, height=2, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 448 jump_read 4 jump_read_endl 112 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 3696 bank_addr_out 1344 bank_addr_weights 786 bank_addr_bias 850 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (18, 1344) TensorShapes(batch=4, width=28, height=2, channel=256)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (2, 1344) TensorShapes(batch=4, width=28, height=2, channel=256)  
##### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/add (18, 1344) TensorShapes(batch=4, width=28, height=2, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 1344
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0100 0101 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 1344 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block1/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 4 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/add #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 984 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 284672
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 1560 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 432128
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=28, height=28, channel=256)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D (16, 1792) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 0 bank_addr_out 1792 bank_addr_weights 854 bank_addr_bias 982 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 448 bank_addr_out 2016 bank_addr_weights 854 bank_addr_bias 982 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 896 bank_addr_out 2240 bank_addr_weights 854 bank_addr_bias 982 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1344 bank_addr_out 2464 bank_addr_weights 854 bank_addr_bias 982 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 1562 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 434176
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 1818 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 499712
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D (16, 1792) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D (16, 2688) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1560 bank_addr_out 2688 bank_addr_weights 984 bank_addr_bias 1560 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1784 bank_addr_out 2912 bank_addr_weights 984 bank_addr_bias 1560 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2008 bank_addr_out 3136 bank_addr_weights 984 bank_addr_bias 1560 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 2232 bank_addr_out 3360 bank_addr_weights 984 bank_addr_bias 1560 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 1826 bank_id 0 jump_read 256 jump_write 16 length 32 channel 256 reg_id 3 ddr_addr 501760
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 2338 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 632832
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D (16, 2688) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2688 bank_addr_out 0 bank_addr_weights 1562 bank_addr_bias 1818 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2912 bank_addr_out 896 bank_addr_weights 1562 bank_addr_bias 1818 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3136 bank_addr_out 1792 bank_addr_weights 1562 bank_addr_bias 1818 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3360 bank_addr_out 2688 bank_addr_weights 1562 bank_addr_bias 1818 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 2346 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 634880
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 2602 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 700416
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block2/unit_1/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block2/unit_1/bottleneck_v1/add OUTPUT SPLIT by h total 5 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=28, height=28, channel=512) (0, 0) ######
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add fm TensorShapes(batch=4, width=28, height=28, channel=256) (16, 0) ######
##### TMP resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D fm TensorShapes(batch=4, width=28, height=28, channel=512) (0, 3584) ######
##### OUT resnet_v1_50/block2/unit_1/bottleneck_v1/add TensorShapes(batch=4, width=28, height=28, channel=512) (0) (0, 0) Absolute 2 0x0 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) + 2xELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=28, height=2, channel=256)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 3584 bank_addr_weights 1826 bank_addr_bias 2338 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/add (0, 3584) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### OUT resnet_v1_50/block2/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add (18, 0) TensorShapes(batch=4, width=28, height=8, channel=256)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D (2, 3584) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 0 bank_addr_out 3584 bank_addr_weights 1826 bank_addr_bias 2338 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D (2, 0) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/add (2, 3584) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_1/bottleneck_v1/add (2, 0) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  8xCONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add (18, 448) TensorShapes(batch=4, width=28, height=8, channel=256)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D (2, 4480) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 448 bank_addr_out 4480 bank_addr_weights 1826 bank_addr_bias 2338 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D (2, 896) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/add (2, 4480) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_1/bottleneck_v1/add (2, 896) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#####  8xCONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 3}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add (18, 896) TensorShapes(batch=4, width=28, height=8, channel=256)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D (2, 5376) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 896 bank_addr_out 5376 bank_addr_weights 1826 bank_addr_bias 2338 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D (2, 1792) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/add (2, 5376) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_1/bottleneck_v1/add (2, 1792) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#####  2xCONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) + 2xELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 4}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add (18, 1344) TensorShapes(batch=4, width=28, height=2, channel=256)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D (2, 6272) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 1344 bank_addr_out 6272 bank_addr_weights 1826 bank_addr_bias 2338 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D (2, 2688) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/add (2, 6272) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### OUT resnet_v1_50/block2/unit_1/bottleneck_v1/add (2, 2688) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0100 0101 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block2/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 4 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/add #######
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 2604 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 702464
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 3180 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 849920
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 2346 bank_addr_bias 2602 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 2346 bank_addr_bias 2602 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 2346 bank_addr_bias 2602 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 2346 bank_addr_bias 2602 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 3182 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 851968
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 3438 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 917504
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3864 bank_addr_out 896 bank_addr_weights 2604 bank_addr_bias 3180 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4088 bank_addr_out 1120 bank_addr_weights 2604 bank_addr_bias 3180 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 216 bank_addr_out 1344 bank_addr_weights 2604 bank_addr_bias 3180 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 440 bank_addr_out 1568 bank_addr_weights 2604 bank_addr_bias 3180 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block2/unit_2/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 3446 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 919552
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 3702 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 985088
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block2/unit_2/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block2/unit_2/bottleneck_v1/add OUTPUT SPLIT by h total 5 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_1/bottleneck_v1/add fm TensorShapes(batch=4, width=28, height=28, channel=512) (0, 0) ######
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=28, height=28, channel=128) (16, 896) ######
##### TMP resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=28, height=28, channel=512) (0, 3584) ######
##### OUT resnet_v1_50/block2/unit_2/bottleneck_v1/add TensorShapes(batch=4, width=28, height=28, channel=512) (0) (0, 0) Absolute 2 0x0 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=2, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 3182 bank_addr_bias 3438 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### OUT resnet_v1_50/block2/unit_2/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (18, 896) TensorShapes(batch=4, width=28, height=8, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D (2, 3584) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 3182 bank_addr_bias 3438 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/add (2, 0) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (2, 3584) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_2/bottleneck_v1/add (2, 0) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  8xCONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (18, 1120) TensorShapes(batch=4, width=28, height=8, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D (2, 4480) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 1120 bank_addr_out 4480 bank_addr_weights 3182 bank_addr_bias 3438 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/add (2, 896) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (2, 4480) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_2/bottleneck_v1/add (2, 896) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#####  8xCONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 3}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (18, 1344) TensorShapes(batch=4, width=28, height=8, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D (2, 5376) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 1344 bank_addr_out 5376 bank_addr_weights 3182 bank_addr_bias 3438 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/add (2, 1792) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (2, 5376) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_2/bottleneck_v1/add (2, 1792) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#####  2xCONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 4}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (18, 1568) TensorShapes(batch=4, width=28, height=2, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D (2, 6272) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 1568 bank_addr_out 6272 bank_addr_weights 3182 bank_addr_bias 3438 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/add (2, 2688) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (2, 6272) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### OUT resnet_v1_50/block2/unit_2/bottleneck_v1/add (2, 2688) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0100 0101 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 4 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block2/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 3704 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 987136
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 4280 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1134592
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 3446 bank_addr_bias 3702 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 3446 bank_addr_bias 3702 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 3446 bank_addr_bias 3702 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 3446 bank_addr_bias 3702 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 4282 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 1136640
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 4538 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 1202176
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3864 bank_addr_out 896 bank_addr_weights 3704 bank_addr_bias 4280 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4088 bank_addr_out 1120 bank_addr_weights 3704 bank_addr_bias 4280 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 216 bank_addr_out 1344 bank_addr_weights 3704 bank_addr_bias 4280 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 440 bank_addr_out 1568 bank_addr_weights 3704 bank_addr_bias 4280 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block2/unit_3/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 4546 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 1204224
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 4802 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1269760
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block2/unit_3/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block2/unit_3/bottleneck_v1/add OUTPUT SPLIT by h total 5 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/add fm TensorShapes(batch=4, width=28, height=28, channel=512) (0, 0) ######
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=28, height=28, channel=128) (16, 896) ######
##### TMP resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=28, height=28, channel=512) (0, 3584) ######
##### OUT resnet_v1_50/block2/unit_3/bottleneck_v1/add TensorShapes(batch=4, width=28, height=28, channel=512) (0) (0, 0) Absolute 2 0x0 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=2, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 4282 bank_addr_bias 4538 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### IN  resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### OUT resnet_v1_50/block2/unit_3/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (18, 896) TensorShapes(batch=4, width=28, height=8, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D (2, 3584) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 4282 bank_addr_bias 4538 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/add (2, 0) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (2, 3584) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_3/bottleneck_v1/add (2, 0) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  8xCONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (18, 1120) TensorShapes(batch=4, width=28, height=8, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D (2, 4480) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 1120 bank_addr_out 4480 bank_addr_weights 4282 bank_addr_bias 4538 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/add (2, 896) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (2, 4480) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_3/bottleneck_v1/add (2, 896) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#####  8xCONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 3}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (18, 1344) TensorShapes(batch=4, width=28, height=8, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D (2, 5376) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 1344 bank_addr_out 5376 bank_addr_weights 4282 bank_addr_bias 4538 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/add (2, 1792) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### IN  resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (2, 5376) TensorShapes(batch=4, width=28, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_3/bottleneck_v1/add (2, 1792) TensorShapes(batch=4, width=28, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#####  2xCONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 5, '_iteration_': 4}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (18, 1568) TensorShapes(batch=4, width=28, height=2, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D (2, 6272) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 1568 bank_addr_out 6272 bank_addr_weights 4282 bank_addr_bias 4538 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/add (2, 2688) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### IN  resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (2, 6272) TensorShapes(batch=4, width=28, height=2, channel=512)  
##### OUT resnet_v1_50/block2/unit_3/bottleneck_v1/add (2, 2688) TensorShapes(batch=4, width=28, height=2, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0100 1000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 4 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block2/unit_3/bottleneck_v1/add #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool #######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [1, 1], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512)  -> 
#### OUT resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool (16, 0) TensorShapes(batch=4, width=14, height=14, channel=512) #### 
POOL 1000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 2 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 6 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 2 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 6 bank_id_out 23 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 2 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 6 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0101 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 2 bank_id_out 21 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 4804 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 1271808
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 5380 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1419264
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512)
#####  -> OUT resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 0 bank_addr_out 896 bank_addr_weights 4546 bank_addr_bias 4802 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 896 bank_addr_out 1120 bank_addr_weights 4546 bank_addr_bias 4802 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 1792 bank_addr_out 1344 bank_addr_weights 4546 bank_addr_bias 4802 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 2688 bank_addr_out 1568 bank_addr_weights 4546 bank_addr_bias 4802 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 5382 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 1421312
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 5638 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 1486848
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (2,2) -> 4x (CONV S(1,2) + 4xELT SAMPLE (2,1)) #### 
#### Weigth Name resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D_weight Parameter True	Space 1179648 bits, BitePerPixel 8 Fraction 9 Start 9838592 End 11018240	Specifier 0 Layout 1 Time 182 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=128, width=3, height=3, channel=128) 
##### Bias Name resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D_bias Parameter True	Space 4096 bits, BitePerPixel 32 Fraction 6 Start 11018240 End 11022336	Specifier 0 Layout 1 Time 183 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=1, width=1, height=1, channel=128) 
###### PM size 16777216 
#### ATT {'overrideshape': True, 'quant_out_signed': True, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'stride': [2, 2], 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'pad_mode': 'VALID', 'fix_point': 4, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 6, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 15, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
#####IN resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128) ->  TEMP temp_for_sample (16, 2016) TensorShapes(batch=1, width=14, height=8, channel=128) -> OUT resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=128) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 2 stride_h 1 act_type 1 jump_write 8 jump_write_endl 112 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8 channel_offset 0 prelu_shift_p 0
###### VHi 28672 VHt 14336 VHo 14336 ######
CONV 0100 1000 pad_left 1 pad_top 1 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 664 bank_addr_out 2016 bank_addr_weights 4804 bank_addr_bias 5380 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 17 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 19 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 888 bank_addr_out 2016 bank_addr_weights 4804 bank_addr_bias 5380 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 21 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 22 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 23 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1112 bank_addr_out 2016 bank_addr_weights 4804 bank_addr_bias 5380 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 16 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 17 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 18 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 19 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1336 bank_addr_out 2016 bank_addr_weights 4804 bank_addr_bias 5380 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 20 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 0101 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 21 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 5646 bank_id 0 jump_read 512 jump_write 32 length 16 channel 512 reg_id 3 ddr_addr 1488896
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 6158 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 1619968
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block2/unit_4/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block2/unit_4/bottleneck_v1/add OUTPUT SPLIT by h total 3 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool fm TensorShapes(batch=4, width=14, height=14, channel=512) (16, 0) ######
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=128) (16, 1792) ######
##### TMP resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=512) (16, 896) ######
##### OUT resnet_v1_50/block2/unit_4/bottleneck_v1/add TensorShapes(batch=4, width=14, height=14, channel=512) (0) (16, 0) Absolute 2 0x0 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block2/unit_4/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=2, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 448 jump_read 8 jump_read_endl 112 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 1000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 896 bank_addr_weights 5382 bank_addr_bias 5638 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool (16, 0) TensorShapes(batch=4, width=14, height=2, channel=512)  
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=2, channel=512)  
##### OUT resnet_v1_50/block2/unit_4/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=14, height=2, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 16 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_4/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block2/unit_4/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D (18, 896) TensorShapes(batch=4, width=14, height=8, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 448 jump_read 8 jump_read_endl 112 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 18 bank_addr_in 1792 bank_addr_out 896 bank_addr_weights 5382 bank_addr_bias 5638 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool (18, 0) TensorShapes(batch=4, width=14, height=8, channel=512)  
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (18, 896) TensorShapes(batch=4, width=14, height=8, channel=512)  
##### OUT resnet_v1_50/block2/unit_4/bottleneck_v1/add (18, 0) TensorShapes(batch=4, width=14, height=8, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 18 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 20 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 22 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 16 bank_addr_out 448 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_4/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  4xCONV(resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D) + 4xELT(resnet_v1_50/block2/unit_4/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (18, 1904) TensorShapes(batch=4, width=14, height=4, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D (18, 1344) TensorShapes(batch=4, width=14, height=4, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 448 jump_read 8 jump_read_endl 112 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 18 bank_addr_in 1904 bank_addr_out 1344 bank_addr_weights 5382 bank_addr_bias 5638 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool (18, 448) TensorShapes(batch=4, width=14, height=4, channel=512)  
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (18, 1344) TensorShapes(batch=4, width=14, height=4, channel=512)  
##### OUT resnet_v1_50/block2/unit_4/bottleneck_v1/add (18, 448) TensorShapes(batch=4, width=14, height=4, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 18 bank_addr_out 448 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0000 0101 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 20 bank_addr_out 448 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block2/unit_4/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 6162 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 1622016
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 274 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 2211840
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=14, height=14, channel=512)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 32 jump_read_endl 448 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 0 bank_addr_out 896 bank_addr_weights 5646 bank_addr_bias 6158 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 448 bank_addr_out 1120 bank_addr_weights 5646 bank_addr_bias 6158 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 278 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 2213888
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 1302 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 2476032
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D (16, 1344) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 656 bank_addr_out 1344 bank_addr_weights 6162 bank_addr_bias 274 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 880 bank_addr_out 1568 bank_addr_weights 6162 bank_addr_bias 274 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 1318 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 2480128
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 3366 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 3004416
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D (16, 1344) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1344 bank_addr_out 1792 bank_addr_weights 278 bank_addr_bias 1302 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1568 bank_addr_out 2688 bank_addr_weights 278 bank_addr_bias 1302 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 3382 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 3008512
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 4406 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 3270656
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block3/unit_1/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block3/unit_1/bottleneck_v1/add OUTPUT SPLIT by h total 3 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=1024) (16, 1792) ######
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/add fm TensorShapes(batch=4, width=14, height=14, channel=512) (16, 0) ######
##### TMP resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=1024) (0, 0) ######
##### OUT resnet_v1_50/block3/unit_1/bottleneck_v1/add TensorShapes(batch=4, width=14, height=14, channel=1024) (0) (16, 1792) Absolute 2 0x1c0000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D) + 2xELT(resnet_v1_50/block3/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=14, height=2, channel=512)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 32 jump_read_endl 448 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 1318 bank_addr_bias 3366 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### OUT resnet_v1_50/block3/unit_1/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block3/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D) + 8xELT(resnet_v1_50/block3/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/add (18, 0) TensorShapes(batch=4, width=14, height=8, channel=512)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 32 jump_read_endl 448 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 1318 bank_addr_bias 3366 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/add (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### OUT resnet_v1_50/block3/unit_1/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 22 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block3/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  4xCONV(resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D) + 4xELT(resnet_v1_50/block3/unit_1/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 3, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/add (18, 448) TensorShapes(batch=4, width=14, height=4, channel=512)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 32 jump_read_endl 448 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 448 bank_addr_out 896 bank_addr_weights 1318 bank_addr_bias 3366 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/add (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### OUT resnet_v1_50/block3/unit_1/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0101 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D) +ELT(resnet_v1_50/block3/unit_1/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 4410 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 3272704
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 6714 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 3862528
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_1/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D (16, 3584) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 3584 bank_addr_weights 3382 bank_addr_bias 4406 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 3808 bank_addr_weights 3382 bank_addr_bias 4406 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 6718 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 3864576
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 7742 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 4126720
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D (16, 3584) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3344 bank_addr_out 4032 bank_addr_weights 4410 bank_addr_bias 6714 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3568 bank_addr_out 160 bank_addr_weights 4410 bank_addr_bias 6714 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_2/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 7758 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 4130816
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 590 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 4392960
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block3/unit_2/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block3/unit_2/bottleneck_v1/add OUTPUT SPLIT by h total 3 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_1/bottleneck_v1/add fm TensorShapes(batch=4, width=14, height=14, channel=1024) (16, 1792) ######
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=256) (16, 4032) ######
##### TMP resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=1024) (0, 0) ######
##### OUT resnet_v1_50/block3/unit_2/bottleneck_v1/add TensorShapes(batch=4, width=14, height=14, channel=1024) (0) (16, 1792) Absolute 2 0x1c0000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block3/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=2, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 4032 bank_addr_out 0 bank_addr_weights 6718 bank_addr_bias 7742 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### IN  resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### OUT resnet_v1_50/block3/unit_2/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block3/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (18, 4032) TensorShapes(batch=4, width=14, height=8, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 4032 bank_addr_out 0 bank_addr_weights 6718 bank_addr_bias 7742 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### IN  resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### OUT resnet_v1_50/block3/unit_2/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 22 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  4xCONV(resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D) + 4xELT(resnet_v1_50/block3/unit_2/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (18, 160) TensorShapes(batch=4, width=14, height=4, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 160 bank_addr_out 896 bank_addr_weights 6718 bank_addr_bias 7742 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### IN  resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### OUT resnet_v1_50/block3/unit_2/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0101 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_2/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block3/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 594 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 4395008
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 2898 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 4984832
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D (16, 3584) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 3584 bank_addr_weights 7758 bank_addr_bias 590 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 3808 bank_addr_weights 7758 bank_addr_bias 590 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 2902 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 4986880
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 3926 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 5249024
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D (16, 3584) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3344 bank_addr_out 4032 bank_addr_weights 594 bank_addr_bias 2898 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3568 bank_addr_out 160 bank_addr_weights 594 bank_addr_bias 2898 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_3/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 3942 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 5253120
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 4966 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 5515264
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block3/unit_3/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block3/unit_3/bottleneck_v1/add OUTPUT SPLIT by h total 3 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/add fm TensorShapes(batch=4, width=14, height=14, channel=1024) (16, 1792) ######
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=256) (16, 4032) ######
##### TMP resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=1024) (0, 0) ######
##### OUT resnet_v1_50/block3/unit_3/bottleneck_v1/add TensorShapes(batch=4, width=14, height=14, channel=1024) (0) (16, 1792) Absolute 2 0x1c0000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block3/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=2, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 4032 bank_addr_out 0 bank_addr_weights 2902 bank_addr_bias 3926 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_2/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### IN  resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### OUT resnet_v1_50/block3/unit_3/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block3/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (18, 4032) TensorShapes(batch=4, width=14, height=8, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 4032 bank_addr_out 0 bank_addr_weights 2902 bank_addr_bias 3926 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_2/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### IN  resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### OUT resnet_v1_50/block3/unit_3/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 22 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  4xCONV(resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D) + 4xELT(resnet_v1_50/block3/unit_3/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (18, 160) TensorShapes(batch=4, width=14, height=4, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 160 bank_addr_out 896 bank_addr_weights 2902 bank_addr_bias 3926 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_2/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### IN  resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### OUT resnet_v1_50/block3/unit_3/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0101 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_3/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block3/unit_3/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 4970 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 5517312
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 7274 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 6107136
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D (16, 3584) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 3584 bank_addr_weights 3942 bank_addr_bias 4966 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 3808 bank_addr_weights 3942 bank_addr_bias 4966 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 7278 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 6109184
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 110 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 6371328
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D (16, 3584) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3344 bank_addr_out 4032 bank_addr_weights 4970 bank_addr_bias 7274 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3568 bank_addr_out 160 bank_addr_weights 4970 bank_addr_bias 7274 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_4/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 126 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 6375424
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 1150 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 6637568
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block3/unit_4/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block3/unit_4/bottleneck_v1/add OUTPUT SPLIT by h total 3 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/add fm TensorShapes(batch=4, width=14, height=14, channel=1024) (16, 1792) ######
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=256) (16, 4032) ######
##### TMP resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=1024) (0, 0) ######
##### OUT resnet_v1_50/block3/unit_4/bottleneck_v1/add TensorShapes(batch=4, width=14, height=14, channel=1024) (0) (16, 1792) Absolute 2 0x1c0000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block3/unit_4/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=2, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 4032 bank_addr_out 0 bank_addr_weights 7278 bank_addr_bias 110 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_3/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### IN  resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### OUT resnet_v1_50/block3/unit_4/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_4/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block3/unit_4/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (18, 4032) TensorShapes(batch=4, width=14, height=8, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 4032 bank_addr_out 0 bank_addr_weights 7278 bank_addr_bias 110 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_3/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### IN  resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### OUT resnet_v1_50/block3/unit_4/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 22 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_4/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  4xCONV(resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D) + 4xELT(resnet_v1_50/block3/unit_4/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 5, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (18, 160) TensorShapes(batch=4, width=14, height=4, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 160 bank_addr_out 896 bank_addr_weights 7278 bank_addr_bias 110 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_3/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### IN  resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### OUT resnet_v1_50/block3/unit_4/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0101 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_4/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block3/unit_4/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 1154 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 6639616
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 3458 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 7229440
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 6, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D (16, 3584) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 3584 bank_addr_weights 126 bank_addr_bias 1150 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 3808 bank_addr_weights 126 bank_addr_bias 1150 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 3462 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 7231488
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 4486 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 7493632
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D (16, 3584) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0100 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3344 bank_addr_out 4032 bank_addr_weights 1154 bank_addr_bias 3458 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3568 bank_addr_out 160 bank_addr_weights 1154 bank_addr_bias 3458 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_5/bottleneck_v1/add #######
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 4502 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 7497728
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 5526 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 7759872
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D_bias end ######
#####   Fuse Operation resnet_v1_50/block3/unit_5/bottleneck_v1/add conv2d-eltwise  #####
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
#### resnet_v1_50/block3/unit_5/bottleneck_v1/add OUTPUT SPLIT by h total 3 ####
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/add fm TensorShapes(batch=4, width=14, height=14, channel=1024) (16, 1792) ######
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=256) (16, 4032) ######
##### TMP resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D fm TensorShapes(batch=4, width=14, height=14, channel=1024) (0, 0) ######
##### OUT resnet_v1_50/block3/unit_5/bottleneck_v1/add TensorShapes(batch=4, width=14, height=14, channel=1024) (0) (16, 1792) Absolute 2 0x1c0000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#####  2xCONV(resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D) + 2xELT(resnet_v1_50/block3/unit_5/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=2, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 4032 bank_addr_out 0 bank_addr_weights 3462 bank_addr_bias 4486 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 2 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_4/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### IN  resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=2, channel=1024)  
##### OUT resnet_v1_50/block3/unit_5/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=2, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_5/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#####  8xCONV(resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D) + 8xELT(resnet_v1_50/block3/unit_5/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (18, 4032) TensorShapes(batch=4, width=14, height=8, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 4032 bank_addr_out 0 bank_addr_weights 3462 bank_addr_bias 4486 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_4/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### IN  resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (2, 0) TensorShapes(batch=4, width=14, height=8, channel=1024)  
##### OUT resnet_v1_50/block3/unit_5/bottleneck_v1/add (18, 1792) TensorShapes(batch=4, width=14, height=8, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 22 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_5/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#####  4xCONV(resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D) + 4xELT(resnet_v1_50/block3/unit_5/bottleneck_v1/add) ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'w_bit_width': 8, 'kernel': [1, 1], 'b_fix_point': 4, 'quant_in_signed': True, 'stride': [1, 1], 'quant_out_signed': True, 'fix_point': 4, 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 3, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (18, 160) TensorShapes(batch=4, width=14, height=4, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 18 bank_id_out 2 bank_addr_in 160 bank_addr_out 896 bank_addr_weights 3462 bank_addr_bias 4486 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 1, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_4/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### IN  resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (2, 896) TensorShapes(batch=4, width=14, height=4, channel=1024)  
##### OUT resnet_v1_50/block3/unit_5/bottleneck_v1/add (18, 2688) TensorShapes(batch=4, width=14, height=4, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 1000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 2688 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
#####  CONV(resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D) +ELT(resnet_v1_50/block3/unit_5/bottleneck_v1/add) ######
## End DDR-to_DDR SPLIT by h 2 ##
#####   THIS IS NOT A DDR SPLIT ... it is  SPLIT #####
####### resnet_v1_50/block3/unit_5/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/shortcut/MaxPool #######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [1, 1], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=1024)  -> 
#### OUT resnet_v1_50/block3/unit_6/bottleneck_v1/shortcut/MaxPool (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=1024) #### 
POOL 1000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 3584 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 16 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 3584 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 18 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 3584 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 20 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 3584 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 22 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 3584 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 16 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 3584 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 18 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0101 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 3584 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 20 bank_id_out 22 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/shortcut/MaxPool #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 5530 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 7761920
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 7834 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 8351744
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 6, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 1000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 4032 bank_addr_weights 4502 bank_addr_bias 5526 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0101 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 160 bank_addr_weights 4502 bank_addr_bias 5526 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D #######
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D_weight start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 7838 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 8353792
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D_weight end ######
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D_bias start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 670 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 8615936
#### BARRIER LOAD END MARKER #####
#### Prefetch Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D_bias end ######
#### BARRIER CONV START MARKER #####
#### CONV (2,2) -> 2x (CONV S(1,2) + 4xELT SAMPLE (2,1)) #### 
#### Weigth Name resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D_weight Parameter True	Space 4718592 bits, BitePerPixel 8 Fraction 8 Start 11325440 End 16044032	Specifier 0 Layout 1 Time 240 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=256, width=3, height=3, channel=256) 
##### Bias Name resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D_bias Parameter True	Space 8192 bits, BitePerPixel 32 Fraction 5 Start 16044032 End 16052224	Specifier 0 Layout 1 Time 241 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=1, width=1, height=1, channel=256) 
###### PM size 16777216 
#### ATT {'overrideshape': True, 'quant_out_signed': True, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'stride': [2, 2], 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'pad_mode': 'VALID', 'fix_point': 4, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 15, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
#####IN resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=14, height=14, channel=256) ->  TEMP temp_for_sample (16, 496) TensorShapes(batch=1, width=7, height=8, channel=256) -> OUT resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D (16, 384) TensorShapes(batch=4, width=7, height=7, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 2 stride_h 1 act_type 1 jump_write 16 jump_write_endl 112 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
###### VHi 28672 VHt 14336 VHo 14336 ######
CONV 0100 1000 pad_left 1 pad_top 1 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3792 bank_addr_out 496 bank_addr_weights 5530 bank_addr_bias 7834 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 496
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 16 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 496
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 17 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 496
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 18 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 496
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 19 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 4016 bank_addr_out 496 bank_addr_weights 5530 bank_addr_bias 7834 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 496
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 20 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 496
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 21 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 496
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 22 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D #######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D (16, 384) TensorShapes(batch=4, width=7, height=7, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 448 jump_read 16 jump_read_endl 112 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 1000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 384 bank_addr_out 4032 bank_addr_weights 7838 bank_addr_bias 670 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_6/bottleneck_v1/shortcut/MaxPool (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=1024)  
##### IN  resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=1024)  
##### OUT resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 448 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 64 jump_read_endl 448 id 1 bank_addr_in 4032
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 16 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 448 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 64 jump_read_endl 448 id 1 bank_addr_in 4032
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 18 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 448 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 64 jump_read_endl 448 id 1 bank_addr_in 4032
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 448 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 64 jump_read_endl 448 id 1 bank_addr_in 4032
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/add #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D #######
#### BARRIER CONV START MARKER #####
## PAR SPLIT ##
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 0, 'pad_top': 0, 'pad_bottom': 0}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=1024) 
##### OUT resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
###### resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D PAR SPLIT part 0  of 2 ######
###### resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D PAR SPLIT part 1  of 2 ######
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 0 ##
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 64 channel 1024 reg_id 3 ddr_addr 8620032
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 10717184
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=1024)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 64 jump_read_endl 448 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 3584 bank_addr_out 4032 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 0 ##
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 1 ##
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 64 channel 1024 reg_id 3 ddr_addr 9668608
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 10721280
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=1024)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D (16, 4096) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 64 jump_read_endl 448 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 3584 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 1 ##
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 32 channel 1024 reg_id 3 ddr_addr 10725376
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2048 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 11249664
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=1024)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D (16, 832) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 64 jump_read_endl 448 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 3584 bank_addr_out 832 bank_addr_weights 0 bank_addr_bias 2048 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D #######
#### BARRIER CONV START MARKER #####
## PAR SPLIT ##
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D (16, 832) TensorShapes(batch=4, width=7, height=7, channel=512) 
##### OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D (16, 1056) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
###### resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D PAR SPLIT part 0  of 2 ######
###### resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D PAR SPLIT part 1  of 2 ######
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 0 ##
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 11251712
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 13611008
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D (16, 832) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D (16, 1056) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 576 bank_addr_out 1056 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 0 ##
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 1 ##
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 12431360
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 13612032
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D (16, 832) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D (16, 1072) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 576 bank_addr_out 1072 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 1 ##
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 128 channel 512 reg_id 3 ddr_addr 13613056
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 32 channel 16 reg_id 3 ddr_addr 14661632
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D (16, 1056) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 128 channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1056 bank_addr_out 1280 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 2, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### IN  resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### OUT resnet_v1_50/block4/unit_1/bottleneck_v1/add (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 4032
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 1280
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 16 bank_addr_out 4032 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 4032
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 1280
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 18 bank_addr_out 4032 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 4032
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 1280
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 20 bank_addr_out 4032 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 4032
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 1280
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 22 bank_addr_out 4032 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 128 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/add #######
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 2048 jump_write 128 length 32 channel 2048 reg_id 3 ddr_addr 14669824
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 15718400
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 11, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/add (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D (16, 832) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 4032 bank_addr_out 832 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D #######
#### BARRIER CONV START MARKER #####
## PAR SPLIT ##
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D (16, 832) TensorShapes(batch=4, width=7, height=7, channel=512) 
##### OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D (16, 1056) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
###### resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D PAR SPLIT part 0  of 2 ######
###### resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D PAR SPLIT part 1  of 2 ######
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 0 ##
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 15720448
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 18079744
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D (16, 832) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D (16, 1056) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 576 bank_addr_out 1056 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 0 ##
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 1 ##
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 16900096
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 18080768
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D (16, 832) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D (16, 1072) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 576 bank_addr_out 1072 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 1 ##
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 128 channel 512 reg_id 3 ddr_addr 18081792
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 32 channel 16 reg_id 3 ddr_addr 19130368
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D (16, 1056) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 128 channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1056 bank_addr_out 1280 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block4/unit_2/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 2, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### IN  resnet_v1_50/block4/unit_1/bottleneck_v1/add (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### OUT resnet_v1_50/block4/unit_2/bottleneck_v1/add (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 1280
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 4032
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 16 bank_addr_out 1280 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 1280
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 4032
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 18 bank_addr_out 1280 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 1280
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 4032
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 20 bank_addr_out 1280 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 1280
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 4032
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 22 bank_addr_out 1280 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block4/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 2048 jump_write 128 length 32 channel 2048 reg_id 3 ddr_addr 19138560
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 20187136
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 11, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/add (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D (16, 2176) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1280 bank_addr_out 2176 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D #######
#### BARRIER CONV START MARKER #####
## PAR SPLIT ##
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D (16, 2176) TensorShapes(batch=4, width=7, height=7, channel=512) 
##### OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D (16, 2400) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
###### resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D PAR SPLIT part 0  of 2 ######
###### resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D PAR SPLIT part 1  of 2 ######
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 0 ##
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 20189184
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 22548480
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D (16, 2176) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D (16, 2400) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1920 bank_addr_out 2400 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 0 ##
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 1 ##
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 21368832
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 22549504
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D (16, 2176) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D (16, 2416) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1920 bank_addr_out 2416 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 1 ##
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 128 channel 512 reg_id 3 ddr_addr 22550528
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 32 channel 16 reg_id 3 ddr_addr 23599104
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D (16, 2400) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D (16, 2624) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 128 channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2400 bank_addr_out 2624 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block4/unit_3/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 2, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D (16, 2624) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### IN  resnet_v1_50/block4/unit_2/bottleneck_v1/add (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### OUT resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2624) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 2624
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 1280
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 16 bank_addr_out 2624 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 2624
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 1280
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 18 bank_addr_out 2624 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 2624
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 1280
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 20 bank_addr_out 2624 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 2624
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 1280
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 22 bank_addr_out 2624 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block4/unit_3/bottleneck_v1/add #######
####### resnet_v1_50/pool5 #######
#### Parameters resnet_v1_50/pool5 start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 16 jump_write 1 length 49 channel 16 reg_id 3 ddr_addr 23607296
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/pool5 end ######
#### Parameters resnet_v1_50/pool5 start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 49 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 23621632
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/pool5 end ######
##### PAR SPLIT (128) #####
##### IN  resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2624) TensorShapes(batch=4, width=7, height=7, channel=2048) ######
##### OUT resnet_v1_50/pool5 (16, 3520) TensorShapes(batch=4, width=1, height=1, channel=2048) #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2624) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3520) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 9 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 128 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 1 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2624 bank_addr_out 3520 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2625) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3521) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2625 bank_addr_out 3521 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2626) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3522) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2626 bank_addr_out 3522 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2627) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3523) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2627 bank_addr_out 3523 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2628) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3524) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2628 bank_addr_out 3524 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2629) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3525) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2629 bank_addr_out 3525 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2630) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3526) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2630 bank_addr_out 3526 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2631) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3527) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2631 bank_addr_out 3527 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2632) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3528) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2632 bank_addr_out 3528 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2633) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3529) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2633 bank_addr_out 3529 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2634) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3530) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2634 bank_addr_out 3530 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2635) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3531) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2635 bank_addr_out 3531 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2636) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3532) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2636 bank_addr_out 3532 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2637) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3533) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2637 bank_addr_out 3533 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2638) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3534) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2638 bank_addr_out 3534 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2639) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3535) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2639 bank_addr_out 3535 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2640) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3536) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2640 bank_addr_out 3536 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2641) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3537) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2641 bank_addr_out 3537 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2642) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3538) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2642 bank_addr_out 3538 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2643) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3539) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2643 bank_addr_out 3539 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2644) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3540) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2644 bank_addr_out 3540 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2645) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3541) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2645 bank_addr_out 3541 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2646) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3542) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2646 bank_addr_out 3542 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2647) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3543) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2647 bank_addr_out 3543 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2648) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3544) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2648 bank_addr_out 3544 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2649) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3545) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2649 bank_addr_out 3545 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2650) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3546) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2650 bank_addr_out 3546 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2651) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3547) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2651 bank_addr_out 3547 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2652) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3548) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2652 bank_addr_out 3548 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2653) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3549) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2653 bank_addr_out 3549 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2654) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3550) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2654 bank_addr_out 3550 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2655) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3551) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2655 bank_addr_out 3551 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2656) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3552) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2656 bank_addr_out 3552 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2657) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3553) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2657 bank_addr_out 3553 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2658) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3554) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2658 bank_addr_out 3554 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2659) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3555) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2659 bank_addr_out 3555 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2660) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3556) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2660 bank_addr_out 3556 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2661) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3557) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2661 bank_addr_out 3557 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2662) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3558) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2662 bank_addr_out 3558 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2663) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3559) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2663 bank_addr_out 3559 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2664) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3560) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2664 bank_addr_out 3560 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2665) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3561) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2665 bank_addr_out 3561 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2666) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3562) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2666 bank_addr_out 3562 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2667) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3563) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2667 bank_addr_out 3563 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2668) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3564) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2668 bank_addr_out 3564 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2669) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3565) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2669 bank_addr_out 3565 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2670) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3566) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2670 bank_addr_out 3566 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2671) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3567) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2671 bank_addr_out 3567 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2672) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3568) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2672 bank_addr_out 3568 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2673) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3569) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2673 bank_addr_out 3569 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2674) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3570) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2674 bank_addr_out 3570 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2675) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3571) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2675 bank_addr_out 3571 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2676) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3572) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2676 bank_addr_out 3572 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2677) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3573) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2677 bank_addr_out 3573 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2678) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3574) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2678 bank_addr_out 3574 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2679) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3575) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2679 bank_addr_out 3575 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2680) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3576) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2680 bank_addr_out 3576 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2681) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3577) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2681 bank_addr_out 3577 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2682) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3578) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2682 bank_addr_out 3578 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2683) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3579) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2683 bank_addr_out 3579 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2684) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3580) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2684 bank_addr_out 3580 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2685) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3581) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2685 bank_addr_out 3581 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2686) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3582) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2686 bank_addr_out 3582 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2687) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3583) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2687 bank_addr_out 3583 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2688) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3584) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2689) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3585) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2689 bank_addr_out 3585 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2690) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3586) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2690 bank_addr_out 3586 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2691) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3587) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2691 bank_addr_out 3587 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2692) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3588) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2692 bank_addr_out 3588 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2693) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3589) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2693 bank_addr_out 3589 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2694) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3590) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2694 bank_addr_out 3590 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2695) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3591) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2695 bank_addr_out 3591 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2696) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3592) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2696 bank_addr_out 3592 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2697) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3593) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2697 bank_addr_out 3593 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2698) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3594) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2698 bank_addr_out 3594 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2699) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3595) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2699 bank_addr_out 3595 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2700) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3596) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2700 bank_addr_out 3596 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2701) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3597) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2701 bank_addr_out 3597 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2702) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3598) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2702 bank_addr_out 3598 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2703) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3599) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2703 bank_addr_out 3599 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2704) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3600) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2704 bank_addr_out 3600 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2705) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3601) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2705 bank_addr_out 3601 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2706) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3602) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2706 bank_addr_out 3602 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2707) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3603) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2707 bank_addr_out 3603 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2708) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3604) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2708 bank_addr_out 3604 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2709) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3605) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2709 bank_addr_out 3605 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2710) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3606) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2710 bank_addr_out 3606 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2711) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3607) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2711 bank_addr_out 3607 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2712) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3608) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2712 bank_addr_out 3608 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2713) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3609) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2713 bank_addr_out 3609 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2714) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3610) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2714 bank_addr_out 3610 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2715) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3611) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2715 bank_addr_out 3611 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2716) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3612) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2716 bank_addr_out 3612 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2717) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3613) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2717 bank_addr_out 3613 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2718) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3614) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2718 bank_addr_out 3614 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2719) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3615) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2719 bank_addr_out 3615 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2720) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3616) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2720 bank_addr_out 3616 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2721) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3617) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2721 bank_addr_out 3617 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2722) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3618) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2722 bank_addr_out 3618 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2723) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3619) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2723 bank_addr_out 3619 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2724) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3620) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2724 bank_addr_out 3620 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2725) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3621) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2725 bank_addr_out 3621 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2726) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3622) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2726 bank_addr_out 3622 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2727) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3623) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2727 bank_addr_out 3623 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2728) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3624) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2728 bank_addr_out 3624 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2729) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3625) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2729 bank_addr_out 3625 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2730) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3626) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2730 bank_addr_out 3626 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2731) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3627) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2731 bank_addr_out 3627 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2732) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3628) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2732 bank_addr_out 3628 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2733) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3629) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2733 bank_addr_out 3629 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2734) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3630) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2734 bank_addr_out 3630 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2735) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3631) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2735 bank_addr_out 3631 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2736) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3632) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2736 bank_addr_out 3632 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2737) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3633) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2737 bank_addr_out 3633 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2738) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3634) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2738 bank_addr_out 3634 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2739) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3635) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2739 bank_addr_out 3635 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2740) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3636) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2740 bank_addr_out 3636 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2741) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3637) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2741 bank_addr_out 3637 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2742) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3638) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2742 bank_addr_out 3638 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2743) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3639) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2743 bank_addr_out 3639 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2744) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3640) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2744 bank_addr_out 3640 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2745) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3641) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2745 bank_addr_out 3641 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2746) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3642) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2746 bank_addr_out 3642 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2747) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3643) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2747 bank_addr_out 3643 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2748) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3644) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2748 bank_addr_out 3644 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2749) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3645) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2749 bank_addr_out 3645 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2750) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3646) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2750 bank_addr_out 3646 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 2751) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 3647) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2751 bank_addr_out 3647 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/pool5 #######
####### resnet_v1_50/logits/Conv2D #######
#### Parameters resnet_v1_50/logits/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 2048 jump_write 128 length 63 channel 2048 reg_id 3 ddr_addr 23623680
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/logits/Conv2D end ######
#### Parameters resnet_v1_50/logits/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 8064 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 25688064
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/logits/Conv2D end ######
#### resnet_v1_50/logits/Conv2D OUTPUT SPLIT by h total 1 ####
#### ATT {'pad_mode': 'VALID', 'fix_point': 2, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 12, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/pool5 fm TensorShapes(batch=4, width=1, height=1, channel=2048) (16, 3520) ######
##### OUT resnet_v1_50/logits/Conv2D TensorShapes(batch=4, width=1, height=1, channel=1000) (0) (0, 14113) Absolute 3 0xdc84000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 2, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 12, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 1, '_iteration_': 0}  #### 
##### IN resnet_v1_50/pool5 (16, 3520) TensorShapes(batch=4, width=1, height=1, channel=2048)
#####  -> OUT resnet_v1_50/logits/Conv2D (0, 0) TensorShapes(batch=4, width=1, height=1, channel=1000) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 0 jump_write 63 jump_write_endl 63 jump_read 128 jump_read_endl 128 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 63 channel_offset 0 prelu_shift_p 0
CONV 0001 0010 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3520 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 8064 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/logits/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/logits/Conv2D TensorShapes(batch=4, width=1, height=1, channel=1000) 2 
####O resnet_v1_50/logits/Conv2D TensorShapes(batch=4, width=1, height=1, channel=1000) 3 #####
SAVE 0100 0010 mode 0 bank_addr 0 bank_id 0 jump_write 1008 jump_read 63 length 1 channel 1000 reg_id 1 ddr_addr 0
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/logits/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 0 ##
####### resnet_v1_50/logits/Conv2D #######
####### bracket #######
END 0010 0000 
####### bracket #######
