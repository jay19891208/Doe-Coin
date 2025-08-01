
/**
 *Submitted for verification at BscScan.com on 2025-07-26
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DoeCoin {

    string public name = "Doe Coin";

    string public symbol = "DOE";

    uint8 public decimals = 18;

    uint256 public totalSupply = 1000000000 * 10 ** uint256(decimals);

    mapping(address => uint256) public balanceOf;

    mapping(address => mapping(address => uint256)) public allowance;

    address public owner;

    constructor() {
        owner = msg.sender;
        balanceOf[owner] = totalSupply;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][msg.sender] >= value, "Allowance exceeded");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
}
