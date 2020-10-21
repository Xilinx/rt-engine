*****************************************************
This section contains compiler instructions in asm format
####### bracket #######
## BEGING 0000 0000 
####### bracket #######
####### input #######
# SOMBODY IS A LAZY BOY   ... missing code for
# input
# Memory_Access(input=-1, parameters=-1, output=-1)
# {212: <bound method BasicCode.gen_fm_par_fm of <SC.HwAbstraction.code_class.BasicCode object at 0x7f273e19f510>>, 232: <bound method BasicCode.gen_fm_ddr_fm of <SC.HwAbstraction.code_class.BasicCode object at 0x7f273e19f510>>, 333: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f273e19f510>>, 332: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f273e19f510>>, 313: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f273e19f510>>, 312: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f273e19f510>>, 213: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f273e19f510>>, 233: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f273e19f510>>}
####### input #######
####### resnet_v1_50/conv1/Conv2D #######
#### Parameters resnet_v1_50/conv1/Conv2D start ######
#### BARRIER LOAD START MARKER #####
LOAD 0000 0000 mode 1 bank_addr 0 bank_id 0 jump_read 16 jump_write 1 length 196 channel 3 reg_id 3 ddr_addr 0
#### BARRIER LOAD END MARKER #####
#### BARRIER LOAD START MARKER #####
LOAD 0000 0001 mode 1 bank_addr 196 bank_id 0 jump_read 16 jump_write 1 length 1 channel 16 reg_id 3 ddr_addr 51200
#### BARRIER LOAD END MARKER #####
#### Parameters resnet_v1_50/conv1/Conv2D end ######
#### resnet_v1_50/conv1/Conv2D OUTPUT SPLIT by h total 14 ####
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 3, 'pad_bottom': 4, 'sync_type': 4}  #### 
##### IN input ddr TensorShapes(batch=4, width=224, height=224, channel=3) (0, 26) ######
##### OUT resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=112, channel=64) (0) (0, 1594) Absolute 3 0x18e8000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 21 parts (counting pading)#####
#### START -3-0 END 18-18 #####
### R  b_id  1 b_add  224 K =   0 (h_0) ->  H_9  ###
LOAD 0001 0000 mode 0 bank_addr 224 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 0
### R  b_id  2 b_add    0 K =   1 (h_1) ->  H_2  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 14336
### R  b_id  2 b_add  224 K =   2 (h_2) ->  H_10  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 28672
### R  b_id  3 b_add    0 K =   3 (h_3) ->  H_3  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 43008
### R  b_id  3 b_add  224 K =   4 (h_4) ->  H_11  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 57344
### R  b_id  4 b_add    0 K =   5 (h_5) ->  H_4  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 71680
### R  b_id  4 b_add  224 K =   6 (h_6) ->  H_12  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 86016
### R  b_id  5 b_add    0 K =   7 (h_7) ->  H_5  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 100352
### R  b_id  5 b_add  224 K =   8 (h_8) ->  H_13  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 114688
### R  b_id  6 b_add    0 K =   9 (h_9) ->  H_6  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 129024
### R  b_id  6 b_add  224 K =  10 (h_10) ->  H_14  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 143360
### R  b_id  7 b_add    0 K =  11 (h_11) ->  H_7  ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 157696
### R  b_id  7 b_add  224 K =  12 (h_12) ->  H_15  ###
LOAD 0000 0000 mode 0 bank_addr 224 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 172032
### R  b_id  0 b_add  448 K =  13 (h_13) ->  H_16  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 186368
### R  b_id  0 b_add  672 K =  14 (h_14) ->  H_24  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 200704
### R  b_id  1 b_add  448 K =  15 (h_15) ->  H_17  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 215040
### R  b_id  1 b_add  672 K =  16 (h_16) ->  H_25  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 229376
### R  b_id  2 b_add  448 K =  17 (h_17) ->  H_18  ###
LOAD 0000 0100 mode 0 bank_addr 448 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 243712
#### Load Reshape 18 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,3)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 3, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 0}  #### 
##### IN input (0, 0) TensorShapes(batch=4, width=224, height=21, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 0) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 3 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 8189 bank_addr_out 0 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 0 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 0
SAVE 0000 0000 mode 0 bank_addr 0 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 28672
SAVE 0000 0000 mode 0 bank_addr 0 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 57344
SAVE 0000 0000 mode 0 bank_addr 0 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 86016
SAVE 0000 0000 mode 0 bank_addr 0 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 114688
SAVE 0000 0000 mode 0 bank_addr 0 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 143360
SAVE 0000 0000 mode 0 bank_addr 0 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 172032
SAVE 0000 0000 mode 0 bank_addr 0 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 200704
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add  672 K =   0 (h_18) ->  H_26  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 258048
### R  b_id  3 b_add  448 K =   1 (h_19) ->  H_19  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 272384
### R  b_id  3 b_add  672 K =   2 (h_20) ->  H_27  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 286720
### R  b_id  4 b_add  448 K =   3 (h_21) ->  H_20  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 301056
### R  b_id  4 b_add  672 K =   4 (h_22) ->  H_28  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 315392
### R  b_id  5 b_add  448 K =   5 (h_23) ->  H_21  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 329728
### R  b_id  5 b_add  672 K =   6 (h_24) ->  H_29  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 344064
### R  b_id  6 b_add  448 K =   7 (h_25) ->  H_22  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 358400
### R  b_id  6 b_add  672 K =   8 (h_26) ->  H_30  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 372736
### R  b_id  7 b_add  448 K =   9 (h_27) ->  H_23  ###
LOAD 0000 0000 mode 0 bank_addr 448 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 387072
### R  b_id  7 b_add  672 K =  10 (h_28) ->  H_31  ###
LOAD 0000 0000 mode 0 bank_addr 672 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 401408
### R  b_id  0 b_add  896 K =  11 (h_29) ->  H_32  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 415744
### R  b_id  0 b_add 1120 K =  12 (h_30) ->  H_40  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 430080
### R  b_id  1 b_add  896 K =  13 (h_31) ->  H_33  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 444416
### R  b_id  1 b_add 1120 K =  14 (h_32) ->  H_41  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 458752
### R  b_id  2 b_add  896 K =  15 (h_33) ->  H_34  ###
LOAD 0000 0100 mode 0 bank_addr 896 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 473088
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 1}  #### 
##### IN input (0, 448) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 448) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 445 bank_addr_out 448 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 448 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 229376
SAVE 0000 0000 mode 0 bank_addr 448 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 258048
SAVE 0000 0000 mode 0 bank_addr 448 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 286720
SAVE 0000 0000 mode 0 bank_addr 448 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 315392
SAVE 0000 0000 mode 0 bank_addr 448 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 344064
SAVE 0000 0000 mode 0 bank_addr 448 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 372736
SAVE 0000 0000 mode 0 bank_addr 448 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 401408
SAVE 0000 0000 mode 0 bank_addr 448 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 430080
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 1120 K =   0 (h_34) ->  H_42  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 487424
### R  b_id  3 b_add  896 K =   1 (h_35) ->  H_35  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 501760
### R  b_id  3 b_add 1120 K =   2 (h_36) ->  H_43  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 516096
### R  b_id  4 b_add  896 K =   3 (h_37) ->  H_36  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 530432
### R  b_id  4 b_add 1120 K =   4 (h_38) ->  H_44  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 544768
### R  b_id  5 b_add  896 K =   5 (h_39) ->  H_37  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 559104
### R  b_id  5 b_add 1120 K =   6 (h_40) ->  H_45  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 573440
### R  b_id  6 b_add  896 K =   7 (h_41) ->  H_38  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 587776
### R  b_id  6 b_add 1120 K =   8 (h_42) ->  H_46  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 602112
### R  b_id  7 b_add  896 K =   9 (h_43) ->  H_39  ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 616448
### R  b_id  7 b_add 1120 K =  10 (h_44) ->  H_47  ###
LOAD 0000 0000 mode 0 bank_addr 1120 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 630784
### R  b_id  0 b_add 1344 K =  11 (h_45) ->  H_48  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 645120
### R  b_id  0 b_add 1568 K =  12 (h_46) ->  H_56  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 659456
### R  b_id  1 b_add 1344 K =  13 (h_47) ->  H_49  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 673792
### R  b_id  1 b_add 1568 K =  14 (h_48) ->  H_57  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 688128
### R  b_id  2 b_add 1344 K =  15 (h_49) ->  H_50  ###
LOAD 0000 0100 mode 0 bank_addr 1344 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 702464
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 2}  #### 
##### IN input (0, 896) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 896) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 893 bank_addr_out 896 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 896 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 458752
SAVE 0000 0000 mode 0 bank_addr 896 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 487424
SAVE 0000 0000 mode 0 bank_addr 896 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 516096
SAVE 0000 0000 mode 0 bank_addr 896 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 544768
SAVE 0000 0000 mode 0 bank_addr 896 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 573440
SAVE 0000 0000 mode 0 bank_addr 896 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 602112
SAVE 0000 0000 mode 0 bank_addr 896 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 630784
SAVE 0000 0000 mode 0 bank_addr 896 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 659456
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 1568 K =   0 (h_50) ->  H_58  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 716800
### R  b_id  3 b_add 1344 K =   1 (h_51) ->  H_51  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 731136
### R  b_id  3 b_add 1568 K =   2 (h_52) ->  H_59  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 745472
### R  b_id  4 b_add 1344 K =   3 (h_53) ->  H_52  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 759808
### R  b_id  4 b_add 1568 K =   4 (h_54) ->  H_60  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 774144
### R  b_id  5 b_add 1344 K =   5 (h_55) ->  H_53  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 788480
### R  b_id  5 b_add 1568 K =   6 (h_56) ->  H_61  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 802816
### R  b_id  6 b_add 1344 K =   7 (h_57) ->  H_54  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 817152
### R  b_id  6 b_add 1568 K =   8 (h_58) ->  H_62  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 831488
### R  b_id  7 b_add 1344 K =   9 (h_59) ->  H_55  ###
LOAD 0000 0000 mode 0 bank_addr 1344 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 845824
### R  b_id  7 b_add 1568 K =  10 (h_60) ->  H_63  ###
LOAD 0000 0000 mode 0 bank_addr 1568 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 860160
### R  b_id  0 b_add 1792 K =  11 (h_61) ->  H_64  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 874496
### R  b_id  0 b_add 2016 K =  12 (h_62) ->  H_72  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 888832
### R  b_id  1 b_add 1792 K =  13 (h_63) ->  H_65  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 903168
### R  b_id  1 b_add 2016 K =  14 (h_64) ->  H_73  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 917504
### R  b_id  2 b_add 1792 K =  15 (h_65) ->  H_66  ###
LOAD 0000 0100 mode 0 bank_addr 1792 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 931840
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 3}  #### 
##### IN input (0, 1344) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 1344) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 1341 bank_addr_out 1344 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 1344 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 688128
SAVE 0000 0000 mode 0 bank_addr 1344 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 716800
SAVE 0000 0000 mode 0 bank_addr 1344 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 745472
SAVE 0000 0000 mode 0 bank_addr 1344 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 774144
SAVE 0000 0000 mode 0 bank_addr 1344 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 802816
SAVE 0000 0000 mode 0 bank_addr 1344 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 831488
SAVE 0000 0000 mode 0 bank_addr 1344 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 860160
SAVE 0000 0000 mode 0 bank_addr 1344 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 888832
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 2016 K =   0 (h_66) ->  H_74  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 946176
### R  b_id  3 b_add 1792 K =   1 (h_67) ->  H_67  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 960512
### R  b_id  3 b_add 2016 K =   2 (h_68) ->  H_75  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 974848
### R  b_id  4 b_add 1792 K =   3 (h_69) ->  H_68  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 989184
### R  b_id  4 b_add 2016 K =   4 (h_70) ->  H_76  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1003520
### R  b_id  5 b_add 1792 K =   5 (h_71) ->  H_69  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1017856
### R  b_id  5 b_add 2016 K =   6 (h_72) ->  H_77  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1032192
### R  b_id  6 b_add 1792 K =   7 (h_73) ->  H_70  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1046528
### R  b_id  6 b_add 2016 K =   8 (h_74) ->  H_78  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1060864
### R  b_id  7 b_add 1792 K =   9 (h_75) ->  H_71  ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1075200
### R  b_id  7 b_add 2016 K =  10 (h_76) ->  H_79  ###
LOAD 0000 0000 mode 0 bank_addr 2016 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1089536
### R  b_id  0 b_add 2240 K =  11 (h_77) ->  H_80  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1103872
### R  b_id  0 b_add 2464 K =  12 (h_78) ->  H_88  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1118208
### R  b_id  1 b_add 2240 K =  13 (h_79) ->  H_81  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1132544
### R  b_id  1 b_add 2464 K =  14 (h_80) ->  H_89  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1146880
### R  b_id  2 b_add 2240 K =  15 (h_81) ->  H_82  ###
LOAD 0000 0100 mode 0 bank_addr 2240 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1161216
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 4}  #### 
##### IN input (0, 1792) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 1792) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 1789 bank_addr_out 1792 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 1792 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 917504
SAVE 0000 0000 mode 0 bank_addr 1792 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 946176
SAVE 0000 0000 mode 0 bank_addr 1792 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 974848
SAVE 0000 0000 mode 0 bank_addr 1792 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1003520
SAVE 0000 0000 mode 0 bank_addr 1792 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1032192
SAVE 0000 0000 mode 0 bank_addr 1792 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1060864
SAVE 0000 0000 mode 0 bank_addr 1792 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1089536
SAVE 0000 0000 mode 0 bank_addr 1792 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1118208
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 4 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 5 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 2464 K =   0 (h_82) ->  H_90  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1175552
### R  b_id  3 b_add 2240 K =   1 (h_83) ->  H_83  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1189888
### R  b_id  3 b_add 2464 K =   2 (h_84) ->  H_91  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1204224
### R  b_id  4 b_add 2240 K =   3 (h_85) ->  H_84  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1218560
### R  b_id  4 b_add 2464 K =   4 (h_86) ->  H_92  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1232896
### R  b_id  5 b_add 2240 K =   5 (h_87) ->  H_85  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1247232
### R  b_id  5 b_add 2464 K =   6 (h_88) ->  H_93  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1261568
### R  b_id  6 b_add 2240 K =   7 (h_89) ->  H_86  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1275904
### R  b_id  6 b_add 2464 K =   8 (h_90) ->  H_94  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1290240
### R  b_id  7 b_add 2240 K =   9 (h_91) ->  H_87  ###
LOAD 0000 0000 mode 0 bank_addr 2240 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1304576
### R  b_id  7 b_add 2464 K =  10 (h_92) ->  H_95  ###
LOAD 0000 0000 mode 0 bank_addr 2464 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1318912
### R  b_id  0 b_add 2688 K =  11 (h_93) ->  H_96  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1333248
### R  b_id  0 b_add 2912 K =  12 (h_94) ->  H_104  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1347584
### R  b_id  1 b_add 2688 K =  13 (h_95) ->  H_97  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1361920
### R  b_id  1 b_add 2912 K =  14 (h_96) ->  H_105  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1376256
### R  b_id  2 b_add 2688 K =  15 (h_97) ->  H_98  ###
LOAD 0000 0100 mode 0 bank_addr 2688 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1390592
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 5}  #### 
##### IN input (0, 2240) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 2240) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 2237 bank_addr_out 2240 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 2240 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1146880
SAVE 0000 0000 mode 0 bank_addr 2240 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1175552
SAVE 0000 0000 mode 0 bank_addr 2240 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1204224
SAVE 0000 0000 mode 0 bank_addr 2240 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1232896
SAVE 0000 0000 mode 0 bank_addr 2240 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1261568
SAVE 0000 0000 mode 0 bank_addr 2240 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1290240
SAVE 0000 0000 mode 0 bank_addr 2240 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1318912
SAVE 0000 0000 mode 0 bank_addr 2240 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1347584
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 5 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 6 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 2912 K =   0 (h_98) ->  H_106  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1404928
### R  b_id  3 b_add 2688 K =   1 (h_99) ->  H_99  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1419264
### R  b_id  3 b_add 2912 K =   2 (h_100) ->  H_107  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1433600
### R  b_id  4 b_add 2688 K =   3 (h_101) ->  H_100  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1447936
### R  b_id  4 b_add 2912 K =   4 (h_102) ->  H_108  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1462272
### R  b_id  5 b_add 2688 K =   5 (h_103) ->  H_101  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1476608
### R  b_id  5 b_add 2912 K =   6 (h_104) ->  H_109  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1490944
### R  b_id  6 b_add 2688 K =   7 (h_105) ->  H_102  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1505280
### R  b_id  6 b_add 2912 K =   8 (h_106) ->  H_110  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1519616
### R  b_id  7 b_add 2688 K =   9 (h_107) ->  H_103  ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1533952
### R  b_id  7 b_add 2912 K =  10 (h_108) ->  H_111  ###
LOAD 0000 0000 mode 0 bank_addr 2912 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1548288
### R  b_id  0 b_add 3136 K =  11 (h_109) ->  H_112  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1562624
### R  b_id  0 b_add 3360 K =  12 (h_110) ->  H_120  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1576960
### R  b_id  1 b_add 3136 K =  13 (h_111) ->  H_113  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1591296
### R  b_id  1 b_add 3360 K =  14 (h_112) ->  H_121  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1605632
### R  b_id  2 b_add 3136 K =  15 (h_113) ->  H_114  ###
LOAD 0000 0100 mode 0 bank_addr 3136 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1619968
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 6}  #### 
##### IN input (0, 2688) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 2688) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 2685 bank_addr_out 2688 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 2688 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1376256
SAVE 0000 0000 mode 0 bank_addr 2688 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1404928
SAVE 0000 0000 mode 0 bank_addr 2688 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1433600
SAVE 0000 0000 mode 0 bank_addr 2688 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1462272
SAVE 0000 0000 mode 0 bank_addr 2688 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1490944
SAVE 0000 0000 mode 0 bank_addr 2688 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1519616
SAVE 0000 0000 mode 0 bank_addr 2688 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1548288
SAVE 0000 0000 mode 0 bank_addr 2688 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1576960
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 6 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 7 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 3360 K =   0 (h_114) ->  H_122  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1634304
### R  b_id  3 b_add 3136 K =   1 (h_115) ->  H_115  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1648640
### R  b_id  3 b_add 3360 K =   2 (h_116) ->  H_123  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1662976
### R  b_id  4 b_add 3136 K =   3 (h_117) ->  H_116  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1677312
### R  b_id  4 b_add 3360 K =   4 (h_118) ->  H_124  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1691648
### R  b_id  5 b_add 3136 K =   5 (h_119) ->  H_117  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1705984
### R  b_id  5 b_add 3360 K =   6 (h_120) ->  H_125  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1720320
### R  b_id  6 b_add 3136 K =   7 (h_121) ->  H_118  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1734656
### R  b_id  6 b_add 3360 K =   8 (h_122) ->  H_126  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1748992
### R  b_id  7 b_add 3136 K =   9 (h_123) ->  H_119  ###
LOAD 0000 0000 mode 0 bank_addr 3136 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1763328
### R  b_id  7 b_add 3360 K =  10 (h_124) ->  H_127  ###
LOAD 0000 0000 mode 0 bank_addr 3360 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1777664
### R  b_id  0 b_add 3584 K =  11 (h_125) ->  H_128  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1792000
### R  b_id  0 b_add 3808 K =  12 (h_126) ->  H_136  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1806336
### R  b_id  1 b_add 3584 K =  13 (h_127) ->  H_129  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1820672
### R  b_id  1 b_add 3808 K =  14 (h_128) ->  H_137  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1835008
### R  b_id  2 b_add 3584 K =  15 (h_129) ->  H_130  ###
LOAD 0000 0100 mode 0 bank_addr 3584 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1849344
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 7}  #### 
##### IN input (0, 3136) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 3136) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 3133 bank_addr_out 3136 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 3136 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1605632
SAVE 0000 0000 mode 0 bank_addr 3136 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1634304
SAVE 0000 0000 mode 0 bank_addr 3136 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1662976
SAVE 0000 0000 mode 0 bank_addr 3136 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1691648
SAVE 0000 0000 mode 0 bank_addr 3136 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1720320
SAVE 0000 0000 mode 0 bank_addr 3136 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1748992
SAVE 0000 0000 mode 0 bank_addr 3136 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1777664
SAVE 0000 0000 mode 0 bank_addr 3136 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1806336
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 7 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 8 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 3808 K =   0 (h_130) ->  H_138  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1863680
### R  b_id  3 b_add 3584 K =   1 (h_131) ->  H_131  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1878016
### R  b_id  3 b_add 3808 K =   2 (h_132) ->  H_139  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1892352
### R  b_id  4 b_add 3584 K =   3 (h_133) ->  H_132  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1906688
### R  b_id  4 b_add 3808 K =   4 (h_134) ->  H_140  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1921024
### R  b_id  5 b_add 3584 K =   5 (h_135) ->  H_133  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1935360
### R  b_id  5 b_add 3808 K =   6 (h_136) ->  H_141  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1949696
### R  b_id  6 b_add 3584 K =   7 (h_137) ->  H_134  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1964032
### R  b_id  6 b_add 3808 K =   8 (h_138) ->  H_142  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1978368
### R  b_id  7 b_add 3584 K =   9 (h_139) ->  H_135  ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 1992704
### R  b_id  7 b_add 3808 K =  10 (h_140) ->  H_143  ###
LOAD 0000 0000 mode 0 bank_addr 3808 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2007040
### R  b_id  0 b_add 4032 K =  11 (h_141) ->  H_144  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2021376
### R  b_id  0 b_add 4256 K =  12 (h_142) ->  H_152  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2035712
### R  b_id  1 b_add 4032 K =  13 (h_143) ->  H_145  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2050048
### R  b_id  1 b_add 4256 K =  14 (h_144) ->  H_153  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2064384
### R  b_id  2 b_add 4032 K =  15 (h_145) ->  H_146  ###
LOAD 0000 0100 mode 0 bank_addr 4032 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2078720
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 8}  #### 
##### IN input (0, 3584) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 3584) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 3581 bank_addr_out 3584 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 3584 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1835008
SAVE 0000 0000 mode 0 bank_addr 3584 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1863680
SAVE 0000 0000 mode 0 bank_addr 3584 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1892352
SAVE 0000 0000 mode 0 bank_addr 3584 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1921024
SAVE 0000 0000 mode 0 bank_addr 3584 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1949696
SAVE 0000 0000 mode 0 bank_addr 3584 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 1978368
SAVE 0000 0000 mode 0 bank_addr 3584 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2007040
SAVE 0000 0000 mode 0 bank_addr 3584 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2035712
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 8 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 9 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 4256 K =   0 (h_146) ->  H_154  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2093056
### R  b_id  3 b_add 4032 K =   1 (h_147) ->  H_147  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2107392
### R  b_id  3 b_add 4256 K =   2 (h_148) ->  H_155  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2121728
### R  b_id  4 b_add 4032 K =   3 (h_149) ->  H_148  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2136064
### R  b_id  4 b_add 4256 K =   4 (h_150) ->  H_156  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2150400
### R  b_id  5 b_add 4032 K =   5 (h_151) ->  H_149  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2164736
### R  b_id  5 b_add 4256 K =   6 (h_152) ->  H_157  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2179072
### R  b_id  6 b_add 4032 K =   7 (h_153) ->  H_150  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2193408
### R  b_id  6 b_add 4256 K =   8 (h_154) ->  H_158  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2207744
### R  b_id  7 b_add 4032 K =   9 (h_155) ->  H_151  ###
LOAD 0000 0000 mode 0 bank_addr 4032 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2222080
### R  b_id  7 b_add 4256 K =  10 (h_156) ->  H_159  ###
LOAD 0000 0000 mode 0 bank_addr 4256 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2236416
### R  b_id  0 b_add 4480 K =  11 (h_157) ->  H_160  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2250752
### R  b_id  0 b_add 4704 K =  12 (h_158) ->  H_168  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2265088
### R  b_id  1 b_add 4480 K =  13 (h_159) ->  H_161  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2279424
### R  b_id  1 b_add 4704 K =  14 (h_160) ->  H_169  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2293760
### R  b_id  2 b_add 4480 K =  15 (h_161) ->  H_162  ###
LOAD 0000 0100 mode 0 bank_addr 4480 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2308096
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 9}  #### 
##### IN input (0, 4032) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 4032) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 4029 bank_addr_out 4032 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 4032 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2064384
SAVE 0000 0000 mode 0 bank_addr 4032 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2093056
SAVE 0000 0000 mode 0 bank_addr 4032 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2121728
SAVE 0000 0000 mode 0 bank_addr 4032 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2150400
SAVE 0000 0000 mode 0 bank_addr 4032 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2179072
SAVE 0000 0000 mode 0 bank_addr 4032 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2207744
SAVE 0000 0000 mode 0 bank_addr 4032 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2236416
SAVE 0000 0000 mode 0 bank_addr 4032 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2265088
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 9 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 10 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 4704 K =   0 (h_162) ->  H_170  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2322432
### R  b_id  3 b_add 4480 K =   1 (h_163) ->  H_163  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2336768
### R  b_id  3 b_add 4704 K =   2 (h_164) ->  H_171  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2351104
### R  b_id  4 b_add 4480 K =   3 (h_165) ->  H_164  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2365440
### R  b_id  4 b_add 4704 K =   4 (h_166) ->  H_172  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2379776
### R  b_id  5 b_add 4480 K =   5 (h_167) ->  H_165  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2394112
### R  b_id  5 b_add 4704 K =   6 (h_168) ->  H_173  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2408448
### R  b_id  6 b_add 4480 K =   7 (h_169) ->  H_166  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2422784
### R  b_id  6 b_add 4704 K =   8 (h_170) ->  H_174  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2437120
### R  b_id  7 b_add 4480 K =   9 (h_171) ->  H_167  ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2451456
### R  b_id  7 b_add 4704 K =  10 (h_172) ->  H_175  ###
LOAD 0000 0000 mode 0 bank_addr 4704 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2465792
### R  b_id  0 b_add 4928 K =  11 (h_173) ->  H_176  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2480128
### R  b_id  0 b_add 5152 K =  12 (h_174) ->  H_184  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2494464
### R  b_id  1 b_add 4928 K =  13 (h_175) ->  H_177  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2508800
### R  b_id  1 b_add 5152 K =  14 (h_176) ->  H_185  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2523136
### R  b_id  2 b_add 4928 K =  15 (h_177) ->  H_178  ###
LOAD 0000 0100 mode 0 bank_addr 4928 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2537472
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 10}  #### 
##### IN input (0, 4480) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 4480) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 4477 bank_addr_out 4480 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 4480 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2293760
SAVE 0000 0000 mode 0 bank_addr 4480 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2322432
SAVE 0000 0000 mode 0 bank_addr 4480 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2351104
SAVE 0000 0000 mode 0 bank_addr 4480 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2379776
SAVE 0000 0000 mode 0 bank_addr 4480 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2408448
SAVE 0000 0000 mode 0 bank_addr 4480 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2437120
SAVE 0000 0000 mode 0 bank_addr 4480 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2465792
SAVE 0000 0000 mode 0 bank_addr 4480 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2494464
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 10 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 11 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 5152 K =   0 (h_178) ->  H_186  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2551808
### R  b_id  3 b_add 4928 K =   1 (h_179) ->  H_179  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2566144
### R  b_id  3 b_add 5152 K =   2 (h_180) ->  H_187  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2580480
### R  b_id  4 b_add 4928 K =   3 (h_181) ->  H_180  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2594816
### R  b_id  4 b_add 5152 K =   4 (h_182) ->  H_188  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2609152
### R  b_id  5 b_add 4928 K =   5 (h_183) ->  H_181  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2623488
### R  b_id  5 b_add 5152 K =   6 (h_184) ->  H_189  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2637824
### R  b_id  6 b_add 4928 K =   7 (h_185) ->  H_182  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2652160
### R  b_id  6 b_add 5152 K =   8 (h_186) ->  H_190  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2666496
### R  b_id  7 b_add 4928 K =   9 (h_187) ->  H_183  ###
LOAD 0000 0000 mode 0 bank_addr 4928 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2680832
### R  b_id  7 b_add 5152 K =  10 (h_188) ->  H_191  ###
LOAD 0000 0000 mode 0 bank_addr 5152 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2695168
### R  b_id  0 b_add 5376 K =  11 (h_189) ->  H_192  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2709504
### R  b_id  0 b_add 5600 K =  12 (h_190) ->  H_200  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2723840
### R  b_id  1 b_add 5376 K =  13 (h_191) ->  H_193  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2738176
### R  b_id  1 b_add 5600 K =  14 (h_192) ->  H_201  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2752512
### R  b_id  2 b_add 5376 K =  15 (h_193) ->  H_194  ###
LOAD 0000 0100 mode 0 bank_addr 5376 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2766848
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 11}  #### 
##### IN input (0, 4928) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 4928) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 4925 bank_addr_out 4928 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 4928 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2523136
SAVE 0000 0000 mode 0 bank_addr 4928 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2551808
SAVE 0000 0000 mode 0 bank_addr 4928 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2580480
SAVE 0000 0000 mode 0 bank_addr 4928 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2609152
SAVE 0000 0000 mode 0 bank_addr 4928 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2637824
SAVE 0000 0000 mode 0 bank_addr 4928 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2666496
SAVE 0000 0000 mode 0 bank_addr 4928 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2695168
SAVE 0000 0000 mode 0 bank_addr 4928 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2723840
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 11 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 12 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 16 parts (counting pading)#####
#### START 0-0 END 16-16 #####
### R  b_id  2 b_add 5600 K =   0 (h_194) ->  H_202  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2781184
### R  b_id  3 b_add 5376 K =   1 (h_195) ->  H_195  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2795520
### R  b_id  3 b_add 5600 K =   2 (h_196) ->  H_203  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2809856
### R  b_id  4 b_add 5376 K =   3 (h_197) ->  H_196  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2824192
### R  b_id  4 b_add 5600 K =   4 (h_198) ->  H_204  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2838528
### R  b_id  5 b_add 5376 K =   5 (h_199) ->  H_197  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2852864
### R  b_id  5 b_add 5600 K =   6 (h_200) ->  H_205  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2867200
### R  b_id  6 b_add 5376 K =   7 (h_201) ->  H_198  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2881536
### R  b_id  6 b_add 5600 K =   8 (h_202) ->  H_206  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2895872
### R  b_id  7 b_add 5376 K =   9 (h_203) ->  H_199  ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2910208
### R  b_id  7 b_add 5600 K =  10 (h_204) ->  H_207  ###
LOAD 0000 0000 mode 0 bank_addr 5600 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2924544
### R  b_id  0 b_add 5824 K =  11 (h_205) ->  H_208  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2938880
### R  b_id  0 b_add 6048 K =  12 (h_206) ->  H_216  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2953216
### R  b_id  1 b_add 5824 K =  13 (h_207) ->  H_209  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2967552
### R  b_id  1 b_add 6048 K =  14 (h_208) ->  H_217  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2981888
### R  b_id  2 b_add 5824 K =  15 (h_209) ->  H_210  ###
LOAD 0000 0100 mode 0 bank_addr 5824 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 2996224
#### Load Reshape 16 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 4, '_iterations_': 14, '_iteration_': 12}  #### 
##### IN input (0, 5376) TensorShapes(batch=4, width=224, height=16, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 5376) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 15 bank_id_in 0 bank_id_out 8 bank_addr_in 5373 bank_addr_out 5376 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 5376 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2752512
SAVE 0000 0000 mode 0 bank_addr 5376 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2781184
SAVE 0000 0000 mode 0 bank_addr 5376 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2809856
SAVE 0000 0000 mode 0 bank_addr 5376 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2838528
SAVE 0000 0000 mode 0 bank_addr 5376 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2867200
SAVE 0000 0000 mode 0 bank_addr 5376 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2895872
SAVE 0000 0000 mode 0 bank_addr 5376 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2924544
SAVE 0000 0000 mode 0 bank_addr 5376 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2953216
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 12 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 13 ##
#### Inputs resnet_v1_50/conv1/Conv2D for input start ######
#### BARRIER LOAD START MARKER #####
#### Load Reshape 14 parts (counting pading)#####
#### START 0-0 END 14-14 #####
### R  b_id  2 b_add 6048 K =   0 (h_210) ->  H_218  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 2 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3010560
### R  b_id  3 b_add 5824 K =   1 (h_211) ->  H_211  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3024896
### R  b_id  3 b_add 6048 K =   2 (h_212) ->  H_219  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 3 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3039232
### R  b_id  4 b_add 5824 K =   3 (h_213) ->  H_212  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3053568
### R  b_id  4 b_add 6048 K =   4 (h_214) ->  H_220  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 4 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3067904
### R  b_id  5 b_add 5824 K =   5 (h_215) ->  H_213  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3082240
### R  b_id  5 b_add 6048 K =   6 (h_216) ->  H_221  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 5 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3096576
### R  b_id  6 b_add 5824 K =   7 (h_217) ->  H_214  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3110912
### R  b_id  6 b_add 6048 K =   8 (h_218) ->  H_222  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 6 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3125248
### R  b_id  7 b_add 5824 K =   9 (h_219) ->  H_215  ###
LOAD 0000 0000 mode 0 bank_addr 5824 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3139584
### R  b_id  7 b_add 6048 K =  10 (h_220) ->  H_223  ###
LOAD 0000 0000 mode 0 bank_addr 6048 bank_id 7 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3153920
### R  b_id  0 b_add 6272 K =  11 (h_221) ->  H_224  ###
LOAD 0000 0000 mode 0 bank_addr 6272 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3168256
### R  b_id  0 b_add 6496 K =  12 (h_222) ->  H_232  ###
LOAD 0000 0000 mode 0 bank_addr 6496 bank_id 0 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3182592
### R  b_id  1 b_add 6272 K =  13 (h_223) ->  H_225  ###
LOAD 0000 0100 mode 0 bank_addr 6272 bank_id 1 jump_read 16 jump_write 1 length 224 channel 3 reg_id 0 ddr_addr 3196928
#### Load Reshape 14 parts #####
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/conv1/Conv2D for input end ######
#### BARRIER CONV START MARKER #####
#### ConvInPlaceChangeLayout CONV (2,2, 7,7 3,0)) #### 
#### ATT {'b_fix_point': 4, 'b_bit_width': 8, 'pad_mode': 'VALID', 'stride': [2, 2], 'dilation': [1, 1], 'bit_width': 8, 'kernel': [7, 7], 'w_bit_width': 8, 'quant_in_signed': True, 'pad': [0, 0, 3, 3, 3, 3, 0, 0], 'w_fix_point': 12, 'dependency_summary': [1, 0, 0, 0, 1, 1], 'quant_out_signed': True, 'fix_point': 3, 'kernel_width': 7, 'kernel_height': 7, 'kernel_1': TensorShapes(batch=0, width=7, height=7, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'dilation_width': 1, 'dilation_height': 1, 'pad_left': 3, 'pad_right': 4, 'pad_top': 0, 'pad_bottom': 4, 'sync_type': 4, '_iterations_': 14, '_iteration_': 13}  #### 
##### IN input (0, 5824) TensorShapes(batch=4, width=224, height=14, channel=3)  ->
##### OUT resnet_v1_50/conv1/Conv2D (8, 5824) TensorShapes(batch=4, width=112, height=8, channel=64) #### 
CONVINIT 0000 0000 kernel_w 7 kernel_h 7 shift_cut 8 stride_w 2 stride_h 2 act_type 1 jump_write 4 jump_write_endl 448 jump_read 1 jump_read_endl 224 wgt_jump_read_endl 49 stride_out 1 channel_group_in 1 channel_group_out 4 channel_offset 13 prelu_shift_p 0
CONV 0001 0010 pad_left 3 pad_top 0 pad_right 4 pad_bottom 4 bank_id_in 0 bank_id_out 8 bank_addr_in 5821 bank_addr_out 5824 bank_addr_weights 0 bank_addr_bias 196 length 112 bank_addr_prelu 0 stride_offset_out 0 prelu_offset 0 bias_offset 0 valid_pixel_parallel 8 prelu_shift_n 0
#### BARRIER CONV STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 8-8 
####I resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 2 
####O resnet_v1_50/conv1/Conv2D TensorShapes(batch=4, width=112, height=8, channel=64) 3 #####
SAVE 0100 0000 mode 0 bank_addr 5824 bank_id 8 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 2981888
SAVE 0000 0000 mode 0 bank_addr 5824 bank_id 9 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 3010560
SAVE 0000 0000 mode 0 bank_addr 5824 bank_id 10 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 3039232
SAVE 0000 0000 mode 0 bank_addr 5824 bank_id 11 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 3067904
SAVE 0000 0000 mode 0 bank_addr 5824 bank_id 12 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 3096576
SAVE 0000 0000 mode 0 bank_addr 5824 bank_id 13 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 3125248
SAVE 0000 0000 mode 0 bank_addr 5824 bank_id 14 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 3153920
SAVE 0000 0010 mode 0 bank_addr 5824 bank_id 15 jump_write 64 jump_read 4 length 112 channel 64 reg_id 1 ddr_addr 3182592
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/conv1/Conv2D for  end ######
## End DDR-to_DDR SPLIT by h 13 ##
####### resnet_v1_50/conv1/Conv2D #######
####### bracket #######
END 0010 0000 
####### bracket #######
