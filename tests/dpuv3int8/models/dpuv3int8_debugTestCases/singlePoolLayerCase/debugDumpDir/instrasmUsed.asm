*****************************************************
This section contains compiler instructions in asm format
####### bracket #######
## BEGING 0000 0000 
####### bracket #######
####### resnet_v1_50/block1/unit_2/bottleneck_v1/add #######
# SOMBODY IS A LAZY BOY   ... missing code for
# resnet_v1_50/block1/unit_2/bottleneck_v1/add
# Memory_Access(input=-1, parameters=-1, output=-1)
# {212: <bound method BasicCode.gen_fm_par_fm of <SC.HwAbstraction.code_class.BasicCode object at 0x7f4937d01b10>>, 232: <bound method BasicCode.gen_fm_ddr_fm of <SC.HwAbstraction.code_class.BasicCode object at 0x7f4937d01b10>>, 333: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f4937d01b10>>, 332: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f4937d01b10>>, 313: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f4937d01b10>>, 312: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f4937d01b10>>, 213: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f4937d01b10>>, 233: <bound method BasicCode.gen_any_par_any of <SC.HwAbstraction.code_class.BasicCode object at 0x7f4937d01b10>>}
####### resnet_v1_50/block1/unit_2/bottleneck_v1/add #######
####### resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool #######
#### resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool OUTPUT SPLIT by h total 28 ####
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add ddr TensorShapes(batch=4, width=56, height=56, channel=256) (0, 0) ######
##### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=28, channel=256) (0) (0, 1568) Absolute 3 0x1880000 #####
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 0 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 1-1 #####
### NR b_id  0 b_add    0 h_0 <- h_0 ###
LOAD 0000 1000 mode 0 bank_addr 0 bank_id 0 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 0
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 0}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 0) TensorShapes(batch=4, width=56, height=1, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (8, 0) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 8 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 0 bank_id 8 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 0
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 0 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 1 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  1 b_add    0 h_0 <- h_1 ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 1 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 57344
### NR b_id  2 b_add    0 h_1 <- h_2 ###
LOAD 0000 1000 mode 0 bank_addr 0 bank_id 2 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 114688
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 1}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 0) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (9, 0) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 9 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 0 bank_id 9 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 28672
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 1 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 2 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  3 b_add    0 h_0 <- h_3 ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 3 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 172032
### NR b_id  4 b_add    0 h_1 <- h_4 ###
LOAD 0000 1000 mode 0 bank_addr 0 bank_id 4 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 229376
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 2}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (4, 0) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (10, 0) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 10 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 0 bank_id 10 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 57344
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 2 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 3 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  5 b_add    0 h_0 <- h_5 ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 5 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 286720
### NR b_id  6 b_add    0 h_1 <- h_6 ###
LOAD 0000 1000 mode 0 bank_addr 0 bank_id 6 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 344064
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 3}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (6, 0) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (11, 0) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 0 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 11 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 0 bank_id 11 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 86016
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 3 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 4 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  7 b_add    0 h_0 <- h_7 ###
LOAD 0000 0000 mode 0 bank_addr 0 bank_id 7 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 401408
### NR b_id  0 b_add  896 h_1 <- h_8 ###
LOAD 0000 1000 mode 0 bank_addr 896 bank_id 0 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 458752
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 4}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 896) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (12, 0) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 12 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 0 bank_id 12 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 114688
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 4 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 5 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  1 b_add  896 h_0 <- h_9 ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 1 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 516096
### NR b_id  2 b_add  896 h_1 <- h_10 ###
LOAD 0000 1000 mode 0 bank_addr 896 bank_id 2 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 573440
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 5}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 896) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (13, 0) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 13 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 0 bank_id 13 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 143360
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 5 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 6 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  3 b_add  896 h_0 <- h_11 ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 3 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 630784
### NR b_id  4 b_add  896 h_1 <- h_12 ###
LOAD 0000 1000 mode 0 bank_addr 896 bank_id 4 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 688128
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 6}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (4, 896) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (14, 0) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 14 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 0 bank_id 14 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 172032
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 6 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 7 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  5 b_add  896 h_0 <- h_13 ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 5 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 745472
### NR b_id  6 b_add  896 h_1 <- h_14 ###
LOAD 0000 1000 mode 0 bank_addr 896 bank_id 6 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 802816
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 7}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (6, 896) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (15, 0) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 896 bank_addr_out 0 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 15 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 0 bank_id 15 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 200704
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 7 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 8 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  7 b_add  896 h_0 <- h_15 ###
LOAD 0000 0000 mode 0 bank_addr 896 bank_id 7 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 860160
### NR b_id  0 b_add 1792 h_1 <- h_16 ###
LOAD 0000 1000 mode 0 bank_addr 1792 bank_id 0 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 917504
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 8}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 1792) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (8, 448) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 8 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 448 bank_id 8 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 229376
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 8 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 9 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  1 b_add 1792 h_0 <- h_17 ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 1 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 974848
### NR b_id  2 b_add 1792 h_1 <- h_18 ###
LOAD 0000 1000 mode 0 bank_addr 1792 bank_id 2 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1032192
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 9}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 1792) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (9, 448) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 9 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 448 bank_id 9 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 258048
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 9 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 10 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  3 b_add 1792 h_0 <- h_19 ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 3 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1089536
### NR b_id  4 b_add 1792 h_1 <- h_20 ###
LOAD 0000 1000 mode 0 bank_addr 1792 bank_id 4 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1146880
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 10}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (4, 1792) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (10, 448) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 10 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 448 bank_id 10 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 286720
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 10 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 11 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  5 b_add 1792 h_0 <- h_21 ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 5 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1204224
### NR b_id  6 b_add 1792 h_1 <- h_22 ###
LOAD 0000 1000 mode 0 bank_addr 1792 bank_id 6 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1261568
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 11}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (6, 1792) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (11, 448) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 1792 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 11 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 448 bank_id 11 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 315392
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 11 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 12 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  7 b_add 1792 h_0 <- h_23 ###
LOAD 0000 0000 mode 0 bank_addr 1792 bank_id 7 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1318912
### NR b_id  0 b_add 2688 h_1 <- h_24 ###
LOAD 0000 1000 mode 0 bank_addr 2688 bank_id 0 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1376256
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 12}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 2688) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (12, 448) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 12 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 448 bank_id 12 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 344064
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 12 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 13 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  1 b_add 2688 h_0 <- h_25 ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 1 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1433600
### NR b_id  2 b_add 2688 h_1 <- h_26 ###
LOAD 0000 1000 mode 0 bank_addr 2688 bank_id 2 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1490944
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 13}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 2688) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (13, 448) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 13 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 448 bank_id 13 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 372736
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 13 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 14 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  3 b_add 2688 h_0 <- h_27 ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 3 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1548288
### NR b_id  4 b_add 2688 h_1 <- h_28 ###
LOAD 0000 1000 mode 0 bank_addr 2688 bank_id 4 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1605632
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 14}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (4, 2688) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (14, 448) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 14 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 448 bank_id 14 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 401408
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 14 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 15 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  5 b_add 2688 h_0 <- h_29 ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 5 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1662976
### NR b_id  6 b_add 2688 h_1 <- h_30 ###
LOAD 0000 1000 mode 0 bank_addr 2688 bank_id 6 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1720320
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 15}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (6, 2688) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (15, 448) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 2688 bank_addr_out 448 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 15 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 448 bank_id 15 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 430080
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 15 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 16 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  7 b_add 2688 h_0 <- h_31 ###
LOAD 0000 0000 mode 0 bank_addr 2688 bank_id 7 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1777664
### NR b_id  0 b_add 3584 h_1 <- h_32 ###
LOAD 0000 1000 mode 0 bank_addr 3584 bank_id 0 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1835008
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 16}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 3584) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (8, 896) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 8 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 896 bank_id 8 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 458752
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 16 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 17 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  1 b_add 3584 h_0 <- h_33 ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 1 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1892352
### NR b_id  2 b_add 3584 h_1 <- h_34 ###
LOAD 0000 1000 mode 0 bank_addr 3584 bank_id 2 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 1949696
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 17}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 3584) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (9, 896) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 9 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 896 bank_id 9 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 487424
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 17 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 18 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  3 b_add 3584 h_0 <- h_35 ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 3 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2007040
### NR b_id  4 b_add 3584 h_1 <- h_36 ###
LOAD 0000 1000 mode 0 bank_addr 3584 bank_id 4 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2064384
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 18}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (4, 3584) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (10, 896) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 10 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 896 bank_id 10 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 516096
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 18 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 19 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  5 b_add 3584 h_0 <- h_37 ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 5 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2121728
### NR b_id  6 b_add 3584 h_1 <- h_38 ###
LOAD 0000 1000 mode 0 bank_addr 3584 bank_id 6 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2179072
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 19}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (6, 3584) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (11, 896) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 3584 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 11 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 896 bank_id 11 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 544768
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 19 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 20 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  7 b_add 3584 h_0 <- h_39 ###
LOAD 0000 0000 mode 0 bank_addr 3584 bank_id 7 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2236416
### NR b_id  0 b_add 4480 h_1 <- h_40 ###
LOAD 0000 1000 mode 0 bank_addr 4480 bank_id 0 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2293760
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 20}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 4480) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (12, 896) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4480 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 12 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 896 bank_id 12 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 573440
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 20 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 21 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  1 b_add 4480 h_0 <- h_41 ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 1 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2351104
### NR b_id  2 b_add 4480 h_1 <- h_42 ###
LOAD 0000 1000 mode 0 bank_addr 4480 bank_id 2 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2408448
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 21}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 4480) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (13, 896) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4480 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 13 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 896 bank_id 13 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 602112
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 21 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 22 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  3 b_add 4480 h_0 <- h_43 ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 3 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2465792
### NR b_id  4 b_add 4480 h_1 <- h_44 ###
LOAD 0000 1000 mode 0 bank_addr 4480 bank_id 4 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2523136
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 22}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (4, 4480) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (14, 896) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4480 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 14 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 896 bank_id 14 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 630784
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 22 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 23 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  5 b_add 4480 h_0 <- h_45 ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 5 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2580480
### NR b_id  6 b_add 4480 h_1 <- h_46 ###
LOAD 0000 1000 mode 0 bank_addr 4480 bank_id 6 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2637824
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 23}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (6, 4480) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (15, 896) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 4480 bank_addr_out 896 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 15 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 896 bank_id 15 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 659456
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 23 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 24 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  7 b_add 4480 h_0 <- h_47 ###
LOAD 0000 0000 mode 0 bank_addr 4480 bank_id 7 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2695168
### NR b_id  0 b_add 5376 h_1 <- h_48 ###
LOAD 0000 1000 mode 0 bank_addr 5376 bank_id 0 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2752512
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 24}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (0, 5376) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (8, 1344) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 0 bank_id_out 8 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 1344 bank_id 8 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 688128
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 24 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 25 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  1 b_add 5376 h_0 <- h_49 ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 1 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2809856
### NR b_id  2 b_add 5376 h_1 <- h_50 ###
LOAD 0000 1000 mode 0 bank_addr 5376 bank_id 2 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2867200
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 25}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (2, 5376) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (9, 1344) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 2 bank_id_out 9 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 1344 bank_id 9 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 716800
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 25 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 26 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  3 b_add 5376 h_0 <- h_51 ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 3 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2924544
### NR b_id  4 b_add 5376 h_1 <- h_52 ###
LOAD 0000 1000 mode 0 bank_addr 5376 bank_id 4 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 2981888
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 26}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (4, 5376) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (10, 1344) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 4 bank_id_out 10 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0000 mode 0 bank_addr 1344 bank_id 10 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 745472
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 26 ##
## SW PIPE OVERAL Start DDR-to_DDR SPLIT by h 27 ##
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add start ######
#### BARRIER LOAD START MARKER #####
#### START 0-0 END 2-2 #####
### NR b_id  5 b_add 5376 h_0 <- h_53 ###
LOAD 0000 0000 mode 0 bank_addr 5376 bank_id 5 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 3039232
### NR b_id  6 b_add 5376 h_1 <- h_54 ###
LOAD 0000 1000 mode 0 bank_addr 5376 bank_id 6 jump_read 256 jump_write 16 length 56 channel 256 reg_id 0 ddr_addr 3096576
#### BARRIER LOAD END MARKER #####
#### Inputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for resnet_v1_50/block1/unit_2/bottleneck_v1/add end ######
#### BARRIER POOL START MARKER #####
#### POOL (2,2, 1,1 0,0)) #### 
#### ATT {'dependency_summary': [1, 0, 0, 0, 1, 1], 'bit_width': 8, 'fix_point': 4, 'quant_out_signed': True, 'quant_in_signed': True, 'kernel': [1, 1], 'stride': [2, 2], 'global': False, 'pad_mode': 'SAME', 'pad': [0, 0, 0, 0], 'kernel_width': 1, 'kernel_height': 1, 'kernel_1': TensorShapes(batch=0, width=1, height=1, channel=0), 'stride_width': 2, 'stride_height': 2, 'strides_1': TensorShapes(batch=0, width=2, height=2, channel=0), 'pad_left': 0, 'pad_right': 15, 'pad_top': 0, 'pad_bottom': 15, 'sync_type': 8, '_iterations_': 28, '_iteration_': 27}  #### 
##### IN resnet_v1_50/block1/unit_2/bottleneck_v1/add (6, 5376) TensorShapes(batch=4, width=56, height=2, channel=256)  -> 
#### OUT resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool (11, 1344) TensorShapes(batch=4, width=28, height=1, channel=256) #### 
POOL 0001 0010 pad_top 0 pad_bottom 15 pad_left 0 pad_right 15 shift_avg 0 bank_addr_in 5376 bank_addr_out 1344 length 28 jump_read_endl 896 jump_write_endl 448 stride_w 2 stride_h 2 valid_pixel_parallel 1 kernel_w 1 select_avg 0 channel_group 16 bank_id_in 6 bank_id_out 11 pool_type 0 kernel_h 1
#### BARRIER POOL STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  start ######
#### BARRIER SAVE START MARKER #####
#### START 0-0 END 1-1 
####I resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 2 
####O resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool TensorShapes(batch=4, width=28, height=1, channel=256) 3 #####
SAVE 1000 0010 mode 0 bank_addr 1344 bank_id 11 jump_write 256 jump_read 16 length 28 channel 256 reg_id 1 ddr_addr 774144
#### BARRIER SAVE STOP MARKER #####
#### outputs resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool for  end ######
## End DDR-to_DDR SPLIT by h 27 ##
####### resnet_v1_50/block1/unit_3/bottleneck_v1/shortcut/MaxPool #######
####### bracket #######
END 0010 0000 
####### bracket #######
