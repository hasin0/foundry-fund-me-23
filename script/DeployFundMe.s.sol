//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;
import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {FundMeTest} from "../../test/unit/FundMeTest.t.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // before startbroadcast -> not a "real" tx
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        // afer  startbroadcast -> is a "real" tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
