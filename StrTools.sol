// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

library StrTools {
    function int2str(int a) public pure returns (string memory) {
        if (a == 0) return "0";
        bool neg = a < 0;
        uint u = uint(neg ? -a : a);

        uint len;
        for (uint i = u; i != 0; i /= 10) len++;
        if (neg) ++len;
        
        bytes memory b = new bytes(len);
        uint j = len;
        for (uint i = u; i != 0; i /= 10) {
            b[--j] = bytes1(uint8(48 + i % 10));
        }
        if (neg) b[0] = '-';
        
        return string(b);
    }

    function uint2str(uint a) public pure returns (string memory) {
        if (a == 0) return "0";

        uint len;
        for (uint i = a; i != 0; i /= 10) len++;
        
        bytes memory b = new bytes(len);
        uint j = len;
        for (uint i = a; i != 0; i /= 10) {
            b[--j] = bytes1(uint8(48 + i % 10));
        }
        
        return string(b);
    }


    function bytes2str(bytes memory a) public pure returns (string memory) {
        uint len = 2 + a.length*2;
        bytes memory b = new bytes(len);
        b[0] = "0";
        b[1] = "x";

        uint j = 2;
        for (uint i = 0; i < a.length; i++) {
            uint8 u = uint8(a[i]);

            uint8 x = u / 16;
            b[j++] = bytes1(x + (x >= 10 ? 55 : 48));

            x = u % 16;
            b[j++] = bytes1(x + (x >= 10 ? 55 : 48));
        }
        
        return string(b);
    }
}