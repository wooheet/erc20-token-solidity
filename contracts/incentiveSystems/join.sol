pragma solidity 0.4.19;

import "../PermissionGroups.sol";


contract join is PermissionGroups {

    mapping (address => bool) public joinUsers;
    address[] public usersGroup;                                   
    address[] public joinAirdropGroup;                                                                


    function getJoinUser(address _user) external view returns(bool) {
        return joinUsers[_user];
    }

    function getJoinUsersGroup() external view returns(address[]) {
        return usersGroup;
    }

    function addJoinUsers(address _newUser) public {
        require(joinUsers[_newUser] == false);                             

        JoinUsersAdded(_newUser, true);                                  
        joinUsers[_newUser] = true;
        usersGroup.push(_newUser);
    }

    function addJoinAirdropUsers(address _user) public {
        require(joinUsers[_user] == true);

        JoinAirdropUsersAdded(_user, true);
        joinAirdropGroup.push(_user);
    }

    function joinEvent(address _from) {
        require(joinUsers[_from] == false);
        addJoinUsers(_from);                                       
        addJoinAirdropUsers(_from);                                
    }

    event JoinUsersAdded(address newUser, bool joinCheck);
    event JoinAirdropUsersAdded(address user, bool joinCheck);

}
