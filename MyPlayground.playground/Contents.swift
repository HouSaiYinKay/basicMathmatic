import UIKit

//整体思想,二分法+递归
func  partialSort(array:inout[Int],start:Int,end:Int) -> Int{
    let pov = array[start]
    var left = start
    var right = end

    //记录指针位置
    var index = start //坑的位置
    while right != left { //中止条件,当两个指针重合时,一次排序结束

        while right > left  {
            if array[right] < pov {  //当右边的值大于基准值时,将右边值替换到左边(填到左边坑中),自身等待被替换(自身成为一个"坑"),同时左边的指针位置+1
                array[left] = array[right]
                index = right
                left += 1
               print("right+\(array)")
                break   //符合条件,跳出本循环
            }
            right -= 1 //不符合条件,右侧指针--,进入下次循环
        }

        while right > left {
            if array[left] > pov{
                array[right] = array[left]
                index = left
                print("left1+\(array)")
                right -= 1
                break
            }
            left += 1
        }


    }
    array[index] = pov
    return index
}
func quickSort(array:inout[Int],start:Int,end:Int){

    if start >= end{//先判断进入循环条件,若不满足,return
        return
    }
    let povIndex = partialSort(array: &array, start: start, end: end);
    quickSort(array: &array, start:povIndex+1, end: end) //分别重复两边的数据
    quickSort(array: &array, start: 0, end: povIndex-1)
}
var arr2 = [9,10,8,7,6,5,4,3,2,1,0]
print("init= \(arr2)")
quickSort(array: &arr2, start: 0, end: arr2.count-1)
print(arr2)

