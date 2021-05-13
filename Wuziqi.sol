pragma solidity ^0.6.0; 
contract Wuziqi{
    
    uint8[10][10] private board;
    address player1;
    address player2;
    uint8 turn;

    function fundContract() public payable{
    }
    
    function initiate(address opponent) public{
        player1 = msg.sender;
        player2 = opponent;
    }
    
    function makeMove(uint8 x, uint8 y) public{
        require(board[x][y] == 0, "already a piece here");
        board[x][y] = turn;
        require(checkWin(), "won");
    }
    
    function checkWin() private returns(bool){
        
        return false;
    }
    
    // function getStatus() public returns(bool){
    //     return turn;
    // }
    
    // function getBoard() public returns(uint8[][]){
    //     return board;
    // }
    
    
}