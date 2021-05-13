pragma solidity ^0.6.0; 
contract Wuziqi{
    
    uint8[10][10] public board;
    address public player1;
    address public player2;
    uint8 public turn;
    uint8 public winner;

    function fundContract() public payable{
    }
    
    function initiate(address opponent) public{
        require(turn == 0);
        winner = 0;
        uint8[10][10] memory myArr;
        board = myArr;
        player1 = msg.sender;
        player2 = opponent;
        turn = 1;
    }
    
    function restart() public{
        require((msg.sender == player1 && turn == 1) || (msg.sender == player2 && turn == 2));
        turn = 0;
    }
    
    function makeMove(uint8 x, uint8 y) public {
        require(x>=0 && x<10 && y>=0 && y<10);
        require(board[x][y] == 0, "already a piece here");
        require((msg.sender == player1 && turn == 1) || (msg.sender == player2 && turn == 2));
        board[x][y] = turn;
        winner = checkWin(x,y);
        if( turn == 1 ){
            turn = 2;
        }else {
            turn = 1;
        }
        if(winner != 0) {
            turn = 0;
        }
    }
    
    function checkWin(uint8 x, uint8 y) view public returns (uint8){
        require(x>=0 && x<10 && y>=0 && y<10);
        uint8 degree0 = 0;
        uint8 degree45 = 0;
        uint8 degree90 = 0;
        uint8 degree135 = 0;
        uint8 colorHere = board[x][y];
        if(x+1 < 10 && y+1 <10 && board[x+1][y+1] == colorHere){
            degree135 += 1;
            if(x+2 < 10 && y+2 <10 && board[x+2][y+2] == colorHere){
            	degree135 += 1;
            	if(x+3 < 10 && y+3 <10 && board[x+3][y+3] == colorHere){
                	degree135 += 1;
                	if(x+4 < 10 && y+4 <10 && board[x+4][y+4] == colorHere){
                    	degree135 += 1;
                    }
                }
            }
        }
        if(degree135 >= 4){
            return colorHere;
        }
        
        if(x+1 < 10 && board[x+1][y] == colorHere){
            degree90 += 1;
            if(x+2 < 10 && board[x+2][y] == colorHere){
            	degree90 += 1;
            	if(x+3 < 10 && board[x+3][y] == colorHere){
                	degree90 += 1;
                	if(x+4 < 10 && board[x+4][y] == colorHere){
                    	degree90 += 1;
                    }
                }
            }
        }
        if(degree90 >= 4){
            return colorHere;
        }
        
        if(x+1 < 10 && y >= 1 && board[x+1][y-1] == colorHere){
            degree45 += 1;
            if(x+2 < 10 && y >= 2 && board[x+2][y-2] == colorHere){
            	degree45 += 1;
            	if(x+3 < 10 && y >= 3 && board[x+3][y-3] == colorHere){
                	degree45 += 1;
                	if(x+4 < 10 && y >= 4 && board[x+4][y-4] == colorHere){
                    	degree45 += 1;
                    }
                }
            }
        }
        if(degree45 >= 4){
            return colorHere;
        }
        
        if(y+1 < 10 && board[x][y+1] == colorHere){
            degree0 += 1;
            if(y+2 < 10 && board[x][y+2] == colorHere){
            	degree0 += 1;
            	if(y+3 < 10 && board[x][y+3] == colorHere){
                	degree0 += 1;
                	if(y+4 < 10 && board[x][y+4] == colorHere){
                    	degree0 += 1;
                    }
                }
            }
        }
        if(degree0 >= 4){
            return colorHere;
        }
        
        
        if(x >= 1 && y >= 1 && board[x-1][y-1] == colorHere){
            degree135 += 1;
            if(x >= 2 && y >= 2 && board[x-2][y-2] == colorHere){
            	degree135 += 1;
            	if(x >= 3 && y >= 3 && board[x-3][y-3] == colorHere){
                	degree135 += 1;
                	if(x >= 4 && y >= 4 && board[x-4][y-4] == colorHere){
                    	degree135 += 1;
                    }
                }
            }
        }
        if(degree135 >= 4){
            return colorHere;
        }
        
        if(x >= 1 && board[x-1][y] == colorHere){
            degree90 += 1;
            if(x >= 2 && board[x-2][y] == colorHere){
            	degree90 += 1;
            	if(x >= 3 && board[x-3][y] == colorHere){
                	degree90 += 1;
                	if(x >= 4 && board[x-4][y] == colorHere){
                    	degree90 += 1;
                    }
                }
            }
        }
        if(degree90 >= 4){
            return colorHere;
        }
        
        if(x >= 1 && y+1 < 10 && board[x-1][y+1] == colorHere){
            degree45 += 1;
            if(x >= 2 && y+2 < 10 && board[x-2][y+2] == colorHere){
            	degree45 += 1;
            	if(x >= 3 && y+3 < 10 && board[x-3][y+3] == colorHere){
                	degree45 += 1;
                	if(x >= 4 && y+4 < 10 && board[x-4][y+4] == colorHere){
                    	degree45 += 1;
                    }
                }
            }
        }
        if(degree45 >= 4){
            return colorHere;
        }
        
        if(y >= 1 && board[x][y-1] == colorHere){
            degree0 += 1;
            if(y >= 2 && board[x][y-2] == colorHere){
            	degree0 += 1;
            	if(y >= 3 && board[x][y-3] == colorHere){
                	degree0 += 1;
                	if(y >= 4 && board[x][y-4] == colorHere){
                    	degree0 += 1;
                    }
                }
            }
        }
        if(degree0 >= 4){
            return colorHere;
        }
        
        return 0;
    }

    function checkPlayers(address addr) view public returns(uint8){
        if(addr == player1){
            return 1;
        }else if(addr == player2){
            return 2;
        }
        return 0;
    }
    
    function getStatus() view public returns(uint8){
        return turn;
    }
    
    function getBoard() view public returns(uint8[10][10] memory){
        return board;
    }
    
    
}
