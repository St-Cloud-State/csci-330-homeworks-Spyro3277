#include <iostream>
#include <stack>
using namespace std; 
/* 
quickSort:
If Starting Index < Ending Index
Partition the List around a Pivot.
quickSort Sublist 1.
quickSort Sublist 2.
End If. */

int partition(int set[], int start, int end)
{
    int pivotValue, pivotIndex, mid;
    mid = (start + end) / 2;

    swap(set[start], set[mid]);
    pivotIndex = start; 
    pivotValue = set[start];

    for (int scan = start + 1; scan <= end; scan++)
    {
        if (set[scan] < pivotValue)
        {
            pivotIndex++;
            swap(set[pivotIndex], set[scan]);
        }
    }
    swap(set[start], set[pivotIndex]);
    return pivotIndex;
}

void quicksort(int arr[], int low, int high)
{
    stack<int> quicksortStack;

    quicksortStack.push(low);
    quicksortStack.push(high);

    while(!quicksortStack.empty())
    {
        high = quicksortStack.top();
        quicksortStack.pop();

        low = quicksortStack.top();
        quicksortStack.pop();


        int partitionValue = partition(arr, low, high);

        if (partitionValue + 1 < high)
        {
            quicksortStack.push(partitionValue + 1);
            quicksortStack.push(high);
        }

        if(partitionValue - 1 > low)
        {
            quicksortStack.push(low);
            quicksortStack.push(partitionValue - 1);
        }

    }
}

int main(){

    int testArray[10] = {47, 6, 32, 746, 543, 6543, 90, 54, 1436, 6453};
    int sizeOfArray = sizeof(testArray)/ sizeof(testArray[0]);

    quicksort(testArray, 0, sizeOfArray - 1);

    for(int i = 0; i < sizeOfArray; i++)
    {
        cout << testArray[i]<< " ";
    }

    
} 