// this is a file named pairings.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Pairings {
    /** 
     *  returns true if == 0,
     *  returns false if != 0,
     *  reverts with "Wrong pairing" if invalid pairing
     */
     function run(uint256[12] memory input) public view returns (bool) {
        assembly {
            let success := staticcall(gas(), 0x08, input, 0x0180, input, 0x20)
            if success {
                return(input, 0x20)
            }
        }
        revert("Wrong pairing");
    }
}

//We use this foundry test file to deploy and call our Pairings contract to confirm our ecPairing calculation. The following file we call TestPairings.sol.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "../src/Pairings.sol";

contract PairingsTest is Test {
    Pairings public pairings;

    function setUp() public {
        pairings = new Pairings();
    }

    function testPairings() public view {
        uint256 aG1_x = 3010198690406615200373504922352659861758983907867017329644089018310584441462;
        uint256 aG1_y = 17861058253836152797273815394432013122766662423622084931972383889279925210507;

        uint256 bG2_x1 = 2725019753478801796453339367788033689375851816420509565303521482350756874229;
        uint256 bG2_x2 = 7273165102799931111715871471550377909735733521218303035754523677688038059653;
        uint256 bG2_y1 = 2512659008974376214222774206987427162027254181373325676825515531566330959255;
        uint256 bG2_y2 = 957874124722006818841961785324909313781880061366718538693995380805373202866;

        uint256 cG1_x = 4503322228978077916651710446042370109107355802721800704639343137502100212473;
        uint256 cG1_y = 6132642251294427119375180147349983541569387941788025780665104001559216576968;

        uint256 dG2_x1 = 18029695676650738226693292988307914797657423701064905010927197838374790804409;
        uint256 dG2_x2 = 14583779054894525174450323658765874724019480979794335525732096752006891875705;
        uint256 dG2_y1 = 2140229616977736810657479771656733941598412651537078903776637920509952744750;
        uint256 dG2_y2 = 11474861747383700316476719153975578001603231366361248090558603872215261634898;

        uint256[12] memory points = [
            aG1_x,
            aG1_y,
            bG2_x2,
            bG2_x1,
            bG2_y2,
            bG2_y1,
            cG1_x,
            cG1_y,
            dG2_x2,
            dG2_x1,
            dG2_y2,
            dG2_y1
        ];

        bool x = pairings.run(points);
        console2.log("result:", x);
    }
}
