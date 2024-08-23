// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.4.16 < 0.9.0;

// 1. create a twitter contract
// 2. create a mapping between user and tweet
// 3. Add function to create a tweet and save it in mapping 
// 4. Create a function to get tweet



contract Twitter{

    // mapping(address => string) public tweets;
     mapping(address => string []) public tweets;//added array of strings for multiple tweets

    function createTweet(string memory _tweet) public {
        // tweets[msg.sender] = _tweet;
        tweets[msg.sender].push(_tweet);
    }

    // function getTweets(address _owner) public view returns (string memory){
    //     return tweets[_owner];
    // }
     function getTweets(address _owner , uint _i) public view returns (string memory){
        return tweets[_owner][_i];//added the index of tweet from array
    }

    function getAllTweets(address _owner ) public view returns(string[] memory){
        return tweets[_owner];
    }
}