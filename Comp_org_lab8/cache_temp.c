//gcc cache_temp.c -o cache_temp -lrt

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Performance evaluation
struct timespec diff(struct timespec start, struct timespec end)
{
  struct timespec temp;
  if ((end.tv_nsec-start.tv_nsec)<0) {
    temp.tv_sec = end.tv_sec-start.tv_sec-1;
    temp.tv_nsec = 1000000000+end.tv_nsec-start.tv_nsec;
  } else {
    temp.tv_sec = end.tv_sec-start.tv_sec;
    temp.tv_nsec = end.tv_nsec-start.tv_nsec;
  }
  return temp;
}


// Function to perform the specified operation on the array
void modifyArray(int N, int *A, int *indices) {
    for (int i = 0; i < N; ++i) {
        A[indices[i]] += 10;
    }
}

int main() {
    
    struct timespec diff(struct timespec start, struct timespec end);
    struct timespec time1, time2;
    int clock_gettime(clockid_t clk_id, struct timespec *tp);

    // Initialize seed for random number generation
    srand(time(NULL));

    // Set the size of the array
    int N = 16e6;  // larger than L3 cache

    // Allocate and initialize arrays A1 and A2 with zeros
    int *A1 = (int *)calloc(N, sizeof(int));
    int *A2 = (int *)calloc(N, sizeof(int));

    // Allocate and initialize ind1 with ordered numbers from 1 to N
    int *ind1 = (int *)malloc(N * sizeof(int));
    for (int i = 0; i < N; ++i) {
        ind1[i] = i;
    }

    // Allocate and initialize ind1
    int *ind2 = (int *)malloc(N * sizeof(int));
    for (int i = 0; i < N; ++i) {
        ind2[i] = i;
    }

    // Shuffle ind2 using the Fisher-Yates algorithm
    for (int i = N - 1; i > 0; --i) {
        int j = rand() % (i + 1);
        int temp = ind2[i];
        ind2[i] = ind2[j];
        ind2[j] = temp;
    }

    // Measure the execution time for A1
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);
    modifyArray(N, A1, ind1);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);
    printf("Execution time for A1: %ld.%09ld seconds\n", diff(time1,time2).tv_sec, diff(time1,time2).tv_nsec);

    // Measure the execution time for A2
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);
    modifyArray(N, A2, ind2);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);
    printf("Execution time for A2: %ld.%09ld seconds\n", diff(time1,time2).tv_sec, diff(time1,time2).tv_nsec);

    // Free allocated memory
    free(A1);
    free(A2);
    free(ind1);
    free(ind2);

    return 0;
}
