// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TipJar Contract
/// @notice Direct tipping and micropayments for creators.
contract TipJar {

    event TipReceived(address indexed from, address indexed to, uint256 amount, string message);
    
    mapping(address => uint256) public totalReceived;
    
    function tip(address payable _to, string calldata _message) external payable {
        require(msg.value > 0, "Tip must be > 0");
        _to.transfer(msg.value);
        totalReceived[_to] += msg.value;
        emit TipReceived(msg.sender, _to, msg.value, _message);
    }

}
