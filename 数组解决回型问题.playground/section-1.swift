// Playground - noun: a place where people can play



var board = Array<Array<Int>> ()
for i in 0..<7 {
    board.append( Array(count:7,repeatedValue:0))
}
board
var i = 0, j = 0, k = 0
for  i = 0 ;i < 4; i++ {
    for  j = i ; j < (7-i) ; j++ {
        k++
        board[j][i] = k
    }
    for  j = i+1; j < (7-i ); j++  {
        k++
        board[6-i][j] = k
    }
    for  j = 5-i; j >= i ; j-- {
        k++
        board[j][6-i] = k
    }
    for  j = 5-i; j >= (i+1) ; j-- {
        k++
        board[i][j] = k
    }
}
board
for i in 0...6 {
    for j in 0...6 {
        if board[i][j] > 9 {
       print(board[i][j])
             print(" ")
            
        } else {
            print("0\(board[i][j]) ")
           
    }
}
    print("\n")
}
