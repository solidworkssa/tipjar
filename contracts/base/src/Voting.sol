// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TipJar {
    struct Tip {
        address from;
        address to;
        uint256 amount;
        string message;
        uint256 timestamp;
    }

    mapping(address => uint256) public balances;
    mapping(address => Tip[]) public tipsReceived;
    uint256 public totalTips;

    event TipSent(address indexed from, address indexed to, uint256 amount, string message);
    event Withdrawn(address indexed creator, uint256 amount);

    function sendTip(address _creator, string memory _message) external payable {
        require(msg.value > 0, "Must send ETH");
        require(_creator != address(0), "Invalid creator");

        balances[_creator] += msg.value;
        
        tipsReceived[_creator].push(Tip({
            from: msg.sender,
            to: _creator,
            amount: msg.value,
            message: _message,
            timestamp: block.timestamp
        }));

        totalTips++;

        emit TipSent(msg.sender, _creator, msg.value, _message);
    }

    function withdraw() external {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No balance");

        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit Withdrawn(msg.sender, amount);
    }

    function getTips(address _creator) external view returns (Tip[] memory) {
        return tipsReceived[_creator];
    }

    function getBalance(address _creator) external view returns (uint256) {
        return balances[_creator];
    }
}
