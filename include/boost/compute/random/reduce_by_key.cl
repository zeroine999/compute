#ifndef _REDUCE_BY_KEY_KERNEL_H_
#define _REDUCE_BY_KEY_KERNEL_H_

/*
    Reduce by key implementation. Groups values by keys and reduces values
    for each unique key. Assumes keys are sorted.
*/

__kernel void reduce_by_key(__global const T* g_keys, __global const T* g_idata,
                            __global T* g_odata_keys, __global T* g_odata_values,
                            unsigned int n, __local volatile T* s_keys, __local volatile T* s_values) {
    // Thread and block indices
    unsigned int tid = get_local_id(0);
    unsigned int i = get_group_id(0) * get_local_size(0) + tid;

    // Initialize shared memory
    s_keys[tid] = (i < n) ? g_keys[i] : 0;
    s_values[tid] = (i < n) ? g_idata[i] : 0;

    barrier(CLK_LOCAL_MEM_FENCE);

    // Perform reduction within the block
    for (unsigned int stride = 1; stride < get_local_size(0); stride *= 2) {
        unsigned int index = 2 * stride * tid;

        if (index + stride < get_local_size(0) && s_keys[index] == s_keys[index + stride]) {
            s_values[index] += s_values[index + stride];
        }

        barrier(CLK_LOCAL_MEM_FENCE);
    }

    // Write results to global memory
    if (tid == 0) {
        g_odata_keys[get_group_id(0)] = s_keys[0];
        g_odata_values[get_group_id(0)] = s_values[0];
    }
}

#endif  // #ifndef _REDUCE_BY_KEY_KERNEL_H_
