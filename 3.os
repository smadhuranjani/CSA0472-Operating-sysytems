#include <stdio.h>
struct Process {
	int i;
    int pid;
    int burstTime;
    int arrivalTime;
    int waitingTime;
    int turnaroundTime;
};
void calculateTimes(struct Process processes[], int n) {
    int totalWaitTime = 0, totalTurnaroundTime = 0;int i;
    processes[0].waitingTime = 0;
    processes[0].turnaroundTime = processes[0].burstTime;
    for ( i = 1; i < n; i++) {
        processes[i].waitingTime = processes[i - 1].waitingTime + processes[i - 1].burstTime;
        processes[i].turnaroundTime = processes[i].waitingTime + processes[i].burstTime;
    }
    for ( i = 0; i < n; i++) {
        totalWaitTime += processes[i].waitingTime;
        totalTurnaroundTime += processes[i].turnaroundTime;
    }
    printf("Process\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for (i = 0; i < n; i++) {
        printf("%d\t%d\t\t%d\t\t%d\n", processes[i].pid, processes[i].burstTime, processes[i].waitingTime, processes[i].turnaroundTime);
    }
    printf("\nAverage Waiting Time: %.2f\n", (float)totalWaitTime / n);
    printf("Average Turnaround Time: %.2f\n", (float)totalTurnaroundTime / n);
}
int main() {
    int n;
	int i;
    printf("Enter the number of processes: ");
    scanf("%d", &n);
    struct Process processes[n];
    printf("Enter burst times for each process:\n");
    for (i = 0; i < n; i++) {
        processes[i].pid = i + 1;
        printf("P %d: ", i + 1);
        scanf("%d", &processes[i].burstTime);
        processes[i].arrivalTime = 0;
    }
    calculateTimes(processes, n);
    return 0;
}
