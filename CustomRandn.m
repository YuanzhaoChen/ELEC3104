function [NewMatrix,SumofRow]=CustomRandn(nRow,nCo1,meanN,stdN)

NewRand = stdN + randn(nRow,nCo1) + meanN;
NewMatrix = NewRand;
SumofRow = sum(NewMatrix);