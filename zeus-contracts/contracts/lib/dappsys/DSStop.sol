// modified for use with truffle

/// stop.sol -- mixin for enable/disable functionality

// Copyright (C) 2017  DappHub, LLC

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity ^0.4.23;

import "./DSAuth.sol";
import "./DSNote.sol";

contract DSStop is DSNote, DSAuth {

    bool public stopped = false;

    modifier whenNotStopped {
        require(!stopped, "DSStop::_ FEATURE_STOPPED");
        _;
    }

    modifier whenStopped {
        require(stopped, "DSStop::_ FEATURE_NOT_STOPPED");
        _;
    }

    function stop() public auth note {
        stopped = true;
    }
    function start() public auth note {
        stopped = false;
    }

}