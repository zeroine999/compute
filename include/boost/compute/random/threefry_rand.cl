#define THREEFRY2x32_DEFAULT_ROUNDS 20
#define SKEIN_KS_PARITY_32 0x1BD11BDA
enum r123_enum_threefry32x2 {
    R_32x2_0_0=13,
    R_32x2_1_0=15,
    R_32x2_2_0=26,
    R_32x2_3_0= 6,
    R_32x2_4_0=17,
    R_32x2_5_0=29,
    R_32x2_6_0=16,
    R_32x2_7_0=24
};
static uint RotL_32(uint x, uint N)
{
    return (x << (N & 31)) | (x >> ((32-N) & 31));
}
struct r123array2x32 {
    uint v[2];
};
typedef struct r123array2x32 threefry2x32_ctr_t;
typedef struct r123array2x32 threefry2x32_key_t;
threefry2x32_ctr_t threefry2x32_R(unsigned int Nrounds, threefry2x32_ctr_t in, threefry2x32_key_t k)
{
    threefry2x32_ctr_t X;
    uint ks[3];
    uint  i; 
    ks[2] =  SKEIN_KS_PARITY_32;
    for (i=0;i < 2; i++) {
        ks[i] = k.v[i];
        X.v[i]  = in.v[i];
        ks[2] ^= k.v[i];
    }
    X.v[0] += ks[0]; X.v[1] += ks[1];
    if(Nrounds>0){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_0_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>1){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_1_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>2){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_2_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>3){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_3_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>3){
        X.v[0] += ks[1]; X.v[1] += ks[2];
        X.v[1] += 1;
    }
    if(Nrounds>4){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_4_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>5){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_5_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>6){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_6_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>7){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_7_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>7){
        X.v[0] += ks[2]; X.v[1] += ks[0];
        X.v[1] += 2;
    }
    if(Nrounds>8){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_0_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>9){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_1_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>10){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_2_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>11){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_3_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>11){
        X.v[0] += ks[0]; X.v[1] += ks[1];
        X.v[1] += 3;
    }
    if(Nrounds>12){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_4_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>13){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_5_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>14){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_6_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>15){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_7_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>15){
        X.v[0] += ks[1]; X.v[1] += ks[2];
        X.v[1] += 4;
    }
    if(Nrounds>16){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_0_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>17){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_1_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>18){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_2_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>19){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_3_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>19){
        X.v[0] += ks[2]; X.v[1] += ks[0];
        X.v[1] += 5;
    }
    if(Nrounds>20){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_4_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>21){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_5_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>22){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_6_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>23){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_7_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>23){
        X.v[0] += ks[0]; X.v[1] += ks[1];
        X.v[1] += 6;
    }
    if(Nrounds>24){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_0_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>25){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_1_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>26){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_2_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>27){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_3_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>27){
        X.v[0] += ks[1]; X.v[1] += ks[2];
        X.v[1] += 7;
    }
    if(Nrounds>28){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_4_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>29){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_5_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>30){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_6_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>31){  X.v[0] += X.v[1]; X.v[1] = RotL_32(X.v[1],R_32x2_7_0); X.v[1] ^= X.v[0]; }
    if(Nrounds>31){
        X.v[0] += ks[2]; X.v[1] += ks[0];
        X.v[1] += 8;
    }
    return X;
}


/**
 * @brief Initializes the state of a random number generator using a given seed.
 *
 * This kernel function sets the initial state of the random number generator
 * based on the provided seed. The state is represented as a uint4 vector, where
 * the first two components (x and y) are initialized with the seed values, and
 * the remaining components (z and w) are set to 0.
 *
 * @param seed A uint2 value representing the seed for the random number generator.
 *             - seed.x: The first part of the seed.
 *             - seed.y: The second part of the seed.
 * @param state A pointer to a global uint4 variable where the state will be stored.
 *              - state->x: Initialized with seed.x.
 *              - state->y: Initialized with seed.y.
 *              - state->z: Set to 0.
 *              - state->w: Set to 0.
 */
__kernel void rand_init(const uint2 seed, __global uint4 * state)
{
    state->x = seed.x;
    state->y = seed.y;
    state->z = 0;
    state->w = 0;
}


/**
 * @brief Generates a random number using the Threefry2x32 algorithm.
 *
 * This kernel function computes a random number based on the current state
 * of the random number generator. The state is updated after each call to
 * ensure the sequence of random numbers is unique.
 *
 * @param output A pointer to a global uint array where the generated random number will be stored.
 *               - output[0]: The generated random number.
 * @param state A pointer to a global uint4 variable representing the current state of the random number generator.
 *              - state->x: The first part of the key.
 *              - state->y: The second part of the key.
 *              - state->z: The first part of the counter (incremented with each call).
 *              - state->w: The second part of the counter (incremented with overflow).
 */
__kernel void rand(__global uint * output,
                   __global uint4 * state)
{
    // Initialize the counter with the current state values.
    threefry2x32_ctr_t c;
    c.v[0] = state->z + 1; // Increment the lower part of the counter.
    c.v[1] = state->w + (c.v[0] < state->x ? 1 : 0); // Handle overflow for the upper part of the counter.

    // Update the state with the new counter values.
    state->z = c.v[0];
    state->w = c.v[1];

    // Initialize the key using the first two components of the state.
    threefry2x32_key_t k = { {state->x, state->y} };

    // Compute the random number using the Threefry2x32 algorithm.
    threefry2x32_ctr_t result;
    result = threefry2x32_R(THREEFRY2x32_DEFAULT_ROUNDS, c, k);

    // Store the generated random number in the output array.
    output[0] = result.v[0];
}
