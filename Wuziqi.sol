pragma solidity ^0.6.0; 
contract Wuziqi{
    
    uint8[10][10] public board;
    address player1;
    address player2;
    uint8 turn;

    function fundContract() public payable{
    }
    
    function initiate(address opponent) public{
        player1 = msg.sender;
        player2 = opponent;
        turn = 1;
    }
    
    function makeMove(uint8 x, uint8 y) public returns (uint8) {
        require(board[x][y] == 0, "already a piece here");
        require((msg.sender == player1 && turn == 1) || (msg.sender == player2 && turn == 2));
        board[x][y] = turn;
        if (checkWin(x, y) && msg.sender == player1) {
            return 1;
        }else if (checkWin(x, y) && msg.sender == player2){
            return 2;
        }
        if( turn == 1 ){
            turn = 2;
        }else {
            turn = 1;
        }
    }
    
    function checkWin(uint8 x, uint8 y) private returns (bool){
        if(x == y){
            return true;
        }else{
            return false;
        }
    }
    
    function getStatus() public returns(uint8){
        return turn;
    }
    
    function getBoard() view public returns(uint8[10][10] memory){
        return board;
    }
    
    
}
