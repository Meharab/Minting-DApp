// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTCollectible is ERC1155 {
    using Counters for Counters.Counter;

    Counters.Counter public _tokenIds;

    constructor() ERC1155("https://bafybeihul6zsmbzyrgmjth3ynkmchepyvyhcwecn2yxc57ppqgpvr35zsq.ipfs.dweb.link/{id}.json") {
        
    }

    function uri(uint256 _tokenId) override public pure returns (string memory) {
        return string(
            abi.encodePacked("https://bafybeihul6zsmbzyrgmjth3ynkmchepyvyhcwecn2yxc57ppqgpvr35zsq.ipfs.dweb.link/", 
            Strings.toString(_tokenId), "{id}.json")
            );
    }

    function mintNFT() public {
        uint totalMinted = _tokenIds.current();
        _mint(msg.sender, totalMinted, 1, "");
        _tokenIds.increment();
    }
}