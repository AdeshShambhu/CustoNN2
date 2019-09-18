

__kernel void  block3_unit_6_bt_v2_shortcut_MaxPool(__global float* restrict tensor, __global float* restrict input0) {

  for (int ax1 = 0; ax1 < 1024; ++ax1) {
    for (int ax2 = 0; ax2 < 7; ++ax2) {
      #pragma unroll
      for (int ax3 = 0; ax3 < 7; ++ax3) {
	float temp_0 = -3.402823e+38f;
	tensor[((((ax1 * 7) + ax2) * 7) + ax3)] = max(temp_0, input0[(((((ax1 * 7) + ax2) * 14) + ax3) * 2)]);
        //tensor[((((ax1 * 7) + ax2) * 7) + ax3)] = -3.402823e+38f;
        //tensor[((((ax1 * 7) + ax2) * 7) + ax3)] = max(tensor[((((ax1 * 7) + ax2) * 7) + ax3)], input0[(((((ax1 * 7) + ax2) * 14) + ax3) * 2)]);
      }
    }
  }
}



__kernel void  Mul1_1844_Fused_Mul__FusedScaleShift(__global float* restrict T_pad, __global float* restrict input0, __global float* restrict input1, __global float* restrict input2) {
  for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner < 200704; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner) {
    T_pad[ax0_ax1_fused_ax2_fused_ax3_fused_inner] = max(((input0[ax0_ax1_fused_ax2_fused_ax3_fused_inner] * input1[(ax0_ax1_fused_ax2_fused_ax3_fused_inner / 196)]) + input2[(ax0_ax1_fused_ax2_fused_ax3_fused_inner / 196)]), 0.000000e+00f);
 }
}



__kernel void  block3_unit_6_bt_v2_conv1_Conv2D(__global float* restrict compute, __global float* restrict input0, __global float* restrict input1,__global float* restrict input2) {
  __local  float input_bias[256];
    for(int bias = 0; bias < 256; bias++){
        input_bias[bias] = input2[bias];
	}

  for (int ff = 0; ff < 256; ++ff) {
    float input_weights[1024];
    for(int w = 0 ; w < 1024 ;w++){
      input_weights[w] = input1[((ff * 1024) + w)];
    }
    for (int yy = 0; yy < 14; ++yy) {
      for (int xx = 0; xx < 14; ++xx) {
	float temp_0 = input_bias[ff];
	float temp_1 = 0.0;
        //compute[((((ff * 14) + yy) * 14) + xx)] = input2[ff];
        for (int rc = 0; rc < 1024; ++rc) {
	  temp_1 += (input0[((((rc * 14) + yy) * 14) + xx)] * input_weights[(rc)]);
          //compute[((((ff * 14) + yy) * 14) + xx)] = (compute[((((ff * 14) + yy) * 14) + xx)] + (input0[((((rc * 14) + yy) * 14) + xx)] * input1[((ff * 1024) + rc)]));
        }
	temp_0 += temp_1;
	temp_0 = (temp_0 > 0) ? temp_0 : 0.0;
 	compute[((((ff * 14) + yy) * 14) + xx)] = temp_0;
	//compute[((((ff * 14) + yy) * 14) + xx)] = (compute[((((ff * 14) + yy) * 14) + xx)] > 0) ? compute[((((ff * 14) + yy) * 14) + xx)] : 0.000000e+00f;
      }
    }
  }
}


__kernel void P_block3_unit_6_bt_v2_conv2_Conv2D(__global float *restrict T_pad, __global float *restrict input0)
{
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner < 65536; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner) {
    T_pad[ax0_ax1_fused_ax2_fused_ax3_fused_inner] = (float)(((((16 <= (ax0_ax1_fused_ax2_fused_ax3_fused_inner % 256)) && ((ax0_ax1_fused_ax2_fused_ax3_fused_inner % 256) < 240)) && (1 <= (ax0_ax1_fused_ax2_fused_ax3_fused_inner % 16))) && ((ax0_ax1_fused_ax2_fused_ax3_fused_inner % 16) < 15)) ? input0[((((((ax0_ax1_fused_ax2_fused_ax3_fused_inner / 256) * 14) + ((ax0_ax1_fused_ax2_fused_ax3_fused_inner % 256) / 16)) * 14) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner % 16)) + -15)] : 0.000000e+00f);
  }
}



__kernel void  block3_unit_6_bt_v2_conv2_Conv2D(__global float* restrict compute, __global float* restrict input0, __global float* restrict input1, __global float* restrict input2) {
  __local  float input_bias[256];
    for(int bias = 0; bias < 256; bias++){
        input_bias[bias] = input2[bias];
	}

  for (int ff = 0; ff < 256; ++ff) {
    float input_weights[256*3*3];
    for(int w = 0 ; w < 256*3*3 ;w++){
      input_weights[w] = input1[((ff * 256*3*3) + w)];
    }
    for (int yy = 0; yy < 7; ++yy) {
      for (int xx = 0; xx < 7; ++xx) {
	float temp_0 = input_bias[ff];
	float temp_3 = 0.0;     
        //compute[((((ff * 7) + yy) * 7) + xx)] = input2[ff];
        for (int rc = 0; rc < 256; ++rc) {
	  float temp_2 = 0.0;
	  #pragma unroll
          for (int ry = 0; ry < 3; ++ry) {
	    float temp_1 = 0.0;
	    #pragma unroll
            for (int rx = 0; rx < 3; ++rx) {
	  	temp_1 += (input0[((((((((rc * 8) + yy) * 2) + ry) * 8) + xx) * 2) + rx)] * input_weights[(((((rc) * 3) + ry) * 3) + rx)]);
              //compute[((((ff * 7) + yy) * 7) + xx)] = (compute[((((ff * 7) + yy) * 7) + xx)] + (input0[((((((((rc * 8) + yy) * 2) + ry) * 8) + xx) * 2) + rx)] * input1[((((((ff * 256) + rc) * 3) + ry) * 3) + rx)]));
            }
	    temp_2 += temp_1;
          }
	  temp_3 += temp_2;
        }
	temp_0 += temp_3;
        temp_0 = (temp_0 > 0) ? temp_0 : 0.0;
	compute[((((ff * 7) + yy) * 7) + xx)] = temp_0;
	//compute[((((ff * 7) + yy) * 7) + xx)] = (compute[((((ff * 7) + yy) * 7) + xx)] > 0) ? compute[((((ff * 7) + yy) * 7) + xx)] : 0.000000e+00f;
      }
    }
  }
}




__kernel void  block3_unit_6_bt_v2_conv3_Conv2D(__global float* restrict compute, __global float* restrict input0, __global float* restrict input1, __global float* restrict input2) {
  __local  float input_bias[1024];
    for(int bias = 0; bias < 1024; bias++){
        input_bias[bias] = input2[bias];
	}

  for (int ff = 0; ff < 1024; ++ff) {
    float input_weights[256];
    for(int w = 0 ; w < 256 ;w++){
      input_weights[w] = input1[((ff * 256) + w)];
    }
    for (int yy = 0; yy < 7; ++yy) {
      for (int xx = 0; xx < 7; ++xx) {
	float temp_0 = input_bias[ff];
	float temp_1 = 0.0;
        //compute[((((ff * 7) + yy) * 7) + xx)] = input2[ff];
		#pragma unroll
        for (int rc = 0; rc < 256; ++rc) {
	  temp_1 += (input0[((((rc * 7) + yy) * 7) + xx)] * input_weights[(rc)]);
          //compute[((((ff * 7) + yy) * 7) + xx)] = (compute[((((ff * 7) + yy) * 7) + xx)] + (input0[((((rc * 7) + yy) * 7) + xx)] * input1[((ff * 256) + rc)]));
        }
	temp_0 += temp_1;
 	compute[((((ff * 7) + yy) * 7) + xx)] = temp_0;
      }
    }
  }
}


__kernel void  block3_unit_6_bt_v2_add(__global float* restrict T_add, __global float* restrict input0, __global float* restrict input1) {
  for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner < 50176; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner) {
    T_add[ax0_ax1_fused_ax2_fused_ax3_fused_inner] =  input0[ax0_ax1_fused_ax2_fused_ax3_fused_inner] + input1[ax0_ax1_fused_ax2_fused_ax3_fused_inner];
  }
}