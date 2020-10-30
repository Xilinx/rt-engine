####### bracket #######
## BEGING 0000 0000 
####### bracket #######
####### input #######
# SOMBODY IS A LAZY BOY   ... missing code for
# input
# Memory_Access(input=-1, parameters=-1, output=-1)
# {212: <bound method BasicCode.gen_fm_par_fm of <SC.HwAbstraction.code_class.BasicCode object at 0x7f22fb8700d0>>, 232: <bound method BasicCode.gen_fm_ddr_fm of <SC.HwAbstraction.code_class.BasicCode object at 0x7f22fb8700d0>>, 333: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f22fb8700d0>>, 332: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f22fb8700d0>>, 313: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f22fb8700d0>>, 312: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f22fb8700d0>>, 213: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f22fb8700d0>>, 233: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f22fb8700d0>>}
####### input #######
####### resnet_v1_50/conv1/Conv2D #######
#### Parameters resnet_v1_50/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 16 jump_write 1 length 196 channel 3 reg_id 3 ddr_addr 0
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/conv1/Conv2D end ######
#### Parameters resnet_v1_50/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0001 mode 1 bank_addr 196 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 51200
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/conv1/Conv2D end ######
#### resnet_v1_50/conv1/Conv2D OUTPUT SPLIT by h total 14 ####
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 3, 'pad_bottom': 4, 'sync_type': 4}  #### 
##### IN input ddr TensorShapes(batch=4, width=224, height=224, channel=3) (0, 12563) ######
##### OUT resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=112, channel=64) (0) (0, 0) Absolute 2 0x0 #####
## Start DDR-to_DDR SPLIT by h 0 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 21 parts (counting pading)#####
#### START -3-0 END 18-18 #####
### R  b_id  9 b_add  224 K =   0 (h_0) ->  H_9  ###
LOAD 0001 0000 mode 0 bank_addr 224 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 0
### R  b_id 10 b_add    0 K =   1 (h_1) ->  H_2  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 14336
### R  b_id 10 b_add  224 K =   2 (h_2) ->  H_10  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 28672
### R  b_id 11 b_add    0 K =   3 (h_3) ->  H_3  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 43008
### R  b_id 11 b_add  224 K =   4 (h_4) ->  H_11  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 57344
### R  b_id 12 b_add    0 K =   5 (h_5) ->  H_4  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 71680
### R  b_id 12 b_add  224 K =   6 (h_6) ->  H_12  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 86016
### R  b_id 13 b_add    0 K =   7 (h_7) ->  H_5  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 100352
### R  b_id 13 b_add  224 K =   8 (h_8) ->  H_13  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 114688
### R  b_id 14 b_add    0 K =   9 (h_9) ->  H_6  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 129024
### R  b_id 14 b_add  224 K =  10 (h_10) ->  H_14  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 143360
### R  b_id 15 b_add    0 K =  11 (h_11) ->  H_7  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 157696
### R  b_id 15 b_add  224 K =  12 (h_12) ->  H_15  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 172032
### R  b_id  8 b_add  448 K =  13 (h_13) ->  H_16  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 186368
### R  b_id  8 b_add  672 K =  14 (h_14) ->  H_24  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 200704
### R  b_id  9 b_add  448 K =  15 (h_15) ->  H_17  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 215040
### R  b_id  9 b_add  672 K =  16 (h_16) ->  H_25  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 229376
### R  b_id 10 b_add  448 K =  17 (h_17) ->  H_18  ###
LOAD 0000 0100 mode 0 bank_addr 448 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 243712
#### Load Reshape 18 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,3)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 3, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 0}  #### 
##### IN input (8, 0) TensorShapes(batch=4, width=224, height=21, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 0) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 3 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 8189 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 0 ##
## Start DDR-to_DDR SPLIT by h 1 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add  672 K =   0 (h_18) ->  H_26  ###
LOAD 0100 0000 mode 0 bank_addr 672 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 258048
### R  b_id 11 b_add  448 K =   1 (h_19) ->  H_19  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 272384
### R  b_id 11 b_add  672 K =   2 (h_20) ->  H_27  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 286720
### R  b_id 12 b_add  448 K =   3 (h_21) ->  H_20  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 301056
### R  b_id 12 b_add  672 K =   4 (h_22) ->  H_28  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 315392
### R  b_id 13 b_add  448 K =   5 (h_23) ->  H_21  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 329728
### R  b_id 13 b_add  672 K =   6 (h_24) ->  H_29  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 344064
### R  b_id 14 b_add  448 K =   7 (h_25) ->  H_22  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 358400
### R  b_id 14 b_add  672 K =   8 (h_26) ->  H_30  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 372736
### R  b_id 15 b_add  448 K =   9 (h_27) ->  H_23  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 387072
### R  b_id 15 b_add  672 K =  10 (h_28) ->  H_31  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 401408
### R  b_id  8 b_add  896 K =  11 (h_29) ->  H_32  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 415744
### R  b_id  8 b_add 1120 K =  12 (h_30) ->  H_40  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 430080
### R  b_id  9 b_add  896 K =  13 (h_31) ->  H_33  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 444416
### R  b_id  9 b_add 1120 K =  14 (h_32) ->  H_41  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 458752
### R  b_id 10 b_add  896 K =  15 (h_33) ->  H_34  ###
LOAD 0000 0100 mode 0 bank_addr 896 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 473088
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 1}  #### 
##### IN input (8, 448) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 448) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 445 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 1 ##
## Start DDR-to_DDR SPLIT by h 2 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 1120 K =   0 (h_34) ->  H_42  ###
LOAD 0100 0000 mode 0 bank_addr 1120 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 487424
### R  b_id 11 b_add  896 K =   1 (h_35) ->  H_35  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 501760
### R  b_id 11 b_add 1120 K =   2 (h_36) ->  H_43  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 516096
### R  b_id 12 b_add  896 K =   3 (h_37) ->  H_36  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 530432
### R  b_id 12 b_add 1120 K =   4 (h_38) ->  H_44  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 544768
### R  b_id 13 b_add  896 K =   5 (h_39) ->  H_37  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 559104
### R  b_id 13 b_add 1120 K =   6 (h_40) ->  H_45  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 573440
### R  b_id 14 b_add  896 K =   7 (h_41) ->  H_38  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 587776
### R  b_id 14 b_add 1120 K =   8 (h_42) ->  H_46  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 602112
### R  b_id 15 b_add  896 K =   9 (h_43) ->  H_39  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 616448
### R  b_id 15 b_add 1120 K =  10 (h_44) ->  H_47  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 630784
### R  b_id  8 b_add 1344 K =  11 (h_45) ->  H_48  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 645120
### R  b_id  8 b_add 1568 K =  12 (h_46) ->  H_56  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 659456
### R  b_id  9 b_add 1344 K =  13 (h_47) ->  H_49  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 673792
### R  b_id  9 b_add 1568 K =  14 (h_48) ->  H_57  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 688128
### R  b_id 10 b_add 1344 K =  15 (h_49) ->  H_50  ###
LOAD 0000 0100 mode 0 bank_addr 1344 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 702464
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 2}  #### 
##### IN input (8, 896) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 896) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 893 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 2 ##
## Start DDR-to_DDR SPLIT by h 3 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 1568 K =   0 (h_50) ->  H_58  ###
LOAD 0100 0000 mode 0 bank_addr 1568 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 716800
### R  b_id 11 b_add 1344 K =   1 (h_51) ->  H_51  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 731136
### R  b_id 11 b_add 1568 K =   2 (h_52) ->  H_59  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 745472
### R  b_id 12 b_add 1344 K =   3 (h_53) ->  H_52  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 759808
### R  b_id 12 b_add 1568 K =   4 (h_54) ->  H_60  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 774144
### R  b_id 13 b_add 1344 K =   5 (h_55) ->  H_53  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 788480
### R  b_id 13 b_add 1568 K =   6 (h_56) ->  H_61  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 802816
### R  b_id 14 b_add 1344 K =   7 (h_57) ->  H_54  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 817152
### R  b_id 14 b_add 1568 K =   8 (h_58) ->  H_62  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 831488
### R  b_id 15 b_add 1344 K =   9 (h_59) ->  H_55  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 845824
### R  b_id 15 b_add 1568 K =  10 (h_60) ->  H_63  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 860160
### R  b_id  8 b_add 1792 K =  11 (h_61) ->  H_64  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 874496
### R  b_id  8 b_add 2016 K =  12 (h_62) ->  H_72  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 888832
### R  b_id  9 b_add 1792 K =  13 (h_63) ->  H_65  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 903168
### R  b_id  9 b_add 2016 K =  14 (h_64) ->  H_73  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 917504
### R  b_id 10 b_add 1792 K =  15 (h_65) ->  H_66  ###
LOAD 0000 0100 mode 0 bank_addr 1792 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 931840
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 3}  #### 
##### IN input (8, 1344) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 1344) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 1341 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 3 ##
## Start DDR-to_DDR SPLIT by h 4 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 2016 K =   0 (h_66) ->  H_74  ###
LOAD 0100 0000 mode 0 bank_addr 2016 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 946176
### R  b_id 11 b_add 1792 K =   1 (h_67) ->  H_67  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 960512
### R  b_id 11 b_add 2016 K =   2 (h_68) ->  H_75  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 974848
### R  b_id 12 b_add 1792 K =   3 (h_69) ->  H_68  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 989184
### R  b_id 12 b_add 2016 K =   4 (h_70) ->  H_76  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1003520
### R  b_id 13 b_add 1792 K =   5 (h_71) ->  H_69  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1017856
### R  b_id 13 b_add 2016 K =   6 (h_72) ->  H_77  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1032192
### R  b_id 14 b_add 1792 K =   7 (h_73) ->  H_70  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1046528
### R  b_id 14 b_add 2016 K =   8 (h_74) ->  H_78  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1060864
### R  b_id 15 b_add 1792 K =   9 (h_75) ->  H_71  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1075200
### R  b_id 15 b_add 2016 K =  10 (h_76) ->  H_79  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1089536
### R  b_id  8 b_add 2240 K =  11 (h_77) ->  H_80  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1103872
### R  b_id  8 b_add 2464 K =  12 (h_78) ->  H_88  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1118208
### R  b_id  9 b_add 2240 K =  13 (h_79) ->  H_81  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1132544
### R  b_id  9 b_add 2464 K =  14 (h_80) ->  H_89  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1146880
### R  b_id 10 b_add 2240 K =  15 (h_81) ->  H_82  ###
LOAD 0000 0100 mode 0 bank_addr 2240 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1161216
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 4}  #### 
##### IN input (8, 1792) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 1792) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 1789 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 4 ##
## Start DDR-to_DDR SPLIT by h 5 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 2464 K =   0 (h_82) ->  H_90  ###
LOAD 0100 0000 mode 0 bank_addr 2464 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1175552
### R  b_id 11 b_add 2240 K =   1 (h_83) ->  H_83  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1189888
### R  b_id 11 b_add 2464 K =   2 (h_84) ->  H_91  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1204224
### R  b_id 12 b_add 2240 K =   3 (h_85) ->  H_84  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1218560
### R  b_id 12 b_add 2464 K =   4 (h_86) ->  H_92  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1232896
### R  b_id 13 b_add 2240 K =   5 (h_87) ->  H_85  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1247232
### R  b_id 13 b_add 2464 K =   6 (h_88) ->  H_93  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1261568
### R  b_id 14 b_add 2240 K =   7 (h_89) ->  H_86  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1275904
### R  b_id 14 b_add 2464 K =   8 (h_90) ->  H_94  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1290240
### R  b_id 15 b_add 2240 K =   9 (h_91) ->  H_87  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1304576
### R  b_id 15 b_add 2464 K =  10 (h_92) ->  H_95  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1318912
### R  b_id  8 b_add 2688 K =  11 (h_93) ->  H_96  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1333248
### R  b_id  8 b_add 2912 K =  12 (h_94) ->  H_104  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1347584
### R  b_id  9 b_add 2688 K =  13 (h_95) ->  H_97  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1361920
### R  b_id  9 b_add 2912 K =  14 (h_96) ->  H_105  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1376256
### R  b_id 10 b_add 2688 K =  15 (h_97) ->  H_98  ###
LOAD 0000 0100 mode 0 bank_addr 2688 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1390592
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 5}  #### 
##### IN input (8, 2240) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 2240) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2237 bank_addr_out 2240 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 5 ##
## Start DDR-to_DDR SPLIT by h 6 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 2912 K =   0 (h_98) ->  H_106  ###
LOAD 0100 0000 mode 0 bank_addr 2912 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1404928
### R  b_id 11 b_add 2688 K =   1 (h_99) ->  H_99  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1419264
### R  b_id 11 b_add 2912 K =   2 (h_100) ->  H_107  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1433600
### R  b_id 12 b_add 2688 K =   3 (h_101) ->  H_100  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1447936
### R  b_id 12 b_add 2912 K =   4 (h_102) ->  H_108  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1462272
### R  b_id 13 b_add 2688 K =   5 (h_103) ->  H_101  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1476608
### R  b_id 13 b_add 2912 K =   6 (h_104) ->  H_109  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1490944
### R  b_id 14 b_add 2688 K =   7 (h_105) ->  H_102  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1505280
### R  b_id 14 b_add 2912 K =   8 (h_106) ->  H_110  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1519616
### R  b_id 15 b_add 2688 K =   9 (h_107) ->  H_103  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1533952
### R  b_id 15 b_add 2912 K =  10 (h_108) ->  H_111  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1548288
### R  b_id  8 b_add 3136 K =  11 (h_109) ->  H_112  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1562624
### R  b_id  8 b_add 3360 K =  12 (h_110) ->  H_120  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1576960
### R  b_id  9 b_add 3136 K =  13 (h_111) ->  H_113  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1591296
### R  b_id  9 b_add 3360 K =  14 (h_112) ->  H_121  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1605632
### R  b_id 10 b_add 3136 K =  15 (h_113) ->  H_114  ###
LOAD 0000 0100 mode 0 bank_addr 3136 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1619968
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 6}  #### 
##### IN input (8, 2688) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 2688) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 2685 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 6 ##
## Start DDR-to_DDR SPLIT by h 7 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 3360 K =   0 (h_114) ->  H_122  ###
LOAD 0100 0000 mode 0 bank_addr 3360 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1634304
### R  b_id 11 b_add 3136 K =   1 (h_115) ->  H_115  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1648640
### R  b_id 11 b_add 3360 K =   2 (h_116) ->  H_123  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1662976
### R  b_id 12 b_add 3136 K =   3 (h_117) ->  H_116  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1677312
### R  b_id 12 b_add 3360 K =   4 (h_118) ->  H_124  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1691648
### R  b_id 13 b_add 3136 K =   5 (h_119) ->  H_117  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1705984
### R  b_id 13 b_add 3360 K =   6 (h_120) ->  H_125  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1720320
### R  b_id 14 b_add 3136 K =   7 (h_121) ->  H_118  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1734656
### R  b_id 14 b_add 3360 K =   8 (h_122) ->  H_126  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1748992
### R  b_id 15 b_add 3136 K =   9 (h_123) ->  H_119  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1763328
### R  b_id 15 b_add 3360 K =  10 (h_124) ->  H_127  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1777664
### R  b_id  8 b_add 3584 K =  11 (h_125) ->  H_128  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1792000
### R  b_id  8 b_add 3808 K =  12 (h_126) ->  H_136  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1806336
### R  b_id  9 b_add 3584 K =  13 (h_127) ->  H_129  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1820672
### R  b_id  9 b_add 3808 K =  14 (h_128) ->  H_137  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1835008
### R  b_id 10 b_add 3584 K =  15 (h_129) ->  H_130  ###
LOAD 0000 0100 mode 0 bank_addr 3584 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1849344
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 7}  #### 
##### IN input (8, 3136) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 3136) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 3133 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 7 ##
## Start DDR-to_DDR SPLIT by h 8 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 3808 K =   0 (h_130) ->  H_138  ###
LOAD 0100 0000 mode 0 bank_addr 3808 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1863680
### R  b_id 11 b_add 3584 K =   1 (h_131) ->  H_131  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1878016
### R  b_id 11 b_add 3808 K =   2 (h_132) ->  H_139  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1892352
### R  b_id 12 b_add 3584 K =   3 (h_133) ->  H_132  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1906688
### R  b_id 12 b_add 3808 K =   4 (h_134) ->  H_140  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1921024
### R  b_id 13 b_add 3584 K =   5 (h_135) ->  H_133  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1935360
### R  b_id 13 b_add 3808 K =   6 (h_136) ->  H_141  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1949696
### R  b_id 14 b_add 3584 K =   7 (h_137) ->  H_134  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1964032
### R  b_id 14 b_add 3808 K =   8 (h_138) ->  H_142  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1978368
### R  b_id 15 b_add 3584 K =   9 (h_139) ->  H_135  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1992704
### R  b_id 15 b_add 3808 K =  10 (h_140) ->  H_143  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2007040
### R  b_id  8 b_add 4032 K =  11 (h_141) ->  H_144  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2021376
### R  b_id  8 b_add 4256 K =  12 (h_142) ->  H_152  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2035712
### R  b_id  9 b_add 4032 K =  13 (h_143) ->  H_145  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2050048
### R  b_id  9 b_add 4256 K =  14 (h_144) ->  H_153  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2064384
### R  b_id 10 b_add 4032 K =  15 (h_145) ->  H_146  ###
LOAD 0000 0100 mode 0 bank_addr 4032 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2078720
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 8}  #### 
##### IN input (8, 3584) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 3584) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 3581 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 8 ##
## Start DDR-to_DDR SPLIT by h 9 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 4256 K =   0 (h_146) ->  H_154  ###
LOAD 0100 0000 mode 0 bank_addr 4256 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2093056
### R  b_id 11 b_add 4032 K =   1 (h_147) ->  H_147  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2107392
### R  b_id 11 b_add 4256 K =   2 (h_148) ->  H_155  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2121728
### R  b_id 12 b_add 4032 K =   3 (h_149) ->  H_148  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2136064
### R  b_id 12 b_add 4256 K =   4 (h_150) ->  H_156  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2150400
### R  b_id 13 b_add 4032 K =   5 (h_151) ->  H_149  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2164736
### R  b_id 13 b_add 4256 K =   6 (h_152) ->  H_157  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2179072
### R  b_id 14 b_add 4032 K =   7 (h_153) ->  H_150  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2193408
### R  b_id 14 b_add 4256 K =   8 (h_154) ->  H_158  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2207744
### R  b_id 15 b_add 4032 K =   9 (h_155) ->  H_151  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2222080
### R  b_id 15 b_add 4256 K =  10 (h_156) ->  H_159  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2236416
### R  b_id  8 b_add 4480 K =  11 (h_157) ->  H_160  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2250752
### R  b_id  8 b_add 4704 K =  12 (h_158) ->  H_168  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2265088
### R  b_id  9 b_add 4480 K =  13 (h_159) ->  H_161  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2279424
### R  b_id  9 b_add 4704 K =  14 (h_160) ->  H_169  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2293760
### R  b_id 10 b_add 4480 K =  15 (h_161) ->  H_162  ###
LOAD 0000 0100 mode 0 bank_addr 4480 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2308096
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 9}  #### 
##### IN input (8, 4032) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 4032) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 4029 bank_addr_out 4032 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 9 ##
## Start DDR-to_DDR SPLIT by h 10 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 4704 K =   0 (h_162) ->  H_170  ###
LOAD 0100 0000 mode 0 bank_addr 4704 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2322432
### R  b_id 11 b_add 4480 K =   1 (h_163) ->  H_163  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2336768
### R  b_id 11 b_add 4704 K =   2 (h_164) ->  H_171  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2351104
### R  b_id 12 b_add 4480 K =   3 (h_165) ->  H_164  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2365440
### R  b_id 12 b_add 4704 K =   4 (h_166) ->  H_172  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2379776
### R  b_id 13 b_add 4480 K =   5 (h_167) ->  H_165  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2394112
### R  b_id 13 b_add 4704 K =   6 (h_168) ->  H_173  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2408448
### R  b_id 14 b_add 4480 K =   7 (h_169) ->  H_166  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2422784
### R  b_id 14 b_add 4704 K =   8 (h_170) ->  H_174  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2437120
### R  b_id 15 b_add 4480 K =   9 (h_171) ->  H_167  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2451456
### R  b_id 15 b_add 4704 K =  10 (h_172) ->  H_175  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2465792
### R  b_id  8 b_add 4928 K =  11 (h_173) ->  H_176  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2480128
### R  b_id  8 b_add 5152 K =  12 (h_174) ->  H_184  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2494464
### R  b_id  9 b_add 4928 K =  13 (h_175) ->  H_177  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2508800
### R  b_id  9 b_add 5152 K =  14 (h_176) ->  H_185  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2523136
### R  b_id 10 b_add 4928 K =  15 (h_177) ->  H_178  ###
LOAD 0000 0100 mode 0 bank_addr 4928 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2537472
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 10}  #### 
##### IN input (8, 4480) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 4480) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 4477 bank_addr_out 4480 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 10 ##
## Start DDR-to_DDR SPLIT by h 11 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 5152 K =   0 (h_178) ->  H_186  ###
LOAD 0100 0000 mode 0 bank_addr 5152 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2551808
### R  b_id 11 b_add 4928 K =   1 (h_179) ->  H_179  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2566144
### R  b_id 11 b_add 5152 K =   2 (h_180) ->  H_187  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2580480
### R  b_id 12 b_add 4928 K =   3 (h_181) ->  H_180  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2594816
### R  b_id 12 b_add 5152 K =   4 (h_182) ->  H_188  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2609152
### R  b_id 13 b_add 4928 K =   5 (h_183) ->  H_181  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2623488
### R  b_id 13 b_add 5152 K =   6 (h_184) ->  H_189  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2637824
### R  b_id 14 b_add 4928 K =   7 (h_185) ->  H_182  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2652160
### R  b_id 14 b_add 5152 K =   8 (h_186) ->  H_190  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2666496
### R  b_id 15 b_add 4928 K =   9 (h_187) ->  H_183  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2680832
### R  b_id 15 b_add 5152 K =  10 (h_188) ->  H_191  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2695168
### R  b_id  8 b_add 5376 K =  11 (h_189) ->  H_192  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2709504
### R  b_id  8 b_add 5600 K =  12 (h_190) ->  H_200  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2723840
### R  b_id  9 b_add 5376 K =  13 (h_191) ->  H_193  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2738176
### R  b_id  9 b_add 5600 K =  14 (h_192) ->  H_201  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2752512
### R  b_id 10 b_add 5376 K =  15 (h_193) ->  H_194  ###
LOAD 0000 0100 mode 0 bank_addr 5376 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2766848
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 11}  #### 
##### IN input (8, 4928) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 4928) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 4925 bank_addr_out 4928 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 11 ##
## Start DDR-to_DDR SPLIT by h 12 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id 10 b_add 5600 K =   0 (h_194) ->  H_202  ###
LOAD 0100 0000 mode 0 bank_addr 5600 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2781184
### R  b_id 11 b_add 5376 K =   1 (h_195) ->  H_195  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2795520
### R  b_id 11 b_add 5600 K =   2 (h_196) ->  H_203  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2809856
### R  b_id 12 b_add 5376 K =   3 (h_197) ->  H_196  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2824192
### R  b_id 12 b_add 5600 K =   4 (h_198) ->  H_204  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2838528
### R  b_id 13 b_add 5376 K =   5 (h_199) ->  H_197  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2852864
### R  b_id 13 b_add 5600 K =   6 (h_200) ->  H_205  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2867200
### R  b_id 14 b_add 5376 K =   7 (h_201) ->  H_198  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2881536
### R  b_id 14 b_add 5600 K =   8 (h_202) ->  H_206  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2895872
### R  b_id 15 b_add 5376 K =   9 (h_203) ->  H_199  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2910208
### R  b_id 15 b_add 5600 K =  10 (h_204) ->  H_207  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2924544
### R  b_id  8 b_add 5824 K =  11 (h_205) ->  H_208  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2938880
### R  b_id  8 b_add 6048 K =  12 (h_206) ->  H_216  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2953216
### R  b_id  9 b_add 5824 K =  13 (h_207) ->  H_209  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2967552
### R  b_id  9 b_add 6048 K =  14 (h_208) ->  H_217  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2981888
### R  b_id 10 b_add 5824 K =  15 (h_209) ->  H_210  ###
LOAD 0000 0100 mode 0 bank_addr 5824 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2996224
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 12}  #### 
##### IN input (8, 5376) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 5376) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0001 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 8 bank_id_out 0 bank_addr_in 5373 bank_addr_out 5376 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 12 ##
## Start DDR-to_DDR SPLIT by h 13 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 14 parts (counting pading)#####
#### START 0-0 END 14-14 #####
### R  b_id 10 b_add 6048 K =   0 (h_210) ->  H_218  ###
LOAD 0100 0000 mode 0 bank_addr 6048 bank_id 10 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3010560
### R  b_id 11 b_add 5824 K =   1 (h_211) ->  H_211  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3024896
### R  b_id 11 b_add 6048 K =   2 (h_212) ->  H_219  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 11 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3039232
### R  b_id 12 b_add 5824 K =   3 (h_213) ->  H_212  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3053568
### R  b_id 12 b_add 6048 K =   4 (h_214) ->  H_220  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 12 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3067904
### R  b_id 13 b_add 5824 K =   5 (h_215) ->  H_213  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3082240
### R  b_id 13 b_add 6048 K =   6 (h_216) ->  H_221  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 13 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3096576
### R  b_id 14 b_add 5824 K =   7 (h_217) ->  H_214  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3110912
### R  b_id 14 b_add 6048 K =   8 (h_218) ->  H_222  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 14 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3125248
### R  b_id 15 b_add 5824 K =   9 (h_219) ->  H_215  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3139584
### R  b_id 15 b_add 6048 K =  10 (h_220) ->  H_223  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 15 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3153920
### R  b_id  8 b_add 6272 K =  11 (h_221) ->  H_224  ###
LOAD 0000 0000 mode 0 bank_addr 6272 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3168256
### R  b_id  8 b_add 6496 K =  12 (h_222) ->  H_232  ###
LOAD 0000 0000 mode 0 bank_addr 6496 bank_id 8 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3182592
### R  b_id  9 b_add 6272 K =  13 (h_223) ->  H_225  ###
LOAD 0000 0100 mode 0 bank_addr 6272 bank_id 9 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3196928
#### Load Reshape 14 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [3, 3, 3, 3], 'w_fix_point': 12, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [7, 7], 'stride': [2, 2], 'dependency_summary': [1, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 4, 'sync_type': 4, '_iterations_': 14, '_iteration_': 13}  #### 
##### IN input (8, 5824) TensorShapes(batch=4, width=224, height=14, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (0, 5824) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 1000 pad_left 3 pad_top 0 pad_right 4 pad_bottom 4 bank_id_in 8 bank_id_out 0 bank_addr_in 5821 bank_addr_out 5824 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End DDR-to_DDR SPLIT by h 13 ##
####### resnet_v1_50/conv1/Conv2D #######
####### resnet_v1_50/pool1/MaxPool #######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 3,3 0,0)) #### 
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [3, 3], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 1, 'pad_top': 0, 'pad_bottom': 1, 'sync_type': 8}  #### 
##### IN resnet_v1_50/conv1/Conv2D (0, 0) TensorShapes(batch=4, width=112, height=112, channel=64)  -> 
#### OUT resnet_v1_50/pool1/MaxPool (16, 0) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
POOL 0100 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 448 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 448 bank_addr_out 0 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 896 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 896 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1344 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1344 bank_addr_out 224 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2240 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2240 bank_addr_out 448 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2688 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 2688 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3136 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3136 bank_addr_out 672 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4032 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4032 bank_addr_out 896 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4480 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4480 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4928 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 4928 bank_addr_out 1120 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 3
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5824 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 3
POOL 0000 0001 pad_top 0 pad_bottom 1 pad_left 0 pad_right 1 shift_avg 0 bank_addr_in 5824 bank_addr_out 1344 length 56 jump_read_endl 448 jump_write_endl 224 stride_w 2 stride_h 2 valid_pixel_parallel 2 kernel_w 3 select_avg 0 channel_group 4 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 3
#### BARRIER POOL STOP MARKER #####
####### resnet_v1_50/pool1/MaxPool #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 53248
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 64 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 69632
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 3, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/pool1/MaxPool (16, 0) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (0, 0) TensorShapes(batch=4, width=56, height=56, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 224 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 448 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 672 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1120 bank_addr_out 4480 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1344 bank_addr_out 5376 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 4 channel 64 reg_id 3 ddr_addr 71680
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 16 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 75776
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D end ######
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
CONV 0100 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1344 bank_addr_out 2912 bank_addr_weights 0 bank_addr_bias 16 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 77824
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 144 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 114688
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_1/bottleneck_v1/conv1/Conv2D (16, 1568) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D (16, 3136) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 10 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1340 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1564 bank_addr_out 3360 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1788 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2012 bank_addr_out 3808 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2236 bank_addr_out 4032 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2460 bank_addr_out 160 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 2684 bank_addr_out 384 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 116736
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 64 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 133120
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_1/bottleneck_v1/conv2/Conv2D (16, 3136) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (8, 0) TensorShapes(batch=4, width=56, height=56, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 5 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 3136 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 3360 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 3584 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 3808 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 4032 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 160 bank_addr_out 4480 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 384 bank_addr_out 5376 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block1/unit_1/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/shortcut/Conv2D (0, 0) TensorShapes(batch=4, width=56, height=56, channel=256)  
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/conv3/Conv2D (8, 0) TensorShapes(batch=4, width=56, height=56, channel=256)  
##### OUT resnet_v1_50/block1/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=56, height=56, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 8 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 0 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 10 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 2 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 12 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 4 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 14 shift_read 1 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 6 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block1/unit_1/bottleneck_v1/add #######
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 4 channel 256 reg_id 3 ddr_addr 135168
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 64 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 151552
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=56, height=56, channel=256)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 3584 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 4480 bank_addr_out 1120 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 5376 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 153600
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 144 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 190464
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (16, 1568) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3868 bank_addr_out 1568 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4092 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 220 bank_addr_out 2016 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 444 bank_addr_out 2240 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 668 bank_addr_out 2464 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 892 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1116 bank_addr_out 2912 bank_addr_weights 0 bank_addr_bias 144 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 192512
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 64 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 208896
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/conv2/Conv2D (16, 1568) TensorShapes(batch=4, width=56, height=56, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (8, 0) TensorShapes(batch=4, width=56, height=56, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 896 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 1568 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 1792 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 2016 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 2240 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 2464 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 2688 bank_addr_out 4480 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 8 bank_addr_in 2912 bank_addr_out 5376 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block1/unit_2/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_2/bottleneck_v1/conv3/Conv2D (8, 0) TensorShapes(batch=4, width=56, height=56, channel=256)  
##### IN  resnet_v1_50/block1/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=56, height=56, channel=256)  
##### OUT resnet_v1_50/block1/unit_2/bottleneck_v1/add (8, 0) TensorShapes(batch=4, width=56, height=56, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 0 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 896 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 1792 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 2688 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 3584 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 4480 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 8 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 8 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 10 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 10 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 12 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 12 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 14 shift_read 0 jump_read 16 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 1000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 896 bank_id_out 14 bank_addr_out 5376 width 56 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block1/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool #######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [1, 1], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (8, 0) TensorShapes(batch=4, width=56, height=56, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (16, 0) TensorShapes(batch=4, width=28, height=28, channel=256) #### 
POOL 1000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 10 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 14 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 10 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 14 bank_id_out 23 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 10 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 14 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 10 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 14 bank_id_out 23 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 10 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 14 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4480 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 8 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4480 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 10 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4480 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 12 bank_id_out 22 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4480 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 14 bank_id_out 23 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 8 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 10 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 12 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0001 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 14 bank_id_out 19 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 4 channel 256 reg_id 3 ddr_addr 210944
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 64 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 227328
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (8, 0) TensorShapes(batch=4, width=56, height=56, channel=256)
#####  -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D (16, 1792) TensorShapes(batch=4, width=56, height=56, channel=64) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 4 jump_write_endl 224 jump_read 16 jump_read_endl 896 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 4 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 0 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 896 bank_addr_out 2016 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 1792 bank_addr_out 2240 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 2688 bank_addr_out 2464 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 3584 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 4480 bank_addr_out 2912 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 8 bank_id_out 16 bank_addr_in 5376 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 64 length 56 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 36 channel 64 reg_id 3 ddr_addr 229376
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 144 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 266240
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (2,2) -> 7x (CONV S(1,2) + 4xELT SAMPLE (2,1)) #### 
#### Weigth Name resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D_weight Parameter True	Space 294912 bits, BitePerPixel 8 Fraction 8 Start 0 End 294912	Specifier 0 Layout 1 Time 143 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=64, width=3, height=3, channel=64) 
##### Bias Name resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D_bias Parameter True	Space 2048 bits, BitePerPixel 32 Fraction 5 Start 294912 End 296960	Specifier 0 Layout 1 Time 144 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=1, width=1, height=1, channel=64) 
###### PM size 16777216 
#### ATT {'overrideshape': True, 'quant_out_signed': True, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'stride': [2, 2], 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'pad_mode': 'VALID', 'fix_point': 4, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 15, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
#####IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv1/Conv2D (16, 1792) TensorShapes(batch=4, width=56, height=56, channel=64) ->  TEMP temp_for_sample (16, 3808) TensorShapes(batch=1, width=28, height=8, channel=64) -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (16, 3360) TensorShapes(batch=4, width=28, height=28, channel=64) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 2 stride_h 1 act_type 1 jump_write 4 jump_write_endl 112 jump_read 4 jump_read_endl 224 wgt_jump_read_endl 36 stride_out 1 channel_group_in 4 channel_group_out 4 channel_offset 0 prelu_shift_p 0
###### VHi 28672 VHt 14336 VHo 14336 ######
CONV 0001 1000 pad_left 1 pad_top 1 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1564 bank_addr_out 3808 bank_addr_weights 0 bank_addr_bias 144 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 16 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 17 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 18 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 19 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1788 bank_addr_out 3808 bank_addr_weights 0 bank_addr_bias 144 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 20 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 21 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 22 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 23 bank_addr_out 3360 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2012 bank_addr_out 3808 bank_addr_weights 0 bank_addr_bias 144 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 16 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 17 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 18 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 19 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2236 bank_addr_out 3808 bank_addr_weights 0 bank_addr_bias 144 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 20 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 21 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 22 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 23 bank_addr_out 3472 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2460 bank_addr_out 3808 bank_addr_weights 0 bank_addr_bias 144 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 16 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 17 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 18 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 19 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2684 bank_addr_out 3808 bank_addr_weights 0 bank_addr_bias 144 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 20 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 21 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 22 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 23 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 2908 bank_addr_out 3808 bank_addr_weights 0 bank_addr_bias 144 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 16 bank_addr_out 3696 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 17 bank_addr_out 3696 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 18 bank_addr_out 3696 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 4 jump_read_endl 112 id 0 bank_addr_in 3808
ELEW 1000 0001 num 1 nonlinear_type 0 jump_write 4 jump_write_endl 112 bank_id_out 19 bank_addr_out 3696 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 4 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 64 jump_write 4 length 16 channel 64 reg_id 3 ddr_addr 268288
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 64 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 284672
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/conv2/Conv2D (16, 3360) TensorShapes(batch=4, width=28, height=28, channel=64)
#####  -> OUT resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=28, height=28, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 16 jump_write_endl 448 jump_read 4 jump_read_endl 112 wgt_jump_read_endl 4 stride_out 1 channel_group_in 4 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3360 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 64 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3472 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 64 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 0100 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3584 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 64 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0100 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3696 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 64 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (16, 0) TensorShapes(batch=4, width=28, height=28, channel=256)  
##### IN  resnet_v1_50/block1/unit_3/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=28, height=28, channel=256)  
##### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=28, height=28, channel=256) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 448
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 448 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 448
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 448 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 448
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 448 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 448
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 448 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 20 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 22 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 1344
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 16 bank_addr_out 1344 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 448 id 0 bank_addr_in 1344
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 16 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 16 jump_write_endl 448 bank_id_out 18 bank_addr_out 1344 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block1/unit_3/bottleneck_v1/add #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 32 channel 256 reg_id 3 ddr_addr 286720
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 512 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 417792
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=28, height=28, channel=256)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 512 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 448 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 512 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 512 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1344 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 512 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 8 channel 256 reg_id 3 ddr_addr 419840
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 128 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 452608
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block1/unit_3/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=28, height=28, channel=256)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D (16, 1792) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 16 jump_read_endl 448 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 0 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 128 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 448 bank_addr_out 2016 bank_addr_weights 0 bank_addr_bias 128 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 896 bank_addr_out 2240 bank_addr_weights 0 bank_addr_bias 128 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1344 bank_addr_out 2464 bank_addr_weights 0 bank_addr_bias 128 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 454656
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 576 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 602112
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_1/bottleneck_v1/conv1/Conv2D (16, 1792) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D (16, 2688) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1560 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1784 bank_addr_out 2912 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2008 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 2232 bank_addr_out 3360 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 604160
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 256 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 669696
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_1/bottleneck_v1/conv2/Conv2D (16, 2688) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=28, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2688 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2912 bank_addr_out 4480 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3136 bank_addr_out 5376 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3360 bank_addr_out 6272 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block2/unit_1/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/shortcut/Conv2D (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512)  
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/conv3/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=28, channel=512)  
##### OUT resnet_v1_50/block2/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 0 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 896 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 1792 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 2688 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block2/unit_1/bottleneck_v1/add #######
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 671744
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 256 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 737280
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 1792 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 2688 bank_addr_out 672 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 739328
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 576 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 886784
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3864 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4088 bank_addr_out 1120 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 216 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 440 bank_addr_out 1568 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 888832
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 256 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 954368
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=28, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 6 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1120 bank_addr_out 4480 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1344 bank_addr_out 5376 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1568 bank_addr_out 6272 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block2/unit_2/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/conv3/Conv2D (0, 3584) TensorShapes(batch=4, width=28, height=28, channel=512)  
##### IN  resnet_v1_50/block2/unit_1/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=28, height=28, channel=512)  
##### OUT resnet_v1_50/block2/unit_2/bottleneck_v1/add (0, 3584) TensorShapes(batch=4, width=28, height=28, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 3584
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 3584 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 4480 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 4480 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 4480 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 4480
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 4480 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 5376 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 5376 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 5376 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 5376
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 5376 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 6272
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 6272 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 6272
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 2688
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 6272 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block2/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 956416
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 256 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1021952
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_2/bottleneck_v1/add (0, 3584) TensorShapes(batch=4, width=28, height=28, channel=512)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 3584 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 4480 bank_addr_out 224 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 5376 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 6272 bank_addr_out 672 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 1024000
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 576 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1171456
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 7 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3864 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 4088 bank_addr_out 1120 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 1 pad_top 0 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 216 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 440 bank_addr_out 1568 bank_addr_weights 0 bank_addr_bias 576 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 1173504
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 256 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 1239040
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/conv2/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D (0, 7168) TensorShapes(batch=4, width=28, height=28, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 896 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 896 bank_addr_out 7168 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1120 bank_addr_out 8064 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1344 bank_addr_out 768 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 1568 bank_addr_out 1664 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block2/unit_3/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 4, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_3/bottleneck_v1/conv3/Conv2D (0, 7168) TensorShapes(batch=4, width=28, height=28, channel=512)  
##### IN  resnet_v1_50/block2/unit_2/bottleneck_v1/add (0, 3584) TensorShapes(batch=4, width=28, height=28, channel=512)  
##### OUT resnet_v1_50/block2/unit_3/bottleneck_v1/add (0, 7168) TensorShapes(batch=4, width=28, height=28, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 7168
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 7168 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 7168
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 7168 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 7168
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 7168 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 7168
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 3584
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 7168 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 8064
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 8064 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 8064
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 8064 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 8064
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 8064 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 8064
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 4480
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 8064 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 768
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 768 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 768
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 768 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 768
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 4 bank_addr_out 768 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 768
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 5376
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 6 bank_addr_out 768 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1664
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 0 bank_addr_out 1664 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 32 jump_read_endl 896 id 0 bank_addr_in 1664
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 32 jump_read_endl 896 id 1 bank_addr_in 6272
ELEW 0000 1000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 896 bank_id_out 2 bank_addr_out 1664 width 28 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 1 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block2/unit_3/bottleneck_v1/add #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool #######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [1, 1], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/add (0, 7168) TensorShapes(batch=4, width=28, height=28, channel=512)  -> 
#### OUT resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool (16, 0) TensorShapes(batch=4, width=14, height=14, channel=512) #### 
POOL 1000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 7168 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 7168 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 2 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 7168 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 7168 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 6 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 8064 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 8064 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 2 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 8064 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 4 bank_id_out 22 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 8064 bank_addr_out 0 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 6 bank_id_out 23 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 768 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 0 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 768 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 2 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 768 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 4 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 768 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 6 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1664 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 0 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0001 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1664 bank_addr_out 448 length 14 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 32 bank_id_in 2 bank_id_out 21 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 8 channel 512 reg_id 3 ddr_addr 1241088
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 256 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1306624
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_3/bottleneck_v1/add (0, 7168) TensorShapes(batch=4, width=28, height=28, channel=512)
#####  -> OUT resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 8 jump_write_endl 224 jump_read 32 jump_read_endl 896 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 8 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 7168 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 8064 bank_addr_out 1120 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 768 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 1664 bank_addr_out 1568 bank_addr_weights 0 bank_addr_bias 256 length 28 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 128 jump_write 8 length 72 channel 128 reg_id 3 ddr_addr 1308672
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 576 bank_id 0 jump_read 16 jump_write 1 length 2 channel 16 reg_id 3 ddr_addr 1456128
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (2,2) -> 4x (CONV S(1,2) + 4xELT SAMPLE (2,1)) #### 
#### Weigth Name resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D_weight Parameter True	Space 1179648 bits, BitePerPixel 8 Fraction 9 Start 0 End 1179648	Specifier 0 Layout 1 Time 183 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=128, width=3, height=3, channel=128) 
##### Bias Name resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D_bias Parameter True	Space 4096 bits, BitePerPixel 32 Fraction 6 Start 1179648 End 1183744	Specifier 0 Layout 1 Time 184 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=1, width=1, height=1, channel=128) 
###### PM size 16777216 
#### ATT {'overrideshape': True, 'quant_out_signed': True, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'stride': [2, 2], 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'pad_mode': 'VALID', 'fix_point': 4, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 6, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 15, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
#####IN resnet_v1_50/block2/unit_4/bottleneck_v1/conv1/Conv2D (16, 896) TensorShapes(batch=4, width=28, height=28, channel=128) ->  TEMP temp_for_sample (16, 2016) TensorShapes(batch=1, width=14, height=8, channel=128) -> OUT resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=128) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 2 stride_h 1 act_type 1 jump_write 8 jump_write_endl 112 jump_read 8 jump_read_endl 224 wgt_jump_read_endl 72 stride_out 1 channel_group_in 8 channel_group_out 8 channel_offset 0 prelu_shift_p 0
###### VHi 28672 VHt 14336 VHo 14336 ######
CONV 0001 1000 pad_left 1 pad_top 1 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 664 bank_addr_out 2016 bank_addr_weights 0 bank_addr_bias 576 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 17 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 19 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 888 bank_addr_out 2016 bank_addr_weights 0 bank_addr_bias 576 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 21 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 22 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 23 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 1112 bank_addr_out 2016 bank_addr_weights 0 bank_addr_bias 576 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 16 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 17 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 18 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 19 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1336 bank_addr_out 2016 bank_addr_weights 0 bank_addr_bias 576 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 4 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 20 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 8 jump_read_endl 112 id 0 bank_addr_in 2016
ELEW 1000 0001 num 1 nonlinear_type 0 jump_write 8 jump_write_endl 112 bank_id_out 21 bank_addr_out 1904 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 8 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 128 jump_write 8 length 32 channel 128 reg_id 3 ddr_addr 1458176
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 256 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 1523712
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/conv2/Conv2D (16, 1792) TensorShapes(batch=4, width=14, height=14, channel=128)
#####  -> OUT resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 32 jump_write_endl 448 jump_read 8 jump_read_endl 112 wgt_jump_read_endl 8 stride_out 1 channel_group_in 8 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 256 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1904 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 256 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block2/unit_4/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/shortcut/MaxPool (16, 0) TensorShapes(batch=4, width=14, height=14, channel=512)  
##### IN  resnet_v1_50/block2/unit_4/bottleneck_v1/conv3/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=512)  
##### OUT resnet_v1_50/block2/unit_4/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=14, height=14, channel=512) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 16 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 18 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 20 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 22 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 16 bank_addr_out 448 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 18 bank_addr_out 448 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 32 jump_read_endl 448 id 0 bank_addr_in 448
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 32 jump_read_endl 448 id 1 bank_addr_in 1344
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 32 jump_write_endl 448 bank_id_out 20 bank_addr_out 448 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 32 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block2/unit_4/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 64 channel 512 reg_id 3 ddr_addr 1525760
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2048 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 2050048
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=14, height=14, channel=512)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 32 jump_read_endl 448 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 0 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 2048 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 448 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 2048 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 16 channel 512 reg_id 3 ddr_addr 2054144
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 512 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 2185216
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block2/unit_4/bottleneck_v1/add (16, 0) TensorShapes(batch=4, width=14, height=14, channel=512)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D (16, 2688) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 32 jump_read_endl 448 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 0 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 512 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 448 bank_addr_out 2912 bank_addr_weights 0 bank_addr_bias 512 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 2187264
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2304 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 2777088
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_1/bottleneck_v1/conv1/Conv2D (16, 2688) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D (16, 3136) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2448 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 2672 bank_addr_out 3360 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 2779136
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 3041280
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_1/bottleneck_v1/conv2/Conv2D (16, 3136) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3136 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3360 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block3/unit_1/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/shortcut/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### OUT resnet_v1_50/block3/unit_1/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 22 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block3/unit_1/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 3045376
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 3307520
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_1/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D (16, 2688) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 896 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 2912 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 3309568
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2304 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 3899392
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/conv1/Conv2D (16, 2688) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (16, 3136) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2448 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 2672 bank_addr_out 3360 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 3901440
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 4163584
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/conv2/Conv2D (16, 3136) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3136 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3360 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block3/unit_2/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_2/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### IN  resnet_v1_50/block3/unit_1/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### OUT resnet_v1_50/block3/unit_2/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 0 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 2 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 4 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 6 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 0 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 2 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 4 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block3/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 4167680
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 4429824
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_2/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 4431872
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2304 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 5021696
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (16, 448) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3856 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 4080 bank_addr_out 672 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 5023744
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 5285888
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/conv2/Conv2D (16, 448) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 448 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 672 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block3/unit_3/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_3/bottleneck_v1/conv3/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### IN  resnet_v1_50/block3/unit_2/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### OUT resnet_v1_50/block3/unit_3/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 22 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block3/unit_3/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 5289984
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 5552128
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_3/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D (16, 2688) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 896 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 2912 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 5554176
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2304 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 6144000
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/conv1/Conv2D (16, 2688) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (16, 3136) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2448 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 2672 bank_addr_out 3360 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 6146048
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 6408192
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/conv2/Conv2D (16, 3136) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3136 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 3360 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block3/unit_4/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_4/bottleneck_v1/conv3/Conv2D (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### IN  resnet_v1_50/block3/unit_3/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### OUT resnet_v1_50/block3/unit_4/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 0 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 2 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 4 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 6 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 6 bank_addr_out 0 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 0 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 0 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 2 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 2 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 4 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 1792
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 4 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block3/unit_4/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 6412288
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 6674432
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 6, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_4/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 0 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 0 bank_id_out 16 bank_addr_in 896 bank_addr_out 224 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 6676480
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2304 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 7266304
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/conv1/Conv2D (16, 0) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (16, 448) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 1 pad_top 1 pad_right 1 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 3856 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 1 pad_top 0 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 4080 bank_addr_out 672 bank_addr_weights 0 bank_addr_bias 2304 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 7268352
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 7530496
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/conv2/Conv2D (16, 448) TensorShapes(batch=4, width=14, height=14, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 896 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 448 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 672 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block3/unit_5/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_5/bottleneck_v1/conv3/Conv2D (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### IN  resnet_v1_50/block3/unit_4/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=14, height=14, channel=1024)  
##### OUT resnet_v1_50/block3/unit_5/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 896
ELEWINIT 0000 0000 bank_id_in 6 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 0
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 22 bank_addr_out 896 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 0 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 16 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 2 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 18 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 64 jump_read_endl 896 id 0 bank_addr_in 1792
ELEWINIT 0000 0000 bank_id_in 4 shift_read 0 jump_read 64 jump_read_endl 896 id 1 bank_addr_in 896
ELEW 0000 1000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 896 bank_id_out 20 bank_addr_out 1792 width 14 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block3/unit_5/bottleneck_v1/add #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/shortcut/MaxPool #######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'fix_point': 3, 'quant_out_signed': True, 'quant_in_signed': True, 'bit_width': 8, 'stride': [2, 2], 'global': False, 'kernel': [1, 1], 'pad': [0, 0, 0, 0], 'pad_mode': 'VALID', 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)  -> 
#### OUT resnet_v1_50/block3/unit_6/bottleneck_v1/shortcut/MaxPool (16, 2688) TensorShapes(batch=4, width=7, height=7, channel=1024) #### 
POOL 1000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 2688 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 16 bank_id_out 16 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 2688 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 18 bank_id_out 17 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 2688 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 20 bank_id_out 18 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 2688 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 22 bank_id_out 19 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 2688 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 16 bank_id_out 20 pool_type 0 kernel_h 1
POOL 0000 0000 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 2688 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 18 bank_id_out 21 pool_type 0 kernel_h 1
POOL 0000 0001 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 2688 length 7 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 64 bank_id_in 20 bank_id_out 22 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/shortcut/MaxPool #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 16 channel 1024 reg_id 3 ddr_addr 7534592
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 7796736
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 6, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_5/bottleneck_v1/add (16, 896) TensorShapes(batch=4, width=14, height=14, channel=1024)
#####  -> OUT resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D (16, 3136) TensorShapes(batch=4, width=14, height=14, channel=256) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 16 jump_write_endl 224 jump_read 64 jump_read_endl 896 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 896 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 3360 bank_addr_weights 0 bank_addr_bias 1024 length 14 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 144 channel 256 reg_id 3 ddr_addr 7798784
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2304 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 8388608
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (2,2) -> 2x (CONV S(1,2) + 4xELT SAMPLE (2,1)) #### 
#### Weigth Name resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D_weight Parameter True	Space 4718592 bits, BitePerPixel 8 Fraction 8 Start 0 End 4718592	Specifier 0 Layout 1 Time 241 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=256, width=3, height=3, channel=256) 
##### Bias Name resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D_bias Parameter True	Space 8192 bits, BitePerPixel 32 Fraction 5 Start 4718592 End 4726784	Specifier 0 Layout 1 Time 242 Strategies None None	Shape  [] CNN_Shape TensorShapes(batch=1, width=1, height=1, channel=256) 
###### PM size 16777216 
#### ATT {'overrideshape': True, 'quant_out_signed': True, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'stride': [2, 2], 'bit_width': 8, 'dilation': [1, 1], 'b_bit_width': 8, 'pad_mode': 'VALID', 'fix_point': 4, 'pad': [1, 1, 1, 1], 'w_fix_point': 8, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 15, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
#####IN resnet_v1_50/block3/unit_6/bottleneck_v1/conv1/Conv2D (16, 3136) TensorShapes(batch=4, width=14, height=14, channel=256) ->  TEMP temp_for_sample (16, 3696) TensorShapes(batch=1, width=7, height=8, channel=256) -> OUT resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=256) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 8 stride_w 2 stride_h 1 act_type 1 jump_write 16 jump_write_endl 112 jump_read 16 jump_read_endl 224 wgt_jump_read_endl 144 stride_out 1 channel_group_in 16 channel_group_out 16 channel_offset 0 prelu_shift_p 0
###### VHi 28672 VHt 14336 VHo 14336 ######
CONV 0001 1000 pad_left 1 pad_top 1 pad_right 15 pad_bottom 15 bank_id_in 23 bank_id_out 16 bank_addr_in 2896 bank_addr_out 3696 bank_addr_weights 0 bank_addr_bias 2304 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 3696
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 16 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 3696
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 17 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 3696
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 18 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 3696
ELEW 1000 0100 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 19 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
CONV 1000 1000 pad_left 1 pad_top 0 pad_right 15 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3120 bank_addr_out 3696 bank_addr_weights 0 bank_addr_bias 2304 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 6 prelu_shift_n 0
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 3696
ELEW 0100 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 20 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 3696
ELEW 1000 1000 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 21 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 16 jump_read_endl 112 id 0 bank_addr_in 3696
ELEW 1000 0001 num 1 nonlinear_type 0 jump_write 16 jump_write_endl 112 bank_id_out 22 bank_addr_out 3584 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 16 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 64 channel 256 reg_id 3 ddr_addr 8390656
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 1024 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 8652800
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/conv2/Conv2D (16, 3584) TensorShapes(batch=4, width=7, height=7, channel=256)
#####  -> OUT resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D (16, 3136) TensorShapes(batch=4, width=7, height=7, channel=1024) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 64 jump_write_endl 448 jump_read 16 jump_read_endl 112 wgt_jump_read_endl 16 stride_out 1 channel_group_in 16 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 3584 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 1024 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block3/unit_6/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 3, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block3/unit_6/bottleneck_v1/shortcut/MaxPool (16, 2688) TensorShapes(batch=4, width=7, height=7, channel=1024)  
##### IN  resnet_v1_50/block3/unit_6/bottleneck_v1/conv3/Conv2D (16, 3136) TensorShapes(batch=4, width=7, height=7, channel=1024)  
##### OUT resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 2688) TensorShapes(batch=4, width=7, height=7, channel=1024) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 64 jump_read_endl 448 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 64 jump_read_endl 448 id 1 bank_addr_in 3136
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 16 bank_addr_out 2688 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 64 jump_read_endl 448 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 64 jump_read_endl 448 id 1 bank_addr_in 3136
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 18 bank_addr_out 2688 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 64 jump_read_endl 448 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 64 jump_read_endl 448 id 1 bank_addr_in 3136
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 20 bank_addr_out 2688 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 64 jump_read_endl 448 id 0 bank_addr_in 2688
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 64 jump_read_endl 448 id 1 bank_addr_in 3136
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 64 jump_write_endl 448 bank_id_out 22 bank_addr_out 2688 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 64 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block3/unit_6/bottleneck_v1/add #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D #######
#### BARRIER CONV START MARKER #####
## PAR SPLIT ##
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 0, 'pad_top': 0, 'pad_bottom': 0}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 2688) TensorShapes(batch=4, width=7, height=7, channel=1024) 
##### OUT resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D (16, 3136) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
###### resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D PAR SPLIT part 0  of 2 ######
###### resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D PAR SPLIT part 1  of 2 ######
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 0 ##
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 64 channel 1024 reg_id 3 ddr_addr 8656896
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 10754048
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 2688) TensorShapes(batch=4, width=7, height=7, channel=1024)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D (16, 3136) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 64 jump_read_endl 448 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 0 ##
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 1 ##
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 64 channel 1024 reg_id 3 ddr_addr 9705472
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 10758144
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 7, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 2688) TensorShapes(batch=4, width=7, height=7, channel=1024)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D (16, 3200) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 64 jump_read_endl 448 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 64 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 3200 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 1 ##
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 1024 jump_write 64 length 32 channel 1024 reg_id 3 ddr_addr 10762240
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 2048 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 11286528
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block3/unit_6/bottleneck_v1/add (16, 2688) TensorShapes(batch=4, width=7, height=7, channel=1024)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 8 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 64 jump_read_endl 448 wgt_jump_read_endl 64 stride_out 1 channel_group_in 64 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 2688 bank_addr_out 4032 bank_addr_weights 0 bank_addr_bias 2048 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D #######
#### BARRIER CONV START MARKER #####
## PAR SPLIT ##
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=512) 
##### OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D (16, 160) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
###### resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D PAR SPLIT part 0  of 2 ######
###### resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D PAR SPLIT part 1  of 2 ######
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 0 ##
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 11288576
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 13647872
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D (16, 160) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3776 bank_addr_out 160 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 0 ##
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 1 ##
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 12468224
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 13648896
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D (16, 176) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3776 bank_addr_out 176 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 1 ##
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 128 channel 512 reg_id 3 ddr_addr 13649920
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 32 channel 16 reg_id 3 ddr_addr 14698496
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/conv2/Conv2D (16, 160) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D (16, 384) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 128 channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 160 bank_addr_out 384 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block4/unit_1/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 2, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block4/unit_1/bottleneck_v1/shortcut/Conv2D (16, 3136) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### IN  resnet_v1_50/block4/unit_1/bottleneck_v1/conv3/Conv2D (16, 384) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### OUT resnet_v1_50/block4/unit_1/bottleneck_v1/add (16, 3136) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 3136
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 384
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 16 bank_addr_out 3136 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 3136
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 384
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 18 bank_addr_out 3136 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 3136
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 384
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 20 bank_addr_out 3136 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 3136
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 384
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 22 bank_addr_out 3136 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 128 shift_write 33 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block4/unit_1/bottleneck_v1/add #######
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 2048 jump_write 128 length 32 channel 2048 reg_id 3 ddr_addr 14706688
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 15755264
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 11, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_1/bottleneck_v1/add (16, 3136) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 3136 bank_addr_out 4032 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D #######
#### BARRIER CONV START MARKER #####
## PAR SPLIT ##
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=512) 
##### OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D (16, 160) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
###### resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D PAR SPLIT part 0  of 2 ######
###### resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D PAR SPLIT part 1  of 2 ######
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 0 ##
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 15757312
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 18116608
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D (16, 160) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3776 bank_addr_out 160 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 0 ##
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 1 ##
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 16936960
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 18117632
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/conv1/Conv2D (16, 4032) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D (16, 176) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 3776 bank_addr_out 176 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 1 ##
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 128 channel 512 reg_id 3 ddr_addr 18118656
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 32 channel 16 reg_id 3 ddr_addr 19167232
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/conv2/Conv2D (16, 160) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D (16, 384) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 128 channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 160 bank_addr_out 384 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block4/unit_2/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 2, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block4/unit_2/bottleneck_v1/conv3/Conv2D (16, 384) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### IN  resnet_v1_50/block4/unit_1/bottleneck_v1/add (16, 3136) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### OUT resnet_v1_50/block4/unit_2/bottleneck_v1/add (16, 384) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 384
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 3136
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 16 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 384
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 3136
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 18 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 384
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 3136
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 20 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 384
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 3136
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 22 bank_addr_out 384 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block4/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 2048 jump_write 128 length 32 channel 2048 reg_id 3 ddr_addr 19175424
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 8 channel 16 reg_id 3 ddr_addr 20224000
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 11, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_2/bottleneck_v1/add (16, 384) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 32 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 384 bank_addr_out 1280 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D #######
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D #######
#### BARRIER CONV START MARKER #####
## PAR SPLIT ##
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=512) 
##### OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D (16, 1504) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
###### resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D PAR SPLIT part 0  of 2 ######
###### resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D PAR SPLIT part 1  of 2 ######
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 0 ##
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 20226048
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 22585344
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D (16, 1504) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1024 bank_addr_out 1504 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 0 ##
## SW PIPE OVERAL Start PAR-to-PAR SPLIT by h 1 ##
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 144 channel 512 reg_id 3 ddr_addr 21405696
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4608 bank_id 0 jump_read 16 jump_write 1 length 4 channel 16 reg_id 3 ddr_addr 22586368
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 3,3 1,1)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 4, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [1, 1, 1, 1], 'w_fix_point': 9, 'b_fix_point': 5, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [3, 3], 'stride': [1, 1], 'dependency_summary': [0, 1, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 3, 'kernel_height': 3, 'kernel_1': TensorShapes(batch=0, width=3, height=3, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 1, 'pad_right': 1, 'pad_top': 1, 'pad_bottom': 1, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/conv1/Conv2D (16, 1280) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D (16, 1520) TensorShapes(batch=4, width=7, height=7, channel=512) #### 
CONVINIT 0000 0000 kernel_w 3 kernel_h 3 shift_cut 9 stride_w 1 stride_h 1 act_type 1 jump_write 32 jump_write_endl 224 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 288 stride_out 1 channel_group_in 32 channel_group_out 16 channel_offset 0 prelu_shift_p 0
CONV 0001 0001 pad_left 1 pad_top 1 pad_right 1 pad_bottom 1 bank_id_in 23 bank_id_out 16 bank_addr_in 1024 bank_addr_out 1520 bank_addr_weights 0 bank_addr_bias 4608 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
## End PAR-to_PAR SPLIT by h 1 ##
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D #######
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D #######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 512 jump_write 32 length 128 channel 512 reg_id 3 ddr_addr 22587392
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 4096 bank_id 0 jump_read 16 jump_write 1 length 32 channel 16 reg_id 3 ddr_addr 23635968
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D end ######
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 3, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 6, 'b_fix_point': 4, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/conv2/Conv2D (16, 1504) TensorShapes(batch=4, width=7, height=7, channel=512)
#####  -> OUT resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D (16, 1728) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 7 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 896 jump_read 32 jump_read_endl 224 wgt_jump_read_endl 32 stride_out 1 channel_group_in 32 channel_group_out 128 channel_offset 0 prelu_shift_p 0
CONV 0001 1000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1504 bank_addr_out 1728 bank_addr_weights 0 bank_addr_bias 4096 length 7 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 7 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D #######
####### resnet_v1_50/block4/unit_3/bottleneck_v1/add #######
#### BARRIER ELTWISE START MARKER #####
#### ATT {'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_in_signed': True, 'fix_point': 2, 'bit_width': 8, 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0)}  #### 
##### IN  resnet_v1_50/block4/unit_3/bottleneck_v1/conv3/Conv2D (16, 1728) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### IN  resnet_v1_50/block4/unit_2/bottleneck_v1/add (16, 384) TensorShapes(batch=4, width=7, height=7, channel=2048)  
##### OUT resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1728) TensorShapes(batch=4, width=7, height=7, channel=2048) #### 
ELEWINIT 0000 0000 bank_id_in 16 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 1728
ELEWINIT 0000 0000 bank_id_in 16 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 384
ELEW 0100 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 16 bank_addr_out 1728 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 18 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 1728
ELEWINIT 0000 0000 bank_id_in 18 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 384
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 18 bank_addr_out 1728 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 20 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 1728
ELEWINIT 0000 0000 bank_id_in 20 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 384
ELEW 0000 0000 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 20 bank_addr_out 1728 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 2 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
ELEWINIT 0000 0000 bank_id_in 22 shift_read 1 jump_read 128 jump_read_endl 896 id 0 bank_addr_in 1728
ELEWINIT 0000 0000 bank_id_in 22 shift_read 0 jump_read 128 jump_read_endl 896 id 1 bank_addr_in 384
ELEW 0000 0001 num 2 nonlinear_type 1 jump_write 128 jump_write_endl 896 bank_id_out 22 bank_addr_out 1728 width 7 bank_id_prelu 0 bank_addr_prelu 0 valid_pixel_parallel 1 channel_group 128 shift_write 0 shift_write_prelu_n 0 stride_out 1 stride_offset_out 0
#### BARRIER ELTWISE END MARKER #####
####### resnet_v1_50/block4/unit_3/bottleneck_v1/add #######
####### resnet_v1_50/pool5 #######
#### Parameters resnet_v1_50/pool5 start ######
#### BARRIER LOAD START MARKER #####
LOAD 1000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 16 jump_write 1 length 49 channel 16 reg_id 3 ddr_addr 23644160
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/pool5 end ######
#### Parameters resnet_v1_50/pool5 start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 49 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 23658496
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/pool5 end ######
##### PAR SPLIT (128) #####
##### IN  resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1728) TensorShapes(batch=4, width=7, height=7, channel=2048) ######
##### OUT resnet_v1_50/pool5 (16, 2624) TensorShapes(batch=4, width=1, height=1, channel=2048) #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1728) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2624) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 9 stride_w 1 stride_h 1 act_type 0 jump_write 128 jump_write_endl 128 jump_read 128 jump_read_endl 896 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 1 channel_offset 0 prelu_shift_p 0
CONV 0001 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1728 bank_addr_out 2624 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1729) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2625) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1729 bank_addr_out 2625 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1730) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2626) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1730 bank_addr_out 2626 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1731) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2627) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1731 bank_addr_out 2627 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1732) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2628) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1732 bank_addr_out 2628 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1733) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2629) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1733 bank_addr_out 2629 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1734) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2630) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1734 bank_addr_out 2630 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1735) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2631) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1735 bank_addr_out 2631 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1736) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2632) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1736 bank_addr_out 2632 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1737) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2633) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1737 bank_addr_out 2633 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1738) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2634) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1738 bank_addr_out 2634 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1739) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2635) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1739 bank_addr_out 2635 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1740) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2636) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1740 bank_addr_out 2636 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1741) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2637) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1741 bank_addr_out 2637 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1742) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2638) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1742 bank_addr_out 2638 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1743) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2639) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1743 bank_addr_out 2639 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1744) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2640) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1744 bank_addr_out 2640 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1745) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2641) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1745 bank_addr_out 2641 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1746) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2642) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1746 bank_addr_out 2642 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1747) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2643) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1747 bank_addr_out 2643 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1748) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2644) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1748 bank_addr_out 2644 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1749) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2645) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1749 bank_addr_out 2645 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1750) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2646) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1750 bank_addr_out 2646 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1751) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2647) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1751 bank_addr_out 2647 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1752) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2648) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1752 bank_addr_out 2648 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1753) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2649) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1753 bank_addr_out 2649 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1754) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2650) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1754 bank_addr_out 2650 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1755) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2651) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1755 bank_addr_out 2651 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1756) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2652) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1756 bank_addr_out 2652 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1757) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2653) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1757 bank_addr_out 2653 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1758) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2654) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1758 bank_addr_out 2654 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1759) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2655) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1759 bank_addr_out 2655 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1760) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2656) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1760 bank_addr_out 2656 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1761) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2657) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1761 bank_addr_out 2657 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1762) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2658) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1762 bank_addr_out 2658 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1763) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2659) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1763 bank_addr_out 2659 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1764) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2660) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1764 bank_addr_out 2660 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1765) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2661) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1765 bank_addr_out 2661 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1766) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2662) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1766 bank_addr_out 2662 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1767) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2663) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1767 bank_addr_out 2663 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1768) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2664) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1768 bank_addr_out 2664 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1769) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2665) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1769 bank_addr_out 2665 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1770) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2666) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1770 bank_addr_out 2666 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1771) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2667) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1771 bank_addr_out 2667 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1772) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2668) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1772 bank_addr_out 2668 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1773) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2669) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1773 bank_addr_out 2669 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1774) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2670) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1774 bank_addr_out 2670 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1775) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2671) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1775 bank_addr_out 2671 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1776) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2672) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1776 bank_addr_out 2672 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1777) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2673) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1777 bank_addr_out 2673 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1778) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2674) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1778 bank_addr_out 2674 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1779) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2675) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1779 bank_addr_out 2675 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1780) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2676) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1780 bank_addr_out 2676 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1781) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2677) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1781 bank_addr_out 2677 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1782) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2678) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1782 bank_addr_out 2678 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1783) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2679) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1783 bank_addr_out 2679 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1784) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2680) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1784 bank_addr_out 2680 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1785) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2681) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1785 bank_addr_out 2681 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1786) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2682) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1786 bank_addr_out 2682 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1787) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2683) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1787 bank_addr_out 2683 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1788) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2684) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1788 bank_addr_out 2684 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1789) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2685) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1789 bank_addr_out 2685 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1790) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2686) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1790 bank_addr_out 2686 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1791) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2687) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1791 bank_addr_out 2687 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1792) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2688) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1792 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1793) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2689) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1793 bank_addr_out 2689 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1794) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2690) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1794 bank_addr_out 2690 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1795) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2691) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1795 bank_addr_out 2691 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1796) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2692) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1796 bank_addr_out 2692 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1797) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2693) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1797 bank_addr_out 2693 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1798) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2694) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1798 bank_addr_out 2694 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1799) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2695) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1799 bank_addr_out 2695 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1800) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2696) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1800 bank_addr_out 2696 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1801) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2697) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1801 bank_addr_out 2697 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1802) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2698) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1802 bank_addr_out 2698 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1803) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2699) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1803 bank_addr_out 2699 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1804) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2700) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1804 bank_addr_out 2700 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1805) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2701) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1805 bank_addr_out 2701 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1806) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2702) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1806 bank_addr_out 2702 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1807) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2703) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1807 bank_addr_out 2703 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1808) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2704) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1808 bank_addr_out 2704 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1809) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2705) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1809 bank_addr_out 2705 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1810) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2706) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1810 bank_addr_out 2706 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1811) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2707) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1811 bank_addr_out 2707 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1812) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2708) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1812 bank_addr_out 2708 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1813) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2709) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1813 bank_addr_out 2709 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1814) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2710) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1814 bank_addr_out 2710 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1815) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2711) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1815 bank_addr_out 2711 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1816) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2712) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1816 bank_addr_out 2712 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1817) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2713) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1817 bank_addr_out 2713 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1818) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2714) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1818 bank_addr_out 2714 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1819) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2715) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1819 bank_addr_out 2715 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1820) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2716) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1820 bank_addr_out 2716 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1821) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2717) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1821 bank_addr_out 2717 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1822) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2718) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1822 bank_addr_out 2718 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1823) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2719) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1823 bank_addr_out 2719 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1824) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2720) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1824 bank_addr_out 2720 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1825) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2721) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1825 bank_addr_out 2721 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1826) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2722) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1826 bank_addr_out 2722 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1827) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2723) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1827 bank_addr_out 2723 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1828) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2724) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1828 bank_addr_out 2724 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1829) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2725) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1829 bank_addr_out 2725 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1830) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2726) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1830 bank_addr_out 2726 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1831) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2727) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1831 bank_addr_out 2727 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1832) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2728) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1832 bank_addr_out 2728 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1833) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2729) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1833 bank_addr_out 2729 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1834) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2730) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1834 bank_addr_out 2730 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1835) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2731) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1835 bank_addr_out 2731 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1836) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2732) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1836 bank_addr_out 2732 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1837) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2733) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1837 bank_addr_out 2733 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1838) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2734) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1838 bank_addr_out 2734 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1839) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2735) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1839 bank_addr_out 2735 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1840) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2736) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1840 bank_addr_out 2736 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1841) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2737) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1841 bank_addr_out 2737 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1842) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2738) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1842 bank_addr_out 2738 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1843) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2739) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1843 bank_addr_out 2739 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1844) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2740) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1844 bank_addr_out 2740 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1845) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2741) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1845 bank_addr_out 2741 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1846) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2742) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1846 bank_addr_out 2742 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1847) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2743) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1847 bank_addr_out 2743 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1848) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2744) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1848 bank_addr_out 2744 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1849) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2745) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1849 bank_addr_out 2745 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1850) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2746) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1850 bank_addr_out 2746 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1851) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2747) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1851 bank_addr_out 2747 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1852) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2748) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1852 bank_addr_out 2748 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1853) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2749) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1853 bank_addr_out 2749 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1854) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2750) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0000 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1854 bank_addr_out 2750 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 7,7 0,0)) #### 
#### ATT {'global': False, 'stride': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'quant_in_signed': True, 'fix_point': 3, 'dependency_summary': [0, 0, 0, 0, 1, 0], 'quant_out_signed': True, 'pad_mode': 'VALID', 'count_include_invalid': True, 'count_include_pad': False, 'kernel': [7, 7], 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/block4/unit_3/bottleneck_v1/add (16, 1855) TensorShapes(batch=4, width=7, height=7, channel=2048)
#####  -> OUT resnet_v1_50/pool5 (16, 2751) TensorShapes(batch=4, width=1, height=1, channel=2048) #### 
CONV 0000 0001 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 16 bank_addr_in 1855 bank_addr_out 2751 bank_addr_weights 0 bank_addr_bias 49 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
####### resnet_v1_50/pool5 #######
####### resnet_v1_50/logits/Conv2D #######
#### Parameters resnet_v1_50/logits/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0100 0000 mode 1 bank_addr 0 bank_id 0 jump_read 2048 jump_write 128 length 63 channel 2048 reg_id 3 ddr_addr 23660544
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/logits/Conv2D end ######
#### Parameters resnet_v1_50/logits/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0100 mode 1 bank_addr 8064 bank_id 0 jump_read 16 jump_write 1 length 16 channel 16 reg_id 3 ddr_addr 25724928
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/logits/Conv2D end ######
#### resnet_v1_50/logits/Conv2D OUTPUT SPLIT by h total 1 ####
#### ATT {'pad_mode': 'VALID', 'fix_point': 2, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 12, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4}  #### 
##### IN resnet_v1_50/pool5 fm TensorShapes(batch=4, width=1, height=1, channel=2048) (16, 2624) ######
##### OUT resnet_v1_50/logits/Conv2D TensorShapes(batch=4, width=1, height=1, channel=1000) (0) (0, 14131) Absolute 3 0xdccc000 #####
## Start DDR-to_DDR SPLIT by h 0 ##
#### BARRIER CONV START MARKER #####
#### CONV (1,1, 1,1 0,0)) #### 
#### ATT {'pad_mode': 'VALID', 'fix_point': 2, 'b_bit_width': 8, 'dilation': [1, 1], 'bit_width': 8, 'pad': [0, 0, 0, 0], 'w_fix_point': 8, 'b_fix_point': 12, 'quant_in_signed': True, 'w_bit_width': 8, 'kernel': [1, 1], 'stride': [1, 1], 'dependency_summary': [0, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 1, 'stride_height': 1, 'strides_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 1, '_iteration_': 0}  #### 
##### IN resnet_v1_50/pool5 (16, 2624) TensorShapes(batch=4, width=1, height=1, channel=2048)
#####  -> OUT resnet_v1_50/logits/Conv2D (0, 0) TensorShapes(batch=4, width=1, height=1, channel=1000) #### 
CONVINIT 0000 0000 kernel_w 1 kernel_h 1 shift_cut 9 stride_w 1 stride_h 1 act_type 0 jump_write 63 jump_write_endl 63 jump_read 128 jump_read_endl 128 wgt_jump_read_endl 128 stride_out 1 channel_group_in 128 channel_group_out 63 channel_offset 0 prelu_shift_p 0
CONV 0001 0010 pad_left 0 pad_top 0 pad_right 15 pad_bottom 15 bank_id_in 16 bank_id_out 0 bank_addr_in 2624 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 8064 length 1 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 1 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/logits/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/logits/Conv2D TensorShapes(batch=4, width=1, height=1, channel=1000) 2 
####O resnet_v1_50/logits/Conv2D TensorShapes(batch=4, width=1, height=1, channel=1000) 3 #####
SAVE 0100 0010 mode 0 bank_addr 0 bank_id 0 jump_write 1024 jump_read 63 length 1 channel 1000 reg_id 1 ddr_addr 0
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/logits/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 0 ##
####### resnet_v1_50/logits/Conv2D #######
####### bracket #######
END 0010 0000 
####### bracket #######
