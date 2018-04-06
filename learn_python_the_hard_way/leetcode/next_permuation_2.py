class Solution:
    # @param num, a list of integer
    # @return a list of integer
    def nextPermutation(self, num):
        lenNum = len(num)
        # find the first number (PartitionNumber) which violates the increase trend
        partitionIndex = -1
        for i in reversed(xrange(lenNum - 1)):
            if num[i] < num[i + 1]:
                partitionIndex = i
                break
        if partitionIndex != -1:
            for i in reversed(xrange(lenNum)):
                if num[i] > num[partitionIndex]:
                    num[i], num[partitionIndex] = num[partitionIndex], num[i]
                    break
        # reverse all numbers behind PartitionIndex
        i = partitionIndex + 1
        j = lenNum - 1
        while i < j:
            num[i], num[j] = num[j], num[i]
            i += 1
            j -= 1
        return num

print "now use function to do something"
nextPermutation("self", "123")
