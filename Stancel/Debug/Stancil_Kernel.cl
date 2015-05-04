/*
* Primary kernel to execute calculations.
*/
__kernel void stancil(__global int* in, __global int* out, 
					int width, int height)
{
	int num = get_global_id(0);
	//for (int doit = 0; doit < 10000000; doit++){

	if(num < width ||(num % width) == 0  || (num % width) == width-1 || num >= (width*height-width)){
	out[num] = in [num];
	}
	else{
		out[num] = -4*in[num]+in[num-1]+in[num+1]+in[num-width]+in[num+width]; 
	}
//	for(int ding = 0; ding< 1000 ;ding++){   //10000 
//		out[num] = out[num] * (out[num] + width);
//	}
}


/*
* Second kernel just for testing how to use a secondary kernel.
*/
__kernel void stancil2(__global int* in, __global int* out, 
					int width, int height)
{
	int num = get_global_id(0);
	out[num] = num;
}